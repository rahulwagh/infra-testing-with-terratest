package test

import (
    "strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformBasicExample(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
    		// Set the path to the Terraform code that will be tested.
    		TerraformDir: "../../aws-ec2",
    	})

    // Clean up resources with "terraform destroy"
    defer terraform.Destroy(t, terraformOptions)

    // Run "terraform init" and "terraform apply". Fail the test if there are any errors.
    terraform.InitAndApply(t, terraformOptions)

    // Run `terraform output` to get the values of output variables
    output := terraform.Output(t, terraformOptions, "ssh_connection_string")
    assert.True(t, strings.Contains(output, "ssh -i /Users/rahulwagh/.ssh/aws_ec2_terraform ubuntu@"))

}
