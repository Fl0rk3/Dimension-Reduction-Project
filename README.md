# Football Player Attributes Analysis Using PCA

### Dimensionality Reduction of EA Sports FC 26 Player Statistics

**Technologies:** R · ggplot2 · factoextra · corrplot · caret · gridExtra  
**Methods:** Principal Component Analysis (PCA) · Dimensionality Reduction · Correlation Analysis · Feature Standardization

[**View Full Analysis on RPubs →**](https://rpubs.com/Fluorek/1390018)

---

## Project Overview

This project applies **Principal Component Analysis (PCA)** to football player attributes from EA Sports FC 26 to identify the underlying dimensions of player performance.

The primary objective is to reduce the complexity of a high-dimensional dataset while preserving as much information as possible. By analyzing correlations between technical, physical, attacking, and defensive attributes, PCA transforms the original variables into a smaller set of uncorrelated components that describe fundamental aspects of player ability.

## Dataset

The dataset contains information on **18,405 football players**, each described by **35 numerical attributes** extracted from EA Sports FC 26.

**Data source:** [SoFIFA](https://sofifa.com/), collected through the publicly available [fifa-data GitHub repository](https://github.com/rovnez/fifa-data).

The attributes cover seven main categories:

- **Overall:** pace, shooting, passing, dribbling, defending, physicality.
- **Attacking:** crossing, finishing, heading accuracy.
- **Skill:** ball control, curve, free-kick accuracy.
- **Movement:** acceleration, sprint speed, agility, balance.
- **Power:** strength, stamina, jumping, shot power.
- **Mentality:** vision, positioning, aggression, composure.
- **Defending:** marking awareness, interceptions, tackling.

After removing incomplete observations, **16,343 players** were retained for the final analysis.

## Methodology

**1. Data Preparation**

- Identified and removed observations containing missing values.
- Examined descriptive statistics and distributions.
- Standardized numerical variables using centering and scaling.

**2. Correlation Analysis**

- Computed the Pearson correlation matrix for all 35 attributes.
- Visualized relationships using `corrplot`.
- Identified strongly correlated feature groups, indicating potential redundancy in the original dataset.

**3. Principal Component Analysis**

- Applied PCA using the `prcomp()` function in R.
- Examined eigenvalues and explained variance.
- Determined the appropriate number of components using the Kaiser criterion, scree plots, and cumulative explained variance.

**4. Component Interpretation & Visualization**

- Analyzed variable loadings and contributions.
- Visualized relationships between the original variables in principal component space.
- Interpreted the retained components in terms of football performance characteristics.

## Key Findings

- **35 original attributes were reduced to 4 principal components**, preserving approximately **82.8% of total variance**.
- The first two components alone explained approximately **65.5% of variance**.
- The Kaiser criterion supported retaining four principal components.
- Strong correlations between technical, attacking, and defensive attributes confirmed substantial redundancy in the original feature space.

### Interpretation of Principal Components

| Component | Explained Variance | Interpretation |
|---|---:|---|
| PC1 | 41.67% | Technical proficiency and attacking ability |
| PC2 | 23.82% | Defensive capabilities and physical intensity |
| PC3 | 10.25% | Physical strength, balance, and aerial ability |
| PC4 | 7.08% | Pace, acceleration, and explosiveness |
| **Total** | **82.82%** | **Variance explained by four components** |

These findings demonstrate that a relatively small number of latent dimensions can effectively summarize the performance characteristics of thousands of football players.

## Tools & Libraries

| Technology | Purpose |
|---|---|
| R | Statistical analysis and data manipulation |
| caret | Data preprocessing and standardization |
| corrplot | Correlation matrix visualization |
| factoextra | PCA visualization and component evaluation |
| ggplot2 | Data visualization |
| gridExtra | Arrangement of multiple visualizations |

## Full Report

The complete analysis, including correlation matrices, eigenvalue analysis, PCA visualizations, and detailed component interpretation, is available on RPubs.

**[Read the Full Project Report →](https://rpubs.com/Fluorek/1390018)**

---

*This project demonstrates the application of multivariate statistical techniques to high-dimensional sports data, emphasizing data preprocessing, dimensionality reduction, feature interpretation, and statistical visualization.*
