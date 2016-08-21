package com.hand.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hand.pojo.Customer;
import com.hand.pojo.Result;
import com.hand.service.ICustomerService;
@Controller
@RequestMapping("/customerController")
public class CustomerController {
	
	@Resource
	private ICustomerService customerService;
	private List<Customer> customerList;
	
	
	@RequestMapping("/customerLogin")
	public String CustomerLogin(Customer customer,Model model,HttpServletRequest req){
		String res="";
		
		boolean b=customerService.selectCustomerService(customer);
		if(b)
		{
			System.out.println("登陆成功");
			res="/index";
//			List<Customer> list=customerService.selectAllCustomerService();
//			
//			for(int i=0;i<list.size();i++)
//			{
//			System.out.println(list.get(i).getFirst_name());
//			System.out.println(list.get(i).getLast_name());
//			}
//			req.setAttribute("mes", customerService.selectAllCustomerService());
		}
		else
		{
			System.out.println("用户不存在");
			res="/error";
		}
//		model.addAttribute("customer", customer);
//		if(customer.getFirst_name().trim().equals("first_name"))
//		{
//			session.setAttribute("customer", customer);
//			res="/index";
//		}
//		else{  
//			res="/error";
//		}
		return res;
	}
//	@RequestMapping("/showCustomer")
//	public String showAllCustomer(Model model){
//		customerList=customerService.selectAllCustomerService();
//		model.addAttribute("customerList", customerList);
//		return "model";
//	}
	@RequestMapping("/getByPage")
	@ResponseBody
	public Result getByPage(int page){
		
		Result result = this.customerService.getByPage(page);
		return result;
		
	}
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		if (session.getAttribute("customer") != null) {
			session.setAttribute("customer", null);
			return "/login";
		}
		return "/login";
	}
}
