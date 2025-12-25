# 1. Base Image
FROM python:3.9-slim

# 2. Security: Create a non-root user (Required by Hugging Face)
RUN useradd -m -u 1000 user
USER user
ENV PATH="/home/user/.local/bin:$PATH"

# 3. CRITICAL: Set the directory where the model will be saved
# This prevents "Permission Denied" errors during model download
ENV HF_HOME=/home/user/app/cache
WORKDIR /home/user/app

# 4. Create the cache directory explicitly
RUN mkdir -p $HF_HOME

# 5. Install dependencies
COPY --chown=user requirements.txt requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# 6. Copy ALL files to the root directory
COPY --chown=user . .

# 7. Run Command (Notice we removed "app." from the path)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7860"]