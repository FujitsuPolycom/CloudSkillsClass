# Create a resource group in Azure. 
# Azure authentication not included as part of function
# Manual auth example: 
#   Install-Module -Name Az
#   Connect-AzAccount


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