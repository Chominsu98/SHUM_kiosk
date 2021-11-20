function send_complain_info() {

    //우산모델번호가 값이 입력되었는지 확인
    var umbrella_number=document.getElementById("umbrella_number").value;
    if(!umbrella_number){
        return;
    }
    let message=document.getElementById("notification1");

    var checkArr=[];
    var isEmpty=true;
    $("input[name='complain']:checked").each(function (i){
        checkArr.push($(this).val());
        isEmpty=false;
    })

    console.log(checkArr);
    if(isEmpty){
        message.innerText="❌신고사유를 최소하나 선택해주세요!";
        showPopup(true);
        return;
    }

    $.ajax({
            type:"post",
            url:"/main/get_complain",
            data:{"umbrella_number":umbrella_number,"checkArr":checkArr},
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            dataType:"json",
            success: function (data){
                console.log("우산정보보내기 성공");
                if(data["check"]){
                    message.innerText="✔신고가 성공적으로 접수되었습니다.빠른시일내에 조치를 취하도록 하겠습니다."
                }
                else{
                    message.innerText="❌신고접수에 문제가 발생했습니다."
                }

            },
            error:function(request,status,error){
                console.log("실패")
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                message.innerText="❌접수문제발생";
            },
            complete:function (){
                showPopup(true);
            }


        }
    );
}