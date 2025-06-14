package com.NewBank.DAO;

import java.util.ArrayList;

import com.NewBank.dto.Customer;

public interface CustomerDAO {
	public boolean insertCustomer(Customer c);   
	public Customer getCustomer(long accno,int pin);
	public Customer getCustomer(long phone,String mail);
	public Customer getCustomer(long accno);
	public ArrayList<Customer> getCustomer();
	//public List getCustomer(Customer c);
	public boolean updateCustomer(Customer c);
	public boolean deleteCustomer(Customer c);
}
