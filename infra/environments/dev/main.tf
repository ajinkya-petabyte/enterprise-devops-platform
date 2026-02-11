module "ec2" {
  source = "../../modules/ec2"

  name              = "enterprise-dev-server"
  ami               = "ami-0f58b397bc5c1f2e8"
  instance_type     = "t2.micro"
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
  key_name          = "your-key-name"

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              systemctl start docker
              systemctl enable docker
              usermod -aG docker ec2-user

              docker run -d -p 80:3000 \
                --name enterprise-app \
                node:18-alpine \
                sh -c "npm install express && echo 'const express=require(\"express\");const app=express();app.get(\"/\",(req,res)=>res.send(\"Enterprise DevOps Platform Running\"));app.listen(3000);' > server.js && node server.js"
              EOF
}



