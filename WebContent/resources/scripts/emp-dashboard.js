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
