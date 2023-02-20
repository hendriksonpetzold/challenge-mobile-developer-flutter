Obi Tec - Mobile Developer Flutter
===================
O objetivo deste desafio é principalmente conhecermos um pouco mais de você que se candidatou para a nossa vaga de Mobile Developer Flutter.

É importante ressaltar que solução do desafio não tem um gabarito. Vamos verificar as técnicas que utilizaram para a criação do serviço, como vocês encaram este desafio e também, claro, a entrega da solução.   

As regras e os requisitos técnicos estão detalhadas abaixo, boa sorte!

_Time Obi.Tec_
# Especificações Técnicas
- **Linguagem:** [Dart](https://dart.dev/)
- **UI:** [Flutter](https://flutter.dev/)
- **Gerenciamento de estado**:  [Provider](https://pub.dev/packages/provider)  ou [GetX](https://pub.dev/packages/get) (opcional)
- **Idioma de escrita do código:** Inglês

# Requisitos
## Contextualização
Considere que para o módulo de filmes do **Aplicativo Obi Tec**, será desenvolvido um funcionalidade com o intuito de apresentar os filmes disponíveis atualmente. O desafio consiste em criar uma aplicação para a listagem de filmes e a possibilidade de visualizar mais informações sobre o mesmo, atendendo aos critérios mínimos de aceitação.


## The Movie Database API
Para obter os dados necessários para a implementação do aplicativo, será necessário a utilização do [Movie Database API](https://developers.themoviedb.org/) disponível publicamente.

Para isso, inicialmente é necessário a implementação do serviço para obter um [token de autenticação](https://developers.themoviedb.org/4/auth/user-authorization-1) para efetuar as requests subsequentes.

Com posse do token, é possível realizar a request para [listar](https://developers.themoviedb.org/4/list) os filmes.

## Histórias do Usuário
- **Sendo** um usuário da Plataforma Obi Tec
- **Quero** listar os filmes da Plataforma
- **Para** que seja possível visualizar informações adicionais do filme e assistir o trailer.

### Critérios mínimos de aceite: 
#### Cenário: listar filmes cadastrados 
- **Dado** que estou na Plataforma Obi Tec
- **Quando** clico no ícone do AppBar 'Filmes'
- **Então** abre a tela de listagem de filmes
- **E** exibe lista dos filmes
- **E** para cada registro exibe o thumbnail e o título do filme
- **E** exibe um ícone para visualizar mais informações

#### Cenário: visualizar informações do filme
- **Dado** que estou na listagem de filmes
- **Quando** clico no ícone de visualizar informações
- **Então** abre a tela de visualização do filme
- **E** exibe um player de vídeo com o trailer do filme, título, sinopse, avaliação dos usuários
- **E** exibe uma opção para favoritar o filme
##### Cenário alternativo #1
- **Dado** que estou na tela de visualização do filme e que o filme não esta favoritado
- **Quando** clico no ícone de favoritar
- **Então** o filme é adicionado na minha lista de desejos
- **E** retorna mensagem de sucesso
##### Cenário alternativo #2
- **Dado** que estou na tela de visualização do filme e que o filme está favoritado
- **Quando** clico no icone de desfavoritar
- **Então** o filme é removido na minha lista de desejos
- **E** retorna mensagem de sucesso

#### Cenário: visualizar minha lista de desejos
- **Dado** que estou na Plataforma Obi Tec
- **Quando** clico no ícone do AppBar 'Lista de Desejos'
- **Então** abre a tela com a listagem dos filmes favoritados
- **E** exibe a thumbnail e título do filme
- **E** exibe uma opção para visualizar mais informações sobre o filme

# Desejável
- Implementação do AppBar
- Gerenciamento de estado para a lista de desejos
- Manter a lista de desejos mesmo após o fechamento do aplicativo
- Documentação da arquitetura de solução

# Critérios de avaliação
- Qualidade de escrita do código
- Organização e estrutura do projeto
- Lógica da solução implementada
- Utilização do Git (quantidade e descrição dos commits, Git Flow, ...)
- Funcionalidades extras

# Instruções de entrega
1. Crie um fork do repositório no seu GitHub
2. Faça o push do código desenvolvido no seu Github
3. Inclua um README.md explicando como rodar o projeto
4. Inclua um arquivo chamado COMMENTS.md explicando
  - Decisão da arquitetura utilizada
  - Lista de bibliotecas de terceiros utilizadas
  - O que você melhoraria se tivesse mais tempo
  - Quais requisitos obrigatórios que não foram entregues (se houver)
5. Informe ao recrutador quando concluir o desafio junto com o link do repositório
6. Após revisão do projeto junto com a equipe de desenvolvimento deixe seu repositório privado



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

Todas as cores mais ultilizadas estão nesse arquivo, embora em algumas raras exceções(casos bastante específicos) usei cores diferentes, caso tivesse um figma muito assertivo esse "erro" não deveria ser cometido para evitar problemas futuros.

> lib/styles/app_colors.dart


### Novas regras de negócio

Novas regras devem ser adicionadas utilizando clean architecture, mais precisamente na camada de *domínio*, utilizando casos de uso (_usecases_) e testes.



## Como testar o projeto?

### Executando:

No terminal digite:

> ```flutter run --release```


Testes:

> ```flutter test```

