/*
42.106.205.241
*/
//import from packages
const express =require('express');
const mongoose=require('mongoose');
const app = express();

//imporrt from other files
const authRouter =require( './routes/auth' );
app.use(express.json());
// //MIDDLEWARES

// //client -> {middlewares}->server-> client ->
// app.use(authRouter.authRouter);
//INIT
const PORT =3000;   
const DB="mongodb+srv://kunaldp379:Lawm2471@cluster123.q5php4x.mongodb.net/?retryWrites=true&w=majority&appName=Cluster123";
const DBase="mongodb+srv://kunaldp379:Lawm@822471@cluster123.q5php4x.mongodb.net/";
//imporrt from other files
// app.get("/hello_kunal", (req,res)=> {
//     res.send({kunal: "Hello Kunal"});
// });
//connections
mongoose.connect(DB).then(()=> {
    console.log("Connected to the database");
}).catch((e)=>{
    console.log("Error connecting to the database->>>>", e);
});
app.use(authRouter);

app.listen(PORT, "0.0.0.0", function(){
    console.log(`Server is running on port ${PORT}`);
});



