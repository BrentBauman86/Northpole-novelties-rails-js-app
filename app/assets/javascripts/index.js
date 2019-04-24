$(function() {
    console.log("index.js is loaded...")
    listenForClick();
});

function getToys() {
    $.getJSON(`/toys`, function (data) {
        console.log('the data is:', data)
        let toy = new Toy(data) 
        let toyHTML = toy.showHTML()
        document.getElementById('toy-data').innerHTML += toyHTML
    })
}

class Toy {
    constructor(obj) {
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
        </div>
    `)
}

function listenForClick() {
    $('button#toy-data').on("click", function(e) {
        e.preventDefault()
        getToys();
    })
}