#!/bin/bash
# Update the system and install Apache
apt update
apt install -y apache2

# Fetch the EC2 instance ID using instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Install AWS CLI
apt install -y awscli

# Optional: Download an image from an S3 bucket (currently commented out)
# aws s3 cp s3://mycustombucket2025/portfolio-image.jpg /var/www/html/portfolio-image.jpg --acl public-read

# Create a custom HTML page with personalized content
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Cloud Showcase</title>
  <style>
    body {
      font-family: 'Courier New', Courier, monospace;
      background-color: #f3f4f6;
      text-align: center;
      color: #333;
      padding: 20px;
    }
    h1 {
      font-size: 2.5em;
      color: #0073e6;
      margin: 20px 0;
      animation: glow 2s infinite;
    }
    h2 {
      font-size: 1.2em;
      color: #333;
      margin: 10px 0;
    }
    p {
      font-size: 1em;
      color: #555;
    }
    @keyframes glow {
      0% { text-shadow: 0 0 5px #0073e6, 0 0 10px #0073e6; }
      50% { text-shadow: 0 0 20px #0073e6, 0 0 30px #0073e6; }
      100% { text-shadow: 0 0 5px #0073e6, 0 0 10px #0073e6; }
    }
    .footer {
      margin-top: 40px;
      font-size: 0.8em;
      color: #666;
    }
  </style>
</head>
<body>
  <h1>Welcome to Page 2</h1>
  <h2>Instance ID: <span style="color:#28a745;">$INSTANCE_ID</span></h2>
  <p>Exploring the world of cloud infrastructure, one project at a time!</p>
  <div class="footer">Powered by Apache on AWS EC2</div>
</body>
</html>
EOF

# Start Apache and enable it to run on boot
systemctl start apache2
systemctl enable apache2
