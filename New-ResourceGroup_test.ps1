# To run the test:
# Invoke-Pester .\New-ResourceGroup_test.ps1

Describe "New-ResourceGroup"{
    $location = 'eastus1'
    $name = 'cloudskillsbootcamp'

    It "Name should be youtube92" {
        $name | Should be 'cloudskillsbootcamp'
    }

    It "Location should be eastus1"{
        $location | Should Be 'eastus1'
    }
}