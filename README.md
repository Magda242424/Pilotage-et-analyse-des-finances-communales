
---
PROJET EN COURS DE FINALISATION
Ce dépôt est en cours de mise à jour et sera complété prochainement.

Version complète disponible à partir du 4 mai





# PILOTAGE DES FINANCES COMMUNALES DE LA VILLE DE LYON – DATA PIPELINE ET SCÉNARIOS

## Objectif
Développer un pipeline de données complet permettant d’analyser, fiabiliser et piloter les finances de la **Ville de Lyon** à travers des indicateurs clés et des simulations de scénarios prospectifs.

## Architecture du Projet
L'organisation du dépôt suit une logique de pipeline ETL (Extract, Transform, Load) :

*   **`python/`** : Scripts Python pour le nettoyage des données, les calculs statistiques et les prédictions.
*   **`sql/`** : Scripts de création de la base de données MySQL, vues et procédures stockées.
*   **`data/`** : Jeux de données financiers bruts (Open Data).
*   **`assets/`** : Captures d'écran des tableaux de bord Superset.
*   **`.env.example`** : Modèle de configuration des accès base de données (sécurité).

## Stack Technique
*   **Python** : ETL, analyse exploratoire, modélisation de régression linéaire.
*   **MySQL** : Stockage structuré, indexation et transformations SQL complexes.
*   **Apache Superset** : Datavisualisation haute-fidélité et dashboards interactifs.

## Visualisation & Tableaux de Bord (Superset)


![Dashboard Superset - Aperçu Global](assets/votre_capture_superset_1.png)
*Exemple de visualisation des recettes et dépenses de fonctionnement.*

##  Indicateurs Clés & Modélisation
Le pipeline calcule automatiquement les indicateurs de santé financière :
*   **Épargne brute & nette** : Capacité réelle d'autofinancement.
*   **Capacité de désendettement** : Ratio dette / épargne brute.
*   **Scénarios Prospectifs** : Simulations basées sur une hausse ou baisse de 5 % des dépenses pour anticiper l'épargne future.

## Couche de Données SQL
Le projet s'appuie sur une base de données MySQL optimisée. Les scripts de création des schémas et des relations sont disponibles dans le dossier `/sql`.
*   **Fiabilisation** : Nettoyage des doublons et typage strict des données financières.
*   **Performance** : Utilisation d'index sur les années et les types de flux.

## Exécution
1.  **Configuration** : Copiez le fichier `.env.example` vers `.env` et complétez vos accès MySQL.
2.  **Base de données** : Exécutez le script `sql/setup_db.sql`.
3.  **Pipeline** :
    ```bash
    python python/main.py
    ```

---








---


















# PROJET EN COURS DE FINALISATION

Ce dépôt est en cours de mise à jour et sera complété prochainement.

## Version complète disponible à partir du 4 mai


# Pilotage des finances communales – Data Pipeline et scénarios

## Objectif
Développer un pipeline de données permettant d’analyser, fiabiliser et piloter les finances communales à travers des indicateurs clés et des simulations de scénarios.

---

## Valeur ajoutée
- Transformation de données financières brutes en indicateurs décisionnels  
- Mise en place de scénarios prospectifs (hausse/baisse des dépenses)  
- Création de tableaux de bord interactifs pour faciliter la prise de décision  

---

## Stack technique
Python · MySQL · Apache Superset

- Python : ETL, analyse exploratoire, modélisation  
- MySQL : structuration et transformations SQL  
- Superset : datavisualisation et dashboards interactifs  

---

## Indicateurs clés
- Épargne de fonctionnement  
- Taux d’épargne  
- Capacité de désendettement  

---

## Scénarios analysés
- Situation réelle  
- +5 % dépenses  
- -5 % dépenses  

---

## Résultats
- Analyse dynamique de la santé financière des communes  
- Comparaison claire de scénarios d’évolution  
- Outil d’aide à la décision basé sur la donnée  

---

## Exécution
```bash
python python/main.py
