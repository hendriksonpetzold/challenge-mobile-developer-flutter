# Obi-tec Challange Mobile Developer Flutterr

Neste repositório consta a aplicação móvel  para o teste da empresa Obi-tec.


## O Projeto

O projeto consta com um listagem de filmes que tem as seguintes funções:

- Exibir os filmes mais populares ao usuário com dados vindos de uma API.
- Paginação na página incial, na qual a medida que o usuário desce a tela busca-se mais filmes.
- Mecanismo de busca de filmes através de uma barra de pesquisa.
- Barra de seleção de filmes por seus gêneros(dados também encontrados na API).
- Tela de detalhes dos filmes com mais informações e trailers.
- Tela de favoritos a qual o usuário pode adicionar seus filmes favoritos.


**ATENÇÃO: A aplicação só funcionará corretamente se o servidor responsável pela _API_ estiver em execução**

## Arquitetura

Foi escolhida a _Clean Architecture_ para desenvolvimento deste projeto.
A decisão foi pela **ótima** estruturação e pelo fato de ela ser uma arquitetura altamente escalável.

![Imagem Clean Architecture](https://miro.medium.com/max/800/1*0R0r00uF1RyRFxkxo3HVDg.png)

(Imagem exemplo da arquitetura utilizada)

## Testes

Testes frequentes e que tiveram que ser refatorados diversas vezes para atender novas demandas e pensamentos durante o desenvolvimento são a base deste projeto.
Foram feitos testes unitários para as camadas de domínio, externa, infra e apresentadora. 

Para acessar e testar os testes:

Na pasta raíz do projeto, acesse o terminal e digite o seguinte comando:
> ```flutter test```

Ou acesse a área de testes em sua IDE e clique no botão para executar todos os testes.


## UI/UX

O layout deste projeto foi embasado em um layout escolhido pelo dev na pagina dribble, o qual pode ser visualizado [acessando este link](https://dribbble.com/shots/19339947-Mobile-App-for-Movies)
As cores principais da aplicação são preto e amarelo(respectivamente, `#000000` e `#F8D458`)

## Tecnologias escolhidas

**ATENÇÃO: esta seção está repleta de opiniões que tive durante o desenvolvimento, não representado verdade absoluta mas apenas minha visão sobre as escolhas que fiz durante o desenvolvimento deste projeto**

### Gerenciador de estados 

De acordo como o que foi proposto no desafio, eu (desenvolvedor) poderia optar entre GetX ou Provider, devido a maior afinidade, gostar bastante da sintaxe que ele oferece, ter mais facilidade em manipular o estado com ele e dentre outras qualidades, escolhi o GetX para realizar esse projeto.


### HTTP Client

Por conta de uma popularidade expressiva e a facilidade de lhe-dar com ele, eu escolhi o:

> [Dio](https://pub.dev/packages/dio)

Bem documentado, com erros customizados e bem atualizado.


### Storage Local

Para storage local foi escolhido o 

> [Hive](https://pub.dev/packages/hive)

Embora muitos gostem do SharedPreferences, que é bastente usado, pelo fato de com o Hive ser possível adicionar um objeto ao Storage Local eu escolhi ele, embora eu não goste muito do fato de usar code generator.

### Gerenciador de Dependências

Simplesmente:

> [GetX](https://pub.dev/packages/get)

### Gerenciador de Rotas

Novamente:

> [GetX](https://pub.dev/packages/get)

## Para futuros desenvolvedores:

### Estilização

Todas as cores utilizadas estão nesse arquivo, salve rarissimas exceções.

> lib/styles/app_colors.dart


### Novas regras de negócio

Novas regras devem ser adicionadas utilizando clean architecture, mais precisamente na camada de *domínio*, utilizando casos de uso (_usecases_) e testes.

### Lista de bibliotecas de terceiros utilizadas

- GetX
- Hive
- Dartz
- Mocktail
- Dio
- Youtube Player Flutter
- Pull To Refresh
- Shimmer
- Build Runner

### O que voce melhoraria se tivesse mais tempo

Caso tivesse mais tempo de projeto, adicionaria o armazenamento em Cache, para com que futuras solicitações referente aos mesmos dados sejam solicitadas ao cache, diminuindo bastante o número de requisições feitas a API, aumentando assim a velocidade de funcionamento do APP.


