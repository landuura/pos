# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Give execute permissions to keep_alive.py and the script files
RUN chmod +x /app
RUN chmod +x main.py

# Make port 8443 available to the world outside this container
EXPOSE 8443

# Define environment variable
ENV NAME World

# Run main.py when the container launches
CMD ["python", "main.py"]
