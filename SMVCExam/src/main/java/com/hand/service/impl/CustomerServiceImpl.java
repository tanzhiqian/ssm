package com.hand.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.hand.dao.ICustomerMapper;

import com.hand.pojo.Customer;
import com.hand.pojo.Paramer;
import com.hand.pojo.Result;
import com.hand.service.ICustomerService;

@Service
public class CustomerServiceImpl implements ICustomerService {

	@Resource
	private ICustomerMapper customerMapper;

	
	public boolean selectCustomerService(Customer c) {
		Customer customer=customerMapper.selectCustomer(c);
		if(customer==null)
		{
			return false;
		}
		else
		{
			return true;
		}
	}


	public List<Customer> selectAllCustomerService() {
		// TODO Auto-generated method stub
		return customerMapper.selectAllCustomer();
	}


	public Result getByPage(int page) {
		int size = 10;
		int begin=(page-1)*size;
		Paramer p=new Paramer();
		p.setBegin(begin);
		p.setSize(size);
		List<Customer> list = this.customerMapper.selectByPage(p);
		int totalPage = this.customerMapper.getTotalPage();
		Result result = new Result();
		result.setList(list);
		result.setTotal(totalPage);
		return result;
	}

}
