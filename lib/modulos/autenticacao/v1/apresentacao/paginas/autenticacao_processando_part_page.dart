part of 'autenticacao_page.dart';

class AutenticacaoProcessandoPartPage extends StatelessWidget {
  const AutenticacaoProcessandoPartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.15,
            child: const AspectRatio(
              aspectRatio: 1,
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 47, 54, 142),
                strokeWidth: 5,
                backgroundColor: Color.fromARGB(255, 242, 244, 247),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          const Text(
            "Processando",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: InternetBankingCores.azul_500,
            ),
          ),
        ],
      ),
    );
  }
}
