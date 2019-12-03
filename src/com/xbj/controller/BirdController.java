package com.xbj.controller;

import com.xbj.domain.Bird;
import com.xbj.service.BirdService;
import com.xbj.util.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/bird")
public class BirdController {
    @Autowired
    private BirdService bs;

    @RequestMapping("/list")
    public String list(Model model, Bird bird, @RequestParam(defaultValue = "1") Integer currentPage,@RequestParam(defaultValue = "5") Integer pageSize){
        PageResult<Bird> page = bs.page(bird, currentPage, pageSize);
        model.addAttribute("page",page);
        model.addAttribute("bird", bird);
        return "bird_list";
    }

    @RequestMapping("/add")
    public String add(Model model,Bird bird){
        bs.insertBird(bird);
        return "redirect:list";
    }

    @RequestMapping("/toModify")
    public String toModify(Model model, Integer id) {
        Bird bird = bs.findById(id);
        model.addAttribute("bird",bird);
        return "bird_modify";
    }


    @RequestMapping("/modify")
    public String modify(Bird bird) {
        bs.updateBird(bird);
        return "redirect:list";
    }

    @RequestMapping("/delete")
    public String delete(Integer id) {
        bs.deleteStatus(id);
        return "redirect:list";
    }

    @ResponseBody
    @RequestMapping("/checkName")
    public String ajaxCheckName(String param) {
        return bs.ajaxCheckName(param) ? "您好，用户名重复了!" : "y";
    }
}
