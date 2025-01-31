#!/bin/bash
# Update system and install Apache
apt update
apt install -y apache2

# Get the instance ID using instance metadata
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Install AWS CLI
apt install -y awscli

# Create a custom HTML file with personalized content
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Cloud Portfolio</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: linear-gradient(120deg, #ff9a9e, #fad0c4);
      color: #333;
      text-align: center;
      padding: 50px;
    }
    h1 {
      font-size: 3em;
      color: #4caf50;
      text-shadow: 2px 2px #000;
      margin-bottom: 20px;
    }
    h2 {
      font-size: 1.5em;
      color: #ff5722;
      margin-bottom: 20px;
    }
    .footer {
      margin-top: 50px;
      font-size: 0.9em;
      color: #555;
    }
  </style>
</head>
<body>
  <h1>Cloud Portfolio</h1>
  <h2>Instance ID: <span style="color:blue;">$INSTANCE_ID</span></h2>
  <p>Welcome to Page 1</p>
  <p>Server powered by Apache and AWS!</p>
  <div class="footer">Created with 💻 by YourName</div>
</body>
</html>
EOF

# Start Apache and enable it on boot
systemctl start apache2
systemctl enable apache2
