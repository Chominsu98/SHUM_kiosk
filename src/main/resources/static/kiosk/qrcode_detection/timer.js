function timer() {
    var sec = 30;

    var x = setInterval(function () {
        document.getElementById("time").innerText = sec + '초';
        sec--;

        if (sec < 0) {
            clearInterval(x);
            document.getElementById('notification3').innerText = "🕒반납시간이 초과되었습니다.다시 진행하시기 바랍니다.";
            document.getElementById("return_finish").innerText = "다시하기";
            document.getElementById("return_finish").setAttribute("value", "return_fail");
        }
    }, 1000);
}