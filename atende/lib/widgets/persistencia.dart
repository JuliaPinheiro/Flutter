import 'dart:convert';
import 'dart:io';

import 'package:atende/widgets/user.dart';
import 'package:path_provider/path_provider.dart';

class persistencia {
  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();

    return File("${diretorio.path}/user.json");
  }

  Future<List<user>> lerUsuarios() async {
    List<user> listaUsuarioNoArquivo = [];

    String listaComoString = "";
    try {
      final arquivo = await _getFile();
      listaComoString = await arquivo.readAsString();
    } catch (e) {
      print("erro na leitura do arquivo $e");
    }

    List mapUser = json.decode(listaComoString);

    for (Map UserMap in mapUser) {
      listaUsuarioNoArquivo.add(user.fromMap(UserMap));
    }
    return listaUsuarioNoArquivo;
  }

  Future<File> gravarUser(user User) async {
    List<user> listaUsuarios = await lerUsuarios();
    listaUsuarios.add(User);

    List mapUser = [];
    for (user User in listaUsuarios) {
      mapUser.add(User.toMap());
    }

    String listaComoString = json.encode(mapUser);
    final arquivo = await _getFile();
    return arquivo.writeAsString(listaComoString);
  }

  Future<File> removeUser(int index) async {
    List<user> lista = await lerUsuarios();
    lista.removeAt(index);
    List mapUser = [];
    for (user User in lista) {
      mapUser.add(User.toMap());
    }
    String listaString = json.encode(mapUser);
    final arquivo = await _getFile();
    return arquivo.writeAsString(listaString);
  }

  Future<File> editUSer(user Usuario, int index) async {
    List<user> lista = await lerUsuarios();
    lista.removeAt(index);
    lista.add(Usuario);
    List mapUser = [];
    for (user Usuario in lista) {
      mapUser.add(Usuario.toMap());
    }
    String listaString = json.encode(mapUser);
    final arquivo = await _getFile();
    return arquivo.writeAsString(listaString);
  }
}
