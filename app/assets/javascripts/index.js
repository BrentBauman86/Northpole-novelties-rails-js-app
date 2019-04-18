$(function() {
    prompt("we in?!")
});

function getUsers() {
    $.ajax({
        url: 'http://localhost:3000/users',
        method: 'get',
        dataType: 'json'
    }).done(function (data) {
        console.log('the data is:', data)
        let user = User.all 
        let userHTML = user.showHTML()
        document.getElementById('users').innerHTML = userHTML
    })
}

class User {
    constructor(attr) {
        this.id = attr.id 
        this.name = attr.name 
        this.password = attr.password
    }
}

User.prototype.showHTML = function() {
    return (
        <div>
          <p>${this.name}</p>
        </div>
    )
}