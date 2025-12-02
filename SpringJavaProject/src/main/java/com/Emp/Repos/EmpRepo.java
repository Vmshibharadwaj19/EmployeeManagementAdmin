package com.Emp.Repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Emp.Entities.Employee;

@Repository
public interface EmpRepo extends JpaRepository<Employee,Long> 
{
 
	
}
