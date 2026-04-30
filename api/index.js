import express from "express";
import 'dotenv/config';
import cors from 'cors'
import equipeRoutes from './routes/equipeRoutes.js'
const app = express();

//middlewares
app.use(cors());
app.use(express.json());

//Routes
app.use('/api/equipes',equipeRoutes);
app.get('/api/planning',(req,res)=>{
    res.json([
    {categorie:"Programming",date:"A definir",lier:"Labo"},
    {categorie:"CTF",date:"A definir",lier:"Labo"},

    ]);
});

//port
const PORT = process.env.PORT;
app.listen(PORT,()=>{
    console.log("Serveur lancé")
});

