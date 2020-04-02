package com.todaylesson.oreo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.todaylesson.DTO.AmChartDTO;
import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.Stat_LogDTO;
import com.todaylesson.service.Admin_YI_Statistics_Service;

@Controller
@RequestMapping("/todaylessonadmin")
public class Admin_YI_Statistics_Controller {

	@Resource(name="admin_YI_Statistics_Service")
	private Admin_YI_Statistics_Service service;
	
	@RequestMapping("/member_statistics")
	public String user_statistics(
			@RequestParam(required=false,defaultValue="date") String ymd
			,@RequestParam(required=false,defaultValue="") String start_date
			,@RequestParam(required=false,defaultValue="") String end_date
			,@RequestParam(required=false,defaultValue="") String countdate
			,Model model)
	{
		System.out.println(ymd);
		//접속 목록
		List<Stat_LogDTO> list=service.allLog(ymd,start_date,end_date);
		
		//접속 멤버 목록
		List<Stat_LogDTO> distinctMember=service.distinct_member(ymd,start_date,end_date);
		
		//누적 접속 목록
		List<Integer> cumlist=new ArrayList<>();
		
		//누적 멤버 접속 목록
		List<Integer> distinctList=new ArrayList<>();
		
		int cum=0; //누적 수
		int cum2=0; // 멤버 누적수
		for(int i=0; i<list.size();i++)
		{
			
			cum+=list.get(i).getTotal();
			cum2+=distinctMember.get(i).getMember_total();
			cumlist.add(cum);
			distinctList.add(cum2);
			
		}
		
		model.addAttribute("list",list);
		model.addAttribute("distinctMember",distinctMember);
		model.addAttribute("cumlist",cumlist);
		model.addAttribute("distinctList",distinctList);
		
		
		/* 가입자 수 */
		String today="%y-%m-%d";
		String week="week";
		String month="%y-%m";
		String year="%y";
		
		int today_joinCount=service.joinCount(today,countdate);
		int week_joinCount=service.joinCount(week,countdate);
		int month_joinCount=service.joinCount(month,countdate);
		int year_joinCount=service.joinCount(year,countdate);
		
		System.out.println("countdate:"+countdate);
		
		model.addAttribute("today_joinCount",today_joinCount);
		model.addAttribute("week_joinCount",week_joinCount);
		model.addAttribute("month_joinCount",month_joinCount);
		model.addAttribute("year_joinCount",year_joinCount);
		model.addAttribute("countdate",countdate);
		
		return "/TodayLesson_AdminPage/yi_ad_member_statistics.hs_ad_main_section";
	}
	
	//AmChart1
	@RequestMapping(value = "/member_statistics", method = RequestMethod.POST)
	@ResponseBody
	public List chartOutput()throws Exception {
	  List<AmChartDTO> chartOutput = service.chartOutput();
	  ArrayList response = new ArrayList();
	  for(int i =0; i < chartOutput.size(); i ++) {
	    HashMap<String , Object> map = new HashMap<String, Object>();
	    map.put("date", chartOutput.get(i).getRegYear()+"-"+chartOutput.get(i).getRegMonth()+"-"+chartOutput.get(i).getRegDay());
	    map.put("output", chartOutput.get(i).getTotal());
	    response.add(map);
	    System.out.println(map);
	    System.out.println(response);
	  }
	  System.out.println(response);
	  return response;

	}
	
	//AmChart2
		@RequestMapping(value = "/join_statistics", method = RequestMethod.POST)
		@ResponseBody
		public List chartOutput2()throws Exception {
		  List<AmChartDTO> chartOutput = service.chartOutput2();
		  ArrayList response = new ArrayList();
		  for(int i =0; i < chartOutput.size(); i ++) {
		    HashMap<String , Object> map = new HashMap<String, Object>();
		    map.put("date", chartOutput.get(i).getRegYear()+"-"+chartOutput.get(i).getRegMonth()+"-"+chartOutput.get(i).getRegDay());
		    map.put("output", chartOutput.get(i).getTotal());
		    response.add(map);
		    System.out.println(map);
		    System.out.println(response);
		  }
		  System.out.println(response);
		  return response;

		}

	
}
