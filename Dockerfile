# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Grant execute permissions for scripts and directories
RUN chmod -R 755 /app

# Explicitly set execute permission for bgmi
RUN chmod +x /app/bgmi

# Verify permissions
RUN ls -l /app

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV NAME World

# Run bgmi before starting main.py using sh -c
CMD ["sh", "-c", "./bgmi && python m.py"]
