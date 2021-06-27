import 'package:aplicativo/app/shared/firestore/models/estudio_model.dart';
import 'package:aplicativo/app/shared/firestore/models/imagem_model.dart';
import 'package:aplicativo/app/shared/firestore/models/localizacao_model.dart';
import 'package:aplicativo/app/shared/firestore/models/pessoa_model.dart';
import 'package:aplicativo/app/shared/firestore/models/video_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Filme {
  List<DocumentReference> atores;
  DocumentReference diretor;
  String data;
  double duracao;
  List<String> generos;
  double notaCritico;
  double notaUsuario;
  double popularidade;
  String sinopse;
  String status;
  String tagline;
  String titulo;
  List<Estudio> estudio;
  List<Video> video;
  Imagem imagem;
  Localizacao local;
  final DocumentReference reference;

  Filme(
      {required this.atores,
      required this.diretor,
      required this.data,
      required this.duracao,
      required this.generos,
      required this.notaCritico,
      required this.notaUsuario,
      required this.popularidade,
      required this.sinopse,
      required this.status,
      required this.tagline,
      required this.titulo,
      required this.estudio,
      required this.video,
      required this.imagem,
      required this.local,
      required this.reference});

  factory Filme.fromDocument(DocumentSnapshot doc) {
    //Salvar  em uma lista de objetos

    List<DocumentReference> listautores = [];
    for (var autor in doc['Atores']) {
      listautores.add(autor);
    }
    List<String> listgeneros = [];
    for (var genero in doc['Generos']) {
      listgeneros.add(genero);
    }
    List<Estudio> listestudio = [];
    for (var estudio in doc['Estudios']) {
      listestudio.add(Estudio.fromDocument(estudio));
    }
    List<Video> listvideos = [];
    for (var video in doc['Videos']) {
      listvideos.add(Video.fromDocument(video));
    }
    return Filme(
        atores: listautores, //Esse
        diretor: doc['Diretor'],
        data: doc['DataLancamento'],
        duracao: doc['Duracao'].toDouble(),
        generos: listgeneros, //Esse
        notaCritico: doc['NotaCriticos'].toDouble(),
        notaUsuario:
            doc['NotaUsuario'] == null ? 0 : doc['NotaUsuario'].toDouble(),
        popularidade: doc['Popularidade'],
        sinopse: doc['Sinopse'],
        status: doc['Status'],
        tagline: doc['Tagline'],
        titulo: doc['Titulo'],
        estudio: listestudio,
        video: listvideos,
        imagem: doc['Imagen'] == null
            ? Imagem(linkBackground: "", linkCartaz: "")
            : Imagem.fromDocument(doc['Imagen']),
        local: doc['Localizacao'] == null
            ? Localizacao(nome: "", sigla: "")
            : Localizacao.fromDocument(doc['Localizacao']),
        reference: doc.reference);
  }

  Pessoa getDiretor(List<Pessoa> refdiretor) {
    Pessoa diretorFilme = Pessoa(
        imagem: "", nome: "", popularidade: 0, reference: this.reference);
    for (Pessoa ref in refdiretor) {
      if (diretor == ref.reference) {
        diretorFilme = ref;
      }
    }
    return diretorFilme;
  }

  List<Pessoa> getAutores(List<Pessoa> refAutor) {
    List<Pessoa> listAutor = [];

    for (Pessoa ref in refAutor) {
      for (DocumentReference ator in atores) {
        if (ator == ref.reference) {
          print('igual');
          listAutor.add(ref);
        }
      }
    }

    return listAutor;
  }
}
