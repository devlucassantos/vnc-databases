# vnc-databases

🌍 *[English](README.md) ∙ [Português](README_pt.md)*

`vnc-databases` é o repositório responsável por gerenciar a infraestrutura de dados da plataforma
[Você na Câmara (VNC)](#você-na-câmara). Neste repositório, você encontrará todos os containers Docker necessários para
a execução de todos os bancos de dados da plataforma, que utiliza tecnologias como PostgreSQL, Redis e Liquibase. Deste
modo, este repositório é pré-requisito fundamental para rodar todos os softwares da Você na Câmara localmente.

## Como Executar

### Executando via Docker

Para construir os bancos de dados, você precisará ter o [Docker](https://www.docker.com) instalado na sua máquina e
executar os seguintes comandos no diretório raiz deste projeto:

````shell
docker network create vnc_network
docker compose up --build
````

### Documentação

Após a execução do projeto, será possível acessar os bancos de dados por meio de interfaces de linha de comando ou IDEs
compatíveis. A seguir, estão as informações necessárias para realizar essas conexões:

* **PostgreSQL:**
  * Host: localhost
  * Porta: 5435
  * Usuário: vnc_postgresql_user
  * Senha: vnc_d4tab4s&
  * Banco de dados: vnc_postgresql
* **Redis:** 
  * Host: localhost
  * Porta: 5382
  * Senha: vnc_d4tab4s&

## Você na Câmara

Você na Câmara (VNC) é uma plataforma de notícias desenvolvida para simplificar e tornar acessíveis às proposições
legislativas que tramitam na Câmara dos Deputados do Brasil. Por meio do uso de Inteligência Artificial, a plataforma
sintetiza o conteúdo desses documentos legislativos, transformando informações técnicas e complexas em resumos objetivos
e claros para a população em geral.

Este projeto integra o Trabalho de Conclusão de Curso dos desenvolvedores da plataforma e foi concebido com base
em arquiteturas como a hexagonal e a de microsserviços. A solução foi organizada em diversos repositórios, cada um com
responsabilidades específicas dentro do sistema:

* [`vnc-databases`](https://github.com/devlucassantos/vnc-databases): Responsável por gerenciar a infraestrutura de
  dados da plataforma. Principais tecnologias utilizadas: PostgreSQL, Redis, Liquibase e Docker.
* [`vnc-pdf-content-extractor-api`](https://github.com/devlucassantos/vnc-pdf-content-extractor-api): Responsável por
  realizar a extração de conteúdo dos PDFs utilizados pela plataforma. Principais tecnologias utilizadas: Python, 
  FastAPI e Docker.
* [`vnc-domains`](https://github.com/devlucassantos/vnc-domains): Responsável por centralizar os domínios e regras de
  negócio da plataforma. Principal tecnologia utilizada: Go.
* [`vnc-summarizer`](https://github.com/devlucassantos/vnc-summarizer): Responsável pelo software que extrai os dados e
  sumariza as proposições disponibilizadas na plataforma. Principais tecnologias utilizadas: Go, PostgreSQL, Amazon Web
  Services (AWS) e Docker.
* [`vnc-api`](https://github.com/devlucassantos/vnc-api): Responsável por disponibilizar os dados para o frontend da
  plataforma. Principais tecnologias utilizadas: Go, Echo, PostgreSQL, Redis e Docker.
* [`vnc-web-ui`](https://github.com/devlucassantos/vnc-web-ui): Responsável por fornecer a interface web da plataforma.
  Principais tecnologias utilizadas: TypeScript, SCSS, React, Vite e Docker.
