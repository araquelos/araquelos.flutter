import 'package:intl/intl.dart';
import 'package:mobile_pj/modulos/comprovante/v1/dados/DTO/comprovante_minificado_dto.dart';
import 'package:xml/xml.dart';

class Comprovante {
  List<GrupoComprovante> lista = [];
  Map<String, String>? aviso;

  Comprovante();

  factory Comprovante.gerarComprovanteXml(String xml) {
    XmlDocument xmlDocument = XmlDocument.parse(xml);
    Comprovante comprovante = Comprovante();

    for (var elemento in xmlDocument.findAllElements("Campo")) {
      var valor = elemento.attributes.where((atributo) => atributo.localName == "valor").first;
      var descricao = elemento.attributes.where((atributo) => atributo.localName == "descricao").first;
      var aviso = elemento.attributes.where((atributo) => atributo.localName == "aviso").first;

      if (valor.value == "") {
        comprovante.lista.add(GrupoComprovante(titulo: Bidi.stripHtmlIfNeeded(descricao.value)));
      } else {
        if (valor.value.startsWith("&")) continue;

        Map<String, String> itemComprovante = {descricao.value: valor.value};

        if (bool.parse(aviso.value) == false) {
          comprovante.lista[comprovante.lista.length - 1].lista.add(itemComprovante);
        } else {
          comprovante.aviso = itemComprovante;
        }
      }
    }

    return comprovante;
  }

  factory Comprovante.gerarComprovante(ComprovanteMinificadoDTO entrada) {
    return Comprovante.gerarComprovanteXml(entrada.xml);
  }
}

class GrupoComprovante {
  final String titulo;
  List<Map<String, String>> lista = [];

  GrupoComprovante({
    this.titulo = "",
  });
}

class ItemComprovante {
  final String descricao;
  final String valor;

  ItemComprovante({
    required this.descricao,
    required this.valor,
  });
}
