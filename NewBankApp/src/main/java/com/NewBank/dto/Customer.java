package com.NewBank.dto;

public class Customer {
	private long ACC_NO;
	private String name;
	private long phone;
	private String mail;
	private double balance;
	private int pin;

	public long getACC_NO() {
		return ACC_NO;
	}
	public void setACC_NO(long ACC_NO) {
		this.ACC_NO = ACC_NO;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public int getPin() {
		return pin;
	}
	public void setPin(int pin) {
		this.pin = pin;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return " [ACC_NO=" + ACC_NO + ", name=" + name + ", phone=" + phone + ", mail=" + mail + ", balance=" + balance
				+ ", pin=" + pin + "]";
	}
}


