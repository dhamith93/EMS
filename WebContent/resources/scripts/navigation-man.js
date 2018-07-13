let navItems = document.getElementsByClassName('nav-item');
let borders = document.getElementsByClassName('border');
let tabs = document.getElementsByClassName('tab');

for (let i = 0; i < navItems.length; i++) {
    navItems[i].addEventListener('click', function(e) {
       navigationHandler(navItems[i].id); 
    });
}

function navigationHandler(id) {
    switch (id) {
        case 'managerInfo-nav':
            changeTab('managerInfo-link', 'managerInfo-tab');
            break;
        case 'dept-nav':
            changeTab('dept-link', 'dept-tab');
            break;
        case 'tasks-nav':
            changeTab('tasks-link', 'tasks-tab');
            break;
        case 'leaveReq-nav':
            changeTab('leaveReqs-link', 'leaveReq-tab');
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
        
        if (i < tabs.length)
            tabs[i].style.display = 'none';

        if (i < tabs.length && tabs[i].id === tab)
            tabs[i].style.display = 'block';
    }
}