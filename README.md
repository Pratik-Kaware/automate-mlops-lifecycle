# Automate MLOps Lifecycle: IMDB Sentiment Analysis

Welcome to the **Automate MLOps Lifecycle** project! This repository demonstrates a complete, production-grade MLOps workflow for text classification using the IMDB movie reviews dataset. The project covers data preprocessing, feature engineering, model training, experiment tracking, and result visualization, all automated and reproducible.

---

## 🚀 Project Overview

- **Goal:** Predict sentiment (positive/negative) from IMDB movie reviews.
- **Tech Stack:** Python, scikit-learn, pandas, NLTK, MLflow, DagsHub, Jupyter, VS Code.
- **MLOps:** Automated experiment tracking, artifact logging, and reproducible pipelines.

---

## 📂 Project Structure

```
.
├── data/                # (gitignored) Raw and processed datasets
├── notebooks/
│   ├── exp1.ipynb       # Baseline: Logistic Regression with Bag-of-Words
│   ├── exp2_bow_vs_tfidf.py  # Compare BoW vs TF-IDF, multiple algorithms
│   └── exp3_hyperparam_tuning.py # Hyperparameter tuning experiments
├── requirements.txt
├── .gitignore
└── README.md
```

---

## 📊 Experiments & Results

### 1️⃣ Experiment 1: Baseline Logistic Regression (Bag-of-Words)

- **Preprocessing:** Lowercasing, stopword removal, lemmatization, punctuation/number/url removal.
- **Feature Engineering:** Bag-of-Words (CountVectorizer, 50 features).
- **Model:** Logistic Regression
- **Tracking:** MLflow on DagsHub

**Result Visualization:**

![Experiment 1 Output](./screenshots/exp1_output.png)

*Interpretation:*  
Parallel coordinates plot showing how model hyperparameters (C, penalty) affect accuracy.

---

### 2️⃣ Experiment 2: BoW vs TF-IDF, Multiple Algorithms

- **Feature Engineering:** Compare Bag-of-Words vs TF-IDF.
- **Algorithms:** Logistic Regression, MultinomialNB, XGBoost, RandomForest, GradientBoosting.
- **Automated MLflow tracking:** All combinations logged as nested runs.

**Result Visualization:**

![Experiment 2 Output](./screenshots/exp2_output.png)

*Interpretation:*  
Parallel coordinates plot comparing algorithms and their hyperparameters.

---

### 3️⃣ Experiment 3: Hyperparameter Tuning

- **Grid search** over key hyperparameters (e.g., number of features, test size, regularization).
- **Automated experiment logging** for each configuration.

**Result Visualization:**

![Experiment 3 Output](./screenshots/exp3_output.png)

*Interpretation:*  
Parallel coordinates plot showing the impact of feature count and test size on precision.

---

## 🛠️ Key Features

- **Automated Data Preprocessing:** Modular, reusable text cleaning pipeline.
- **Flexible Feature Engineering:** Easily switch between BoW and TF-IDF.
- **Multiple Algorithms:** Out-of-the-box support for classic and ensemble models.
- **Experiment Tracking:** MLflow integration with DagsHub for full reproducibility.
- **Artifact Logging:** Models and metrics logged for every run.
- **Visual Analytics:** Parallel coordinates plots for insightful model comparison.
- **Production-Ready Structure:** Clean code, clear separation of concerns, and extensible design.

---

## 🏁 Getting Started

1. **Clone the repo**
   ```sh
   git clone https://github.com/Pratik-Kaware/automate-mlops-lifecycle.git
   cd automate-mlops-lifecycle
   ```

2. **Set up your environment**
   ```sh
   conda create -n atlas311 python=3.11
   conda activate atlas311
   pip install -r requirements.txt
   ```

3. **Prepare the data**
   - Place your IMDB dataset as `IMDB.csv` in the project root.
   - Run the data sampling cell in `exp1.ipynb` to generate `notebooks/data.csv`.

4. **Run experiments**
   - **Baseline:** Open and run `notebooks/exp1.ipynb`.
   - **BoW vs TF-IDF:** `python notebooks/exp2_bow_vs_tfidf.py`
   - **Hyperparameter Tuning:** `python notebooks/exp3_hyperparam_tuning.py`

---

## 📈 MLflow Tracking

All experiments, parameters, metrics, and artifacts are tracked using MLflow and visualized on [DagsHub](https://dagshub.com/Pratik-Kaware/automate-mlops-lifecycle.mlflow).

---

## 📷 Screenshots

### Experiment 1 Output
![Experiment 1 Output](./screenshots/exp1_output.png)

### Experiment 2 Output
![Experiment 2 Output](./screenshots/exp2_output.png)

### Experiment 3 Output
![Experiment 3 Output](./screenshots/exp3_output.png)

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!  
Feel free to fork the repo and submit a PR.

---

## 📧 Contact

For questions or collaboration, reach out via [DagsHub](https://dagshub.com/Pratik-Kaware/automate-mlops-lifecycle) or open an issue.

---

**Happy MLOps-ing! 🚀**