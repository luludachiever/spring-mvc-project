package com.lagou.edu.controller;

import com.lagou.edu.pojo.Resume;
import com.lagou.edu.dao.ResumeDao;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/resume")
public class ResumeController {

    /**
     * Spring容器和SpringMVC容器是有层次的（父子容器）
     * Spring容器：service对象+dao对象
     * SpringMVC容器：controller对象，，，，可以引用到Spring容器中的对象
     */
    @Autowired
    private ResumeDao resumeDao;

    @RequestMapping("/queryAll")
    @ResponseBody
    public List<Resume>  queryAll() throws Exception {
       // return resumeDao.queryAccountList();
          List<Resume> list = resumeDao.findAll();
          return list;
    }


    @RequestMapping(value="/deleteUser",  method = RequestMethod.POST)
    public ModelAndView deleteUser(@RequestBody Resume resume) throws Exception {
          resumeDao.delete(resume);
        return showData();
    }

    @RequestMapping(value="/EditUser", method = RequestMethod.POST)
    public ModelAndView EditUser(@RequestBody Resume account)  throws Exception {
            resumeDao.save(account);
        return showData();
    }

    @RequestMapping(value="/AddUser", method = RequestMethod.POST)
    public  ModelAndView AddUser(String Name,  String Address, String Phone)  throws Exception {
        Resume r = new Resume();
        r.setId(resumeDao.getMax() + 1);
        r.setName(Name);
        r.setAddress(Address);
        r.setPhone(Phone);
        resumeDao.save(r);
        return showData();
    }
    public ModelAndView showData() throws Exception {
        List<Resume> L = this.queryAll();
        ModelAndView model = new ModelAndView("ShowData");
        model.addObject("data", L);
        return model;
    }

    @RequestMapping(value = "/login",method = {RequestMethod.POST})
    public ModelAndView handlePost(String username, String password) throws Exception {
        if (username.equals("admin") && password.equals("admin")) {
            return showData();
        }
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("error");
        return modelAndView;
    }
}
