package com.yulaw.reader.controller.management;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 后台管理系统控制器
 */
@Controller
@RequestMapping("management")
public class ManagementController {
    @GetMapping("/index.html")
    public ModelAndView showIndex(){
        return new ModelAndView("/management/index");
    }


}
