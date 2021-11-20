package com.cos.shumstart.web;

import com.cos.shumstart.config.auth.PrincipalDetails;
import com.cos.shumstart.domain.booth.Booth;
import com.cos.shumstart.domain.rental.Rental;
import com.cos.shumstart.domain.user.User;
import com.cos.shumstart.domain.voucher.Voucher;
import com.cos.shumstart.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Controller
public class MainController {

    private final RentalService rentalService;
    private final VoucherService voucherService;
    private final AuthService authService;
    private final BoothService boothService;
    private final ReportService reportService;


    private String qrcode_number;//큐알코드 정보를 여기다가 넣어놨으니 이걸로 접근해서 서비스 쓰도록,,,
    //키오스크인트로 페이지
    @GetMapping("/")
    public String main() {
        return "/kiosk/mainUI";
    }

    //대여,반납-키오스크qr코드 페이지->state는 대여,반납을 나타냄
    @GetMapping("/main/{state}/qrcode")
    public String qrcode_rent(@PathVariable("state")String state, Model model, @AuthenticationPrincipal PrincipalDetails principalDetails) {
        Booth booth=boothService.부스정보(principalDetails.getBooth().getId());
        model.addAttribute("booth",booth);
        model.addAttribute("state",state);

        return "/kiosk/qrcode_perception";
    }


    //대여,반납-키오스크예약번호 페이지->state는 대여,반납을 나타냄
    @GetMapping("/main/{state}/reservation_code")
    public String reservation(@PathVariable("state")String state, Model model, @AuthenticationPrincipal PrincipalDetails principalDetails) {
        Booth booth=boothService.부스정보(principalDetails.getBooth().getId());

        model.addAttribute("booth",booth);
        model.addAttribute("state",state);
        return "/kiosk/reservation_code";
    }

    //ajax로 키오스크에서 인식된 큐알코드가 오면 처리되는 컨트롤러
    @PostMapping({"/main/rental/check_qrcode","/main/return/check_qrcode"})
    @ResponseBody
    public Map check_qrcode(String qrcode_number ) {

        this.qrcode_number=qrcode_number;//큐알코드 정보 넣어줘서 다른데에서도 쓸수 있게 초기화함
        boolean check=false;
        String type="";//큐알코드 타입을 담아준다
        int umbrella_number;//반납할때의 이미 빌린 우산모델번호를 담아준다
        boolean rental_state=false;
        System.out.println("qr코드 정보 확인중....");
        Map json = new HashMap();

        try {
            Voucher voucher = voucherService.예약번호로찾기(qrcode_number);//예약번호를 바우처에서 찾음 성공여부 리턴
            rental_state=voucher.getUser().isState();//사용자의 빌린여부파악을 위해 전달
            if(voucher!=null){
                check=true;
                type=voucher.getTicketType();//사용자의 티켓 종류를 얻을 수 있다.
                if(voucher.getUser().isState()){//사용자가 지금 대여상황일경우-이미 빌린 우산이 있을 것이다.
                    Rental rental=rentalService.대여정보(voucher.getUser().getId());
                    umbrella_number=rental.getUmbrella().getId();//사용자가 이미 빌린 우산번호를 찾아서 넘겨줌
                    json.put("return_umbrella_info",umbrella_number);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            check = false;
        }
        json.put("check", check);
        json.put("tickettype",type);
        json.put("rentalState",rental_state);


        return json;

    }

    @PostMapping("/main/rental/get_umbrella_info")
    @ResponseBody
    public void get_umbrella_info(String umbrella_number, @AuthenticationPrincipal PrincipalDetails principalDetails){
        boolean check;

        Voucher voucherEntity = voucherService.예약번호로찾기(qrcode_number);
        User userEntity = authService.유저정보(voucherEntity.getUser().getId());

        if(userEntity.isState() == false) {
            if(voucherEntity.getVoucherStartDate() == null) {
                rentalService.이용권구매후첫대여(voucherEntity.getUser().getId(), Integer.parseInt(umbrella_number), principalDetails.getBooth().getId());
            }
            else {
                rentalService.대여하기(voucherEntity.getUser().getId(), Integer.parseInt(umbrella_number), principalDetails.getBooth().getId());
            }

            System.out.println("대여 완료 우산번호:"+umbrella_number);
        }
        else {
            rentalService.반납하기(userEntity.getId(), principalDetails.getBooth().getId());

            System.out.println("반납 완료 우산번호:"+umbrella_number);
        }
    }

    //신고페이지 보여줌
    @GetMapping("/main/complain")
    public String complain(){

        return "/kiosk/complain";
    }


    @PostMapping("/main/get_complain")//이 메소드를 통해 몇번우산이 신고가 들어왔고 신고내용파악가능....여기서 쓰도록
    @ResponseBody
    public Map<String,Boolean> get_complain_info(String umbrella_number,@RequestParam(value="checkArr[]") List<String> checkArr){
        boolean check;

        String reasonString = "";

        for(String reason:checkArr){
            reasonString += (reason + " ");
        }

        Map<String,Boolean> json = new HashMap<>();

        reportService.우산고장신고(Integer.parseInt(umbrella_number), reasonString);

        try {
            check=true;
        } catch (Exception e) {
            e.printStackTrace();
            check = false;
        }
        json.put("check", check);

        return json;
    }
}
