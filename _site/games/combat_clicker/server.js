/* Setup 
    To launch the game starting from menus:
    In terminal run the following commands
    npm install -g firebaese-tools 
    npm install express
    npm install node

    After all required frameworks installed run the game with the following command:
    node server.js

    to enter gameplay, user has to register, press register and enter a valid email (@mail.com at the end)
    and create a valid password (numbers, letters, special characters).

    after registration, login with your details
    press "Start game" to launch CombatClicker! Enjoy
 */
const express = require('express')
const app = express()


app.set('view engine', 'ejs')
app.use(express.static('public'))

//routes
app.get('/', (req, res) => {
    console.log("Game-page")
    res.render('index')  // Directly render the game page
})

//localhost port
app.listen(3000)



