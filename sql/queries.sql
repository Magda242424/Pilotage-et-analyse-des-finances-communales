
CREATE OR REPLACE VIEW balance_fonc_detail AS
SELECT 
    t.annee,
    t.compte,
    t.categorie,
    SUM(t.debit) AS montant
FROM (
    SELECT 
        annee,
        compte,
        debit,
        CASE 
            WHEN LEFT(compte, 2) = '64' THEN 'Personnel'
            WHEN LEFT(compte, 2) IN ('61', '62') THEN 'Services extérieurs'
            WHEN LEFT(compte, 2) = '65' THEN 'Autres charges'
            ELSE 'Autres'
        END AS categorie
    FROM 
        balance
    WHERE 
        LEFT(compte, 1) = '6'
) t
GROUP BY 
    t.annee,
    t.compte,
    t.categorie;






CREATE OR REPLACE VIEW balance_fonc_repartition AS 
SELECT 
    annee,
    CASE 
        WHEN LEFT(compte, 2) = '64' THEN 'Personnel' 
        WHEN LEFT(compte, 2) IN ('61', '62') THEN 'Services extérieurs' 
        WHEN LEFT(compte, 2) = '65' THEN 'Autres charges gestion' 
        WHEN LEFT(compte, 2) = '66' THEN 'Charges financières' 
        WHEN LEFT(compte, 2) = '67' THEN 'Charges exceptionnelles' 
        ELSE 'Autres' 
    END AS categorie,
    SUM(debit) AS montant 
FROM 
    balance 
WHERE 
    LEFT(compte, 1) = '6' 
GROUP BY 
    annee, 
    categorie;







CREATE OR REPLACE VIEW balance_fonc_repartition_pct AS 
SELECT 
    annee,
    categorie,
    montant,
    ROUND(((montant / SUM(montant) OVER (PARTITION BY annee)) * 100), 2) AS pourcentage 
FROM 
    balance_fonc_repartition;
    
    
CREATE OR REPLACE VIEW budget_scenarios AS 
-- Scénario Réel
SELECT 
    annee,
    recettes_fonctionnement AS recettes,
    depenses_fonctionnement AS depenses,
    personnel,
    dette,
    (recettes_fonctionnement - depenses_fonctionnement) AS epargne,
    ((recettes_fonctionnement - depenses_fonctionnement) / NULLIF(recettes_fonctionnement, 0)) AS taux_epargne,
    (personnel / NULLIF(depenses_fonctionnement, 0)) AS ratio_personnel,
    (dette / NULLIF((recettes_fonctionnement - depenses_fonctionnement), 0)) AS capacite_desendettement,
    'Réel' AS scenario 
FROM budget_pivot_m57

UNION ALL 

-- Scénario Hausse dépenses +5%
SELECT 
    annee,
    recettes_fonctionnement,
    (depenses_fonctionnement * 1.05),
    personnel,
    dette,
    (recettes_fonctionnement - (depenses_fonctionnement * 1.05)),
    ((recettes_fonctionnement - (depenses_fonctionnement * 1.05)) / NULLIF(recettes_fonctionnement, 0)),
    (personnel / NULLIF((depenses_fonctionnement * 1.05), 0)),
    (dette / NULLIF((recettes_fonctionnement - (depenses_fonctionnement * 1.05)), 0)),
    'Hausse dépenses +5%' 
FROM budget_pivot_m57

UNION ALL 

-- Scénario Baisse dépenses -5%
SELECT 
    annee,
    recettes_fonctionnement,
    (depenses_fonctionnement * 0.95),
    personnel,
    dette,
    (recettes_fonctionnement - (depenses_fonctionnement * 0.95)),
    ((recettes_fonctionnement - (depenses_fonctionnement * 0.95)) / NULLIF(recettes_fonctionnement, 0)),
    (personnel / NULLIF((depenses_fonctionnement * 0.95), 0)),
    (dette / NULLIF((recettes_fonctionnement - (depenses_fonctionnement * 0.95)), 0)),
    'Baisse dépenses -5%' 
FROM budget_pivot_m57;








CREATE OR REPLACE VIEW diagnostic_financier AS 
SELECT 
    a.annee,
    (a.recettes_fonctionnement - a.depenses_fonctionnement) AS epargne,
    p.dette,
    (p.dette / NULLIF((a.recettes_fonctionnement - a.depenses_fonctionnement), 0)) AS ratio_dette,
    CASE 
        WHEN (a.recettes_fonctionnement - a.depenses_fonctionnement) <= 0 THEN 3 -- Déficit
        WHEN (p.dette / NULLIF((a.recettes_fonctionnement - a.depenses_fonctionnement), 0)) > 12 THEN 3 -- Risque haut
        WHEN (p.dette / NULLIF((a.recettes_fonctionnement - a.depenses_fonctionnement), 0)) BETWEEN 8 AND 12 THEN 2 -- Vigilance
        ELSE 1 -- Sain
    END AS alerte_score 
FROM analyse_evolution a 
LEFT JOIN pilotage_financier p ON a.annee = p.annee;








CREATE OR REPLACE VIEW pilotage_financier AS 
SELECT 
    b.annee,
    STR_TO_DATE(CONCAT(b.annee, '-01-01'), '%Y-%m-%d') AS date_annee,
    b.recettes_fonctionnement,
    b.depenses_fonctionnement,
    (b.recettes_fonctionnement - b.depenses_fonctionnement) AS epargne,
    b.recettes_investissement,
    b.depenses_investissement,
    (b.depenses_investissement - b.recettes_investissement) AS besoin_financement,
    b.dette,
    r.capacite_desendettement,
    r.taux_epargne_pct,
    CASE 
        WHEN r.capacite_desendettement < 8 THEN 'sain' 
        WHEN r.capacite_desendettement < 12 THEN 'surveillance' 
        ELSE 'risque' 
    END AS statut 
FROM budget_pivot_m57 b 
LEFT JOIN ratios r ON b.annee = r.annee;






CREATE OR REPLACE VIEW ml_projection AS 
SELECT annee, recettes, depenses, epargne, type 
FROM ml_fonctionnement;







CREATE OR REPLACE VIEW scenario_simple AS 
SELECT 
    annee,
    recettes_fonctionnement,
    depenses_fonctionnement,
    (recettes_fonctionnement * 1.02) AS recettes_proj,
    (depenses_fonctionnement * 1.03) AS depenses_proj,
    ((recettes_fonctionnement * 1.02) - (depenses_fonctionnement * 1.03)) AS epargne_proj 
FROM budget_pivot_m57;






CREATE OR REPLACE VIEW analyse_evolution AS
SELECT 
    annee,
    recettes_fonctionnement,
    depenses_fonctionnement,
    (recettes_fonctionnement - depenses_fonctionnement) AS epargne,
    LAG(recettes_fonctionnement) OVER (ORDER BY annee) AS recettes_n_1,
    LAG(depenses_fonctionnement) OVER (ORDER BY annee) AS depenses_n_1,
    (recettes_fonctionnement - LAG(recettes_fonctionnement) OVER (ORDER BY annee)) AS evolution_recettes,
    (depenses_fonctionnement - LAG(depenses_fonctionnement) OVER (ORDER BY annee)) AS evolution_depenses
FROM 
    budget_pivot_m57;






    




















