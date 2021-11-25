# Configurações de comandos basicos

# make build
build: clean
	@docker-compose build

# make up
up:
	@docker-compose up -d

# make migrate
migrate:	
	@docker-compose run api rails db:drop db:create db:migrate

# make seed
seed:
	@docker-compose run api rails db:seed

# make remove
remove: down
	@docker container prune
	@docker image rmi jus/api
	@docker image rmi jus/sidekiq

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

# make clean
clean:
	@sudo rm -rf tmp/*
	@mkdir -p tmp/pids && touch tmp/pids/.keep