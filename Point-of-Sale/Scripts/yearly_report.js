// Function to display products when the button is clicked

<script>
    // JavaScript function to update the year value
    function updateYear() {
        var yearInput = document.getElementById('txtReportYear');
    if (yearInput.value < 1800) {
        yearInput.value = 1800;
        } else if (yearInput.value > 2200) {
        yearInput.value = 2200;
        }
    }
</script>

function yearly_report() {
    // Call a server-side function (button_click_display_products) using AJAX
    // This will trigger the server-side event handler to fetch and display products in the GridView
    var btnyearly_report = document.getElementById('<%= btnyearly_report.ClientID %>');

    if (btnyearly_report) {
        btnyearly_report.addEventListener('click', function () {
            // Use AJAX to trigger the server-side click event
            __doPostBack('<%= btnyearly_report.UniqueID %>', '');
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
    yearly_report();
});
