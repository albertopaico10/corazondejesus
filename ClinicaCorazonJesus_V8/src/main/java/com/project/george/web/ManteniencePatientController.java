package com.project.george.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.project.george.common.CommonUtil;
import com.project.george.model.TbNewPatient;
import com.project.george.model.bean.PatientJson;
import com.project.george.model.dto.TbNewPatientDTO;
import com.project.george.model.facade.TableAreasManager;
import com.project.george.model.facade.TableNewPatientManager;
import com.project.george.model.facade.TablePatientManager;

@Controller
@RequestMapping("/private/")
public class ManteniencePatientController {
	
	@Autowired
	TableAreasManager tableAreaMan;
	@Autowired
	TablePatientManager tablePatientMan;
	
	@Autowired
	TableNewPatientManager tableNewPatientMan;

	@RequestMapping("listMaintenancePatient.htm")
    public ModelAndView listMaintenancePatient (HttpServletRequest request,
			HttpServletResponse response,final ModelMap model) {
		System.out.println("inside listMaintenancePatient htm");
//		final TbPatient tablePatient=new TbPatient();
		final TbNewPatient tablePatient=new TbNewPatient();
		model.addAttribute("maintenancePatientForm", tablePatient);
		
		String responseStr=CommonUtil.ManteniencePatient.RESPONSE_MANTENIENCE_PATIENT;

		return new ModelAndView(responseStr);
	}
		
	@RequestMapping("findPatientSpecific.htm")
	public ModelAndView listMaintenancePatientSpecific(HttpServletRequest request, 
			HttpServletResponse response,final ModelMap model) {
		String lastName=request.getParameter("lastName")!=null?request.getParameter("lastName"):"";
		String dni=request.getParameter("dniValue")!=null?request.getParameter("dniValue"):"";

		try {
			List<TbNewPatientDTO> listAllPatient=tableNewPatientMan.listAllPatientSpecificValues(lastName, dni);
			System.out.println("En el Web : "+listAllPatient.size());
			request.setAttribute("listPatient", listAllPatient);
		} catch (Exception e) {
			System.out.println("Error :"+e.toString());
		}
		
		final TbNewPatient tablePatient=new TbNewPatient();
		model.addAttribute("maintenancePatientForm", tablePatient);
		
		System.out.println("Value...!!! :"+request.getParameter("lastName"));
		String responseStr=CommonUtil.ManteniencePatient.RESPONSE_MANTENIENCE_PATIENT;
		return new ModelAndView(responseStr);
	}
	
//	@ModelAttribute("listAllArea")
//    public final List<TbAreasDTO> areaList(
//            final HttpServletRequest request) {
//		try {
//			List<TbAreasDTO> listAllArea=tableAreaMan.listAllAreas();
//			System.out.println("Cantidad de areas  para cargar:"+listAllArea.size());
//			return listAllArea;
//		} catch (Exception e) {
//			System.out.println("Error : "+e.toString());
//		}
//		return null;
//	}
	
	
	@RequestMapping("registerPatient.htm")
	public ModelAndView registerUserForm(
			@ModelAttribute TbNewPatient tablePatientBean,
			final BindingResult result, final SessionStatus status,
			final HttpServletRequest request,final ModelMap model) {
		System.out.println("inside registerPatient htm");
		String valueResponse="";
		System.out.println("Datos: "+"****"+tablePatientBean.getNamePatient()
				+"***"+tablePatientBean.getLastNamePatient()+"*****"+tablePatientBean.getDni()+"*****"+tablePatientBean.getAdress()
				+"***"+tablePatientBean.getDistrictName()
				+"***"+tablePatientBean.getBirthDay()+"***"+tablePatientBean.getCodeHistoryClinic()+tablePatientBean.getSex()
				+"***"+tablePatientBean.getNameReference()+"****"+tablePatientBean.getPhoneReference());
		try {
			valueResponse=tableNewPatientMan.addNewPatient(tablePatientBean);
			if(CommonUtil.ManteniencePatient.RESPONSE_MANTENIENCE_PATIENT_NEW.equals(valueResponse)){				
				request.setAttribute("messages", "success");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("**** "+valueResponse);
		System.out.println("Save User Data");
		return new ModelAndView(valueResponse);
	}
	
	@RequestMapping("deleteMaintenancePatient.htm")
    public String deletePatient(final ModelMap model,final SessionStatus status,
            final HttpServletRequest request) {
		System.out.println("inside deletePatient.htm");
		final int idPatient = Integer.parseInt(request.getParameter("idPatient"));
		System.out.println("ID Patient : "+idPatient);
		String valueResponse="";
		try {
			valueResponse=tableNewPatientMan.deletePatient(idPatient);
		} catch (Exception e) {
			System.out.println("Error : "+e.toString());
		} 
		return valueResponse;
	}
	
	
	@RequestMapping(value = "/listAllPatientJson.htm", 
		    method = RequestMethod.GET, produces = 
		    "application/json")
	    public @ResponseBody String springPaginationDataTables() 
		    throws IOException {
		System.out.println("Entre a listar todos los pacientes");
		String json2="";
		try {
			List<TbNewPatientDTO> listAllPatient=tableNewPatientMan.listAllPatient();
			PatientJson beanPatientJson=new PatientJson();
			beanPatientJson.setiTotalDisplayRecords(listAllPatient.size());
			beanPatientJson.setiTotalRecords(listAllPatient.size());
			beanPatientJson.setPatientData(listAllPatient);
			
			Gson gson=new GsonBuilder().setPrettyPrinting().create();
			json2=gson.toJson(beanPatientJson);
			
			
			System.out.println("Cantidad de filas que trae : "+listAllPatient.size());
//			request.setAttribute("listPatient", listAllPatient);
//			request.setAttribute("jsonTable", json2);
		} catch (Exception e) {
			System.out.println("Error :"+e.toString());
		}		
		return json2;
	}
	
}
