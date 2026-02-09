using { employee as my } from '../db/schema';

service EmployeeService {
    @odata.draft.enabled: true
    entity Employees as projection on my.Employees;

    // Expose these for the Value Helps (dropdowns)
    @readonly entity Departments as projection on my.Departments;
    @readonly entity Statuses as projection on my.Statuses;
}