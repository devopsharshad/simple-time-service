# Use lightweight Python base
FROM python:3.11-slim

# Create non-root user
RUN useradd -m appuser

# Set working directory
WORKDIR /home/appuser

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY main.py .

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 5000

# Run app
CMD ["python", "main.py"]
