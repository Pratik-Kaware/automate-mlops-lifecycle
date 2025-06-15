FROM python:3.11-slim

# create work dir

WORKDIR /app 

# Copy only requirements first for better caching
COPY flask_app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY flask_app/ .

COPY models/vectorizer.pkl /app/models/

RUN python -m nltk.downloader stopwords wordnet

EXPOSE 5000

# Local Run 

CMD ["python", "app.py"]


# Prod run 

# CMD ["gunicorn", "-b", "0.0.0:5000", "--timeout", "120", "app:app"]