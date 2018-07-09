$(window).on('load', function() {
    setNotification();
});

function setNotification() {
    let span = document.getElementById('leave-notification');
    if (approvedLeaveCount > 0) {
        span.innerHTML = approvedLeaveCount;
        span.style.display = 'inline-block';
    } else {
        span.innerHTML = '';
        span.style.display = 'none';
    }
}

$("#reqLeaveForm").submit(function(e) {

    $.ajax({
           type: 'POST',
           url: 'RequestLeaveAction.action',
           data: $('#reqLeaveForm').serialize(),
           success: function(data) {
               let result = JSON.parse(data);
               if (result['status'] === 'OK') {
                   alert('Leave request successful!');
                   document.getElementById('reqLeaveForm').reset();
               } else if (result['status'] === 'OUT_OF_LEAVES') {
                   alert('You are out of leaves!');
               } else { 
                   alert('Encountered an error! Please check your data and try again later...');
               }
           }
         });

    e.preventDefault();
});

$("#reqShortLeaveForm").submit(function(e) {

    $.ajax({
           type: 'POST',
           url: 'RequestLeaveAction.action',
           data: $('#reqShortLeaveForm').serialize(),
           success: function(data) {
               let result = JSON.parse(data);
               if (result['status'] === 'OK') {
                   alert('Leave request successful!');
                   document.getElementById('reqShortLeaveForm').reset();
               } else if (result['status'] === 'OUT_OF_LEAVES') {
                   alert('You are out of leaves!');
               } else { 
                   alert('Encountered an error! Please check your data and try again later...');
               }
           }
         });

    e.preventDefault();
});

$('.confirm-link').click(function(e) {  
    let element = this;
    $.ajax({
        type: 'POST',
        url: 'ConfirmLeaveAction.action',
        data: { 
            'leaveId': this.id
        },
        success: function(data) {
            let result = JSON.parse(data);
            if (result['status'] === 'OK') {
               alert('Leave confirmed!');
               element.replaceWith('YES');
               approvedLeaveCount -= 1;
               setNotification()
            } else if (result['status'] === 'NOT_APPROVED') {
               alert('Your leave is not yet approved.');
            } else { 
               alert('Encountered an error! Please check your data and try again later...');
            }
        }
      });

    e.preventDefault();
});

$('.progress-link').click(function(e) { 
    let element = this;
    let inputs = document.getElementsByClassName('progInput');
    let progress;
    for (let i = 0; i < inputs.length; i++) {
        if (inputs[i].id === this.id)
            progress = inputs[i].value;
    }
    if (parseFloat(progress) > 100 || parseFloat(progress) < 0) {
        alert('Progress must be 0 --> 100!');
        return;
    }
    $.ajax({
        type: 'POST',
        url: 'SetTaskProgressAction.action',
        data: { 
            'taskId': this.id,
            'progress': progress
        },
        success: function(data) {
            let result = JSON.parse(data);
            if (result['status'] === 'OK') {
               alert('Progress is set!');
            } else { 
               alert('Encountered an error! Please check your data and try again later...');
            }
        }
      });

    e.preventDefault();
});