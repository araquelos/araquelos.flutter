class MascaraUtils {
  String mascararTelefone({String? ddd, String? telefone}) {
    if (ddd == null || telefone == null) {
      return "<Não informado>";
    } else {
      return "($ddd) *****-${telefone.substring(5)}";
    }
  }

  String mascararEmail({String? email}) {
    if (email == null) {
      return "<Não informado>";
    } else {
      return "${email.split('@')[0].substring(0, 3)}***@${email.split('@')[1]}";
    }
  }
}
