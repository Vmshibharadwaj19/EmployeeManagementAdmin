package com.Banking;

import java.sql.Timestamp;

public class Customers {
	private int cust_Id;
	private String cust_Name;
	private String email;
	private String mob_no;
	private String address;
	private Timestamp createdAt;
	
	Customers(int cust_Id,String cust_Name,String email,String mob_no,String address,Timestamp createdAt)
	{
		this.cust_Id=cust_Id;
		this.cust_Name=cust_Name;
		this.email=email;
		this.mob_no=mob_no;
		this.address=address;
		 this.createdAt = createdAt; 
		
	}
	
	public  int getCust_id()
	{
		return cust_Id;
	}
    public String getCustName()
    {
    	return cust_Name;
    }
    public String getEmail()
    {
    	return email;
    }
    public String getMobno()
    {
    	return mob_no;
    }
    public String getAddress()
    {
    	return address;
    }
    public Timestamp getCreatedAt()
    {
    	return createdAt;
    }
}
