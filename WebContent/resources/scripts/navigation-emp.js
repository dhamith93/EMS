let navItems = document.getElementsByClassName('nav-item');
let tabs = document.getElementsByClassName('tab');
let getAttendanceBtn = document.getElementById('getAttendance');

getAttendanceBtn.addEventListener('click', function(e) {
    let from = document.getElementById('from').value;
    let to = document.getElementById('to').value;
    getAttendance(from, to);
});

for (let i = 0; i < navItems.length; i++) {
    navItems[i].addEventListener('click', function(e) {
       navigationHandler(navItems[i].id); 
    });
}

function navigationHandler(id) {
    switch (id) {
        case 'personal-nav':
            changeTab('personal-nav', 'personal-tab');
            break;
        case 'leaves-nav':
            changeTab('leaves-nav', 'leaves-tab');
            break;
        case 'short-leaves-nav':
            changeTab('short-leaves-nav', 'short-leaves-tab');
            break;
        case 'leave-details-nav':
            changeTab('leave-details-nav', 'leave-details-tab');
            break;
        case 'tasks-nav':
            changeTab('tasks-nav', 'tasks-tab');
            break;
        case 'attendance-nav':
            changeTab('attendance-nav', 'attendance-tab');
            break;
        case 'logout':
            window.location.replace('LogoutAction');
            break;
        case 'markAttendance':
            markAttendance();
            break;
        default:

    }
}

function changeTab(nav, tab) {
    for (let i = 0; i < navItems.length; i++) {
        navItems[i].classList.remove('active-nav');

        if (navItems[i].id === nav)
            navItems[i].classList.add('active-nav');
        
        if (i < tabs.length)
            tabs[i].style.display = 'none';

        if (i < tabs.length && tabs[i].id === tab)
            tabs[i].style.display = 'block';
    }
}