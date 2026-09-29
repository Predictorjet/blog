# Blog
deployed at afritech-connect.com

## Dev
```bash
composer install
php artisan key:generate
yarn
yarn dev
```

## Secrets — ce dépôt est public

Aucun identifiant ne doit être commité ici : ni mot de passe, ni clé privée, ni `.env`.
Les accès passent par l'environnement :

- **SSH** : clé personnelle (`~/.ssh/id_ed25519`) autorisée sur le serveur, appelée via un
  alias de `~/.ssh/config` — jamais un mot de passe en clair.
- **Application** : variables dans `.env` (non versionné — voir `.env.example`).
- **Déploiement** : `DEPLOY_HOST` / `DEPLOY_USER`, voir `Makefile`.

> ⚠️ Un identifiant déjà publié doit être **révoqué et remplacé** chez le fournisseur :
> le retirer du dépôt ne l'efface ni de l'historique Git, ni des clones et des index.
> Purge de l'historique : `git filter-repo --path README.md --invert-paths` puis force push,
> à coordonner avec tous les clones (forks inclus).

## TODO
- [ ] Déclarer la clé publique de déploiement sur le serveur (`~/.ssh/id_ed25519.pub`)
- [ ] Ajouter une deploy key sur GitHub
- [ ] Déploiement automatique sur `main`
- [ ] Workflow de linting
- [ ] Workflow de tests
