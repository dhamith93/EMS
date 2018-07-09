$(window).on('load', function() {
	setNotification();
});

function setNotification() {
	let btn = document.getElementById('leave-details-btn');
	if (approvedLeaveCount > 0) {
		btn.innerHTML = 'Leave Details <span class="badge badge-danger">'+ approvedLeaveCount +'</span>️';
	} else {
		btn.innerHTML = 'Leave Details';
	}
}

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
        case 'info-btn':
            div = document.getElementById('infoTab');
            break;
        case 'leaves-btn':
            div = document.getElementById('leavesTab');
            break;
        case 'short-leaves-btn':
            div = document.getElementById('shortLeavesTab');
            break;
        case 'leave-details-btn':
            div = document.getElementById('leaveDetailsTab'); 
            break;
        case 'tasks-btn':
            div = document.getElementById('tasksTab');            
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