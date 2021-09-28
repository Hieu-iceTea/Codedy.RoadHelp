package com.codedy.roadhelp.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeFrontController {

    //region - Autowired Service -

    //endregion


    //region - Static pages -
    @RequestMapping(value="/", method= RequestMethod.GET)
    public String contact() {

        return "index";
    }
    //endregion

}
