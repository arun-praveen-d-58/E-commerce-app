const express = require("express");
const User = require("../modules/user");
const bcryptjs = require('bcryptjs');
const authRouter = express.Router();
const jwt = require("jsonwebtoken");
/*
authRouter.get("/user",(req,res)=>{
    res.json({msg:"arun"})
});
*/

authRouter.post('/api/signup',async(req,res)=>{

    try{
            const {name,email,password} = req.body;
            
          const existingUser = await User.findOne({email}); //checks whether the email exist already
         
          if(existingUser){
            return res.status(400).json({msg: "User with same e-mail exists"}); //client error 400
          }
        
        const hashedPassword = await bcryptjs.hash(password,8);



        let user =  new User({
           email,
           password: hashedPassword,
           name, 
          })

          user = await user.save();
          res.json(user);
        }catch(e){
          
            res.status(500).json(e.message);
        }
      // 200/ok - result succeeded
     //{
     // 'name':name , 'email':email ,'password':password
     // }
    //get data from the client
    //post data in database
    //return that data to user

})

//module.exports= {authRouter, name: 'arun'}; //pass many arguments

//Sign In Route
//Exercise

authRouter.post('/api/signin', async (req, res)=>{
try{
 const {email, password} = req.body;

 const user = await User.findOne({email});

 if(!user){
  return res.status(400).json({msg: 'User with this email does not exists!'});
 }
    const isMatch = await bcryptjs.compare(password,user.password);

    if(!isMatch){
      return res.status(400).json({msg: 'Incorrect password'});
    }

    const token = jwt.sign({id: user._id}, "passwordKey");
    res.json({token, ...user._doc})
}catch(e){
  res.status(500).json({error: e.message});
}
});


module.exports = authRouter;

