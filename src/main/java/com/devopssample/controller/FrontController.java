package com.devopssample.controller;

import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;
import org.springframework.beans.factory.annotation.Value;

import javax.annotation.Resource;

@Controller
public class FrontController {

//    @Value("${environment}")
//    String environment;
//
//    @Value("${dbname}")
//    String dbname;

    @Resource
    private Environment env;

    @RequestMapping(value="/",method=RequestMethod.GET)
    public String getHomePage(Model model){
        String myPropValue = env.getProperty("myprop");
        model.addAttribute("environment", myPropValue);
        model.addAttribute("dbname", myPropValue);
//        model.addAttribute("dbname", dbname);
        return "/home";
    }
}