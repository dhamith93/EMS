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
        case 'attendance-btn':
            div = document.getElementById('attendanceTab');            
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
