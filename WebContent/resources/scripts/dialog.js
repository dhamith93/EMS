function getApproval(title, message, okBtnCallback, closeBtnCallback) {  
    showMessage(title, message);
    document.getElementById('msg-ok').style.display = 'none';
    document.getElementById('msg-yes').style.display = 'block';
    document.getElementById('msg-cancel').style.display = 'block';
    
    document.getElementById('msg-yes').addEventListener('click', function(e) {
        closeDialog();
        okBtnCallback();
    });
    
    document.getElementById('msg-cancel').addEventListener('click', function(e) {
        closeDialog();  
        closeBtnCallback();          
    });
}

function showMessage(title, message) {
    document.getElementById('msg-title').innerHTML = title;
    document.getElementById('msg-content').innerHTML = message;
    document.getElementById('dialog').style.display = 'flex';
    
    document.getElementById('msg-ok').addEventListener('click', function(e) {
        closeDialog();
    });
}

function closeDialog() {
    document.getElementById('dialog').style.display = 'none';
    document.getElementById('msg-ok').style.display = 'block';
    document.getElementById('msg-yes').style.display = 'none'; 
    document.getElementById('msg-cancel').style.display = 'none'; 
}