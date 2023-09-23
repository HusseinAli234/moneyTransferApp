function saveUser(user) {
    let userAsJson = JSON.stringify(user)
    console.log(userAsJson)
    localStorage.setItem('user', userAsJson)
}

function readUser() {
    let userAsJson = localStorage.getItem('user')
    let user = JSON.parse(userAsJson)
    return user;
}
