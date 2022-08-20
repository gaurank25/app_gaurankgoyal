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

    @Resource
    private Environment env;

    @RequestMapping(value="/",method=RequestMethod.GET)
    public String getHomePage(Model model){
        String branchName = env.getProperty("branchName");
        String dbname = env.getProperty("dbname");
        String username = env.getProperty("username");
        String password = env.getProperty("password");
        model.addAttribute("environment", branchName);
        model.addAttribute("dbname", dbname);
        model.addAttribute("password", password);
        model.addAttribute("username", username);
        return "/home";
    }
}