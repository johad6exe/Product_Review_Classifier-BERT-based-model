# 🚀 Product Review Sentiment Analysis API

![Python](https://img.shields.io/badge/Python-3.9-blue?style=for-the-badge&logo=python&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-0.109-009688?style=for-the-badge&logo=fastapi&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Container-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![HuggingFace](https://img.shields.io/badge/%F0%9F%A4%97-Hugging%20Face-yellow?style=for-the-badge)

A production-ready, serverless REST API that classifies product reviews as **Positive** or **Negative** in real-time. Built with **FastAPI** for high performance and **Docker** for easy deployment.

## 🔗 Live Demo
**[👉 Click here to try the API / Documentation]([https://[INSERT_YOUR_HF_SPACE_LINK_HERE]/docs](https://pjr-explores-sentiment-analysis-api.hf.space/docs))**

---

## 💡 About The Project

This project demonstrates an **End-to-End MLOps pipeline** for deploying a Transformer-based sentiment analysis model. Unlike simple scripts, this is a fully engineered application featuring:

* **Robust API Design:** Uses `Pydantic` for strict data validation and error handling.
* **Containerization:** Fully dockerized for consistent runs across any environment (Cloud or Local).
* **Optimized Inference:** Uses `DistilBERT` (CPU-optimized) to keep memory usage low (~260MB) and response times fast (<200ms).
* **Auto-Documentation:** Integrated Swagger UI for interactive testing.

### The Model: DistilBERT Finetuned on SST-2
Instead of training from scratch, this project leverages **Transfer Learning**:
* **Architecture:** [DistilBERT](https://huggingface.co/distilbert-base-uncased-finetuned-sst-2-english) (a lighter, faster version of Google's BERT).
* **Dataset:** Finetuned on **SST-2 (Stanford Sentiment Treebank)**, a massive dataset of expert-labeled movie reviews.
* **Why this works:** The emotional vocabulary used in movie reviews ("terrible", "amazing", "waste of time") transfers perfectly to product reviews, achieving **>91% accuracy**.

---

## 🛠️ Tech Stack

* **Framework:** FastAPI (Python)
* **Model:** Hugging Face Transformers (PyTorch)
* **Deployment:** Docker & Hugging Face Spaces
* **Validation:** Pydantic
* **Server:** Uvicorn

---

## 💻 How to Run Locally

### Option 1: Using Docker (Recommended)
This ensures you run in the exact same environment as the production server.

```bash
# 1. Build the image
docker build -t sentiment-api .

# 2. Run the container on port 7860
docker run -p 7860:7860 sentiment-api
