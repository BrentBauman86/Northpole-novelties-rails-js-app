$(function() {
    console.log("index.js is loaded...")
    listenForClick();
    showToyClick();
    toyFormClick();
});

//using an ajax request for getToyList was causing a cross-origin request error

function getToyList() {
    $.getJSON(`/toys`, function (data) {
        let toyList = "";
      
        data.forEach(function(toys){
            let toy = new Toy(toys);
            let toyHTML = toy.showHTML();
            toyList = toyHTML 
        });

        let table = document.getElementById('toy-table');
        table.innerHTML = toyTable();
        let toyData = document.getElementById('toys');
        toyData.innerHTML = toyList;
    });
}

function getToy() {
    let catId = $(".toy-details-js").attr("data-cat-id")
    let toyId = $(".toy-details-js").attr("data-toy-id")
    $.getJSON(`/categories/${catId}/toys/${toyId}`, function(data){
        let toy = new Toy(data);

        let toyInfo = toy.toyDetails();

        let toyData = document.getElementById('show-toy')
        toyData.innerHTML = toyInfo;
    });
}

class Toy {
    constructor(obj) {
        this.id = obj.id;
        this.name = obj.name; 
        this.quantity = obj.quantity;
        this.rating = obj.rating; 
        this.user_id = obj.user_id;
        this.category_id = obj.category_id
    }
}

function newToyForm() {
    return (`
    <h1>New Toy Form</h1>
    <form>
        <strong>name</strong><input id="toy-name" type='text' name='name'></input><br>
        <strong>quantity</strong><input id="toy-quantity" type='text' name='quantity'></input><br>
        <strong>rating</strong><input id="toy-rating" type='text' name='rating'></input>
        <input type='submit' />
    </form>
    `)
}

 function toyTable() {
    return (`
    <style>
        .left   
        .center 
        .right  
    </style>

    <table class="table">
        
    <tr>
        <td class="left">Name</td>
        <td class="center">Quantity</td>
        <td class="right">Rating</td>
    </tr>
        </table>
`)
}

Toy.prototype.toyDetails = function() {
    return (`
    <h1>JS Toy Details</h1>

    <h2>Name: ${this.name}</h2>
    <h2>Quantity: ${this.quantity}</h2>
    <h2>Rating: ${this.rating}</h2>
      <br>
    `)
}

Toy.prototype.showHTML = function() {
    return (`
    <style>
        .left  
        .center 
        .right  
    </style>

    <ul>
    <table class="table">
         <tr>
             <td class="left"><li>${this.name}</li></td>             
             <td class="center">${this.quantity}</td>
             <td class="right">${this.rating}</td>
        </tr>
    </table>
    </ul>
    `)
}

function toyFormClick() {
    $('button#toy-form').on("click", function(e) {
        e.preventDefault()
         let form = document.getElementById("toy-form")
         form.innerHTML = newToyForm();
    })
}

function submitToyForm() {
    $('#toy-form').on("submit", function(e) {
    e.preventDefault();
    let values = $(this).serialize();
    $.post(`/categories/${catId}/toys`, values).done(function(data){
        console.log('info')
    })
    console.log("submitting??")
})
}

function listenForClick() {
    $('button#toy-data').on("click", function(e) {
        e.preventDefault()
        getToyList();
    })
}

function showToyClick() {
    $(".toy-details-js").on("click", function(e) {
      e.preventDefault();
      getToy();
    });
}

