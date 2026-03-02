# Gebruik een lichte Python 3.13 image
FROM python:3.13-slim

# Werkdirectory in de container
WORKDIR /app

# Kopieer je code naar de container
COPY . .

# Installeer OS-dependencies die Odoo nodig heeft
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libxml2-dev \
    libxslt1-dev \
    libldap2-dev \
    libsasl2-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Installeer Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Start Odoo met jouw config
CMD ["python3", "odoo/odoo-bin", "-c", "odoo.conf"]
