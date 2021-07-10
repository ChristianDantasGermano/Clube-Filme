class Imagem {
  String linkBackground;
  String linkCartaz;

  Imagem({required this.linkBackground, required this.linkCartaz});

  factory Imagem.fromDocument(Map<String, dynamic> doc) {
    return Imagem(
      linkBackground: doc['LinkBackground'],
      linkCartaz: doc['LinkCartaz'],
    );
  }
}
