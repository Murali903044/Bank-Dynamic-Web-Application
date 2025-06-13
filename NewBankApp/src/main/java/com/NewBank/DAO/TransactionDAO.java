package com.NewBank.DAO;

import java.util.ArrayList;

import com.NewBank.dto.Transaction;

public interface TransactionDAO {
	public boolean insertTransaction(Transaction t);
	public ArrayList<Transaction> getTransaction(long user);
	public ArrayList<Transaction>getTransaction ();
}
