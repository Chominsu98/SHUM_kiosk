function send_umbrella_info(rental_umbrella) {


    $.ajax({
            type:"post",
            url:"/main/rental/get_umbrella_info",
            data:{"umbrella_number":rental_umbrella},
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            dataType:"json",
            success: function (data){
                console.log("우산정보보내기 성공")

            },
            error:function(request,status,error){
                console.log("실패")
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
            complete:function (){

            }


        }
    );
}