.DEFAULT_GOAL := help

help: ##show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

install-symfony-skeleton: ##install new symfony app via symfony/skeleton
	composer create-project symfony/skeleton ./app

build: ##build containers
	cd ./docker && docker-compose up --build

fast-start: ## fast install all
	make install-symfony-skeleton && make build

up: ##up containers
	cd ./docker && docker-compose up -d

down: ##down containers
	cd ./docker && docker-compose down

php-console: ##open $_bash in php container
	cd ./docker && docker-compose exec -it php bash
