# Bicep

## Documentation

### Getting started docs
Introductory material to bicep

[What is Bicep? - Microsoft Docs](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview)

[Get started with Bicep - Github](https://github.com/Azure/bicep#get-started-with-bicep)

### Reference docs
Reference documentation covering authoring each part of the template, such as parameters, variables, resources, functions, output...

[Bicep Docs - Github](https://github.com/Azure/bicep/tree/main/docs)

[Bicep Docs - Microsoft Docs](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep)

[ARM Template References - Microsoft Docs](https://docs.microsoft.com/en-us/azure/templates/)


### Training modules
Microsoft Learn training modules covering bicep
[Deploy and manage resources in Azure by using Bicep - MS Learn](https://docs.microsoft.com/en-gb/learn/paths/bicep-deploy/)

### Tools
Tools for working with and authoring bicep templates

[Bicep VS Code Extension](https://github.com/Azure/bicep/blob/main/docs/installing.md#install-the-bicep-vs-code-extension) - VS Code extension enabiling intelisense, snippets and error checking of bicep files.

[Bicep CLI - Windows](https://github.com/Azure/bicep/blob/main/docs/installing.md#manual-with-powershell) - Windows version of the bicep CLI used for compiling and decompiling templates. Required to directly deploy bicep files using Azure PowerShell/CLI

[Bicep Playground - online bicep compiler](https://bicepdemo.z22.web.core.windows.net/) - Online bicep compiler with bicep and compiled json side by side. Great for discovering differences between bicep and json.

## Building

### Local
Install the bicep CLI (linked above) and use `build bicep <filename>` to build .bicep to .json or `bicep decompile <filename>` to go the other way.
```bash
bicep build src/demo.bicep
```

### Pipeline
Install the bicep CLI and Build using `bicep build <file>`
```yaml
- script: |
    curl -Lo bicep.bin https://github.com/Azure/bicep/releases/latest/download/bicep-linux-x64
    chmod +x ./bicep.bin
    sudo mv ./bicep.bin /usr/local/bin/bicep
    bicep --help
  displayName: 'Install Bicep CLI'
- script: |
    bicep build src/demo.bicep
```

## Deploying
To deploy the template locally or in pipeline there are two main options:
- compile the template into json and deploy in the same way you deploy json templates
- install the bicep CLI and deploy using Azure PowerShell (`New-AzResourceGroupDeployment`) or Azure CLI (`az deployment group create`)

```bash
az deployment group create -f ./src/demo.bicep -g bicepdemo
```