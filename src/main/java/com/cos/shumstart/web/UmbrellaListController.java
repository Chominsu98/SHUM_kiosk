package com.cos.shumstart.web;

import com.cos.shumstart.service.BoothService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@RequiredArgsConstructor
@Controller
public class UmbrellaListController {

    private final BoothService boothService;
/*
    @GetMapping("/rental/showUmbrella/{boothId}")
    public String umbrellaList(@PathVariable int boothId,
                               @AuthenticationPrincipal PrincipalDetails principalDetails,
                               Model model) {
        Booth boothEntity = boothService.부스정보(boothId);
        model.addAttribute("booth", boothEntity);
        model.addAttribute("user", principalDetails.getUser());
        return "/rental/showUmbrella";
    }

    @GetMapping("/rental/showUmbrella_original/{boothId}")
    public String umbrellaList2(@PathVariable int boothId,
                               @AuthenticationPrincipal PrincipalDetails principalDetails,
                               Model model) {
        Booth boothEntity = boothService.부스정보(boothId);
        model.addAttribute("booth", boothEntity);
        model.addAttribute("user", principalDetails.getUser());
        return "/rental/showUmbrella_original";
    }*/
}
