# Azure Integration Overview

## 1. Authentication Methods

### Azure Active Directory
````powershell
# Connect to Azure
Connect-AzAccount

# Set subscription
Set-AzContext -SubscriptionId "your-subscription-id"
````

### Connection Strings
````json
{
    "AzureSQL": {
        "connectionString": "Server=tcp:server.database.windows.net,1433;Database=mydb;Authentication=Active Directory Default"
    },
    "StorageAccount": {
        "connectionString": "DefaultEndpointsProtocol=https;AccountName=myaccount;AccountKey=key;EndpointSuffix=core.windows.net"
    }
}
````

## 2. Common Services Integration

### Azure SQL Database
````csharp
public async Task<SqlConnection> GetConnectionAsync()
{
    var connection = new SqlConnection(Configuration.GetConnectionString("AzureSQL"));
    await connection.OpenAsync();
    return connection;
}
````

### Azure Storage
````csharp
public async Task UploadFileAsync(string containerName, string blobName, Stream content)
{
    var blobClient = _blobServiceClient
        .GetBlobContainerClient(containerName)
        .GetBlobClient(blobName);
    
    await blobClient.UploadAsync(content, true);
}
````

## 3. Azure CLI Commands

For Mac Terminal:
````bash
# Install Azure CLI
brew update && brew install azure-cli

# Login
az login

# List resources
az resource list --output table

# Create resource group
az group create --name myGroup --location eastus
````

## 4. Key Azure Services

### Azure Functions
````csharp
[FunctionName("HttpTrigger")]
public static async Task<IActionResult> Run(
    [HttpTrigger(AuthorizationLevel.Function, "get", "post")] HttpRequest req,
    ILogger log)
{
    log.LogInformation("C# HTTP trigger function processed a request.");
    return new OkObjectResult("Hello from Azure Functions");
}
````

### Azure Key Vault
````csharp
public async Task<string> GetSecretAsync(string secretName)
{
    var client = new SecretClient(
        new Uri("https://your-vault.vault.azure.net/"), 
        new DefaultAzureCredential());
    
    KeyVaultSecret secret = await client.GetSecretAsync(secretName);
    return secret.Value;
}
````

## 5. Monitoring

### Application Insights
````json
{
    "ApplicationInsights": {
        "InstrumentationKey": "your-key-here",
        "EnableAdaptiveSampling": true,
        "EnableQuickPulseMetricStream": true
    }
}
````

## Development Tools
1. VS Code Extensions:
   - Azure Tools
   - Azure Account
   - Azure Functions

Install VS Code extensions:
````bash
code --install-extension ms-vscode.azure-account
code --install-extension ms-azuretools.vscode-azure-functions
code --install-extension ms-azuretools.vscode-docker
````