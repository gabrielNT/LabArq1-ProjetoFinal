Repositório para armazenar o trabalho final de Laboratório de Arquitetura e Organização de Computadores 1, focado na criação de um sistema de vídeo colorido.

**Integrantes do Grupo**
=======

* Fábio Kenji Jojima      RA - 558273
- Gabriel Nagatomo Tutui  RA - 558290
+ Victor Otavio Sales     RA - 558460

**Proposta de Projeto**
=======

  O projeto consiste numa implementação de um processador em arquitetura MIPS, focando na criação de um sistema de vídeo colorido. A placa escolhida para ser utilizada na implementação é a Altera DE1, da família Cyclone II.

  A proposta para demonstrar o funcionamento do sistema de vídeo colorido é a criação de um simples mapa de cores, que exibe blocos de forma a mostrar todas as cores disponíveis.

  O projeto pode ser dividido em algumas etapas:

  1. Entender funcionamento do sistema de saída VGA fornecido pela placa;
  2. Definir as especificações e funcionamento da animação(como fazer os objetos percorrerem a tela e como mudar suas cores), para implementar como o sistema de vídeo será executado e como será feita a interface com o programa;
  3. Criar o programa que gera o mapa de cores.

**Especificações da Saída de Vídeo**
=======

  A resolução do vídeo gerado para o monitor é de 640x480, considerando um monitor com taxa de atualização vertical de 60Hz. Dessa maneira, as especificações tabeladas são as seguintes:

| Resolution(pixels)  | RefreshRate(Hz) | PixelClock(MHz) | Horizontal Display(pixel_clocks) | Horizontal FrontPorch(pixel_clocks) | Horizontal SyncPulse(pixel_clocks) | Horizontal BackPorch(pixel_clocks) | Vertical Display(rows) | Vertical FrontPorch(rows) | Vertical SyncPulse(rows) | Vertical BackPorch(rows) | h_syncPolarity | v_syncPolarity|
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 640x480   | 60 | 25.175 | 640 | 16 | 96 | 48 | 480 | 10 | 2 | 33 | n | n |

  Devemos considerar as limitações fisícas da placa, pensando que todos os pixels da tela devem ser mapeados por uma posição da memória. Possuimos na implementação atual uma memória de 4096 palavras de 32 bits, representando um total de 131072 bits de memória. Com a resolução de 640x480, teremos um total de 294400 pixels para serem mapeados, um número muito maior do que o disponível(sem contar a necessidade de usar mais de um bit de controle para poder exibir mais de uma cor).

  A solução encontrada foi "extender" os pixels, para que cada pixel seja copiado para as posições adjacentes(copiando nos três pixels inferiores e no à direita dele), formando um "pixel maior" de 2x4. Na memória, faremos com que os pixels sejam representados em pares, para que a impressão visual na tela seja um quadrado de 4x4. Além disso, a implementação original exibia 10 palavras por linha: diminuímos esse valor para exibir 5 palavras por linha, aumentando o número de vezes que os bits se repetem dentro da palavra.
 
  Dessa forma, teremos uma resolução efetiva de 160x120 = 19200 posições, valor muito menor do que o anterior. Cada pixel será representado por 4 bits, aplicados nos sinais VGA_R, VGA_G, VGA_B, além de um quarto sinal VGA_S que controla a intensidade, gerando um total de 2^3*2 = 16 cores. Dessa forma, a memória interna criada no processador será suficiente para suportar o sistema de vídeo.
  Essas alterações foram feitas no arquivo address_video.vhd, mudando a forma como os pixels são representados na memória(da maneira descrita acima, com a manipulação da saída video_out) e a extensão dos pixels.

**Progamas de teste**
=======

  A fim de testar o sistema de vídeo colorido criado e como a integração deste com o processador é feita, criamos alguns programas de teste. O primeiro consiste num mapa de cores, que demonstra todas as saídas de cores possíveis em alguns blocos, que periodicamente se movimentam na tela. O programa funciona com base em inicializar as cores desejadas em certas posições da memória, copiando os valores nas posições abaixo com o programa.

![alt tag](https://raw.githubusercontent.com/gabrielNT/LabArq1-ProjetoFinal/master/Imagens/Imagem%202.jpg)

[Link para o vídeo de demonstração](https://www.youtube.com/watch?v=TAhM3hrse1g)

  O segundo trata-se do programa original do processador fornecido na aula, com a alteração de colocar escrever em cada posição da memória o valor de seu endereço, feito para entender melhor o funcionamento do vídeo.
  
![alt tag](https://raw.githubusercontent.com/gabrielNT/LabArq1-ProjetoFinal/master/Imagens/Imagem%201.jpg)

  Por fim, uma demonstração de pixels únicos exibidos na tela, a partir de uma posição da memória.
  
![alt tag](https://github.com/gabrielNT/LabArq1-ProjetoFinal/blob/master/Imagens/Imagem%203.jpg)

**Referências**
=======

[VGA Controller - Signal Timing](https://eewiki.net/pages/viewpage.action?pageId=15925278#VGAController(VHDL)-SignalTiming)
