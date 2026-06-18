resource "aws_instance" "cv_server" {
    ami                    = "ami-05b457b541faec0ca"
    instance_type          = "t3.micro"
    subnet_id              = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.web_sg.id]

   iam_instance_profile = aws_iam_instance_profile.profil_serveur_cv.name

   user_data = <<-EOF
                    #!/bin/bash
                    sudo apt-get update -y
                    sudo apt-get install nginx unzip curl python3-certbot-nginx -y
                    curl -s "https://www.duckdns.org/update?domains=projet-cloud&token=${var.duckdns_token}&ip="
                    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
                    unzip awscliv2.zip
                    sudo ./aws/install
                    sudo rm -rf /var/www/html/*
                    aws s3 cp s3://cv-deploiement-storage-joseph-nathan /var/www/html/ --recursive
                    sudo certbot --nginx --non-interactive --agree-tos -m nathanjobjn@gmail.com -d projet-cloud.duckdns.org
                    sudo systemctl restart nginx
                    sudo systemctl enable nginx
                EOF

                
     tags = {
        Name         = "serveur-cv-Joseph-Nathan"
        Environment = "production"
    }

}