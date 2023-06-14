# Use the official Python base image
FROM python:3.9

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file to the working directory
COPY requirements.txt .

# Install project dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django project files to the working directory
COPY . .

# Expose the port that Django runs on (change it if your app runs on a different port)
EXPOSE 8000

# Set the command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
