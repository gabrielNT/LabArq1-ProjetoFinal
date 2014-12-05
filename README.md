Repositório para armazenar o trabalho final de Laboratório de Arquitetura e Organização de Computadores 1.

**Integrantes do Grupo**
=======

* Fábio Kenji Jojima      RA - 558273
- Gabriel Nagatomo Tutui  RA - 558290
+ Victor Otavio Sales     RA - 558460

**Proposta de Projeto**
=======

  O projeto consiste numa implementação de um processador em arquitetura MIPS, focando na criação de um sistema de vídeo colorido. A placa escolhida para ser utilizada na implementação é a Altera DE1, da família Cyclone II.

  A proposta para demonstrar o funcionamento do sistema de vídeo colorido é a criação de uma animação, a partir de um programa na arquitetura MIPS que altere dados em uma determinada posição da memória. A escolha de animação em si está sujeita a alterações dependendo das necessidades que surgirem no decorrer do projeto(sendo preciso realizar alguns testes para definir o que melhor representará o funcionamento do sistema), mas deve consistir basicamente em um bloco(ou blocos) que percorre a tela e muda de cor de acordo com o conteúdo da memória. Como exemplo, podemos pensar em um *screensaver*.
 
  O projeto pode ser dividido em algumas etapas:
  
  1. Entender funcionamento do sistema de saída VGA fornecido pela placa;
  2. Definir as especificações e funcionamento da animação(como fazer os objetos percorrerem a tela e como mudar suas cores), para implementar como o sistema de vídeo será executado e como será feita a interface com o programa;
  3. Criar o programa que gera a animação.

  Quanto à animação, o esboço inicial seria colocar numa posição da memória um dado que possui 12 bits destinados ao controle de cores(que estaria diretamente relacionado a este pelo sinal *video_out*) e o restante relativo à posição que o objeto ocuparia na tela. 

A resolução do vídeo gerado para o monitor é de 640x480, considerando um monitor com taxa de atualização vertical de 60Hz. Dessa maneira, as especificações tabeladas são as seguintes:
  
| Resolution(pixels)  | RefreshRate(Hz) | PixelClock(MHz) | Horizontal Display(pixel_clocks) | Horizontal FrontPorch(pixel_clocks) | Horizontal SyncPulse(pixel_clocks) | Horizontal BackPorch(pixel_clocks) | Vertical Display(rows) | Vertical FrontPorch(rows) | Vertical SyncPulse(rows) | Vertical BackPorch(rows) | h_syncPolarity | v_syncPolarity|
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| 640x480   | 60 | 25.175 | 640 | 16 | 96 | 48 | 480 | 10 | 2 | 33 | n | n |

  Tentaremos utilizar os 4 bits de cada sinal gerado para o VGA(VGA_R, VGA_G, VGA_B), de forma que consigamos gerar até 2^12 cores(4096 no total).
  
**Referências**
=======

[VGA Controller - Signal Timing](https://eewiki.net/pages/viewpage.action?pageId=15925278#VGAController(VHDL)-SignalTiming)
