package com.todaylesson.oreo;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Array;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
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

import com.todaylesson.DTO.AllLessonDTO;
import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.service.JY_Admin_LessonService;

@Controller
public class JY_Admin_Lesson_Controller {

	
	@Resource(name="adminservice")
	private JY_Admin_LessonService adminservice;
	
	
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
	


	
	// 전체 레슨 조회
	@RequestMapping("alllesson")
	public String all_lesson(Model model) {
		List<AllLessonDTO> list = adminservice.all_lesson();
		model.addAttribute("list",list);
		return "TodayLesson_AdminPage/jy_ad_all_lesson";
	}
	
	
	// 신청 완료에서 심사중으로 넘기는 페이지
	@RequestMapping("apply_lesson")
	public String apply_lesson(Model model) {
		List<AllLessonDTO> list = adminservice.apply_lesson();
		model.addAttribute("list", list);
		return "TodayLesson_AdminPage/jy_ad_apply_lesson_list";
	}
	
	
	
	@RequestMapping("admin_apply_exam")
	public String apply_exam(HttpServletRequest request, Model model) {
	
		String[] checkvalue = request.getParameterValues("check");
		
		List<Integer> list = new ArrayList<>();
		
		for (int i = 0; i < checkvalue.length; i++) {
			int num = Integer.parseInt(checkvalue[i]);
			list.add(num);
		}
		
		
		System.out.println(list);
		
		
		int result = adminservice.apply_lesson_result(list);
		model.addAttribute("result",result);
		return "TodayLesson_AdminPage/jy_ad_apply_exam_result";
	}
	
	
	
	
	
	
	// 심사 필요한 레슨들 조회
	@RequestMapping("wait_lesson")
	public String wait_lesson(Model model) {
		List<AllLessonDTO> list = adminservice.wait_lesson();
		model.addAttribute("list",list);
		return "TodayLesson_AdminPage/jy_ad_wait_lesson";
	}
	
	
	


	//승인 해줘야하는 레슨 디테일
	@RequestMapping("admin_wait_lesson_detail/{lesson_no}")
	public String wait_lesson_detail(Model model, @PathVariable int lesson_no,HttpServletRequest request,HttpServletResponse response) throws Exception {	
		// 선택한 레슨에 대한 정보
		AllLessonDTO dto = adminservice.select_lesson(lesson_no);
		// 레슨을 신청한 사람에 대한 정보
		int senior_no = dto.getSenior_no();
		List<LessonDTO> list = adminservice.select_lesson_list(senior_no);
		System.out.println(list);
		
		String imp_key 		=	"5422837446408379";
		String imp_secret	=	"FhzhNcakGqAxLiWaXndMLWKpsouBVOQB5pTTC3eitOPe6Mp39CPVyAl1YPCUEtwJTpDvsSOWGEaNqzQz";

		JSONObject json = new JSONObject();
		json.put("imp_key", imp_key);
		json.put("imp_secret", imp_secret);
	
		String token = getToken(request, response, json, "https://api.iamport.kr/users/getToken"); 
		model.addAttribute("token",token);
		
		model.addAttribute("dto",dto);
		model.addAttribute("list",list);
		
		return "TodayLesson_AdminPage/jy_ad_wait_lesson_detail";
	}
	
	
	//레슨 디테일
	@RequestMapping("admin_lesson_detail/{lesson_no}")
	public String detail_lesson(Model model, @PathVariable int lesson_no) {	
		// 선택한 레슨에 대한 정보
		AllLessonDTO dto = adminservice.select_lesson(lesson_no);
		// 레슨을 신청한 사람에 대한 정보
		int senior_no = dto.getSenior_no();
		List<LessonDTO> list = adminservice.select_lesson_list(senior_no);
				
		model.addAttribute("dto",dto);
		model.addAttribute("list",list);
		
		return "TodayLesson_AdminPage/jy_ad_lesson_detail";
	}
	
	
	@RequestMapping("lesson_result_update/{lesson_no}")
	public String lesson_result_update(@PathVariable int lesson_no,Model model) {
		model.addAttribute("lesson_no",lesson_no);
		return "TodayLesson_AdminPage/jy_ad_lesson_result_update";
	}
	
	@RequestMapping("lesson_approve/{lesson_no}")
	public String lesson_approve(@PathVariable int lesson_no, Model model) {
		int result = adminservice.approve(lesson_no);
		model.addAttribute("result",result);
		return "TodayLesson_AdminPage/jy_ad_lesson_approve";
	}
	
	
	
	@RequestMapping("lesson_reject/{lesson_no}")
	public String lesson_reject(@PathVariable int lesson_no, Model model) {
		int result = adminservice.reject(lesson_no);
		model.addAttribute("result",result);
		return "TodayLesson_AdminPage/jy_ad_lesson_reject";
	}
	
	
}
