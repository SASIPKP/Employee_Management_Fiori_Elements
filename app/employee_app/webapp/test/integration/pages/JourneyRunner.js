sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/myorg/employeeapp/test/integration/pages/EmployeesList",
	"com/myorg/employeeapp/test/integration/pages/EmployeesObjectPage"
], function (JourneyRunner, EmployeesList, EmployeesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/myorg/employeeapp') + '/test/flp.html#app-preview',
        pages: {
			onTheEmployeesList: EmployeesList,
			onTheEmployeesObjectPage: EmployeesObjectPage
        },
        async: true
    });

    return runner;
});

