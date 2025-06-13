package com.NewBank.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Customer.connect.Connector;
import com.NewBank.dto.*;

public class CustomerDAOimpl implements CustomerDAO {
	private Connection con;
	public CustomerDAOimpl() {
		this.con=Connector.requestConnection();
	}

	public boolean insertCustomer(Customer c) {
		PreparedStatement ps=null;
		String query="INSERT INTO CUSTOMER VALUES(0,?,?,?,0.00,?)";
		int res=0;
		try {
			con.setAutoCommit(false);
			ps=con.prepareStatement(query);
			ps.setString(1,c.getName());
			ps.setLong(2,c.getPhone());
			ps.setString(3,c.getMail());
			ps.setInt(4,c.getPin());
			res=ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		if(res>0) {
			try {
				con.commit();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return true;
		}
		else {
			try {
				con.rollback();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
			return false;
		}
	}


	public Customer getCustomer(long accno, int pin) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Customer c=null;
		String query="SELECT *  FROM CUSTOMER WHERE ACC_NO=? AND PIN=?";
		try {
			ps=con.prepareStatement(query);
			ps.setLong(1, accno);
			ps.setInt(2, pin);
			rs=ps.executeQuery();
			if(rs.next()) {
				c=new Customer();
				c.setACC_NO(rs.getLong(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setBalance(rs.getDouble(5));
				c.setPin(rs.getInt(6));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return c;

	}


	public Customer getCustomer(long phone, String mail) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		Customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE PHONE=? AND MAIL=?";
		try {
			ps=con.prepareStatement(query);
			ps.setLong(1, phone);
			ps.setString(2, mail);
			rs=ps.executeQuery();
			if(rs.next()) {
				c=new Customer();
				c.setACC_NO(rs.getInt(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setBalance(rs.getDouble(5));
				c.setPin(rs.getInt(6));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return c;
	}


	public Customer getCustomer(long accno) {
		// TODO Auto-generated method stub
		String query="SELECT * FROM CUSTOMER WHERE ACC_NO=?";
		Customer c=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setLong(1, accno);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Customer();
				c.setACC_NO(rs.getLong(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setBalance(rs.getDouble(5));
				c.setPin(rs.getInt(6));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return c;
	}

	public ArrayList<Customer> getCustomer() {
		// TODO Auto-generated method stub
		ArrayList<Customer>ac=new ArrayList<>();
		Customer c=null;
		String query="SELECT * FROM CUSTOMER WHERE ACC_NO!=1100110011";
		try{
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Customer();
				c.setACC_NO(rs.getLong(1));
				c.setName(rs.getString(2));
				c.setPhone(rs.getLong(3));
				c.setMail(rs.getString(4));
				c.setBalance(rs.getDouble(5));
				c.setPin(rs.getInt(6));
				ac.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return ac;
	}


	public boolean updateCustomer(Customer c) {
		// TODO Auto-generated method stub
		String query="UPDATE CUSTOMER SET NAME=?,PHONE=?,MAIL=?,BALANCE=?,PIN=? WHERE ACC_NO=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, c.getName());
			ps.setLong(2,c.getPhone());
			ps.setString(3, c.getMail());
			ps.setDouble(4,c.getBalance());
			ps.setInt(5, c.getPin());
			ps.setLong(6, c.getACC_NO());
			i=ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		if(i>0) {
			return true;	
		}
		else {
			return false;
		}
	}		


	public boolean deleteCustomer(Customer c) {
		// TODO Auto-generated method stub
		String query="DELETE FROM CUSTOMER WHERE ACC_NO=?";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setLong(1,c.getACC_NO());;
			i=ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
	}

}
