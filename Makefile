# Configurações de comandos basicos

# make build
build:
	@docker-compose build

# make up
up:
	@docker-compose up -d

# make migrate
migrate:	
	@docker-compose run api rails db:drop db:create db:migrate

# make remove
remove: down
	@docker image rmi jus/rails

# make sh
sh:
	@docker container exec -it api sh

# make down
down:
	@docker-compose down

# make logs
logs:
	@docker-compose logs -f api

# make permit
permit:
	@sudo chown -R ${USER}:${USER} .