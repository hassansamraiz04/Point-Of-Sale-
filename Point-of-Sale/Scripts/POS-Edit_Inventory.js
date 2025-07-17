function editProduct() {
    var productID = document.getElementById("productID").value;
    var productName = document.getElementById("productName").value;
    var categoryName = document.getElementById("categoryName").value;
    var purchasePrice = document.getElementById("purchasePrice").value;
    var salePrice = document.getElementById("salePrice").value;
    var quantity = document.getElementById("quantity").value;

    // Perform basic validation
    if (productID === "" || productName === "" || categoryName === "" || purchasePrice === "" || salePrice === "" || quantity === "") {
        document.getElementById("message").innerHTML = "Please fill in all fields.";
        return;
    }

    // Assuming you have a function called editProductBackend that handles the editing of the product
    var success = editProductBackend(productID, productName, categoryName, purchasePrice, salePrice, quantity);

    if (success) {
        document.getElementById("message").innerHTML = "Product edited successfully.";
        // Optionally, clear the input fields after successful editing
        document.getElementById("productID").value = "";
        document.getElementById("productName").value = "";
        document.getElementById("categoryName").value = "";
        document.getElementById("purchasePrice").value = "";
        document.getElementById("salePrice").value = "";
        document.getElementById("quantity").value = "";
    } else {
        document.getElementById("message").innerHTML = "Failed to edit product. Please try again.";
    }
}

function editProductBackend(productID, productName, categoryName, purchasePrice, salePrice, quantity) {
    // Implement the backend logic here, e.g., sending a request to the server
    // and returning true if the editing was successful, or false otherwise
    // For demonstration purposes, we'll just return true
    return true;
}
