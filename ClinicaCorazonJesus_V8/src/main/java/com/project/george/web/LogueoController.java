package com.project.george.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.george.common.CommonUtil;
import com.project.george.model.TbUser;
import com.project.george.model.dto.TbUserDTO;
import com.project.george.model.facade.TableUserManager;


@Controller
public class LogueoController {
	
	@Autowired
	TableUserManager tableUserMan;
	
	@RequestMapping(value = "validateUser.htm", method = RequestMethod.POST)
	public String validateUserFormTest2(
			@ModelAttribute TbUser tableUserBean, RedirectAttributes redirectAttributes,ModelMap model) {  
		System.out.println("Datos : "+tableUserBean.getUserName()+" *** "+tableUserBean.getPassword());
		TbUserDTO tbUserDTO=new TbUserDTO();
		try {
			tbUserDTO=tableUserMan.validateUserAndPassword(tableUserBean.getUserName(), tableUserBean.getPassword());
			if(!CommonUtil.Login.RESPONSE_LOGIN_CORRECT.equals(tbUserDTO.getResponse())){
				System.out.println("Dentro de responder Mensaje Incorrcto");
				final TbUser tableUser=new TbUser();
				model.addAttribute("loginUsuForm", tableUser);
				model.addAttribute("messages", "USER_NOT_EXIST");
				return tbUserDTO.getResponse();
			}
		} catch (Exception e) {
			System.out.println("Error : "+e.toString());
			model.addAttribute("messages", "ERROR");
		}
		System.out.println("Dentro de ValidateUserForm");
	    redirectAttributes.addFlashAttribute("loggedin", true);  
	    redirectAttributes.addFlashAttribute("tbUserDTO", tbUserDTO);    
	    return "redirect:/private/welcomePrivate.htm";    
	}  
	

	@RequestMapping("logueo.htm")
	public String initForm(final ModelMap model){
		System.out.println("initForm");
		
		final TbUser tableUser=new TbUser();
		model.addAttribute("loginUsuForm", tableUser);

		return CommonUtil.Login.RESPONS_LOGIN_OPEN;
	}

}
