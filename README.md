# API Challenge.Jus
API Rest que permite a criação e consumo de conteúdo

## Pré-Condições

Esse tópico é responsavel por informar quais ferramentas precisa ter para usar a API localmente.

**Ferramentas**:

- Docker
- Postman/Insomnia 

## Configuração

Para iniciar o uso local da API, é preciso seguir os seguintes passos abaixo :point_down:

### Makefile

Caso seu S.O for (Linux), estou usando o Make para construir o projeto, então o primeiro comando é para criar as imagens docker do projeto.

>  make build

Para subir os Containers, use :point_down:

> make up

Para criar as tabelas do bando de dados e popular com algumas informações fornecida no arquivo `data.json` , use :point_down:

> make migrate && make seed

Para derrubar os Containers e remover as imagens, use :point_down:

> make remove

___

### Docker Compose

Caso esteja usando Windows|Linux ou qualquer outro S.O basta ter o docker instalado. Para criar as imagens  do projeto, use :point_down:

> docker-compose build

Para subir os Containers, use :point_down:

> docker-compose up - d

Para criar as tabelas do projetos, use :point_down:

> docker-compose run api rails db:drop db:create db:migrate

Para popular os dados de acordo com o arquivo `data.json`, use :point_down:

> docker-compose run api rails db:seed

Para derrubar os Containers, use :point_down:

> docker-compose down



## Estrutura do Projeto

```shell
app/
├── workers
│   └── article_worker.rb
├── views
│   └── layouts
│       ├── mailer.text.erb
│       └── mailer.html.erb
├── services
│   ├── page_service.rb
│   ├── category_service.rb
│   └── article_service.rb
├── serializers
│   └── article_serializer.rb
├── models
│   ├── page.rb
│   ├── concerns
│   ├── category.rb
│   ├── article.rb
│   └── application_record.rb
├── mailers
│   └── application_mailer.rb
├── jobs
│   └── application_job.rb
├── controllers
│   ├── concerns
│   ├── articles_controller.rb
│   └── application_controller.rb
└── channels
    └── application_cable
        ├── connection.rb
        └── channel.rb
```

## Recursos da API

**GET /articles**

`http://0.0.0.0:3000/articles`

*Exemplo de Response:*

```json
{
  "data": [
    {
      "id": "1",
      "type": "articles",
      "attributes": {
        "title": "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
        "status": "active",
        "publish-at": "2021-11-25T01:45:17.909Z"
      },
      "relationships": {
        "category": {
          "data": {
            "id": 5,
            "name": "default"
          }
        }
      }
    }
  ]
}
```



**GET /articles/:id**

`http://0.0.0.0:3000/articles/:id`

*Exemplo de Response:*

```json
{
      "id": "1",
      "type": "articles",
      "attributes": {
        "title": "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
        "status": "active",
        "publish-at": "2021-11-25T01:45:17.909Z"
      },
      "relationships": {
        "category": {
          "data": {
            "id": 5,
            "name": "default"
          }
        }
      }
    }
```



**POST /articles**

`http://0.0.0.0:3000/articles`

*Exemplo de Body:*

```json
{
    "category": {
        "name": "Teste"
    },
    "article": {
        "title": "Teste",
        "status": "inactive", // active or inactive
        "publish_at": "2021-11-18 00:00:00"
    },
    "page": {
        "number": 1,
        "content": "Teste"
    }
}
```

*Exemplo de Response:*

```json
{
    "job_id": "HASH_JOB"
}
```

## Sidekiq

Para verificar o painel do `sidekiq` acesse:

> http://0.0.0.0:3000/sidekiq