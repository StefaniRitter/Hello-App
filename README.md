# Hello-App: Pipeline CI/CD e GitOps Completa

## Visão Geral

Este projeto foi desenvolvido como parte do programa de bolsas Cloud & DevSecOps da Compass UOL.
O repositório demonstra, na prática, uma pipeline completa de Integração Contínua (CI), Entrega Contínua (CD) e GitOps, utilizando uma aplicação FastAPI como exemplo de workload.

## Objetivo Principal

Automatizar o ciclo completo de desenvolvimento, build, deploy e execução de uma aplicação FastAPI simples, usando GitHub Actions para CI/CD, Docker Hub como registry, e ArgoCD para entrega contínua em Kubernetes local com Rancher Desktop. 

## Tecnologias e Ferramentas Utilizadas

* Linguagem/Framework: Python 3.12 + FastAPI.

* Contêinerização: Docker + Rancher Desktop.

* Orquestração: Kubernetes (via Rancher Desktop).

* CI/CD: GitHub Actions.

* GitOps/CD: ArgoCD.

* Registro de Imagens: Docker Hub.


## Pré-requisitos 

* Conta no GitHub: (Repositório público com Actions habilitadas).

* Conta no Docker Hub: (com token de acesso configurado no GitHub Actions).

* Rancher Desktop: Instalado e com o Kubernetes habilitado.

* kubectl: Configurado e apontando para o cluster Rancher Desktop (kubectl get nodes).

* ArgoCD: Instalado no cluster local.

* Git e Python 3 instalados localmente

## Fluxo de Trabalho

1.  **Commit do Código:** Um git push no repositório `hello-app` aciona o workflow.

2.  **CI/Build (GitHub Actions):** O workflow `ci-cd.yml` é acionado automaticamente.
    * Constrói a imagem Docker a partir do `Dockerfile`.
    * Faz o *push* da imagem versionada para o Docker Hub.

3.  **CD/GitOps (GitHub Actions):** Após o *push* bem-sucedido:
    * O workflow **atualiza um arquivo de manifesto** no repositório de configuração `hello-manifests`.
   
4.  **Deploy (ArgoCD):**
    * O **ArgoCD** monitora o repositório de manifestos.
    * Ao detectar o *commit* com a nova tag, ele sincroniza o estado do cluster, aplicando a nova versão da aplicação.

5.  **Execução:** A nova versão da aplicação FastAPI entra em execução no Kubernetes.
   

## Etapa 1 - Criação dos Repositórios

Antes de configurar a pipeline de CI/CD e o GitOps, é necessário preparar dois repositórios: um para o código da aplicação (Hello-App) e outro para os manifestos Kubernetes (Hello-Manifests).

### Etapa 1.1 - Repositório Principal (Hello-App)

Este repositório vai conter o código-fonte da aplicação FastAPI e o workflow do GitHub Actions responsável pelo processo de build, push e atualização dos manifestos. 

Estrutura inicial:
```
hello-app/
├── app/                     # Diretório onde vai ficar o código principal da aplicação FastAPI
├── .github/
│   └── workflows/           # Diretório para o workflow do GitHub Actions (Build, Push e Commit no repositório dos manifestos "hello-manifests")
└── README.md                # Documentação do projeto
```

Os arquivos específicos (main.py, Dockerfile e ci-cd.yml) serão criados nas próximas etapas.

### Etapa 1.2 - Repositório de Manifestos

O segundo repositório, `hello-manifests`, será utilizado para armazenar os arquivos de manifesto Kubernetes utilizados pelo ArgoCD.

👉 [Ir para Hello-Manifests](https://github.com/StefaniRitter/Hello-Manifests)


## Etapa 2 - Criação da Aplicação FastAPI

No repositório principal, em `hello-app/app/`, foi criado o arquivo main.py com o conteúdo abaixo:
```
from fastapi import FastAPI 

app = FastAPI() 
@app.get("/") 
async def root(): 
    return {"message": "Hello World"} 
```

## Etapa 3 - Criação do Dockerfile






