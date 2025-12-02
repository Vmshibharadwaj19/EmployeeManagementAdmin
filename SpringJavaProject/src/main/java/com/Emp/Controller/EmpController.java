package com.Emp.Controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.Emp.Service.EmpService;
import com.Emp.dto.EmpDto;

@CrossOrigin("*")
@RestController
@Controller
@RequestMapping("/api/employees")
public class EmpController {
 private EmpService empserve;
 EmpController(EmpService empserve)
 {
	 this.empserve=empserve;
 }
 //build add employee Rest Api
 
 
 
 @GetMapping("{id}")
  public ResponseEntity<EmpDto> getEmpById(@PathVariable("id") Long id)
  {
	 EmpDto get=empserve.getEmpById(id);
	 return ResponseEntity.ok(get);
	 
  }
 
 @GetMapping
  public ResponseEntity<List<EmpDto>> getAllEmp()
  {
	 List<EmpDto> allemp=(List<EmpDto>) empserve.getAllEmployee();
	 
	 return ResponseEntity.ok(allemp);
  }
 
 //Build Update Employee Rest Api
 @PutMapping("{id}")
  public ResponseEntity<EmpDto> UpdateEmp(@PathVariable("id")Long id,@RequestBody EmpDto emp)
  {
	  EmpDto empdt=empserve.UpdateEmp(id, emp);
	  return ResponseEntity.ok(empdt);
  }
 //Delete Rest Api
 @DeleteMapping("{id}")
 public ResponseEntity<String> deleteEmp(@PathVariable("id") Long id)
 {
	 empserve.deleteEmp(id);
	 
	 return ResponseEntity.ok("Employee deleted successfully");
 }
 
 @PostMapping
 public ResponseEntity<EmpDto> createEmp(@RequestBody EmpDto emp)
 {
	 EmpDto saved= empserve.createEmp(emp);
	 return new ResponseEntity<>(saved,HttpStatus.CREATED);
 }
}
