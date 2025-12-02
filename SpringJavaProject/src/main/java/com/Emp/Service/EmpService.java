package com.Emp.Service;

import java.util.List;

import com.Emp.dto.EmpDto;

public interface EmpService {
  EmpDto createEmp(EmpDto emp);
  
  EmpDto getEmpById(Long Id);
	  
 List<EmpDto> getAllEmployee();
  EmpDto UpdateEmp(Long id , EmpDto emp);
 
  void deleteEmp(Long id);
}
