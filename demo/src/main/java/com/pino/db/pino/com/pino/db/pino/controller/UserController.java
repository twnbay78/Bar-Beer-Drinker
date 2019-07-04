package com.pino.db.pino.com.pino.db.pino.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.pino.db.pino.dao.BarDAO;
import com.pino.db.pino.dao.DrinkerDAO;
import com.pino.db.pino.entities.Bar;
import com.pino.db.pino.entities.Drinker;
import com.pino.db.pino.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.RequestMapping;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class UserController {

    @Autowired
    private DrinkerDAO drinkerDAO;
    private BarDAO barDAO;

    @GetMapping(value = "/pino")
    public ModelAndView listDrinker() throws IOException {
        ModelAndView model = new ModelAndView();
        List<Drinker> listDrinker = drinkerDAO.list();
        Drinker drinker = new Drinker("John", 201, 123, new java.sql.Date(Calendar.getInstance().getTime().getTime()) );
        List<Drinker> listDrinker2 = new ArrayList();
        listDrinker2.add(drinker);
        model.addObject("listDrinker2", listDrinker);
        model.setViewName("home");
        return model;
    }

    @GetMapping("/beers")
    public ModelAndView listBeers(ModelAndView model) throws IOException {
        List<Drinker> listDrinker = drinkerDAO.list();
        model.addObject("listDrinker", listDrinker);
        model.setViewName("bars");
        return model;
    }
    @GetMapping("/bars")
    public ModelAndView listBars(ModelAndView model) throws IOException {
        List<Bar> listBar = barDAO.list();
        model.addObject("listBar", listBar);
        model.setViewName("beers");
        return model;
    }
    @GetMapping("/modification")
    public String listDTables() throws IOException {
        return "modification";
    }

    @RequestMapping(value = "/newDrinker", method = RequestMethod.GET)
    public ModelAndView newContact(ModelAndView model) {
        Drinker newDrinker = new Drinker();
        model.addObject("drinker", newDrinker);
        model.setViewName("DrinkerForm");
        return model;
    }

    @RequestMapping(value = "/saveDrinker", method = RequestMethod.POST)
    public ModelAndView saveDrinker(@ModelAttribute Drinker drinker) {
        drinkerDAO.insert(drinker);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/deleteDrinker", method = RequestMethod.GET)
    public ModelAndView deleteDrinker(HttpServletRequest request) {
        Drinker drinker = new Drinker();
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/editDrinker", method = RequestMethod.GET)
    public ModelAndView getDrinker(HttpServletRequest request){
        String drinkerName = request.getParameter("name");
        int drinkerPhone = Integer.parseInt(request.getParameter("phone"));
        Drinker drinker = drinkerDAO.get(drinkerName, drinkerPhone);
        ModelAndView model = new ModelAndView("drinkerForm");
        model.addObject("drinker", drinker);
        return new ModelAndView("redirect:/");
    }
}
    /*
    @Autowired
    UserRepository userRepository;

    @GetMapping(path="/hello")
    public String returnString(){
        return "hello";
    }

    @GetMapping(path="/beer")
    public List<String> getAllUserNames(){
        return userRepository.getAllUserNames();
    }

    //Test
    @GetMapping
    public String check() {
        return "Welcome to Java";
    }*/

