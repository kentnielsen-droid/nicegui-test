# Use the same base image defined in the compose file
FROM zauberzeug/nicegui:latest

# Set environment variables
# Note: PUID and PGID are often used by specific entrypoint scripts to handle permissions.
# We set them here as defaults, though they can still be overridden at runtime.
ENV PUID=1000
ENV PGID=1000

# Set the working directory inside the container
WORKDIR /app

# COPY replaces the 'volumes' section.
# Instead of mounting the code at runtime, we copy it into the image during the build.
COPY . /app

# Install dependencies if you have a requirements.txt file
# (Uncomment the following lines if you use external libraries)
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# Expose the internal port
# The compose file mapped 80->8080, so the container listens on 8080.
EXPOSE 8080

# Run the application
# The base image is set up to run python, so we point it to your main script.
CMD ["python3", "main.py"]