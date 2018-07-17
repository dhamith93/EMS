$(window).on('load', function() {
    setNotification();
});

function setNotification() {
    let span = document.getElementById('task-notification');
//    if (approvedLeaveCount > 0) {
//        span.innerHTML = approvedLeaveCount;
//        span.style.display = 'inline-block';
//    } else {
//        span.innerHTML = '';
//        span.style.display = 'none';
//    }
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
                        } else { 
                            showMessage('Error', 'Encountered an error! Please check your data and try again later...');
                        }
                    }
                  });
                
                console.log(taskId);
                console.log(empId);
                console.log(performance);   
                console.log(notes);
                

            }, 
            function() { } // leave this empty! This is the cancel event
    );
});