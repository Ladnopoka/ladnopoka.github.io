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
// disabling this for now because its painful
//app.get('/',(req,res)=>{
  //  console.log("Log-In page")
    //res.render('LoginPage')
//})
/*app.get('/', (req, res) => {
    console.log("Game-page")
    res.render('index')  // Directly render the game page
})
app.get('/signUp',(req,res)=>{
    console.log("Sign-Up page")
    res.render('SignupPage')
})

app.get('/home',(req,res)=>{
    console.log("Home-page")
    res.render('Homepage')
})

app.get('/game',(req,res)=>{
    console.log("Game-page")
    res.render('index')
})

app.get('/settings',(req,res)=>{
    console.log("Settings-page")
    res.render('settings')
})*/

app.get('/', (req, res) => {
    console.log("Game-page")
    res.render('index')  // Directly render the game page
})

//localhost port
app.listen(3000)