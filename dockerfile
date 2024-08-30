# Dockerfile for book_catalog microservice
# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file from book_catalog into the container at /app
COPY book_catalog/requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy all the application files from book_catalog to /app
COPY book_catalog /app

# Expose the port the app runs on
EXPOSE 8000

# Set environment variables
ENV DATABASE_URL=${DATABASE_URL}

# Run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
