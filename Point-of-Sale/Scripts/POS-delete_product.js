function deleteProduct() {
    var productID = document.getElementById("productID").value;
    var quantity = document.getElementById("quantity").value;

    // Perform basic validation
    if (productID === "" || quantity === "") {
        document.getElementById("message").innerHTML = "Please fill in all fields.";
        return;
    }

    // Check if quantity is valid
    if (quantity <= 0) {
        document.getElementById("message").innerHTML = "Quantity must be greater than 0.";
        return;
    }

    // Assuming you have a function called getProductQuantity that gets the current quantity of the product
    var currentQuantity = getProductQuantity(productID);

    // Check if the entered quantity is more than the current quantity
    if (quantity > currentQuantity) {
        document.getElementById("message").innerHTML = "Quantity exceeds available stock.";
        return;
    }

    // Assuming you have a function called deleteProductBackend that handles the deletion of the product
    var success = deleteProductBackend(productID, quantity);

    if (success) {
        document.getElementById("message").innerHTML = "Product deleted successfully.";
        // Optionally, clear the input fields after successful deletion
        document.getElementById("productID").value = "";
        document.getElementById("quantity").value = "";
    } else {
        document.getElementById("message").innerHTML = "Failed to delete product. Please try again.";
    }
}

function getProductQuantity(productID) {
    // Implement the logic to get the current quantity of the product
    // For demonstration purposes, we'll just return a hardcoded value
    return 10; // Assuming the current quantity is 10
}

function deleteProductBackend(productID, quantity) {
    // Implement the backend logic here, e.g., sending a request to the server
    // and returning true if the deletion was successful, or false otherwise
    // For demonstration purposes, we'll just return true
    return true;
}
