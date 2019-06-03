$(function() {
    console.log("index.js is loaded...")
    toyListClick();
    showToyClick();
    submitToyForm();
});

//using an ajax request for getToyList was causing a cross-origin request error

function getToyList() {
    $.getJSON(`/toys`, function(data) {
        let toyList = "";
      
        data.forEach(function(toys){
            let toy = new Toy(toys);
            let toyHTML = toy.showHTML();
            toyList += toyHTML 
        });

        let table = document.getElementById('toy-table');
        table.innerHTML = toyTable();
        let toyData = document.getElementById('toys');
        toyData.innerHTML = toyList;
        $('#js-app').html('')
    });
}

function getToy() {
    let catId = $(".toy-details-js").attr("data-cat-id")
    let toyId = $(".toy-details-js").attr("data-toy-id")

    $.getJSON(`/categories/${catId}/toys/${toyId}`, function(data) {
        let toy = new Toy(data);

        let toyInfo = toy.toyDetails();

        let toyData = document.getElementById('show-toy')
        toyData.innerHTML = toyInfo;
        $('#js-app').html('')
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
    <h1>New JS Toy</h1>

    <h2>Name: ${this.name}</h2>
    <h2>Quantity: ${this.quantity}</h2>
    <h2>Rating: ${this.rating}</h2>
      <br>
      <a href=/categories/>Back to Categories</a>
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

function submitToyForm() {
    $("#new_toy").on('submit', function(e) {
        e.preventDefault();

        let values = $(this).serialize();
        let catId = $(".details-js").attr("data-cat");

        $.post(`/categories/${catId}/toys`, values).done(function(data){

            const toy = new Toy(data);
            const toyInfo = toy.toyDetails();
            const newToy = document.getElementById("new-toy")
            newToy.innerHTML = toyInfo 
            $('#js-app').html("")
        })
    })
}

function toyListClick() {
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
