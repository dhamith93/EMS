let navItems = document.getElementsByClassName('nav-item');
let borders = document.getElementsByClassName('border');
let tabs = document.getElementsByClassName('tab');
let infoLinks = document.getElementsByClassName('info-link');

document.getElementById('emp-info-close').addEventListener('click',
        function(e) {
            document.getElementById('emp-info-tab').style.display = 'none';
            document.getElementById('search-tab').style.display = 'block';
        });

document.getElementById('emp-leaves-close').addEventListener('click',
        function(e) {
            document.getElementById('emp-leaves-tab').style.display = 'none';
            document.getElementById('search-tab').style.display = 'block';
        });

document.getElementById('emp-tasks-close').addEventListener('click',
        function(e) {
            document.getElementById('emp-tasks-tab').style.display = 'none';
            document.getElementById('search-tab').style.display = 'block';
        });

for (let i = 0; i < navItems.length; i++) {
    navItems[i].addEventListener('click', function(e) {
        navigationHandler(navItems[i].id);
    });
}

function navigationHandler(id) {
    switch (id) {
    case 'search-nav':
        changeTab('search-link', 'search-tab');
        break;
    case 'emp-nav':
        changeTab('emp-link', 'emp-tab');
        break;
    case 'dept-nav':
        changeTab('dept-link', 'dept-tab');
        break;
    case 'logout':
        window.location.replace('LogoutAction');
        break;
    default:

    }
}

function changeTab(nav, tab) {
    for (let i = 0; i < borders.length; i++) {
        borders[i].classList.remove('active');

        if (borders[i].id === nav)
            borders[i].classList.add('active');
    }

    for (let i = 0; i < tabs.length; i++) {
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
        url : 'GetEmployeeTasksAction.action?empId='
                + this.id,
        dataType : 'json',
        error : function() {
            console
                    .log('error getting a response from GetEmployeeTasksAction...');
        },
        success : function(data) {
            fillTasksTable(JSON.parse(data.replace(
                    '//', '')));
        }
    });
    document.getElementById('search-tab').style.display = 'none';
    document.getElementById('emp-tasks-tab').style.display = 'block';
});
