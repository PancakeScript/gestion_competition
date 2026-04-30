import 'dart:convert'; // Fix: 'jsonEncode' n'était pas défini sans ça
import 'package:http/http.dart' as http; // Fix: 'hhtp' était une faute de frappe

class Nouvelle {

  final String url = "http://10.0.2.2:3000/api/equipes";

  Future<List<dynamic>> fetchEquipes() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Erreur de chargement');
    }
  }

  // Ajouter une équipe
  Future<void> addEquipe(String nom, String cat, String membres) async {
    await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nom_equipe": nom,
        "categorie": cat,
        "membres": membres,
      }),
    );
  }

  // Modifier une équipe
  Future<void> updateEquipe(int id, String nom, String cat, String membres) async {
    await http.put(
      Uri.parse("$url/$id"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nom_equipe": nom,
        "categorie": cat,
        "membres": membres,
      }),
    );
  }

  // Supprimer une équipe
  Future<void> deleteEquipe(int id) async {
    await http.delete(Uri.parse("$url/$id"));
  }
}