function timer() {
    var sec = 30;

    var x = setInterval(function () {
        document.getElementById("time").innerText = sec + 'μ΄';
        sec--;

        if (sec < 0) {
            clearInterval(x);
            document.getElementById('notification3').innerText = "πλ°λ©μκ°μ΄ μ΄κ³Όλμμ΅λλ€.λ€μ μ§ννμκΈ° λ°λλλ€.";
            document.getElementById("return_finish").innerText = "λ€μνκΈ°";
            document.getElementById("return_finish").setAttribute("value", "return_fail");
        }
    }, 1000);
}