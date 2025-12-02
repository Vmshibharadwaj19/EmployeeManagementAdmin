import React, { useEffect, useState } from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import { getEmployees } from "../services/EmployeeService.js";
import { useNavigate } from "react-router-dom";
import { deleteEmployee } from "../services/EmployeeService.js";

const ListEmployee = () => {
  const [response, setResponse] = useState([]);
const navigator=useNavigate();
  useEffect(() => {
    getEmployees()
      .then((res) => {
        setResponse(res.data);
      })
      .catch((err) => {
        console.error(err);
      });
  }, []);

  

  const handleDelete = (id) => {
   let a= confirm("Are you sure you want to delete this employee?");
   console.log(a);
   if(!a){
    return;
   }
   deleteEmployee(id).then((res)=>{
    setResponse(response.filter(emp=>emp.id!==id));
    alert("Employee Deleted Successfully");
   }).catch((err)=>{
    console.error(err);
   });
    console.log("Delete:", id);
  };
const handleUpdate=(id)=>{
    navigator(`/Update-employee`+`/${id}`);
    console.log(id);
    

}
  const handleAddEmployee = () => {
    navigator('/add-employee');
    console.log("Add Employee clicked");
  };

  return (
    <div className="container mt-4">
      <h2 className="mb-3">Employee List</h2>

      {/* Add Employee button */}
      <div className="mb-3">
        <button className="btn btn-primary" onClick={handleAddEmployee}>
          <span className="me-1">+</span>
          Add Employee
        </button>
      </div>

      <table className="table table-bordered table-striped">
        <thead className="table-dark">
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>LastName</th>
            <th>Email</th>
            <th>Actions</th>
          </tr>
        </thead>

        <tbody>
          {response.map((emp) => (
            <tr key={emp.id}>
              <td>{emp.id}</td>
              <td>{emp.firstName}</td>
              <td>{emp.lastName}</td>
              <td>{emp.email}</td>
              <td>
                <button
                  className="btn btn-primary btn-sm me-2"
                  onClick={() => handleUpdate(emp.id)}
                >
                  Edit
                </button>

                <button
                  className="btn btn-danger btn-sm"
                  onClick={() => handleDelete(emp.id)}
                >
                  Delete
                </button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default ListEmployee;
