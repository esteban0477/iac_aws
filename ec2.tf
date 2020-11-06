resource "aws_instance" "myec2" {
    ami = "ami-0baeff348741804cd"
    instance_type = "t2.micro"
    key_name = "myec2"
}