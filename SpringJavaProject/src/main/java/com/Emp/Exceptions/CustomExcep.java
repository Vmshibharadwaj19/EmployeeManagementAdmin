package com.Emp.Exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value=HttpStatus.NOT_FOUND)
public class CustomExcep extends RuntimeException {

	public CustomExcep(String Msg)
	{
		super(Msg);
	}
	 
	
}
