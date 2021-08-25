# Week 2 Scripting Like a Developer

The Code found in this repository is my fumblings through cloudskills.io cloud native devops bootcamp

## WIP
All code found in this repository is WIP

## Powershell Code
The powershell code is for creating Azure resource groups. Functions allow custom inputs.

## Python Code
The python code is for creating s3 buckets in AWS. Functions allow custom inputs.

## Examples

```Pwsh
function New-ResourceGroup {
    [cmdletbinding(SupportsShouldProcess)]

    param (
        [parameter(Mandatory)]
        [string]$rgName,

        [parameter(Mandatory)]
        [string]$location
    )

    $params = @{
        'name' = $rgName
        'location' = $location
        }

        if ($pscmdlet.ShouldProcess('location')){
            New-AzResourceGroup @params
        }
}

New-ResourceGroup -rgName 'uniqueName' -location 'eastus1'
```

```Python
import sys
import boto3

try:
    def main():
        create_s3Bucket(bucket_name)

except Exception as e:
    print(e)

def create_s3Bucket(bucket_name):
    s3_bucket=boto3.client(
        's3',
    )

    bucket = s3_bucket.create_bucket(
        Bucket = bucket_name,
        ACL='private',
    )

    print(bucket)

bucket_name = sys.argv[1]

if __name__ == '__main__':
    main()

python s3Bucket.py 'uniqueBucketname'
```

## Contributors
1. Cody Cessna