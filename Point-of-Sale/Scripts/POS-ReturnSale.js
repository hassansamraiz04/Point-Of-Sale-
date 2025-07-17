function returnProduct() {
    // Get the values from the input fields
    var saleID = document.getElementById("saleID").value;
    var productID = document.getElementById("productID").value;
    var quantity = document.getElementById("quantity").value;

    // Perform some basic validation
    if (saleID === "" || productID === "" || quantity === "") {
        document.getElementById("message").innerHTML = " Please fill in all fields first.";
        return;
    }

    // Assuming you have a function called returnProductBackend that handles the return logic
    var success = returnProductBackend(saleID, productID, quantity);

    if (success) {
        document.getElementById("message").innerHTML = "Product returned successfully.";
        // Optionally, clear the input fields after successful return
        document.getElementById("saleID").value = "";
        document.getElementById("productID").value = "";
        document.getElementById("quantity").value = "";
    } else {
        document.getElementById("message").innerHTML = "Failed to return product. Please try again.";
    }
}

function returnProductBackend(saleID, productID, quantity) {
    // Implement the backend logic here, e.g., sending a request to the server
    // and returning true if the return was successful, or false otherwise
    // For demonstration purposes, we'll just return true
    return true;
}
