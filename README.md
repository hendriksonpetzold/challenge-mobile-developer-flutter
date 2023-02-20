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


## Como testar o projeto?

### Executando:

No terminal digite:

> ```flutter run --release```

Testes:

> ```flutter test```

