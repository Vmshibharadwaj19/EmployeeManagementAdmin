import React, { useEffect, useState } from 'react'
import "bootstrap/dist/css/bootstrap.min.css";
import { createEmployee } from '../services/EmployeeService';
import { useNavigate,useParams } from 'react-router-dom';
import { getEmployeeById } from '../services/EmployeeService';
import { updateEmployee } from '../services/EmployeeService';

const EmployeeComponent = () => {
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [email, setEmail] = useState('');
    const {id}=useParams();
    const navigator=useNavigate();
    const [successMessage, setSuccessMessage] = useState('');

    useEffect(() => {
        if(id){
            getEmployeeById(id).then((res)=>{
                let employee=res.data;
                setFirstName(employee.firstName);
                setLastName(employee.lastName);
                setEmail(employee.email);
            });
        }
    }, [id]);

    const [error,setError]= useState({
        firstName: '',
        lastName: '',
        email: ''
    }); 

    const formValidation=()=>{
        let isValid=true;
        const newError={ firstName: '', lastName: '', email: '' };
        if(firstName.trim().length<2){
            newError.firstName='First name must be at least 2 characters long';
            isValid=false;
        }
        if(lastName.trim().length<2){
            newError.lastName='Last name must be at least 2 characters long';
            isValid=false;
        }
        if(!validateEmail(email)){
            newError.email='Invalid email format';
            isValid=false;
        }
        setError(newError);
        return isValid;
    }

    const validateEmail = (email) => {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    const handleFirstName = (e) => {
        setFirstName(e.target.value);
    }
    
    // 1. Worker Function: Does NOT handle event (no 'e' parameter, no e.preventDefault)
    const saveEmployee = () => {
        const employee = { firstName, lastName, email };
        if(formValidation()){
            createEmployee(employee).then((response) => {
                console.log("Employee added successfully", response.data);
                setSuccessMessage('Employee added successfully!');
                setFirstName('');
                setLastName('');
                setEmail('');
                navigator('/employees');

            }).catch((error) => {
                console.error("Something went wrong", error);
                alert('Failed to add employee. Please try again.');
                navigator('/add-employee');
            });
        }
        console.log(employee);
    }

    // 2. Worker Function: Does NOT handle event (no 'e' parameter, no e.preventDefault)
    const putEmployee=()=>{
        // Removed: e.preventDefault();
        const employee={firstName,lastName,email};
        if(formValidation()){
            updateEmployee(id,employee).then((response)=>{
                console.log("Employee updated successfully",response.data);
                navigator('/employees');
            }).catch((error)=>{
                console.error("Something went wrong",error);
                alert('Failed to update employee. Please try again.');
            });
        }
    }

    // 3. Controller Function: Handles event, prevents default, calls worker functions
    const handleEmploye = (e) => {
        e.preventDefault(); 
        if(id){
            putEmployee();
        } else {
            saveEmployee();
        }
    }

    const pageTitle=()=>{
        if(id){
            return <h2 className='text-center'>Update Employee</h2>
        }
        else{
            return <h2 className='text-center'>Add Employee</h2>
        }
    }

    return (
        <div className='container'>
            <div className='row'>
                <div className='card col-md-6 offset-md-3 mt-5'>
                    {pageTitle()}
                    <div className='card-body'>
                        <form>
                            <div className='form-group mb-2'>
                                <label className='form-label'>First Name</label>
                                <input
                                type='text'
                                placeholder='Enter the first name of the Employee'
                                name='firstName'
                                value={firstName}
                                className={`form-control ${error.firstName ? 'is-invalid' : ''}`}
                                onChange={handleFirstName}/>
                                {error.firstName? <div className='invalid-feedback'>{error.firstName}</div>:null}
                            </div>
                            <div className='form-group mb-2'>
                                <label className='form-label mt-2'>Last Name</label>
                                <input
                                    type='text'
                                    name='lastName'
                                    value={lastName}
                                    className={`form-control ${error.lastName ? 'is-invalid':''}`}
                                    onChange={(e) => setLastName(e.target.value)}
                                    placeholder='Enter the last name of the Employee'/>
                                    {error.lastName? <div className='invalid-feedback'>{error.lastName}</div>:null}
                            </div>
                            <div className='form-group mb-2'>
                                <label className='form-label mt-2'>Email</label>
                                <input
                                    type='email'
                                    name='email'
                                    value={email}
                                    className={`form-control ${error.email?'is-invalid':''}`}
                                    onChange={(e) => setEmail(e.target.value)}
                                    placeholder='Enter the email of the Employee'/>
                                    {error.email? <div className='invalid-feedback'>{error.email}</div>:null}
                            </div>
                            <div className='d-flex justify-content-center'>
                                {/* Button is correctly linked to the controller */}
                                <button className='btn btn-success mt-3 px-4' onClick={handleEmploye}>Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default EmployeeComponent