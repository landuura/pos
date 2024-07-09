# Use a slim Python base image for efficiency
FROM python:3.9-slim

# Set working directory within the container
WORKDIR /app

# Copy requirements.txt (adjust the path if needed)
COPY requirements.txt ./

# Install dependencies (adjust if you have a different package manager)
RUN pip install -r requirements.txt

# Copy all other files and set appropriate permissions (caution!)
COPY --from=source . .
RUN chmod -R 755 /app  # Grant execute permissions for scripts and directories

# Optional: Set executable permissions for specific files
# RUN chmod +x /app/my_script.sh

# Entrypoint to run your script (adjust the command)
ENTRYPOINT ["python", "m.py"]
