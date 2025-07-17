// Function to display products when the button is clicked
function daily_report() {
    // Call a server-side function (button_click_display_products) using AJAX
    // This will trigger the server-side event handler to fetch and display products in the GridView
    var btndaily_report = document.getElementById('<%= btndaily_report.ClientID %>');

    if (btndaily_report) {
        btndaily_report.addEventListener('click', function () {
            // Use AJAX to trigger the server-side click event
            __doPostBack('<%= btndaily_report.UniqueID %>', '');
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
    // Call the displayProducts function to handle button click event
    daily_report();
});
