let divs = document.getElementsByClassName('content-area');
let tabs = document.getElementsByClassName('tab');
let addEmpBtn = document.getElementById('add-emp-btn');

for (let i = 0; i < tabs.length; i++) {
    tabs[i].addEventListener('click', function(e) {
        processClickOnTab(this);
    });
}

let employees;

function processClickOnTab(tab) {
    let div;
    switch (tab.id) {
        case 'home-btn':
            div = document.getElementById('homeTab');
            break;
        case 'add-btn':
            div = document.getElementById('addTab');
            break;
        case 'dept-btn':
            div = document.getElementById('deptTab');            
            break;
        case 'leave-btn':
            div = document.getElementById('leaveTab');
            break;
    }
    navigationHandler(tab, div);
}

function navigationHandler(tab, div) {
    for (let i = 0; i < divs.length; i++) {
        divs[i].style.display = 'none';
        tabs[i].classList.remove('active');
    }    
    div.style.display = 'block';
    tab.classList.add('active');
}

let searchInput = document.getElementById('search-val')
let timer;
searchInput.addEventListener('keyup', function(e) {	
	e.preventDefault();
	clearTimeout(timer);
	timer = setTimeout(function() {
      search();
    }, 400);
}); 

function search() {
	$.ajax({
       type: 'GET',
       url:'SearchAction.action?searchValue='+ $("#search-val").val().trim()+'&searchOption='+$(".searchOption:checked").val(),
       dataType: 'json',
       error: function() {
    	   console.log('error getting a response from SearchAction...');
       },
       success: function(data){    	   
           fillTable(JSON.parse(data.replace('//', '')));
    }});
}

function fillTable(data) {	
	employees = data;
	resetTable('result-table');
	if (data.length > 0) {
		let tBody=document.getElementsByTagName("tbody").item(0);
	    for (let i = 0; i < data.length; i++) {
	        let id = data[i]['empId'];
	        let firstName = data[i]['firstName'];
	        let lastName = data[i]['lastName'];
	        let dept = data[i]['deptName'];

	        let link = document.createElement('a');
	        link.href = '#';
	        link.innerHTML = 'More Info';
	        link.classList.add('prof-link');
	        link.id = id;
	        
	        let link2 = document.createElement('a');
	        link2.href = '#';
	        link2.innerHTML = 'Leaves';
	        link2.classList.add('leaves-link');
	        link2.id = id;
	        
	        let link3 = document.createElement('a');
	        link3.href = '#';
	        link3.innerHTML = 'Tasks';
	        link3.classList.add('task-link');
	        link3.id = id;
	        
	        let deleteBtn = document.createElement('button');
	        deleteBtn.id = id;
	        deleteBtn.innerHTML = 'DELETE';
	        deleteBtn.classList.add('btn');
	        deleteBtn.classList.add('btn-danger');
	        deleteBtn.classList.add('delete-btn');	 

	        let tr = document.createElement('tr');
	        let cell1 = document.createElement('td');
	        let cell2 = document.createElement('td');
	        let cell3 = document.createElement('td');
	        let cell4 = document.createElement('td');   
	        let cell5 = document.createElement('td'); 
	        let cell6 = document.createElement('td'); 
	        let cell7 = document.createElement('td'); 
	        let cell8 = document.createElement('td'); 
	        
	        cell1.appendChild(document.createTextNode(id));
	        cell2.appendChild(document.createTextNode(firstName));
	        cell3.appendChild(document.createTextNode(lastName));
	        cell4.appendChild(document.createTextNode(dept));
	        cell5.appendChild(link);
	        cell6.appendChild(link2);
	        cell7.appendChild(link3);
	        cell8.appendChild(deleteBtn);
	        
	        tr.appendChild(cell1);        
	        tr.appendChild(cell2);       
	        tr.appendChild(cell3);   
	        tr.appendChild(cell4);    
	        tr.appendChild(cell5);  
	        tr.appendChild(cell6);  
	        tr.appendChild(cell7);  
	        tr.appendChild(cell8); 
	        tBody.appendChild(tr);
	    }
	}	
}

function fillLeavesTable(data) {	
	resetTable('leaves-table');
	if (data.length > 0) {
		let tBody=document.getElementsByTagName("tbody").item(1);
	    for (let i = 0; i < data.length; i++) {
	        let id = data[i]['empId'];
	        let type = data[i]['type'];
	        let dateFrom = data[i]['dateFrom'];
	        let dateTo = data[i]['dateTo'];
	        let timeFrom = data[i]['timeFrom'];
	        let timeTo = data[i]['timeTo'];
	        let reason = data[i]['reason'];
	        let approved = (data[i]['isApproved'] === 0) ? 'NO' : 'YES';
	        let confirmed = (data[i]['isConfirmed'] === 0) ? 'NO' : 'YES';

	        let tr = document.createElement('tr');
	        let cell1 = document.createElement('td');
	        let cell2 = document.createElement('td');
	        let cell3 = document.createElement('td');
	        let cell4 = document.createElement('td');   
	        let cell5 = document.createElement('td'); 
	        let cell6 = document.createElement('td'); 
	        let cell7 = document.createElement('td'); 
	        let cell8 = document.createElement('td'); 
	        let cell9 = document.createElement('td');
	        
	        cell1.appendChild(document.createTextNode(id));
	        cell2.appendChild(document.createTextNode(type));
	        cell3.appendChild(document.createTextNode(dateFrom));
	        cell4.appendChild(document.createTextNode(dateTo));
	        cell5.appendChild(document.createTextNode(timeFrom));
	        cell6.appendChild(document.createTextNode(timeTo));
	        cell7.appendChild(document.createTextNode(reason));
	        cell8.appendChild(document.createTextNode(approved));
	        cell9.appendChild(document.createTextNode(confirmed));
	        
	        tr.appendChild(cell1);        
	        tr.appendChild(cell2);       
	        tr.appendChild(cell3);   
	        tr.appendChild(cell4);    
	        tr.appendChild(cell5);  
	        tr.appendChild(cell6);  
	        tr.appendChild(cell7);  
	        tr.appendChild(cell8);  
	        tr.appendChild(cell9); 
	        tBody.appendChild(tr);
	    }
	}	
}

function fillTasksTable(data) {	
	resetTable('tasks-table');
	if (data.length > 0) {
		let tBody=document.getElementsByTagName("tbody").item(2);
	    for (let i = 0; i < data.length; i++) {
	        let task = data[i]['name'];
	        let desc = data[i]['desc'];
	        let from = data[i]['startOn'];
	        let to = data[i]['endOn'];
	        let performance = data[i]['performance'];
	        let notes = data[i]['notes'];

	        let tr = document.createElement('tr');
	        let cell1 = document.createElement('td');
	        let cell2 = document.createElement('td');
	        let cell3 = document.createElement('td');
	        let cell4 = document.createElement('td');   
	        let cell5 = document.createElement('td'); 
	        let cell6 = document.createElement('td'); 
	        
	        cell1.appendChild(document.createTextNode(task));
	        cell2.appendChild(document.createTextNode(desc));
	        cell3.appendChild(document.createTextNode(from));
	        cell4.appendChild(document.createTextNode(to));
	        cell5.appendChild(document.createTextNode(performance));
	        cell6.appendChild(document.createTextNode(notes));
	        
	        tr.appendChild(cell1);        
	        tr.appendChild(cell2);       
	        tr.appendChild(cell3);   
	        tr.appendChild(cell4);    
	        tr.appendChild(cell5);  
	        tr.appendChild(cell6);
	        tBody.appendChild(tr);
	    }
	}	
}

function resetTable(id) {
	let elements = document.getElementById(id).getElementsByTagName('tbody');
    let length = elements[0].childNodes.length - 1;
    for (let i = length; i > 0; i--)
        elements[0].removeChild(elements[0].childNodes[i]);    
}

$("#addEmpForm").submit(function(e) {

    $.ajax({
           type: 'POST',
           url: 'AddEmployeeAction.action',
           data: $('#addEmpForm').serialize(),
           success: function(data) {
               let result = JSON.parse(data);
               if (result['status'] === 'OK') {
            	   alert('Employee Added!');
            	   document.getElementById('addEmpForm').reset();
               } else if (result['status'] === 'passwords-no-match') {
            	   alert('Passwords don\'t match!');
               } else { 
            	   alert('Encountered an error! Please check your data and try again later...');
               }
           }
         });

    e.preventDefault();
});

$("#updateEmpForm").submit(function(e) {

    $.ajax({
       type: 'POST',
       url: 'UpdateEmployeeAction.action',
       data: $('#updateEmpForm').serialize(),
       success: function(data) {
           let result = JSON.parse(data);
           if (result['status'] === 'OK') {
        	   alert('Employee updated!');
           } else if (result['status'] === 'passwords-no-match') {
        	   alert('Passwords don\'t match!');
           } else if (result['status'] === 'ERROR_PASSWORD') {
        	   alert('Employee updated!\nError with saving the password. Please try again.');
           } else { 
        	   alert('Encountered an error! Please check your data and try again later...');
           }
       }
     });

    e.preventDefault();
});

$(document).on('click', '.prof-link', function(e) {
	e.preventDefault();
	let id = this.id;
	let emp = employees.find(function(e) {
	    return e.empId === id;
	});	
	
	$('#update-firstName').val(emp.firstName);
	$('#update-lastName').val(emp.lastName);
	$('#update-nic').val(emp.NIC);
	$('#update-DOB').val(emp.dob);
	$("#update-female").prop("checked", false);
	$("#update-male").prop("checked", false);
	
	if (emp.gender === 'male') {
		$("#update-male").prop("checked", true);
	} else {
		$("#update-female").prop("checked", true);
	}
	
	$('#update-empId').val(emp.empId);
	
	$("#update-dept option").each(function() {
        if ($(this).val() == emp.dept) {
            $(this).attr("selected","selected");    
        }
    });
	

	$('#update-Position').val(emp.position);
	$('#update-Salary').val(emp.salary);
	$('#update-JoinedDate').val(emp.joinedDate);
	$('#update-Address').val(emp.addressLine1);
	$('#update-Address2').val(emp.addressLine2);
	$('#update-City').val(emp.city);
	$('#update-TPNo').val(emp.telephoneNo);
	
	$('#emp-modal').modal('show');
});

$(document).on('click', '.leaves-link', function(e) {
	e.preventDefault();
	$.ajax({
       type: 'GET',
       url:'GetLeavesAction.action?empId='+ this.id,
       dataType: 'json',
       error: function() {
    	   console.log('error getting a response from GetLeavesAction...');
       },
       success: function(data){    	   
           fillLeavesTable(JSON.parse(data.replace('//', '')));
    }});
	$('#leaves-modal').modal('show');
});

$(document).on('click', '.task-link', function(e) {
	e.preventDefault();
	$.ajax({
       type: 'GET',
       url:'GetEmployeeTasksAction.action?empId='+ this.id,
       dataType: 'json',
       error: function() {
    	   console.log('error getting a response from GetEmployeeTasksAction...');
       },
       success: function(data){    	   
           fillTasksTable(JSON.parse(data.replace('//', '')));
    }});
	$('#task-modal').modal('show');
});

$(document).on('click', '.delete-btn', function(e) {
	e.preventDefault();
	let id = this.id;
	if (confirm('Do you want to delete employee: ' + id)) {
		$.ajax({
	       type: 'GET',
	       url:'DeleteEmployeeAction.action?empId='+ id,
	       dataType: 'json',
	       error: function() {
	    	   console.log('error getting a response from DeleteEmployeeAction...');
	       },
	       success: function(data){    	   
	    	   let result = JSON.parse(data);
	           if (result['status'] === 'OK') {
	        	   alert('Employee' + id + ' deleted!');
	        	   search();
	           } else {
	        	   alert('Encountered an error! Please check your data and try again later...');
	           }
	    }});
	}
});