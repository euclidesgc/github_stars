# Github Stars

No Github você pode seguir repositórios de projetos que você achou interessantes e acompanhar o desenvolvimento no seu feed de notícias.

Estrelar um repositório torna mais fácil encontrá-los posteriormente. Você pode ver todos os repositórios que você favoritou indo para sua página de favoritos.

O que não tem no Github, com menos do que 2 cliques, é saber quais são todos os repositórios que um determinado usuário estrelou.

Consumindo a API GraphQL do GitHub, você deve fazer um app com o seguinte funcionamento:

1. Permita que o usuário busque por nome ou apelido de outro usuário no Github;
2. Liste os repos estrelados do usuário buscado;
    a. Exiba os seguintes dados do usuário buscado: nickname, avatar, bio, localização, email e URL;
    b. Exiba os seguintes dados dos repositórios encontrados: nome do repo, descrição e quantidade de favoritos;

------------------------------------------------------------------------------------------

## Como executar esse projeto:
  Por questão de segurança o token do GITHUB foi incluído em uma variável de ambiente e excluído do controle de versão.
  Para executar esse projeto, você deve baixá-lo e criar um arquivo .env na raiz da pasta lib.
  Dentro desse arquivo inclua a seguinte linha:
  
    GIT_TOKEN="INFORME_AQUI_O_SEU_TOKEN"
  
  Substitua o trecho INFORME_AQUI_O_SEU_TOKEN pelo real valor do seu token.

  Para obter um token de acesso pessoal, siga as instruções da documentação:
  https://docs.github.com/pt/enterprise-server@2.21/github/authenticating-to-github/creating-a-personal-access-token
  
------------------------------------------------------------------------------------------
## v. 0.1
  - Layout da página concluído
  - Variável de ambiente criada

## v. 1.0.0+1
  - Campo de busca incluído
  - Classe Debounce criada para auxiliar na busca
  - Remoção de arquivos desncessários
  - Separação dos componentes em arquivos separados
  - Incluída informação sobre quantidade de respositórios favoritados

------------------------------------------------------------------------------------------

## Considerações gerais

  A arquitetura utilizada para construção desse projeto foi a Modular, difundida pela comunidade fluterando do youtube.
  Como se trata apenas de uma tela, não inclui nenhuma biblioteca para gestão de estado e utilizei o setState() para essa finalidade.
  Nunca utilizei GraphQl anteriormente, então segui as documentações do pacote graphql_flutter, do gitHub e da própria linguagem Graphql como referência para construir essa aplicação, abaixo os links utilizados:
  - https://pub.dev/documentation/graphql_flutter/latest/
  - https://docs.github.com/pt/graphql/overview/explorer
  - https://graphql.org/
  
  A princípio a idéia era utilizar um pageController para separar as regras de negócio da página e um repositório para fazer as consultas no GraphQl, porém como a maioria dos exemplos utilizava widgtes diretamente na página, resolvi descartar essa abordagem e seguir os exemplos a fim de concluir as funcionalidades em tempo hábil.

  Ourtra questão, é que a tarefa pede para pesquisar usuário por nome ou apelido, porém só achei formas de pesquisar pelo login, e não encontrei nenhum campo chamado apelido.




