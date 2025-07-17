// Function to display employees when the button is clicked
function displayEmployees() {
    // Call a server-side function (button_click_display_employees) using AJAX
    // This will trigger the server-side event handler to fetch and display employees in the GridView
    var btnDisplayEmployees = document.getElementById('<%= btnDisplayEmployees.ClientID %>');

    if (btnDisplayEmployees) {
        btnDisplayEmployees.addEventListener('click', function () {
            // Use AJAX to trigger the server-side click event
            __doPostBack('<%= btnDisplayEmployees.UniqueID %>', '');
        });
    }
}

// Function to handle messages or notifications
function showMessage(message) {
    var messageElement = document.getElementById('message');

    if (messageElement) {
        messageElement.innerText = message;
    }
}

// Execute functions when the DOM content is fully loaded
document.addEventListener('DOMContentLoaded', function () {
    // Call the displayEmployees function to handle button click event
    displayEmployees();
});
