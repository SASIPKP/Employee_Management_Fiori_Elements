namespace employee;

entity Employees {
  key ID            : Integer;
  FullName          : String not null;
  Email             : String not null;
  Department        : String not null;
  JobTitle          : String;
  Status            : String not null;
  JoinDate          : Date;
  Salary            : Decimal(9,2);
  
  criticality : Integer = case 
    when Status = 'Active'    then 3 
    when Status = 'On Leave'  then 2 
    when Status = 'Resigned'  then 1 
    else 0 
  end;
}

entity Departments {
  key Department : String;
}

entity Statuses {
  key Status : String;
}