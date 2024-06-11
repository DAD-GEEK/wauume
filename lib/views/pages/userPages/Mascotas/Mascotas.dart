import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wauume/controllers/MascotasProvider.dart';
import 'package:wauume/models/MascotaModel.dart';
import 'package:wauume/views/pages/userPages/Mascotas/EditMascota.dart';
import 'package:wauume/views/pages/userPages/Mascotas/NewMascota.dart';

class Mascotas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MascotasProvider>(
        builder: (context, mascotasProvider, child) {
          return listPets(mascotasProvider);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[900],
        onPressed: () => loadCreatePetPage(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  ListView listPets(MascotasProvider mascotasProvider) {
    List<MascotaModel> pets = mascotasProvider.pets;
    return ListView.builder(
      itemCount: pets.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image(
            image: AssetImage(pets[index].photo),
            width: 50.0,
            height: 50.0,
          ),
          title: Text(
            pets[index].nombre,
          ),
          subtitle: Text(pets[index].raza,
          ),
          trailing: SizedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => loadEditPetPage(context, index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => mascotasProvider.deletePet(index),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  loadCreatePetPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewMascotaPage(),
      ),
    );
  }

  loadEditPetPage(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditMascota(index: index),
      ),
    );
  }
}
