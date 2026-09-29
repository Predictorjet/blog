# Hôte de déploiement : jamais en dur dans un dépôt public (voir §Secrets du README).
# Renseigner .deploy-host (non versionné) ou passer DEPLOY_HOST=… en ligne de commande.
DEPLOY_HOST ?= $(shell cat .deploy-host 2>/dev/null)
DEPLOY_USER ?= deploy

.PHONY: ssh sshr vendor composer.lock node_module prod

ssh:
	@test -n "$(DEPLOY_HOST)" || { echo "DEPLOY_HOST manquant : créez .deploy-host"; exit 1; }
	ssh $(DEPLOY_USER)@$(DEPLOY_HOST)

sshr:
	@test -n "$(DEPLOY_HOST)" || { echo "DEPLOY_HOST manquant : créez .deploy-host"; exit 1; }
	ssh root@$(DEPLOY_HOST)

vendor: composer.lock
	composer install

composer.lock: composer.json
	composer update

node_module: package.json
	yarn

prod: $(wildcard resources/js) $(wildcard resources/css)
	yarn build
