import React from 'react'
import ListEmployee from './Components/ListEmployee.jsx'
import HeaderComponent from './Components/HeaderComponent.jsx'
import Footer from './Components/Footer.jsx'
import { BrowserRouter,Routes,Route } from 'react-router-dom'
import EmployeeComponent from './Components/EmployeeComponent.jsx'
const App = () => {
  return (
    <>
    <BrowserRouter>
      <div className="d-flex flex-column min-vh-100"> 
      {/* main content */}
      <div className="flex-grow-1">
        <HeaderComponent />
        <Routes>
          {/* http:localhost:3000/employees or just url without employees*/}
          <Route path='/' element={<ListEmployee/>}></Route>
          <Route path='/employees' element={<ListEmployee/>}></Route>
          {/* when ever user clicks on the add Employee button it redirect to /add-Employee url ,where it is routed to component Employee component using dom router */}
          <Route path='/add-employee' element={<EmployeeComponent/>}></Route>
          <Route path='/Update-employee/:id' element={<EmployeeComponent/>}></Route>
        </Routes>
        {/* <ListEmployee /> */}
      </div>

      {/* footer sits at bottom */}
      <Footer />
     </div>
    </BrowserRouter>
    </>
  )
}

export default App
