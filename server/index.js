/*
console.log("hello world");
const express = require('express'); // import 'package:express/express.dart'
const PORT = 3000;
const app = express();

//{
 //   'name':'arun'
//}
//creating api 
//GET,PUT,POST,DELETE,UPDATE -> CRUD
//GET
//http://<youripaddress>/hello-world

app.get('/',(req,res)=>{
    res.json({'name':'arun'});
})

app.get('/hello-world', function(req,res){ //request,result
     res.json('Do it your own');
})
*/

const express = require('express'); // import 'package:express/express.dart'
const mongoose = require('mongoose');
require('dotenv').config()
const authRouter = require('./routes/auth'); 
const adminRouter = require('./routes/admin');
//INIT        //import './features/auth/screens/auth_screens.dart'
//middleware
//Client ->Node Http server -> express.js 
//       <-           |                 |
//                    <- middle ware  <-




//INIT

const app = express();
const port = process.env.PORT;
const db = process.env.DB;





//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

//connections
mongoose.connect(db).then(() => {
    console.log("Connection successful");
}).catch(e => {
    console.log(e);
})


app.listen(port,"0.0.0.0",function(){
    console.log(`connected to port ${port} hello!!!!!!!!!!`);
});



