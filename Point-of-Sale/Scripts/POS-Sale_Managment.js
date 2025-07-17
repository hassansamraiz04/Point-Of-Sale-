let products = [];
let totalAmount = 0;
let i = 1;

function newSale() {
    if (confirm("Are you sure you want to start a new sale?")) {
        window.location.reload();
    }
    
}

function addProduct() {
    const productName = document.getElementById('productName').value;
    const productId = document.getElementById('productId').value;
    const price = parseFloat(document.getElementById('price').value);

    
    const quantity = parseInt(document.getElementById('quantity').value);
    const discount = parseFloat(document.getElementById('discount').value);
    const finalPrice = (price * quantity) - discount;
    if(finalPrice < 0)
        finalPrice = 0;
    if(productId == 0 || price === NaN || productName == '')
    {
        alert("Please add details of the Product First.");
    }
    else{
        let item = [];
        
        item.push({
            productName: productName,
            productId: productId,
            price: price,
            quantity: quantity,
            discount: discount,
            finalPrice: finalPrice
        });

        products.push({item});

        totalAmount += finalPrice;

        updateBill(item);
        clearForm();
    }
}


function updateBill(item) {
    
    addRow(item, i); 
    i++;
    document.getElementById('totalAmount').textContent = totalAmount.toFixed(2);
}



function addRow(product, id) {
    var table = document.getElementById("myTable");
    var row = table.insertRow(-1); // Insert at the last position
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    var cell4 = row.insertCell(3);

    cell1.innerHTML = id; // Index
    cell2.innerHTML = product[0].productName; // Product
    cell3.innerHTML = product[0].quantity; // Quantity
    cell4.innerHTML = product[0].finalPrice.toFixed(2); // Price
}

function clearForm() {
    document.getElementById('productName').value = '';
    document.getElementById('productId').value = '';
    document.getElementById('price').value = '';
    document.getElementById('quantity').value = '1';
    document.getElementById('discount').value = '0';
    document.getElementById('finalPrice').value = '';
}

function CompleteBill() {
    localStorage.setItem('products', JSON.stringify(products));
    localStorage.setItem('totalAmount', totalAmount.toFixed(2));
    document.getElementById('printButton').style.display = 'inline-block';
    document.getElementById('customerInfo').style.display = 'inline-block';
}

function printBill() {
    window.print();
}
