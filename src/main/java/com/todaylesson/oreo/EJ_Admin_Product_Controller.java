package com.todaylesson.oreo;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.todaylesson.DTO.ProductDTO;
import com.todaylesson.service.EJ_All_Product_Service;
import com.todaylesson.upload.UploadFileUtils;

@Controller
@RequestMapping("/todaylessonadmin/")
public class EJ_Admin_Product_Controller {
	@Resource(name="service")
	private EJ_All_Product_Service service;
	
	@RequestMapping("/ej_ad_productlist")
	public String list(Model model) {
		List<ProductDTO> list = service.selectAll(null);
		model.addAttribute("list",list);
		return "TodayLesson_AdminPage/ej_ad_productlist.hs_ad_main_section";
	}
	
	@RequestMapping("/ej_ad_productregister")
	public String insert(){
		
		return "TodayLesson_AdminPage/ej_ad_productregister.hs_ad_main_section";
	}
	
	@RequestMapping("/ej_ad_product_insertresult")
	public String insertresult(Model model, ProductDTO dto, 
			MultipartFile file,  HttpServletRequest request) throws IOException, Exception {
		
		
	
/*
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null)   
		{
		 fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		
		
		
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setProduct_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setProduct_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);*/
		String uploadPath=request.getSession().getServletContext().getRealPath("/"); 
		System.out.println("uploadPath:"+uploadPath);
		String imgUploadPath = uploadPath + File.separator+ "resources"+ File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		//file=null;
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "")   
		{
		 fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setProduct_img(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setProduct_thumb(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
	/*	String img=dto.getProduct_img();
		String imgthumb=dto.getProduct_thumb();
		System.out.println("이미지경로: "+img);
		System.out.println("썸네일이미지경로: "+imgthumb);*/
		int cost=dto.getProduct_cost()*(100-dto.getProduct_sale())/100;
		dto.setProduct_after_cost(cost);
		int result = service.insertBoard(dto);
		model.addAttribute("result", result);
		
		return "TodayLesson_AdminPage/ej_ad_product_insertresult";
		
	}
	
	@RequestMapping("/ej_ad_productdetail/{product_no}")
	public String detail(@PathVariable("product_no") int product_no, Model model) {
		
		ProductDTO dto = service.select(product_no);
		model.addAttribute("dto",dto);
		
		return "TodayLesson_AdminPage/ej_ad_productdetail.hs_ad_main_section";
	}
	//상품 수정입력란 들어가기
	@RequestMapping("/ad_product_update/{product_no}")
	public String updatepro(@PathVariable("product_no") int product_no, Model model)
	{

		ProductDTO dto = service.select(product_no);
		model.addAttribute("dto",dto);
		
		return "TodayLesson_AdminPage/ej_ad_product_update.hs_ad_main_section";
	}

	
	//상품수정 결과
	@RequestMapping("/ad_product_update_result")
	public String proupdate_result(Model model, ProductDTO dto, MultipartFile file,HttpServletRequest request) throws IOException, Exception {
		

		String uploadPath=request.getSession().getServletContext().getRealPath("/"); 
		System.out.println("uploadPath:"+uploadPath);
		String imgUploadPath = uploadPath + File.separator+ "resources"+ File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		//가격에 할인율 적용
		int cost=dto.getProduct_cost()*(100-dto.getProduct_sale())/100;
		dto.setProduct_after_cost(cost);
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "")   
		{
		 fileName=UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		 dto.setProduct_thumb(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		 dto.setProduct_img(File.separator+ "resources"+File.separator + "imgUpload" + ymdPath + File.separator + fileName); 
		// String imgthumb=dto.getProduct_thumb();
	      
	      int result = service.updatepro(dto);
	      model.addAttribute("result", result);
	      return "TodayLesson_AdminPage/ej_ad_product_updateresult";	      
	      
		 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		 System.out.println("썸네일 경로가 안들어와야 정상"+fileName);
		 int result = service.updatepro_nothumbnail(dto);
		  model.addAttribute("result", result);
		  return "TodayLesson_AdminPage/ej_ad_product_updateresult";	      
	      
		}
		
		
	}
	
	//상품 삭제
	@RequestMapping("/ad_product_delete/{product_no}")
	public String prodelete(@PathVariable int product_no, Model model) {
		
		int result = service.deletepro(product_no);//삭제 쿼리만들기
		model.addAttribute("result",result);
		
		return "TodayLesson_AdminPage/ej_ad_product_delete_result";
	}
}
