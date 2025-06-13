package com.NewBank.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.Customer.connect.Connector;
import com.NewBank.dto.*;

public class TransactionDAOimpl implements TransactionDAO {
	private Connection con;
	public TransactionDAOimpl() {
		this.con=Connector.requestConnection();
	}

	public boolean insertTransaction(Transaction t) {
		// TODO Auto-generated method stub
		String query="INSERT INTO PASSBOOK (TRANS_ID,USER_ACC,REC_ACC,TRAN_DATE,TRAN_TYPE,AMOUNT,BALANCE) VALUES(?,?,?,SYSDATE(),?,?,?)";
		//Connection con=null;
		int res=0;
		try {
			con.setAutoCommit(false);
			PreparedStatement ps=con.prepareStatement(query);
			ps.setLong(1, t.getTransactionId());
			ps.setLong(2, t.getUser());
			ps.setLong(3, t.getRec_acc());
			ps.setString(4, t.getTransaction());
			ps.setDouble(5, t.getAmount());
			ps.setDouble(6, t.getBalance());
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
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return false;
		}

	}


	public ArrayList<Transaction>getTransaction(long user) {
		// TODO Auto-generated method stub
		ArrayList<Transaction>at1=new ArrayList<Transaction>();
		Transaction t1=null;
		String query="SELECT * FROM PASSBOOK WHERE USER_ACC=? or REC_ACC=?  ORDER BY TRAN_DATE DESC";

		try{
			PreparedStatement ps=con.prepareStatement(query);
			ps.setLong(1, user);
			ps.setLong(2, user);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				t1=new Transaction();
				t1.setTransactionId(rs.getLong(1));
				t1.setUser(rs.getLong(2));
				t1.setRec_acc(rs.getLong(3));
				t1.setDate(rs.getString(4));
				t1.setTransaction(rs.getString(5));
				t1.setAmount(rs.getDouble(6));
				t1.setBalance(rs.getDouble(7));
				at1.add(t1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return at1;
	}


	public ArrayList<Transaction> getTransaction() {
		// TODO Auto-generated method stub
		ArrayList<Transaction> tra=new ArrayList<>();
		Transaction t=null;
		String query="SELECT * FROM PASSBOOK ORDER BY TRAN_DATE DESC";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				t=new Transaction();
				t.setTransaction(rs.getString(1));
				t.setUser(rs.getLong(2));
				t.setRec_acc(rs.getLong(3));
				t.setDate(rs.getString(4));
				t.setTransaction(rs.getString(5));
				t.setAmount(rs.getDouble(6));
				t.setBalance(rs.getDouble(7));
				tra.add(t);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return tra;
	}

}
