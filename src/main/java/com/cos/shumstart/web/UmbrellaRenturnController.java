package com.cos.shumstart.web;

import com.cos.shumstart.service.BoothService;
import com.cos.shumstart.service.RentalService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class UmbrellaRenturnController {

    private final BoothService boothService;
    private final RentalService rentalService;
/*
    @GetMapping("/return/umbrellaReturn/{boothId}")
    public String umbrellaReturnForm(@PathVariable int boothId,
                                     @AuthenticationPrincipal PrincipalDetails principalDetails,
                                     Model model) {

        Booth boothEntity = boothService.부스정보(boothId);
        User userEntity = principalDetails.getUser();

        model.addAttribute("booth", boothEntity);
        model.addAttribute("user", userEntity);
        return "/return/umbrellaReturn";
    }

    @PostMapping("/return/umbrellaReturn/{boothId}")
    public String umbrellaReturn(@PathVariable int boothId,
                                 @AuthenticationPrincipal PrincipalDetails principalDetails) {

        rentalService.반납하기(principalDetails.getUser().getId(), boothId);
        return "/main/rentalStateFalse";
    }*/
}
