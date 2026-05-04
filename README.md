---

# PILOTAGE DES FINANCES COMMUNALES DE LA VILLE DE LYON – DATA PIPELINE ET ANALYSE DÉSISIONELLE  

# Pilotage Financier de la Ville de Lyon : Data Pipeline & Analyse Décisionnelle

## Objectif Stratégique
Transformer des données financières brutes en outils de pilotage pour sécuriser l'analyse et anticiper les trajectoires budgétaires.

## Organisation du Projet
Le dépôt est structuré selon une logique ETL (Extract, Transform, Load) :
* **`sql/`** : Architecture de la base de données, vues analytiques et procédures.
* **`notebook/`** : Nettoyage des données, calculs statistiques et modèles de prédiction (Python).
* **`images/`** : Restitution visuelle via les tableaux de bord Apache Superset.

## Démonstration des Compétences Clés

### 1. Valorisation et Pilotage de la Donnée
Mise en œuvre de solutions concrètes pour transformer les flux comptables en indicateurs de performance au service des décideurs.

### 2. Automatisation des Processus (Budget & Prospective)
Optimisation des cycles de gestion en remplaçant les traitements manuels par un pipeline automatisé (SQL/Python), fiabilisant ainsi la prospective financière.

### 3. Conception d'Outils Décisionnels
Déploiement de tableaux de bord interactifs et de datavisualisations haute-fidélité pour faciliter l'arbitrage budgétaire.

### 4. Analyses Avancées (Descriptive, Diagnostique, Prédictive)
Exploitation complète du cycle de la donnée : de l'état des lieux historique à la modélisation statistique des budgets à l'horizon 2027.

### 5. Ingénierie de Données Multi-sources
Structuration et exploitation de données issues de systèmes hétérogènes (Comptes de communes et Balances comptables) avec un typage strict et une intégrité garantie.

## Architecture Technique
* **Base de données** : MySQL (Schémas relationnels et vues calculées).
* **Traitement** : Python / Jupyter Notebook (Scikit-Learn, Pandas).
* **Visualisation** : Apache Superset.

## Sources des données

Les données utilisées dans ce projet proviennent de sources open data institutionnelles :

- **Observatoire des Finances et de la Gestion Publique Locales (OFGL)**  
  Données : *Comptes des communes 2017–2024*  
  Source : https://data.ofgl.fr  

- **Ministère de l’Économie et des Finances**  
  Données : *Balances comptables des communes en 2024*  
  Source : https://data.economie.gouv.fr  

### Pré-traitement des données

Les fichiers CSV utilisés dans ce projet ont été **préalablement filtrés directement depuis les interfaces des plateformes open data**, comme illustré dans les captures d’écran du repository :

- Filtrage sur la commune de **Lyon**
- Sélection du **budget principal**
- Filtrage sur l’année **2024**
- Application de critères métier (nomenclature M57, identifiants INSEE, etc.)

Ce pré-filtrage permet :
- de travailler sur un périmètre analytique cohérent
- d’optimiser les traitements
- de reproduire des cas d’usage métiers concrets

Les étapes suivantes du pipeline (nettoyage, structuration, analyse) sont réalisées via SQL et Python et SQL


---







---


















## Exécution
```bash
python python/main.py
