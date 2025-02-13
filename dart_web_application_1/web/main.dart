//import 'package:web/web.dart' as web;

void main() {
  PopulacaoCoelhos populacao = PopulacaoCoelhos(2, 0);
  int mes = 1;
  int duracao = 24;

  while (mes <= duracao) {
    populacao.progredirMes();

    if (mes > 12) {
      populacao.aplicarPredacao(0.75); // 75% de redução
    }

    print('Fim do Mês $mes: População de coelhos: ${populacao.total()}, Jovens: ${populacao.jovens}, Adultos: ${populacao.adultos}');

    mes++;
  }
}

class PopulacaoCoelhos {
  int jovens;
  int adultos;

  PopulacaoCoelhos(this.jovens, this.adultos);

  void progredirMes() {
    //int novosAdultos = jovens;
    //int novosJovens = adultos + jovens;  //* 2;

    adultos += jovens;//novosAdultos;
    jovens = adultos;//novosJovens;
  }

  void aplicarPredacao(double taxa) {
    int total = jovens + adultos;
    int reducao = (total * taxa).toInt();
    total -= reducao;

    double proporcaoJovens = jovens / (jovens + adultos);
    jovens = (total * proporcaoJovens).toInt();
    adultos = total - jovens;
  }

  int total() => jovens + adultos;
}
