# vnc-databases

🌍 *[English](README.md) ∙ [Português](README_pt.md)*

`vnc-databases` is the service responsible for the data infrastructure of the [Você na Câmara (VNC)](#você-na-câmara-vnc)
platform.  In this repository you will find all the containers needed to run all the databases of the platform, therefore
being a prerequisite to run all Você na Câmara software locally.

## How to run

To build the databases you will need to have [Docker](https://www.docker.com) installed on your machine and run the
following commands in the root directory of this project:

````shell
docker network create vnc_network
docker compose up
````

## Você na Câmara (VNC)

Você na Câmara (VNC) is a news platform that seeks to simplify the propositions under debate in the Chamber of Deputies
of Brazil aiming to synthesize the ideas of these propositions through the use of Artificial Intelligence (AI) so that
these documents can have their ideas expressed in a simple and objective way for the general population.
