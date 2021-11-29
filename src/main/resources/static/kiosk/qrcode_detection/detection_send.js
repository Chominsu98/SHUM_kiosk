var id=1;
var count=1;
//var isAjaxing=false;

let message=document.getElementById("notification1");

$('#scan_info').bind("DOMSubtreeModified",function(){
    console.log("나 여기임"+count);

    console.log("이번에는 여기지롱");
    var li_list=document.querySelectorAll("#scan_info li");

    var item=li_list.item(li_list.length-1);
    item.setAttribute("id","list"+String(id));
    if (count==2){
        console.log("여기 걸려부러따");
        count=1;
        return;
    }
    id+=1;
    count+=1;
    data=$('#'+item.id).text();
    console.log(data);
    //alert("인식되었습니다."+count);
    console.log("휴 금새 여기까지.."+count);
    //test("loading_page");
    $.ajax({
        type:'POST',
        url:"/main/rental/check_qrcode",//qrcode 받는 url링크로 보내주기
        data:{"qrcode_number":data},
        contentType:"application/x-www-form-urlencoded;charset=utf-8",
        dataType:"json",


        success:function(data){
            console.log("qr코드 전송성공")
            if(data['check']) {
                message.innerText="✔성공적으로 이용권이 인증되었습니다.";
                var p=document.getElementById("popup_set_new_password");
                var tmpTag=document.createElement("p");
                var tmpTag_return_info=document.createElement("p");
                var tmpTag_rentalState=document.createElement("p");
                tmpTag.innerText=data["tickettype"];//사용자의 티켓타입을 불러온다
                tmpTag.setAttribute('id',"tmp");
                tmpTag.style.display='none';
                tmpTag_return_info.innerText=data["return_umbrella_info"];
                tmpTag_return_info.setAttribute('id',"tmp_return_info");
                tmpTag_return_info.style.display='none';

                if(data["rentalState"]==true){//이미 빌린상황
                    tmpTag_rentalState.innerText="rental";
                }
                else{
                    tmpTag_rentalState.innerText="return";
                }
                tmpTag_rentalState.setAttribute("id","rentalState");
                tmpTag_rentalState.style.display="none";
                p.appendChild(tmpTag);//임시로 데이터를 다른 자바스크립트에서 쓰기 위해 dom으로 올림
                p.appendChild(tmpTag_return_info);
                p.appendChild(tmpTag_rentalState);
                document.getElementById("close").setAttribute("value","first_pass");//확인버튼의 value값을 초기화하여넘어가게만듦
            }
            else{
                message.innerText="❌해당번호로 인증된 이용권번호가 없습니다."
                document.getElementById("close").setAttribute("value","");//확인버튼의 value값을 아무것도 주지않아 안넘어가게만듦
            }

        },
        error:function(request,status,error){
            console.log("실패")
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            message.innerText="❌인증과정에 오류가 발생했습니다.";
        },
        complete:function (){
            showPopup(true,"#popup");//여기까지하면 인증완료메시지가 출력

        }

    });

});
