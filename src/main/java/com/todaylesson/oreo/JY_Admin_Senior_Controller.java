package com.todaylesson.oreo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.PageMaker;
import com.todaylesson.DTO.SeniorDTO;
import com.todaylesson.service.JY_Admin_SeniorService;

@Controller
@RequestMapping("/todaylessonadmin/")
public class JY_Admin_Senior_Controller {

	
	@Resource(name="ad_senior_service")
	private JY_Admin_SeniorService ad_senior_service;
	

//  아임포트의 토큰 값 받아오기
	public String getToken(HttpServletRequest request,HttpServletResponse response,JSONObject json,String requestURL) throws Exception{
		String _token = "";

		try{

			String requestString = "";
			URL url = new URL(requestURL);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true); 				
			connection.setInstanceFollowRedirects(false);  
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Content-Type", "application/json");
			OutputStream os= connection.getOutputStream();
			os.write(json.toString().getBytes());
			connection.connect();
			StringBuilder sb = new StringBuilder(); 
			if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
				String line = null;  
				while ((line = br.readLine()) != null) { 
					sb.append(line + "\n");  
				}
				br.close();
				requestString = sb.toString();
			}
			os.flush();
			connection.disconnect();
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(requestString);

			if((Long)jsonObj.get("code")  == 0){
				JSONObject getToken = (JSONObject) jsonObj.get("response");
				System.out.println("getToken==>>"+getToken.get("access_token") );
				_token = (String)getToken.get("access_token");
			}
 
		}catch(Exception e){
			e.printStackTrace();
			_token = "";
		}
		return _token;
	}
	

	
	// 전체시니어 목록
	@RequestMapping("all_senior")
	public String all_senior(Model model,			
			@RequestParam(required=false, defaultValue="") String search
			,@RequestParam(required=false, defaultValue="") String searchtxt
			,@RequestParam(required=false, defaultValue="1") int currPage
			,@RequestParam(required=false, defaultValue="senior_no") String order) {
		
		System.out.println(order);

		int totalCount= ad_senior_service.totalCount(search, searchtxt);
		int pageSize=15;
		int blockSize=5;
		
		PageMaker page=new PageMaker(currPage,totalCount,pageSize,blockSize);

		List<SeniorDTO> list = ad_senior_service.all_senior(search, searchtxt,order
				,page.getStartRow()
				,page.getEndRow());
		model.addAttribute("list",list);
		model.addAttribute("page",page);
		model.addAttribute("search",search);
		model.addAttribute("searchtxt",searchtxt);
		model.addAttribute("order",order);

		
		return "TodayLesson_AdminPage/jy_ad_senior_list.hs_ad_main_section";
	}
	
	// 시니어 상세페이지
	@RequestMapping("select_senior/{senior_no}")
	public String select_senior(@PathVariable int senior_no,Model model, HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		String imp_key 		=	"5422837446408379";
		String imp_secret	=	"FhzhNcakGqAxLiWaXndMLWKpsouBVOQB5pTTC3eitOPe6Mp39CPVyAl1YPCUEtwJTpDvsSOWGEaNqzQz";

		JSONObject json = new JSONObject();
		json.put("imp_key", imp_key);
		json.put("imp_secret", imp_secret);
	
		String token = getToken(request, response, json, "https://api.iamport.kr/users/getToken"); 

		
		List<LessonDTO> list = ad_senior_service.senior_lesson(senior_no);	
		SeniorDTO dto = ad_senior_service.select_senior(senior_no);
		model.addAttribute("list",list);
		model.addAttribute("dto",dto);
		model.addAttribute("token",token);
		return "TodayLesson_AdminPage/jy_ad_senior_select.hs_ad_main_section";
	}
	
}
