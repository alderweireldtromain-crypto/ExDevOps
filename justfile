
# Initialise un nouveau dépôt git
init:
    git init

# Affiche l'état du répertoire de travail
status:
    git status

# Ajoute toutes les modifications à l'index de git
add:
    git add .

# Enregistre les modifications avec un message
commit message:
    git commit -m "{{message}}"

# Affiche l'historique des commits
log:
    git log --oneline

# Nettoie les fichiers temporaires
clean:
    rm -f tmp.txt

# Nom de la base de données (variable globale)
db_name := "app_database"

# Création de la base SQL dans un serveur local
db-create:
    createdb {{db_name}}

# Insertion de tables/entités
db-insert:
    psql -d {{db_name}} -f schema_et_donnees.sql

# Migration de la base (mise à jour du schéma)
db-migrate:
    # Exécution d'un script de migration ou appel à un outil tiers (ex: flyway, alembic)
    psql -d {{db_name}} -f migrations/up.sql

# Downgrade vers une database vide
db-downgrade:
    dropdb {{db_name}}
    createdb {{db_name}}