```bash
EmployeeManagementSystem/
├── backend/                                   # Spring Boot Application Root
│   ├── .mvn/
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/
│   │   │   │   └── com/
│   │   │   │       └── Emp/                   # Base Package
│   │   │   │           ├── Controller/        # EmpController.java
│   │   │   │           ├── Entities/          # Employee.java
│   │   │   │           ├── Exceptions/        # CustomExcep.java
│   │   │   │           ├── Map/               # EmpMap.java
│   │   │   │           ├── Repos/             # EmpRepo.java
│   │   │   │           ├── Service/           # EmpService.java
│   │   │   │           ├── ServiceImpl/       # EmpServiceImpl.java
│   │   │   │           └── dto/               # EmpDto.java
│   │   │   └── resources/
│   │   │       ├── application.properties     # DB configuration
│   │   │       └── static/
│   │   └── test/
│   ├── pom.xml                                # Maven build file
│   └── README.md (Backend Specific)
│
└── frontend/                                  # React Application Root
    ├── node_modules/
    ├── public/
    ├── src/
    │   ├── components/
    │   │   ├── EmployeeComponent.jsx          # Add/Update Form
    │   │   ├── Footer.jsx
    │   │   ├── HeaderComponent.jsx
    │   │   └── ListEmployee.jsx               # Display Table
    │   ├── services/
    │   │   └── EmployeeService.js             # Axios API calls
    │   └── App.jsx
    ├── package.json
    ├── .gitignore
    └── README.md (Frontend Specific)
