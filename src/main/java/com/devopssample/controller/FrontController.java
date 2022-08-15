package com.devopssample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Value;

@Controller
public class FrontController {

    @Value("${environment}")
    String environment;

    @Value("${dbname}")
    String dbname;

    @RequestMapping(value="/",method=RequestMethod.GET)
    public String getHomePage(Model model){
        model.addAttribute("environment", environment);
        model.addAttribute("dbname", dbname);
        return "/home";
    }
}