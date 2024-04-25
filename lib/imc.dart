//Enumeração para representar as diferentes faixas de IMC.
enum FaixaIMC {
  abaixoIdeal,
  pesoIdeal,
  acimaIdeal,
  obesidadeI,
  obesidadeII,
  obesidadeIII,
}

// Extensão aplicada à enumeração FaixaIMC, para 
// adicionar propriedade de descrição.
extension FaixaIMCExt on FaixaIMC {
  String? get descricao {
    switch (this) {
      case FaixaIMC.abaixoIdeal:
        return 'Abaixo do Peso';
      case FaixaIMC.pesoIdeal:
        return 'Peso Ideal';
      case FaixaIMC.acimaIdeal:
        return 'Acima do Peso'; 
      case FaixaIMC.obesidadeI:
        return 'Obesidade Grau I';               
      case FaixaIMC.obesidadeII:
        return 'Obesidade Grau II';
      case FaixaIMC.obesidadeIII:
        return 'Obesidade Grau III';      
      default:
        return null;
    }
  }
}

/// Representa o IMC - Índice de Massa Corpórea.
/// 
class IMC{
  //Atributos da classe IMC, necessários para o cálculo do índice.
  double peso;
  double altura;

  //Construtor para receber os parâmetros.  
  IMC({required this.peso, required this.altura});

  //Propriedade que realiza o cálculo do índice.
  double get imc{
    return peso / (altura * altura);
  }

  //Propriedade que realizada a apuração da faixa conforme 
  //o índice calculdado.
 FaixaIMC? get faixa {
  double valorIMC = this.imc;
  if(valorIMC < 18.6){
    return FaixaIMC.abaixoIdeal;
  }
  if(valorIMC >= 18.6 && valorIMC < 24.9){
    return FaixaIMC.pesoIdeal;
  }  
  if(valorIMC >= 24.9 && valorIMC < 29.9){
    return FaixaIMC.acimaIdeal;
  }   
  if(valorIMC >= 29.9 && valorIMC < 34.9){
    return FaixaIMC.obesidadeI;
  } 
  if(valorIMC >= 34.9 && valorIMC < 39.9){
    return FaixaIMC.obesidadeII;
  }  
  if(valorIMC >= 40){
    return FaixaIMC.obesidadeIII;
  }
  return null;
}

}