# Use the official n8n Docker image as base
FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Copy custom configurations if any (optional)
# COPY ./custom /home/node/custom

# Expose default n8n port
EXPOSE 5678

# Set environment variables (you can also set these in Render dashboard)
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=http://your-render-domain.onrender.com/  
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=yourpassword
ENV NODE_ENV=production
ENV DB_TYPE=sqlite
ENV DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite

# Create directory for n8n data
RUN mkdir -p /home/node/.n8n

# Set the entrypoint to start n8n
ENTRYPOINT ["n8n"]
CMD ["start"]
