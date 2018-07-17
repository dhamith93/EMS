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