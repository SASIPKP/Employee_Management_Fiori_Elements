using EmployeeService as service from '../../srv/service';

// 1. Value Help and Field Control Annotations

annotate service.Employees with {

    // Mandatory Fields (Red asterisk in UI)
    FullName   @Common.FieldControl : #Mandatory;
    Email      @Common.FieldControl : #Mandatory;
    Department      @Common.FieldControl : #Mandatory;
    Status      @Common.FieldControl : #Mandatory;

    Department @Common.ValueListWithFixedValues: true
               @Common.ValueList: {
        CollectionPath: 'Departments', 
        Parameters: [
            { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: Department, ValueListProperty: 'Department' }
        ]
    };

    Status @Common.ValueListWithFixedValues: true
           @Common.ValueList: {
        CollectionPath: 'Statuses', 
        Parameters: [
            { $Type: 'Common.ValueListParameterInOut', LocalDataProperty: Status, ValueListProperty: 'Status' }
        ]
    };
};

// 2. UI Layout Annotations
annotate service.Employees with @(
    // Defining SelectionFields prioritizes these filters on the bar.
    UI.SelectionFields : [
        Department,
        Status
    ],

    UI.HeaderInfo : {
        TypeName       : 'Employee',
        TypeNamePlural : 'Employees',
        Title          : { Value: 'Employee Management' }
    },
    
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { Label : 'ID', Value : ID },
            { Label : 'FullName', Value : FullName },
            { Label : 'Email', Value : Email },
            { Label : 'Department', Value : Department },
            { Label : 'JobTitle', Value : JobTitle },
            { Label : 'Status', Value : Status },
            { Label : 'JoinDate', Value : JoinDate },
            { Label : 'Salary', Value : Salary },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        { Label : 'ID', Value : ID },
        { Label : 'FullName', Value : FullName },
        { Label : 'Email', Value : Email },
        { Label : 'Department', Value : Department },
        { Label : 'Status', Value : Status, Criticality : criticality },
    ],
);
