package com.Emp.Map;

import com.Emp.Entities.Employee;
import com.Emp.dto.EmpDto;

public class EmpMap {

	public static EmpDto map(Employee emp)
	{
		return new EmpDto(emp.getId(),emp.getFirst_Name(),emp.getLast_Name(),emp.getEmail());
	}
	
	public static Employee mapToEmp(EmpDto emp)
	{
		 return new Employee(emp.getId(),emp.getFirstName(),emp.getLastName(),emp.getEmail());
	}
}
