---


# PILOTAGE DES FINANCES COMMUNALES DE LA VILLE DE LYON  
## Data Pipeline et Analyse Décisionnelle

## Objectif Stratégique
Transformer des données financières brutes en outils de pilotage afin de sécuriser l’analyse et anticiper les trajectoires budgétaires.

## Organisation du Projet
Le dépôt est structuré selon une logique ETL (Extract, Transform, Load) :

- **sql/** : Architecture de la base de données, vues analytiques et procédures  
- **notebook/** : Nettoyage des données, calculs statistiques et modèles de prédiction (Python)  
- **images/** : Restitution visuelle via les tableaux de bord Apache Superset  

## Démonstration des Compétences Clés

### 1. Valorisation et Pilotage de la Donnée
Mise en œuvre de solutions concrètes pour transformer les flux comptables en indicateurs de performance au service des décideurs.

### 2. Automatisation des Processus (Budget & Prospective)
Optimisation des cycles de gestion en remplaçant les traitements manuels par un pipeline automatisé (SQL / Python), fiabilisant ainsi la prospective financière.

### 3. Conception d’Outils Décisionnels
Déploiement de tableaux de bord interactifs et de data visualisations haute fidélité pour faciliter l’arbitrage budgétaire.

### 4. Analyses Avancées (Descriptive, Diagnostique, Prédictive)
Exploitation complète du cycle de la donnée : de l’analyse historique à la modélisation statistique des budgets à l’horizon 2027.

### 5. Gestion de données multi-sources
Organisation et utilisation de données provenant de différentes sources (comptes des communes et balances comptables), avec un travail de nettoyage et de structuration.

## Architecture Technique
Base de données : MySQL (schémas relationnels et vues calculées)
Traitement : Python / Jupyter Notebook (Pandas, Scikit-Learn)
Visualisation : Apache Superset

## Sources des Données :

### Observatoire des Finances et de la Gestion Publique Locales (OFGL)
Données : Comptes des communes 2017–2024
Source : https://data.ofgl.fr

### Ministère de l’Économie et des Finances
Données : Balances comptables des communes en 2024
Source : https://data.economie.gouv.fr

## Pré-traitement des Données
Les fichiers CSV utilisés dans ce projet ont été préalablement filtrés directement depuis les interfaces des plateformes open data.

### Filtres appliqués :

Données OFGL – Comptes des communes (2017–2024)
- Commune : Lyon
- Type de budget : Budget principal
- Nomenclature : M57

Données Ministère – Balances comptables (2024)
- Code INSEE : 123
- Libellé budget (LBUDG) : LYON

Les étapes suivantes du pipeline (nettoyage, structuration et analyse) sont réalisées en SQL et en Python.



---
