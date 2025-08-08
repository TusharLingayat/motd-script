# Use Ubuntu as base image
FROM ubuntu:22.04

# Install necessary packages (Apache optional)
RUN apt-get update && apt-get install -y \
    apache2 \
    && rm -rf /var/lib/apt/lists/*

# Copy custom MOTD script
COPY motd.sh /etc/update-motd.d/99-custom
RUN chmod +x /etc/update-motd.d/99-custom

# Start Apache by default
CMD ["apache2ctl", "-D", "FOREGROUND"]
