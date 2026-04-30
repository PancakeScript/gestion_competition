import 'package:flutter/material.dart';
import 'package:gestion_competition/api.dart';

class EquipePage extends StatefulWidget {
  EquipePage({super.key});

  @override
  State<EquipePage> createState() => _EquipePageState();
}

class _EquipePageState extends State<EquipePage> {
  //convention nommage d'ou apiService et final car la variable sera utilisé au demarrage seulement
  final Nouvelle apiService = Nouvelle();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("REPARTITION DES EQUIPES",style:TextStyle(color: Colors.white) ),backgroundColor: Colors.grey,),
        body: Column(children: [

          FutureBuilder<List<dynamic>>(
            future: apiService.fetchEquipes(),
            builder: (context, snapshot){
              //cas:chargement
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }
              //cas: erreur
              if(snapshot.hasError){
                return Center(child: Text("Erreur:${snapshot.error}"),);
              }
              //cas:Succès
              final equipes =snapshot.data??[];
              return
              Container(
                height: 100,
                color: Colors.green,
                width: 410,
                child: ListView.builder(
                  itemCount: equipes.length,
                  itemBuilder: (context, index) {
                    final equipe = equipes[index];
                    return ListTile(
                      title: Text(equipe['nom_equipe']),
                      subtitle: Text(equipe['categorie']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon:const Icon(Icons.edit,color: Colors.blue),
                              onPressed: ()=> _showForm(equipe),
                          ),
                          IconButton(
                              icon: const Icon(Icons.delete, color:  Colors.red,),
                              onPressed: ()=> _confirmDelete(equipe['id']),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          )
        ],),

      ),
    );
  }

  void _showForm(Map<String, dynamic>?equipe){
    showModalBottomSheet(context: context, 
        builder: (context)=>Container(
          padding: const EdgeInsets.all(20),
          child: const Text("Formulaire à remplir ici"),
        ));
  }
  
  void _confirmDelete(int id){
    showDialog(context: context, 
        builder: (context)=>AlertDialog(
          title: const Text("Supprimer cette équipe"),
          actions: [
            TextButton(onPressed: ()=> Navigator.pop(context),
                child: const Text("Annuler"),
            ),
          ],
        ));
  }
}
