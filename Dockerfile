# Use a slim Python base image
FROM python:3.9-slim-buster

# Set working directory
WORKDIR /app

# Copy requirements.txt
COPY requirements.txt ./

# Install dependencies
RUN pip install -r requirements.txt

# Copy all other files (including bgmi with permission)
COPY --from=source . .
RUN chmod +x /app/bgmi  # Set executable permission for bgmi inside container

# Set the entrypoint to run your script
ENTRYPOINT ["python", "m.py"]

# Define a source image with embedded permissions
FROM alpine:latest AS source
RUN apk add --no-cache bash
RUN echo "#!/bin/sh" > /tmp/entrypoint.sh
RUN echo "chmod +x /app/bgmi" >> /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
COPY --from=tmp /tmp/entrypoint.sh ./entrypoint.sh
