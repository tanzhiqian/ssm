package com.hand.dao;

import java.util.List;

import com.hand.pojo.*;

public interface ICustomerMapper {
	public Customer selectCustomer(Customer c);

	public List<Customer> selectAllCustomer();

	public Integer insertCustomer();

	List<Customer> selectByPage(Paramer p);

	int getTotalPage();
}
