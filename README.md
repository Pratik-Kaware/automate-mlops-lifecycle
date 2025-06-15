# Automate MLOps Lifecycle: IMDB Sentiment Analysis

Welcome to the **Automate MLOps Lifecycle** project! This repository demonstrates a full MLOps workflow for text sentiment classification using the IMDB dataset, with robust experiment tracking, CI/CD, containerization, and cloud deployment.

---

## 🚀 Project Overview

- **Goal:** Predict sentiment (positive/negative) from IMDB movie reviews.
- **Tech Stack:** Python, scikit-learn, pandas, NLTK, Flask, MLflow, DagsHub, DVC, Docker, GitHub Actions, AWS ECR.
- **MLOps:** Automated data versioning, experiment tracking, model registry, CI/CD, and containerized deployment.

---

## 📂 Project Structure

```
.
├── src/
│   ├── data/
│   │   ├── data_ingestion.py
│   │   └── data_preprocessing.py
│   ├── features/
│   │   └── feature_engineering.py
│   ├── model/
│   │   ├── model_building.py
│   │   ├── model_evaluation.py
│   │   ├── register_model.py
│   │   └── ...
│   ├── logger/
│   └── ...
├── flask_app/
│   ├── app.py
│   ├── requirements.txt
│   └── templates/
│       └── index.html
├── models/
│   └── vectorizer.pkl
├── data/
│   └── (raw/interim/processed data - DVC tracked)
├── reports/
│   ├── metrics.json
│   ├── experiment_info.json
│   └── figures/
├── tests/
│   ├── test_model.py
│   └── test_flask_app.py
├── scripts/
│   └── promote_model.py
├── dvc.yaml
├── params.yaml
├── requirements.txt
├── dockerfile
├── .gitignore
├── .github/workflows/mlcicd.yaml
└── README.md
```

---

## ⚙️ End-to-End MLOps Workflow

### 1. **Data Ingestion & Preprocessing**
- Download and split IMDB data.
- Clean and normalize text (lowercase, remove stopwords, lemmatize, etc.).
- Scripts: `src/data/data_ingestion.py`, `src/data/data_preprocessing.py`

### 2. **Feature Engineering**
- Transform text using Bag-of-Words or TF-IDF.
- Save vectorizer for inference.
- Script: `src/features/feature_engineering.py`

### 3. **Model Building & Evaluation**
- Train ML models (e.g., Logistic Regression).
- Evaluate with metrics (accuracy, precision, recall, AUC).
- Log metrics and models to MLflow (DagsHub backend).
- Scripts: `src/model/model_building.py`, `src/model/model_evaluation.py`

### 4. **Model Registration**
- Register the best model to MLflow Model Registry on DagsHub.
- Script: `src/model/register_model.py`

### 5. **Flask App for Inference**
- REST API for sentiment prediction.
- Loads model and vectorizer from artifacts.
- Monitors with Prometheus metrics.
- App: `flask_app/app.py`

### 6. **Testing**
- Unit tests for model and Flask app.
- Directory: `tests/`

### 7. **CI/CD Pipeline**
- Automated with GitHub Actions:
  - Runs DVC pipeline, tests, model promotion, and containerization.
  - Pushes Docker image to AWS ECR.
- Workflow: `.github/workflows/mlcicd.yaml`

### 8. **Containerization**
- Dockerfile builds a lightweight image for the Flask app.
- Supports both development and production (Gunicorn) runs.

---

## 🛠️ Key Features

- **Data Versioning:** DVC tracks all data and model artifacts.
- **Experiment Tracking:** MLflow logs all runs, metrics, and artifacts to DagsHub.
- **Model Registry:** Models are versioned and promoted via MLflow Model Registry.
- **CI/CD:** GitHub Actions automates testing, model promotion, and Docker builds.
- **Cloud Deployment:** Docker images are pushed to AWS ECR for scalable deployment.
- **Monitoring:** Prometheus metrics for app and model monitoring.
- **Reproducibility:** All parameters tracked in `params.yaml` and DVC pipeline.

---

## 📈 Example Experiment Visualizations

### Experiment 1: Hyperparameter Tuning
![Experiment 1 Output](./screenshots/exp1_output.png)

### Experiment 2: Algorithm Comparison
![Experiment 2 Output](./screenshots/exp2_output.png)

### Experiment 3: Feature Engineering Impact
![Experiment 3 Output](./screenshots/exp3_output.png)

---

## 🐳 Docker & Deployment

**Build and run locally:**
```sh
docker build -t imdb-mlops:latest .
docker run -p 8888:5000 -e DAGSHUB_TOKEN=<your_token> imdb-mlops:latest
```

**Production run (uncomment Gunicorn CMD in Dockerfile):**
```dockerfile
# CMD ["gunicorn", "-b", "0.0.0.0:5000", "--timeout", "120", "app:app"]
```

---

## 🚦 CI/CD Pipeline (GitHub Actions)

- **project-testing job:**  
  - Checks out code, installs dependencies, runs DVC pipeline, tests, and uploads build context as an artifact.
- **Containerize job:**  
  - Downloads artifact, builds Docker image, logs in to AWS ECR, and pushes the image.

**Secrets required:**
- `DAGSHUB_TOKEN` (as `TEST_ENV`)
- `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`, `ECR_REPOSITORY`, `AWS_ACCOUNT_ID`

---

## 📦 DVC Pipeline

- **dvc.yaml** defines all stages: data-ingestion, data-preprocessing, feature-engineering, model-building, model-evaluation, model-registration.
- **params.yaml** tracks all key parameters (e.g., `test_size`, `max_features`).

---

## 📝 How to Reproduce

1. **Clone the repo**
   ```sh
   git clone https://github.com/Pratik-Kaware/automate-mlops-lifecycle.git
   cd automate-mlops-lifecycle
   ```

2. **Set up environment**
   ```sh
   conda create -n atlas311 python=3.11
   conda activate atlas311
   pip install -r requirements.txt
   ```

3. **Configure DVC and MLflow**
   - Set up DagsHub and AWS credentials as described above.

4. **Run DVC pipeline**
   ```sh
   dvc repro
   ```

5. **Run Flask app locally**
   ```sh
   cd flask_app
   python app.py
   ```

6. **Run tests**
   ```sh
   python -m unittest tests/test_model.py
   python -m unittest tests/test_flask_app.py
   ```

7. **Build and run Docker image**
   ```sh
   docker build -t imdb-mlops:latest .
   docker run -p 8888:5000 -e DAGSHUB_TOKEN=<your_token> imdb-mlops:latest
   ```

---

## 📊 MLOps Lifecycle Diagram

```mermaid
flowchart TD
    A[Data Ingestion<br>src/data/data_ingestion.py] --> B[Data Preprocessing<br>src/data/data_preprocessing.py]
    B --> C[Feature Engineering<br>src/features/feature_engineering.py]
    C --> D[Model Building<br>src/model/model_building.py]
    D --> E[Model Evaluation<br>src/model/model_evaluation.py]
    E --> F[Model Registration<br>src/model/register_model.py]
    D --> G[Experiment Tracking<br>MLflow + DagsHub]
    E --> G
    F --> G
    C --> H[Flask App<br>flask_app/app.py]
    H --> I[Docker Container]
    I --> J[AWS ECR]
```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!  
Feel free to fork the repo and submit a PR.

---

## 📧 Contact

For questions or collaboration, reach out via [DagsHub](https://dagshub.com/Pratik-Kaware/automate-mlops-lifecycle) or open an issue.

---

**Happy MLOps-ing! 🚀**