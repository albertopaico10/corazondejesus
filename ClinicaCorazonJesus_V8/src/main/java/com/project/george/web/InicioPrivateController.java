package com.project.george.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.george.model.dto.TbUserDTO;
import com.project.george.model.facade.TableUserManager;

@Controller
@RequestMapping("/private/")
public class InicioPrivateController {
	@Autowired
	TableUserManager tableUserMan;
	
	@RequestMapping("welcomePrivate.htm")
	public ModelAndView validateUserForm(@ModelAttribute("tbUserDTO") TbUserDTO beanTbUserDTO,ModelMap model) {
		System.out.println("Dentro de Welcome");
		System.out.println("*** "+beanTbUserDTO.getId()+"*"+beanTbUserDTO.getNombreUsuario()+"*"+beanTbUserDTO.getLastLoginFormat());
		return  new ModelAndView(beanTbUserDTO.getResponse(), "userObject", beanTbUserDTO);   
	}
	
	@RequestMapping(value = "home")    
	public String home(@ModelAttribute("loggedin") boolean loggedIn) {    
	            System.out.println(loggedIn);   
	            return "home";  
	}
}
