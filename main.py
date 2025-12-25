from fastapi import FastAPI, HTTPException
from schemas import ReviewRequest, SentimentResponse  # <--- CHANGED (No 'app.')
from model import classifier                          # <--- CHANGED (No 'app.')

app = FastAPI(title="Sentiment Analysis API", version="1.0")

@app.get("/")
def home():
    return {"message": "System Operational. Use /predict endpoint."}

@app.post("/predict", response_model=SentimentResponse)
def predict_sentiment(request: ReviewRequest):
    try:
        result = classifier.predict(request.text)
        return result
    except Exception as e:
        # This prints the actual error to your cloud logs for debugging
        print(f"ERROR: {str(e)}")
        raise HTTPException(status_code=500, detail="Internal processing error.")