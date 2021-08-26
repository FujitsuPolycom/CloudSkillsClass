package test

import (
	"fmt"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/terraform"
	http_helper "github.com/gruntwork-io/terratest/tree/master/modules/http-helper"
)

func TestTerraformWebserverExample(t *testing.T) {

	// the values to pass into the Terraform CLI
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// The path to the terraform code to be tested
		TerraformDir: "../examples/webserver",

		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"region":     "us-east-2",
			"servername": "testwebserver",
		},
	})

	//Init and apply instance
	terraform.InitAndApply(t, terraformOptions)

	// destroy instances after testing
	defer terraform.Destroy(t, terraformOptions)

	publicIp := terraform.Output(t, terraformOptions, "public_ip")

	url := fmt.Sprintf("http://%s:8080", publicIp)

	http_helper.HttpGetWithRetry(t, url, nil, 200, "I made a Terraform Module!", 30, 5*time.Second)

}
