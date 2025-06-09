# 🌱 SOS Natureza - API

API desenvolvida em ASP.NET Core 8 para registrar e gerenciar denúncias de desastres ambientais. O projeto utiliza banco de dados Oracle e está containerizado com Docker Compose para facilitar a execução local.

---

## 👥 Integrantes

- **Eduardo do Nascimento Barriviera** - RM 555309  
- **Thiago Lima de Freitas** - RM 556795  
- **Bruno Centurion Fernandes** - RM 556531

---

## 🚀 Tecnologias Utilizadas

- ASP.NET Core 8
- Entity Framework Core
- Oracle Database (Oracle XE via Docker)
- AutoMapper
- Swagger / Swashbuckle
- Docker & Docker Compose

---
## 🐳 Como Rodar o Projeto

### Pré-requisitos

- Docker e Docker Compose instalados
- Git instalado

### Passos

1. **Clone o repositório**

```bash
git clone https://github.com/edu1805/GS1-cloud.git
cd seu_repo
```
## Link demonstrativo de como deixar o projeto fonte de ASP.NET na raiz corretamente: https://youtu.be/rer19MLDdBc
---
2. **Execute o Docker Compose**
```bash
docker compose up --build
```
### Esse comando irá:

Subir o banco Oracle em localhost:1521

Subir a API ASP.NET em localhost:5000/swagger
---

## 🔐 Variáveis de Ambiente
O projeto usa a seguinte variável de ambiente para se conectar ao Oracle:
| Variável                  | Descrição                   | Exemplo                                                             |
|---------------------------|-----------------------------|----------------------------------------------------------------------|
| `ORACLE_CONNECTION_STRING` | String de conexão Oracle XE | `User Id=system;Password=181005;Data Source=oracle-db:1521/XE`       |
