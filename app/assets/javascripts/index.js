$(function() {
    console.log("index.js is loaded...")
    listenForClick();
});

function getToys() {
    $.getJSON(`/toys`, function (data) {
        let toyList = "";
        data.forEach(function(toys){
            let toy = new Toy(toys);
            let toyHTML = toy.showHTML();
            toyList += toyHTML 
        });
        let toyData = document.getElementById('toys');
        toyData.innerHTML = toyList;
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

Toy.prototype.showHTML = function() {
    return (`
        <div>
          <p>${this.name}</p>
          <p>${this.quantity}</p>
          <p>${this.rating}</p>
          <p>${this.user_id}</p>
          <p>${this.category_id}</p>
          <p>${this.id}</p>
        </div>
    `)
}

function listenForClick() {
    $('button#toy-data').on("click", function(e) {
        e.preventDefault()
        getToys();
    })
}