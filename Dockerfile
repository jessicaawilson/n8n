# Use official n8n image as base
FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node

# Copy your workflow into container
COPY workflow.json /home/node/workflow.json

# Expose n8n default port
EXPOSE 5678

# Create n8n data folder (for persistent storage)
RUN mkdir -p /home/node/.n8n

# Set environment variables (can override in Render dashboard)
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV WEBHOOK_URL=https://your-render-app.onrender.com/  # replace with Render URL
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD=yourpassword
ENV NODE_ENV=production
ENV DB_TYPE=sqlite
ENV DB_SQLITE_DATABASE=/home/node/.n8n/database.sqlite

# Copy the workflow into n8n default workflow folder
RUN mkdir -p /home/node/.n8n/workflows \
    && cp /home/node/workflow.json /home/node/.n8n/workflows/workflow.json

# Start n8n
ENTRYPOINT ["n8n"]
CMD ["start"]
