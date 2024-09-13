# Use the official Python 3.9 image based on Alpine
FROM python:3.9-alpine

# Create a non-root user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any dependencies listed in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Run the container as the non-root user
USER appuser

# Define the command to run your application
CMD ["python", "app.py"]
