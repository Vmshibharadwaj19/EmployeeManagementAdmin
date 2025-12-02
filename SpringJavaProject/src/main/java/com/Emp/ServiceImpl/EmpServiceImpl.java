package com.Emp.ServiceImpl;


import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.Emp.Entities.Employee;
import com.Emp.Exceptions.CustomExcep;
import com.Emp.Map.EmpMap;
import com.Emp.Repos.EmpRepo;
import com.Emp.Service.EmpService;
import com.Emp.dto.EmpDto;

@Service
public class EmpServiceImpl implements EmpService {
	
	private final  EmpRepo repo;
	
	EmpServiceImpl(EmpRepo repo)
	{
		this.repo=repo;
	}
	@Override
	public
	EmpDto createEmp(EmpDto emp)
	{
		Employee empl=EmpMap.mapToEmp(emp);
		Employee saved=repo.save(empl);
		return EmpMap.map(saved);
	}
	
	@Override
	public EmpDto getEmpById(Long Id) {
		// TODO Auto-generated method stub
		Employee emp=repo.findById(Id).orElseThrow(()-> new CustomExcep("Employee Not found with given Id :"+ Id));
		return EmpMap.map(emp);
	}
	@Override
	public List<EmpDto> getAllEmployee() {
		// TODO Auto-generated method stub
		List<Employee> allEmp=repo.findAll();
		
		return allEmp.stream().map((emp)->EmpMap.map(emp)).collect(Collectors.toList());
	}
	@Override
	public EmpDto UpdateEmp(Long id,EmpDto emp) {
		// TODO Auto-generated method stub
		Employee byId=repo.findById(id).orElseThrow(()-> new CustomExcep("Employee not found"));
		byId.setEmail(emp.getEmail());
		byId.setFirst_Name(emp.getFirstName());
		byId.setLast_Name(emp.getLastName());
	    Employee e=	repo.save(byId);
		return EmpMap.map(e);
	}
	
	@Override
	public void deleteEmp(Long id)
	{
		repo.deleteById(id);
	}
   
}
