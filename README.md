# Hello-App

## Visão Geral do Projeto
Este repositório serve como um guia prático para a implementação de uma pipeline de Integração Contínua (CI), Entrega Contínua (CD) e GitOps, utilizando as ferramentas mais relevantes do ecossistema moderno de desenvolvimento.

O projeto demonstra como automatizar o ciclo completo, desde o commit do código até a execução em ambiente orquestrado, utilizando uma aplicação FastAPI simples como carga de trabalho.

## Objetivo Principal
Automatizar o ciclo completo de desenvolvimento, build, deploy e execução da aplicação FastAPI. Isso é alcançado pela integração das seguintes tecnologias:

* GitHub Actions: Responsável pela CI/CD, automatizando o build e o push da imagem Docker no registry.
* Docker Hub: Atua como Container Registry para armazenar as imagens versionadas.
* ArgoCD: Implementa o GitOps, monitorando o repositório de configuração e garantindo que o estado do Kubernetes local (Rancher Desktop) reflita o "estado desejado" definido no Git.

## Tecnologias e Ferramentas Utilizadas

* Linguagem/Framework: Python 3, FastAPI.

* Contêinerização: Docker, Rancher Desktop.

* Orquestração: Kubernetes (via Rancher Desktop).

* CI/CD: GitHub Actions.

* GitOps/CD: ArgoCD.

* Registro de Imagens: Docker Hub.


## Pré-requisitos 

* Conta no GitHub: (Repo público para o código e Actions).

* Conta no Docker Hub: (Com Token de Acesso para o GitHub Actions).

* Rancher Desktop: Instalado e com o Kubernetes habilitado.

* kubectl: Configurado e apontando para o cluster Rancher Desktop (kubectl get nodes).

* ArgoCD: Instalado no cluster local.

* Git: Instalado.

* Python 3: Instalado.

## Estrutura do Repositório
```
hello-app/
├── app/
│   └── main.py              # Aplicação FastAPI
├── .github/
│   └── workflows/
│       └── ci-cd.yml        # Workflow do GitHub Actions (Build, Push e Commit no repositório dos manifestos "hello-manifests")
├── Dockerfile               # Instruções para construir a imagem Docker da aplicação
└── README.md                # Documentação principal do projeto
```








