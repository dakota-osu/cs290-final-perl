

function show_modal() {
    var hidden_sections = document.querySelectorAll('.hidden');

    hidden_sections.forEach((e) => {
        e.removeAttribute('class'); 
    });

    //sets up event listeners on modal buttons
    document.querySelector('.modal-close-button').addEventListener('click', hide_modal);
    document.getElementById('modal-cancel-button').addEventListener('click', hide_modal);
}

function hide_modal() {
    document.getElementById('modal-backdrop').setAttribute('class', 'hidden');
    document.getElementById('add-note-modal').setAttribute('class', 'hidden');
    clear_modal();
}

function clear_modal() {
    var inputs = document.querySelectorAll('input');

    inputs.forEach((e) => {
        e.value = '';
    });
}

window.addEventListener("DOMContentLoaded", (event) => {

    var login_button = document.getElementById('login-button');
    if(login_button) {
        login_button.addEventListener('click', show_modal);
    }
});
