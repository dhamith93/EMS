let divs = document.getElementsByClassName('content-area');
let tabs = document.getElementsByClassName('tab');

for (let i = 0; i < tabs.length; i++) {
    tabs[i].addEventListener('click', function(e) {
        processClickOnTab(this);
    });
}

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
	resetTable();
	if (data.length > 0) {
		let tBody=document.getElementsByTagName("tbody").item(0);
	    for (let i = 0; i < data.length; i++) {
	        let id = data[i]['empId'];
	        let firstName = data[i]['firstName'];
	        let lastName = data[i]['lastName'];
	        let dept = data[i]['deptName'];

	        let link = document.createElement('a');
	        link.href = 'employee/'+id;
	        link.innerHTML = 'More Info...';

	        let tr = document.createElement('tr');
	        let cell1 = document.createElement('td');
	        let cell2 = document.createElement('td');
	        let cell3 = document.createElement('td');
	        let cell4 = document.createElement('td');   
	        let cell5 = document.createElement('td'); 
	        
	        cell1.appendChild(document.createTextNode(id));
	        cell2.appendChild(document.createTextNode(firstName));
	        cell3.appendChild(document.createTextNode(lastName));
	        cell4.appendChild(document.createTextNode(dept));
	        cell5.appendChild(link);
	        
	        tr.appendChild(cell1);        
	        tr.appendChild(cell2);       
	        tr.appendChild(cell3);   
	        tr.appendChild(cell4);    
	        tr.appendChild(cell5);  
	        tBody.appendChild(tr);
	    }
	}	
}

function resetTable() {
	let elements = document.getElementById('result-table').getElementsByTagName('tbody');
    let length = elements[0].childNodes.length - 1;
    for (let i = length; i > 0; i--)
        elements[0].removeChild(elements[0].childNodes[i]);    
}