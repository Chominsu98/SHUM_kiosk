package com.cos.shumstart.web;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequiredArgsConstructor
@Controller // 1.IoC 2. 파일을 리턴하는 컨트롤러
public class AuthController {

    //로그인실패에 대한 처리를 위한 params처리
    @GetMapping("/auth/signin")
    public String signinForm(@RequestParam(value="error",required = false)String error,
                             @RequestParam(value ="exception",required = false)String exception,
                             Model model)
    {
        model.addAttribute("error",error);
        System.out.println(exception);
        return "/auth/signin";
    }
}
