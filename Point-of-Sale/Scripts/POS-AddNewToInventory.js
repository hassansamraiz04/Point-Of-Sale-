function addProduct() {
    var productName = document.getElementById("productName").value;
    var categoryName = document.getElementById("categoryName").value;
    var purchasePrice = document.getElementById("purchasePrice").value;
    var salePrice = document.getElementById("salePrice").value;
    var quantity = document.getElementById("quantity").value;

    // Perform basic validation
    if (productName === "" || categoryName === "" || purchasePrice === "" || salePrice === "" || quantity === "") {
        document.getElementById("message").innerHTML = "Please fill in all fields.";
        return;
    }

    // Assuming you have a function called addProductBackend that handles the addition of the product
    var success = addProductBackend(productName, categoryName, purchasePrice, salePrice, quantity);

    if (success) {
        document.getElementById("message").innerHTML = "Product added successfully.";
        // Optionally, clear the input fields after successful addition
        document.getElementById("productName").value = "";
        document.getElementById("categoryName").value = "";
        document.getElementById("purchasePrice").value = "";
        document.getElementById("salePrice").value = "";
        document.getElementById("quantity").value = "";
    } else {
        document.getElementById("message").innerHTML = "Failed to add product. Please try again.";
    }
}

function addProductBackend(productName, categoryName, purchasePrice, salePrice, quantity) {
    // Implement the backend logic here, e.g., sending a request to the server
    // and returning true if the addition was successful, or false otherwise
    // For demonstration purposes, we'll just return true
    return true;
}
