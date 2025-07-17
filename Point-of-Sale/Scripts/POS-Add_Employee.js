function addEmployee() {
    var name = document.getElementById("name").value;
    var email = document.getElementById("email").value;
    var phone = document.getElementById("phone").value;
    var address = document.getElementById("address").value;
    var cnic = document.getElementById("cnic").value;
    var dob = document.getElementById("dob").value;
    var designation = document.getElementById("designation").value;
    var salary = document.getElementById("salary").value;
    var joiningDate = document.getElementById("joiningDate").value;
    var password = document.getElementById("password").value;

    // Perform basic validation
    if (name === "" || email === "" || phone === "" || address === "" || cnic === "" || dob === "" || designation === "" || salary === "" || joiningDate === "" || password === "") {
        document.getElementById("message").innerHTML = "Please fill in all fields.";
        return;
    }

    // Assuming you have a function called addEmployeeBackend that handles the addition of the employee
    var success = addEmployeeBackend(name, email, phone, address, cnic, dob, designation, salary, joiningDate, password);

    if (success) {
        document.getElementById("message").innerHTML = "Employee added successfully.";
        // Optionally, clear the input fields after successful addition
        document.getElementById("name").value = "";
        document.getElementById("email").value = "";
        document.getElementById("phone").value = "";
        document.getElementById("address").value = "";
        document.getElementById("cnic").value = "";
        document.getElementById("dob").value = "";
        document.getElementById("designation").value = "";
        document.getElementById("salary").value = "";
        document.getElementById("joiningDate").value = "";
        document.getElementById("password").value = "";
    } else {
        document.getElementById("message").innerHTML = "Failed to add employee. Please try again.";
    }
}

function addEmployeeBackend(name, email, phone, address, cnic, dob, designation, salary, joiningDate, password) {
    // Implement the backend logic here, e.g., sending a request to the server
    // and returning true if the addition was successful, or false otherwise
    // For demonstration purposes, we'll just return true
    return true;
}

