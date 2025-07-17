function deleteEmployee() {

    
    // Get the Employee ID from the input field
    var employeeID = document.getElementById('EmployeeID').value;

    // Perform validation
    if (employeeID === '') {
        document.getElementById('message').innerHTML = 'Please enter an Employee ID';
        return;
    }

    alert("Are You Sure ?");
    // Display success message
    document.getElementById('message').innerHTML = 'Employee deleted successfully';
}
