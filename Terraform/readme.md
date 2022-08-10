# How to use Data Source in Terraform

Firstly Go the given URL and copy the content from the terraform docs of data_source and make changes to it according to you:

[Data Source File Content ](https://www.terraform.io/language/data-sources)

Now one should have a seperate directory and under that directory create one file and named it as:

```
provider.tf
```

Now you should have AWS CLI in your local machine and then configure your AWS as:

```
provider "aws"{
  region     = "us-east-1"
  access_key = "your_access_key"
  secret_key = "your_secret_key"
}

```

Now run the Terraform command to Create the S3 Bucket as:


```
terraform init
```

```
terraform plan
```

```
terraform apply
```

At last if you want to delete the resources to avoid unnecessary charges , you should use:

```
terraform destroy
'''