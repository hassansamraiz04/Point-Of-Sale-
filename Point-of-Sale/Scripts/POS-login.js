// Function to handle form submission
function handleFormSubmission(event) {
    event.preventDefault(); // Prevent form submission

    // Get the username and password from the form
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;

    // Perform basic validation
    if (username === "" || password === "") {
        alert("Please enter username and password.");
        return;
    }

    // You can add additional validation here, such as checking the username and password against a database

    // If the validation passes, you can redirect the user to another page or perform other actions
    alert("Login successful. Redirecting to dashboard...");
    window.location.href = "dashboard.html";
}

// Add event listener to the form submit event
document.getElementById("loginForm").addEventListener("submit", handleFormSubmission);
