package com.project.george.model.facade;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.george.common.CommonUtil;
import com.project.george.common.UtilMethods;
import com.project.george.model.TbPresentation;
import com.project.george.model.TbProduct;
import com.project.george.model.dao.TablePresentationDao;
import com.project.george.model.dao.TableProductDao;
import com.project.george.model.dto.TbProductDTO;

@Service
@Transactional
public class TableProductManagerImpl implements TableProductManager {
	@Autowired
	TableProductDao customTableTypeProduct;
	@Autowired
	TablePresentationDao customTablePresentation;
	
	public List<TbProductDTO> listSpecificProduct(String nameProduct)
			throws Exception {
		List<TbProduct> listAllData=customTableTypeProduct.listSpecificProduct(nameProduct);
		
		List<TbProductDTO> newListAll=new ArrayList<TbProductDTO>();
		
		UtilMethods utilMethods=new UtilMethods();
		for (TbProduct beanTableDB:listAllData) {
			//--Call Presentation
			TbPresentation beanPresentation=customTablePresentation.beanPresentationSpecific(beanTableDB.getIdPresentation());
			TbProductDTO beanDTO=new TbProductDTO();
			beanDTO=utilMethods.copyValuesTypeProductDTO(beanTableDB, beanDTO,beanPresentation);
			newListAll.add(beanDTO);
		}
		if(newListAll.size()==0){
			newListAll=null;
		}
		
		return newListAll;
	}
		
	public List<TbProductDTO> listAllTypeProduct() throws Exception {
		System.out.println("Inside listAllTypeProduct");
		List<TbProduct> listAllData=customTableTypeProduct.listAllTypeProduct();
		
		List<TbProductDTO> newListAll=new ArrayList<TbProductDTO>();
		
		UtilMethods utilMethods=new UtilMethods();
		
		for (TbProduct beanTableDB:listAllData) {
			//--Call Presentation
			TbPresentation beanPresentation=customTablePresentation.beanPresentationSpecific(beanTableDB.getIdPresentation());
			TbProductDTO beanDTO=new TbProductDTO();
			beanDTO=utilMethods.copyValuesTypeProductDTO(beanTableDB, beanDTO,beanPresentation);
			newListAll.add(beanDTO);
		}
		if(newListAll.size()==0){
			newListAll=null;
		}
		return newListAll;
	}


	public String addNewTypeProduct(TbProduct tbTypeProductBean)
			throws Exception {
		String returnRsponse=CommonUtil.MantenienceProduct.RESPONSE_MANTENIENCE_PRODUCT_NEW;
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		try {
			tbTypeProductBean.setExpirationDate(formatter.parse(tbTypeProductBean.getStrExpirationDate()));
			customTableTypeProduct.addNewMantenience(tbTypeProductBean);
		} catch (Exception e) {
			returnRsponse=CommonUtil.ERROR;
		}		
		return returnRsponse;
	}


	public String deleteTypeProduct(int idTypeProduct) throws Exception {
		String returnRsponse=CommonUtil.MantenienceProduct.RESPONSE_MANTENIENCE_PRODUCT_NEW;
		TbProduct tbTypeProduct=new TbProduct();
		tbTypeProduct=customTableTypeProduct.beanProductSpecific(idTypeProduct);
		tbTypeProduct.setId(idTypeProduct);
		tbTypeProduct.setStatus(2);
		customTableTypeProduct.deleteValueMantenience(tbTypeProduct);
		return returnRsponse;
	}


	
	
}
