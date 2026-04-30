import express from "express";
import db from '../config/db.js';

const router = express.Router();

//liste des equipes
router.get('/', async(req,res)=>{//router remplace api/equipes/
    try{
        const[rows] = await db.query('SELECT * FROM equipes');
        res.json(rows);
    }catch(err){
    res.status(500).json({error:err.message});
    }
});

//ajouter une équipe
router.post('/',async(req,res)=>{
    const {nom_equipe,categorie,membres} = req.body;
    try{
    await db.query('INSERT INTO equipes(nom_equipe,categori,membres)VALUES(?,?,?)',
    [nom_equipe,categorie,membres]
    );
    res.status(201).json({message:"Equipe ajoutée"})
    }catch(err){
    res.status(500).json({error:err.message});
    }
});


//modifier une equipe
// router.put('/:id',async(req,res)=>{
//     const {nom_equipe,categorie,membres} =req.body;
//     const{id}= req.params;
//     try{
//       await db.query('UPDATE equipes SET nom_equipe=?,categorie=?,membres=? WHERE id=?',
//         [nom_equipe,categorie,membres]
//         );
//         res.json({message:"Equipe modifiée"});
//     }catch(err){
//     res.status(500).json({error:err.message});
//     }
// });

//supprimer une equipe
router.delete('/:id',async(req,res)=>{
const {id}=req.params;
    try{
    await db.query('DELETE FROM equipes WHERE id=?',[id]);
    res.json({message:"Equipe supprimée"});
    }catch(err){
        res.status(500).json({error:err.message});
    }
});

export default router;
