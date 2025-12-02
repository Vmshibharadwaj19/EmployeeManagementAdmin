import axios from "axios";

const Rest_Api_Url= 'http://localhost:8080/api/employees';

export const getEmployees = async () => {
    return await axios.get(Rest_Api_Url);
}
export const createEmployee = async (employee) => {
    return await axios.post(Rest_Api_Url, employee);
}

export const getEmployeeById = async (employeeId) => {
    return await axios.get(`${Rest_Api_Url}/${employeeId}`);
}

export const updateEmployee = async(employeeId, employee) => {
    return await axios.put(`${Rest_Api_Url}/${employeeId}`, employee);
}
export const deleteEmployee = async(employeeId) => {
    return await axios.delete(`${Rest_Api_Url}/${employeeId}`);
}