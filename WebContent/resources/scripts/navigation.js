let navItems = document.getElementsByClassName('nav-item');
let tabs = document.getElementsByClassName('tab');
let infoLinks = document.getElementsByClassName('info-link');
let getAttendanceBtn = document.getElementById('getAttendance');

document.getElementById('emp-info-close').addEventListener('click', function(e) {
    document.getElementById('emp-info-tab').style.display = 'none';
    document.getElementById('search-tab').style.display = 'block';
});

document.getElementById('emp-leaves-close').addEventListener('click', function(e) {
    document.getElementById('emp-leaves-tab').style.display = 'none';
    document.getElementById('search-tab').style.display = 'block';
});

document.getElementById('emp-tasks-close').addEventListener('click', function(e) {
    document.getElementById('emp-tasks-tab').style.display = 'none';
    document.getElementById('search-tab').style.display = 'block';
});

document.getElementById('emp-attendance-close').addEventListener('click', function(e) {
    document.getElementById('emp-attendance-tab').style.display = 'none';
    document.getElementById('search-tab').style.display = 'block';
    resetTable('attendance-table');
});

for (let i = 0; i < navItems.length; i++) {
    navItems[i].addEventListener('click', function(e) {
        navigationHandler(navItems[i].id);
    });
}

function navigationHandler(id) {
    switch (id) {
    case 'search-nav':
        changeTab('search-nav', 'search-tab');
        break;
    case 'emp-nav':
        changeTab('emp-nav', 'emp-tab');
        break;
    case 'dept-nav':
        changeTab('dept-nav', 'dept-tab');
        break;
    case 'logout':
        window.location.replace('LogoutAction');
        break;
    default:

    }
}

function changeTab(nav, tab) {
    for (let i = 0; i < navItems.length; i++) {
        navItems[i].classList.remove('active-nav');

        if (navItems[i].id === nav)
            navItems[i].classList.add('active-nav');
        
        tabs[i].style.display = 'none';

        if (tabs[i].id === tab)
            tabs[i].style.display = 'block';
    }
}

$(document).on('click', '.info-link', function(e) {
    e.preventDefault();
    for (let i = 0; i < tabs.length; i++) {
        tabs[i].style.display = 'none';
    }
    displayEmpInfo(this.id);
});

$(document).on('click', '.leaves-link', function(e) {
    e.preventDefault();
    $.ajax({
        type : 'GET',
        url : 'GetLeavesAction.action?empId=' + this.id,
        dataType : 'json',
        error : function() {
            console.log('error getting a response from GetLeavesAction...');
        },
        success : function(data) {
            fillLeavesTable(JSON.parse(data.replace('//', '')));
        }
    });
    document.getElementById('search-tab').style.display = 'none';
    document.getElementById('emp-leaves-tab').style.display = 'block';
});

$(document).on('click', '.task-link', function(e) {
    e.preventDefault();
    $.ajax({
        type : 'GET',
        url : 'GetEmployeeTasksAction.action?empId=' + this.id,
        dataType : 'json',
        error : function() {
            console
                    .log('error getting a response from GetEmployeeTasksAction...');
        },
        success : function(data) {
            fillTasksTable(JSON.parse(data.replace('//', '')));
        }
    });
    document.getElementById('search-tab').style.display = 'none';
    document.getElementById('emp-tasks-tab').style.display = 'block';
});

$(document).on('click', '.attendance-link', function(e) {
    e.preventDefault();
    document.getElementById('search-tab').style.display = 'none';
    document.getElementById('emp-attendance-tab').style.display = 'block';
    getAttendanceBtn.id = this.id;
});

getAttendanceBtn.addEventListener('click', function(e) {
    let from = document.getElementById('from').value;
    let to = document.getElementById('to').value;
    getAttendance(this.id, from, to);
});