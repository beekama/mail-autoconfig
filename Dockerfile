FROM python:3.10-slim

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    git \
    python3-venv \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install flask automx2 waitress

# Create and switch to new user
RUN useradd --create-home automx2
USER automx2

WORKDIR /home/automx2

# Copy entrypoint-script into container
COPY --chown=automx2 entrypoint.sh .

# Create .automx2.conf configuration file
RUN echo "[automx2]\n\
loglevel = DEBUG\n\
db_echo = no\n\
db_uri = sqlite:////home/automx2/automxdb.sqlite\n" > /home/automx2/.automx2.conf

# Expose port 4243 for Flask
# Set up Flask environment variable and run Flask
# Enable initdb web-call
ENTRYPOINT ["/home/automx2/entrypoint.sh"]
