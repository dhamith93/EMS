function prompt(okBtnCallback, closeBtnCallback) {  
    showPrompt();    
    document.getElementById('prompt-ok').addEventListener('click', function(e) {        
        closePrompt();
        okBtnCallback();
    });
    
    document.getElementById('prompt-cancel').addEventListener('click', function(e) {
        closePrompt();  
        closeBtnCallback();          
    });
}

function showPrompt() {
    document.getElementById('prompt').style.display = 'flex';
}

function closePrompt() {
    document.getElementById('prompt').style.display = 'none';
    document.getElementById('prompt-ok').style.display = 'block';
}