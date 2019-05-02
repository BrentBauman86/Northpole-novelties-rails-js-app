$(function() {
    console.log("index.js is loaded...")
    listenForClick();
    showToyClick();
});

function getToyList() {
    $.getJSON(`/toys`, function (data) {
        let toyList = "";
      
        data.forEach(function(toys){
            let toy = new Toy(toys);
            let toyHTML = toy.showHTML();
            toyList += toyHTML 
        });

        let table = document.getElementById('toy-table');
        table += toyTable();
        let toyData = document.getElementById('toys');
        toyData.innerHTML = toyList;
    });
}
//using ajax request for getToyList was causing a cross-origin request error

function getToy() {
    let catId = $(".toy-details-js").attr("data-cat-id")
    let toyId = $(".toy-details-js").attr("data-toy-id")
    $.getJSON(`/categories/${catId}/toys/${toyId}`, function(data){
        console.log('ill take that...')
        let toy = new Toy(data);
        let toyDetails = toy.showHTML();

        let toyData = document.getElementById('show-toy')
        toyDetails.toyData.innerHTML 
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
    <table class="table">
        
     <tr>
         <td>Name</td>
         <td>Quantity</td>
         <td>Rating</td>
         <td>Edit</td>
        </tr>
        </table>
`)
}

Toy.prototype.showHTML = function() {
    return (`
    <ul>
    <table class="table">
        
     <tr>
         <td>Name</td>
         <td>Quantity</td>
         <td>Rating</td>
         <td>Edit</td>
        </tr>
         <tr>
             <td><li>${this.name}</li></td>             
             <td>${this.quantity}</td>
             <td>${this.rating}</td>
        </tr>
    </table>
    </ul>
    `)
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