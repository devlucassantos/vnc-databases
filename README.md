# vnc-databases

🌍 *[English](README.md) ∙ [Português](README_pt.md)*

`vnc-databases` is the repository responsible for managing the data infrastructure of the
[Você na Câmara (VNC)](#você-na-câmara) platform. In this repository, you will find all the required Docker containers
to run all the platform’s databases, which uses technologies such as PostgreSQL, Redis, and Liquibase. Therefore, this
repository is a fundamental prerequisite for running all the Você na Câmara software locally.

## How to run

### Running via Docker

To build the databases, you will need to have [Docker](https://www.docker.com) installed on your machine and run the
following commands in the root directory of this project:

````shell
docker network create vnc_network
docker compose up --build
````

### Documentation

After running the project, it will be possible to access the databases through command-line interfaces or compatible
IDEs. Below are the necessary details for connecting to these databases:

* **PostgreSQL:**
  * Host: localhost
  * Port: 5435
  * User: vnc_postgresql_user
  * Password: vnc_d4tab4s&
  * Database: vnc_postgresql
* **Redis:**
  * Host: localhost
  * Port: 5382
  * Password: vnc_d4tab4s&

## Você na Câmara

Você na Câmara (VNC) is a news platform developed to simplify and make accessible the legislative propositions being
processed in the Chamber of Deputies of Brazil. Through the use of Artificial Intelligence, the platform synthesizes the
content of these legislative documents, transforming technical and complex information into clear and objective
summaries for the general public.

This project is part of the Final Paper of the platform's developers and was conceived based on architectures such as
hexagonal and microservices. The solution was organized into several repositories, each with specific responsibilities
within the system:

* [`vnc-databases`](https://github.com/devlucassantos/vnc-databases): Responsible for managing the platform's data
  infrastructure. Main technologies used: PostgreSQL, Redis, Liquibase, and Docker.
* [`vnc-pdf-content-extractor-api`](https://github.com/devlucassantos/vnc-pdf-content-extractor-api): Responsible for
  extracting content from the PDFs used by the platform. Main technologies used: Python, FastAPI, and Docker.
* [`vnc-domains`](https://github.com/devlucassantos/vnc-domains): Responsible for centralizing the platform's domains
  and business logic. Main technology used: Go.
* [`vnc-summarizer`](https://github.com/devlucassantos/vnc-summarizer): Responsible for the software that extracts data
  and summarizes the propositions available on the platform. Main technologies used: Go, PostgreSQL,
  Amazon Web Services (AWS), and Docker.
* [`vnc-api`](https://github.com/devlucassantos/vnc-api): Responsible for providing data to the platform's frontend.
  Main technologies used: Go, Echo, PostgreSQL, Redis, and Docker.
* [`vnc-web-ui`](https://github.com/devlucassantos/vnc-web-ui): Responsible for providing the platform's web interface.
  Main technologies used: TypeScript, SCSS, React, Vite, and Docker.
