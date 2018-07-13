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
                   showMessage('Success', 'Leave request successful!');
                   document.getElementById('reqLeaveForm').reset();
               } else if (result['status'] === 'OUT_OF_LEAVES') {
                   showMessage('Error', 'You are out of leaves!');
               } else { 
                   showMessage('Error', 'Encountered an error! Please check your data and try again later...');
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
                   showMessage('Success', 'Leave request successful!');
                   document.getElementById('reqShortLeaveForm').reset();
               } else if (result['status'] === 'OUT_OF_LEAVES') {
                   showMessage('Error', 'You are out of leaves!');
               } else { 
                   showMessage('Error', 'Encountered an error! Please check your data and try again later...');
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
               showMessage('Success', 'Leave confirmed!');
               element.replaceWith('YES');
               approvedLeaveCount -= 1;
               setNotification()
            } else if (result['status'] === 'NOT_APPROVED') {
               showMessage('Error', 'Your leave is not yet approved.');
            } else { 
               showMessage('Error', 'Encountered an error! Please check your data and try again later...');
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
               showMessage('Success', 'Progress is set!');
            } else { 
               showMessage('Error', 'Encountered an error! Please check your data and try again later...');
            }
        }
      });

    e.preventDefault();
});

function markAttendance() {
    let url = 'ClockInAction.action';
    let message = 'Clocked in!';
    let html = 'CLOCK OUT';
    
    if (isClockedIn) {
        url = 'ClockOutAction.action';
        message = 'Clocked out!';
        html = 'CLOCK IN';
    }
    
    $.ajax({
        type: 'POST',
        url: url,
        data: { 
            'empId': empId
        },
        success: function(data) {
            let result = JSON.parse(data);
            if (result['status'] === 'OK') {
               showMessage('Success', message);
               isClockedIn = false;
               document.getElementById('markAttendance').innerHTML = html;
            } else { 
               showMessage('Error', 'Encountered an error! Please check your data and try again later...');
            }
        }
    });
}

function getAttendance(from, to) {
    $.ajax({
        type: 'POST',
        url: 'GetAttendanceAction.action',
        data: { 
            'empId': empId,
            'from': from,
            'to': to
        },
        success: function(data) {
            let result = JSON.parse(data);
            fillTable(result);            
        }
    });
} 

function resetTable(id) {
    let elements = document.getElementById(id).getElementsByTagName('tbody');
    let length = elements[0].childNodes.length - 1;
    for (let i = length; i > 0; i--)
        elements[0].removeChild(elements[0].childNodes[i]);
}

function fillTable(data) {
    resetTable('attendance-table');
    if (data.length > 0) {
        let tBody = document.getElementsByTagName("tbody").item(7);
        for (let i = 0; i < data.length; i++) {
            let dateFrom = data[i]['dateIn'];
            let dateTo = data[i]['dateOut'];
            let timeFrom = data[i]['clockIn'];
            let timeTo = data[i]['clockOut'];
            let hours = data[i]['hours'];
            let ot = data[i]['ot'];

            let tr = document.createElement('tr');
            let cell1 = document.createElement('td');
            let cell2 = document.createElement('td');
            let cell3 = document.createElement('td');
            let cell4 = document.createElement('td');
            let cell5 = document.createElement('td');
            let cell6 = document.createElement('td');

            cell1.appendChild(document.createTextNode(dateFrom));
            cell2.appendChild(document.createTextNode(dateTo));
            cell3.appendChild(document.createTextNode(timeFrom));
            cell4.appendChild(document.createTextNode(timeTo));
            cell5.appendChild(document.createTextNode(hours));
            cell6.appendChild(document.createTextNode(ot));

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