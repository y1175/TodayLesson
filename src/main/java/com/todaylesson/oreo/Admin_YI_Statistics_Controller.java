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
			,Model model)
	{
		System.out.println(ymd);
		//立加 格废
		List<Stat_LogDTO> list=service.allLog(ymd,start_date,end_date);
		
		//立加 糕滚 格废
		List<Stat_LogDTO> distinctMember=service.distinct_member();
		
		//穿利 立加 格废
		List<Integer> cumlist=new ArrayList<>();
		
		//穿利 糕滚 立加 格废
		List<Integer> distinctList=new ArrayList<>();
		
		int cum=0; //穿利 荐
		int cum2=0; // 糕滚 穿利荐
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
		
		return "/TodayLesson_AdminPage/yi_ad_member_statistics";
	}
	
	//AmChart
	@RequestMapping(value = "/member_statistics", method = RequestMethod.POST)
	@ResponseBody
	public List chartOutput()throws Exception {
	  List<Stat_LogDTO> chartOutput = service.chartOutput();
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
