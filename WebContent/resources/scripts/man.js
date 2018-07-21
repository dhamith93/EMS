$(window).on('load', function() {
    setNotification();
    getPerformance();
});

function setNotification() {
    let span = document.getElementById('leave-notification');
    if (unapprovedLeaveCount > 0) {
        span.innerHTML = unapprovedLeaveCount;
        span.style.display = 'inline-block';
    } else {
        span.innerHTML = '';
        span.style.display = 'none';
    }
    
    span = document.getElementById('task-notification');
    if (finishedTaskCount > 0) {
        span.innerHTML = finishedTaskCount;
        span.style.display = 'inline-block';
    } else {
        span.innerHTML = '';
        span.style.display = 'none';
    }
}

function showGraph(result) {
	if (result) {
	    let labels = [];
	    let perfromance = [];
	
	
	    for(const [key, value] of Object.entries(result)) {
		    labels.push(key); 
		    perfromance.push(value);
	    }
	
	    let gpaChart = document.getElementById("myChart").getContext("2d");
	    let lineChart = new Chart(gpaChart, {
		    type: "line",
		    data: {
		        labels: labels,
		        datasets: [{
		            label: 'Perfromance',
		            data: perfromance,
		            borderColor: '#F93B23'
		        }]
		    },
		    options: {
		        
		    }
	    });
	}
}

function getPerformance() {
	$.ajax({
	    type : 'GET',
	    url : 'GetDepartmentPerformanceAction.action?deptId=' + deptId,
	    dataType : 'json',
	    error : function() {
	        console.log('error getting a response from SearchAction...');
	    },
	    success : function(data) {
	        let result =  JSON.parse(data.replace('//', ''));
	        if (result['status']) {
	        	console.log('error getting a response from SearchAction...');
	        } else {
	        	showGraph(result);	        	
	        }
	    }
	});
}

$("#addTask").submit(function(e) {

    $.ajax({
           type: 'POST',
           url: 'AddTaskAction.action',
           data: $('#addTask').serialize(),
           success: function(data) {
               let result = JSON.parse(data);
               if (result['status'] === 'OK') {
                   showMessage('Success', 'Task has beed added to Employee successfully!');
                   closeNewTaskPrompt();
               } else { 
                   showMessage('Error', 'Encountered an error! Please check your data and try again later...');
               }
           }
         });

    e.preventDefault();
});

$(document).on('click', '.performance-link', function(e) {
    e.preventDefault();
    let taskId = this.id;
    let empId = this.getAttribute("data-empId");
    prompt(            
            function() { 
                let performance = document.getElementById('prompt-performance').value;
                let notes = document.getElementById('prompt-notes').value;

                $.ajax({
                    type: 'POST',
                    url: 'ConfirmTaskAction.action',
                    data: {
                    	'empId':empId,
                    	'taskId':taskId,
                    	'performance':performance,
                    	'notes':notes
                    },
                    success: function(data) {
                        let result = JSON.parse(data);
                        if (result['status'] === 'OK') {
                            showMessage('Success', 'Task Completed');
                            document.getElementById('complete-' + taskId).innerHTML = 'YES';
                            finishedTaskCount -= 1;
                            setNotification();
                        } else { 
                            showMessage('Error', 'Encountered an error! Please check your data and try again later...');
                        }
                    }
                  });                
            }, 
            function() { } // leave this empty! This is the cancel event
    );
});

$(document).on('click', '.leave-approve-link', function(e) {
    e.preventDefault();
    let id = this.id;
	$.ajax({
        type: 'POST',
        url: 'ApproveLeaveAction.action',
        data: {
        	'leaveId': id,
    	},
        success: function(data) {
            let result = JSON.parse(data);
            if (result['status'] === 'OK') {
                showMessage('Success', 'Leave approved');
                document.getElementById('status-'+id).innerHTML = 'APPROVED';
                unapprovedLeaveCount -= 1;
                setNotification();
            } else {
            	showMessage('Error', 'Encountered an error! Please check your data and try again later...');
            }
        }
   });                
});

$(document).on('click', '.leave-disapprove-link', function(e) {
    e.preventDefault();
    let id = this.id;
    $.ajax({
        type: 'POST',
        url: 'DisapproveLeaveAction.action',
        data: {
            'leaveId': id,
        },
        success: function(data) {
            let result = JSON.parse(data);
            if (result['status'] === 'OK') {
                showMessage('Success', 'Leave disapproved');
                document.getElementById('status-'+id).innerHTML = 'DISAPPROVED';
                unapprovedLeaveCount -= 1;
                setNotification();
            } else {
                showMessage('Error', 'Encountered an error! Please check your data and try again later...');
            }
        }
   });                
});