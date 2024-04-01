

const mongoose = require("mongoose");

const express =require('express');
const User=require( '../models/users' );
const authRouter = express.Router();    
authRouter.get('/user', (req,res)=>{
    res.status().json({message: "User is authenticated"});
});
authRouter.get('/api/signup',async function (req,res){
    try{
        const {name, email, password}=req.body;
    const existingUser= await User.findOne({email});
    if (existingUser){
        return res.status(400).json({msg: "User already exists"});
    }
    let user=new User({
            email,
            password,
            name,
    });
    user=await user.save();
    res.json({user});
        //req.body;
        //-> map //{
        //     name: "kunal",'email': "kunal@gmail.com"
        //}
        console.log(req.body);
//validations 

    //get the data from the user


    //post the data to the database
    ///return the response to the user
    console.log("User signed up");
    }catch(e){
        res.status(500).json({error: e.message});
    }
    
});
module.exports = {authRouter: authRouter};//public
