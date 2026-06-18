resource "aws_security_group" "web_sg" {
  name        = "web-server-sg"
  description = "Garde du corps du server"
  vpc_id      = aws_vpc.main_vpc.id

# Entrer sur mon serveur conexion HTTP

ingress {
  
   from_port   = 80
   to_port     = 80
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

#Entrer https
ingress {
  from_port    = 443
  to_port      = 443
  protocol     = "tcp"
  cidr_blocks  =["0.0.0.0/0"]
}

# Entrer en admin via le port 22 connexion ssh

ingress {

   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks = ["128.79.71.244/32"]

 }

# Sortie universelle pour tous les ports

egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 } 

  tags = {
         Name = "sg-formation-web"
   }

}