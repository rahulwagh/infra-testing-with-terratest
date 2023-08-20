# 1. Pre-requisites 

1. Install `terraform`. Click here for [installation instructions](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. Install `go`. Click here for [installation instructions](https://go.dev/doc/install)

<br/>

# 2. Initialize the `terrtest directory`

Goto the directory `test/aws_ec2_test` and run the following command 

1. Initiate the `go module`
```bash
go mod init test 
```

2. make sure all the dependencies of your project are present in the go.mod file and remove any unneeded dependencies.

```bash 
go mod tidy
```

<br/>

# 3. Run the test 

Use the following command to run the test.
`test` is the name the module

```bash
go test -v
```