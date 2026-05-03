CREATE TABLE `budget_pivot_m57` (
  `annee` bigint DEFAULT NULL,
  `recettes_fonctionnement` double DEFAULT NULL,
  `depenses_fonctionnement` double DEFAULT NULL,
  `recettes_investissement` double DEFAULT NULL,
  `depenses_investissement` double DEFAULT NULL,
  `remboursement_capital` double DEFAULT NULL,
  `epargne_brute` double DEFAULT NULL,
  `epargne_nette` double DEFAULT NULL,
  `subventions_investissement` double DEFAULT NULL,
  `fctva` double DEFAULT NULL,
  `cessions` double DEFAULT NULL,
  `emprunts` double DEFAULT NULL,
  `dette` double DEFAULT NULL,
  `personnel` double DEFAULT NULL,
  `depenses_equipement` double DEFAULT NULL,
  KEY `idx_budget_annee` (`annee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `balance` (
  `annee` bigint DEFAULT NULL,
  `compte` text,
  `categorie` text,
  `debit` double DEFAULT NULL,
  `credit` double DEFAULT NULL,
  `solde` double DEFAULT NULL,
  KEY `idx_balance_annee` (`annee`),
  KEY `idx_balance_compte` (`compte`(20)),
  KEY `idx_balance_categorie` (`categorie`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


    
CREATE TABLE `ratios` (
  `annee` bigint DEFAULT NULL,
  `taux_epargne` double DEFAULT NULL,
  `ratio_personnel` double DEFAULT NULL,
  `taux_financement_invest` double DEFAULT NULL,
  `capacite_desendettement` double DEFAULT NULL,
  `taux_epargne_pct` double DEFAULT NULL,
  `ratio_personnel_pct` double DEFAULT NULL,
  `taux_financement_invest_pct` double DEFAULT NULL,
  KEY `idx_ratios_annee` (`annee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
    
    
CREATE TABLE `ml_fonctionnement` (
  `annee` bigint DEFAULT NULL,
  `recettes` double DEFAULT NULL,
  `depenses` double DEFAULT NULL,
  `epargne` double DEFAULT NULL,
  `type` text,
  KEY `idx_ml_annee` (`annee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

    
    
    