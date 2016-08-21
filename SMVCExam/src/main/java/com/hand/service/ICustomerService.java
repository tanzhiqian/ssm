package com.hand.service;
import java.util.*;
import com.hand.pojo.*;

public interface ICustomerService {
	public boolean selectCustomerService(Customer c);
	public List<Customer> selectAllCustomerService();
	public Result getByPage(int page);
}
