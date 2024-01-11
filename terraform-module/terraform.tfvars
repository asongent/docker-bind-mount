
////// KEY VARIABLE ////
# To create and downloads aws ec2-instance key_pay instantly, use the following commands below. 


//// For MacOS users ////
#  aws ec2 create-key-pair --key-name myKeypair --query 'KeyMaterial' --output text > mykeypair.pem

///// WINDOWS Users ///// --------> NB: This must be run on POWERSHELL as Admin user
# aws ec2 create-key-pair --key-name mykeypair --query 'KeyMaterial' --output text | out-file -encoding ascii -filepath mykeypair.pem

aws_access_key = "AKIA4I57KPHBG6RMP4LB"

aws_secret_key = "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"

ssh_key_name = "apache-keypair"

private_key_path = "/c/Users/Gentle/Desktop/Key_pairs/apache-keypair.pem"



# //THis config below is for testing purpose. Uncomment the config above and use for your regular deployments

# aws_access_key = file("~/Desktop/Key_pairs/aws_acces_key")

# aws_secret_key = file("~/Desktop/Key_pairs/aws_secret_key")

# ssh_key_name = "apache-keypair"

# private_key_path = "~/Desktop/Key_pairs/apache-keypair.pem"