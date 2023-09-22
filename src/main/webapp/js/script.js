let dashboard = document.getElementById("dashboard-link");
let orders = document.getElementById("orders-link");
let products = document.getElementById("products-link");
let users = document.getElementById("users-link");
let inventory = document.getElementById("inventory-link");
let customerCare = document.getElementById("customer-link");
let forms = document.getElementById("forms-link");


function setActive(id) {
    if (id === "dashboard") {
        dashboard.classList.add("active");
        orders.classList.remove("active");
        products.classList.remove("active");
        users.classList.remove("active");
        inventory.classList.remove("active");
        customerCare.classList.remove("active");
        forms.classList.remove("active");
    } else if (id === "orders") {
        dashboard.classList.remove("active");
        orders.classList.add("active");
        products.classList.remove("active");
        users.classList.remove("active");
        inventory.classList.remove("active");
        customerCare.classList.remove("active");
        forms.classList.remove("active");
    } else if (id === "products") {
        dashboard.classList.remove("active");
        orders.classList.remove("active");
        products.classList.add("active");
        users.classList.remove("active");
        inventory.classList.remove("active");
        customerCare.classList.remove("active");
        forms.classList.remove("active");
    } else if (id === "users") {
        dashboard.classList.remove("active");
        orders.classList.remove("active");
        products.classList.remove("active");
        users.classList.add("active");
        inventory.classList.remove("active");
        customerCare.classList.remove("active");
        forms.classList.remove("active");
    } else if (id === "inventory") {
        dashboard.classList.remove("active");
        orders.classList.remove("active");
        products.classList.remove("active");
        users.classList.remove("active");
        inventory.classList.add("active");
        customerCare.classList.remove("active");
        forms.classList.remove("active");
    } else if (id === "customerCare") {
        dashboard.classList.remove("active");
        orders.classList.remove("active");
        products.classList.remove("active");
        users.classList.remove("active");
        inventory.classList.remove("active");
        customerCare.classList.add("active");
        forms.classList.remove("active");
    } else if (id === "customerCare") {
        dashboard.classList.remove("active");
        orders.classList.remove("active");
        products.classList.remove("active");
        users.classList.remove("active");
        inventory.classList.remove("active");
        customerCare.classList.remove("active");
        forms.classList.add("active");
    }
}
