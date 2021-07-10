class Localizacao {
  String nome;
  String sigla;

  Localizacao({required this.nome, required this.sigla});

  factory Localizacao.fromDocument(Map<String, dynamic> doc) {
    return Localizacao(nome: doc['Nome'], sigla: doc['Sigla']);
  }
}
