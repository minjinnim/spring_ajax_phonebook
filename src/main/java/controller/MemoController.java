
package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.PhonebookServiceInter;
import vo.PhonebookVO;

@Controller
public class MemoController {
	
	@Autowired
	PhonebookServiceInter service;

	@RequestMapping("/")
	public String index() {
		return "index";  
	}
	
	@RequestMapping("/list")
	public ModelAndView list() {//객체 있는 상태는 ModelAndView
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",service.getList());
		mv.setViewName("list");
		return mv;
	}
	
	@RequestMapping("/find")
	public ModelAndView list(String search) {//객체 있는 상태는 ModelAndView
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",service.find(search));
		mv.setViewName("list");
		return mv;
	}
	
	/*
	 //폼 이용시
	@RequestMapping("/insertProc")
	public String insertProc(PhonebookVO pb) {
		int result=service.insert(pb);
		return "redirect:/";
	}*/
	
	
	//ajax처리시
	@RequestMapping("/insert")
	public ModelAndView insertProc(PhonebookVO pb) {
		ModelAndView mv = new ModelAndView();
		//ㅊ첫번째 작업 입력
		int result=service.insert(pb);
		//두번ㅉㅐ 작업 입력, 리스트 요청, 페이지 이동하는 것이 아니라 결과로 돌려주는 것
		mv.addObject("list",service.getList());
		mv.setViewName("list");
		return mv;
	}
	
	
	
	@RequestMapping("/findOne")
	public ModelAndView findOne(int idx) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", service.findOne(idx)); 
		mv.setViewName("findOne"); //페이지이동
		return mv;
	}
	
	@RequestMapping("/update")
	public ModelAndView update(int idx) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("list", service.findOne(idx)); 
		mv.setViewName("updateForm");
		return mv;
	}
	
	
	@RequestMapping("/updateProc")
	public String updateProc(PhonebookVO pb) {
		System.out.println(pb.toString());
		int result=service.update(pb);
		
		
		return "redirect:/";
	}
	
	@RequestMapping("/delete")
	public ModelAndView delete(int idx) {
		ModelAndView mv = new ModelAndView();
		//ㅊ첫번째 작업 입력
		
		int result=service.delete(idx);
		//두번ㅉㅐ 작업 입력, 리스트 요청, 페이지 이동하는 것이 아니라 결과로 돌려주는 것
		mv.addObject("list",service.getList());
		mv.setViewName("list");
		return mv;
	}
	

}
