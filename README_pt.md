# vnc-databases

🌍 *[English](README.md) ∙ [Português](README_pt.md)*

`vnc-databases` é o serviço responsável pela infraestrutura de dados da plataforma [Você na Câmara (VNC)](#você-na-câmara-vnc).
Neste repositório você encontrará todos os containers necessários para a execução de todas as bases de dados da plataforma,
sendo, portanto, pré-requisito para rodar todos os softwares da Você na Câmara localmente.

## Como Executar

Para construir as bases de dados você precisará ter o [Docker](https://www.docker.com) instalado na sua máquina e
executar os seguintes comandos no diretório raiz deste projeto:

````shell
docker network create vnc_network
docker compose up
````

## Você na Câmara (VNC)

Você na Câmara (VNC) é uma plataforma de notícias que busca simplificar as proposições que tramitam pela Câmara dos
Deputados do Brasil visando sintetizar as ideias destas proposições através do uso da Inteligência Artificial (IA)
de modo que estes documentos possam ter suas ideias expressas de maneira simples e objetiva para a população em geral.
