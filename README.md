# .NET 6 Hello World

This sample demonstrates a tiny Hello World .NET Core app for [App Service Web App](https://docs.microsoft.com/azure/app-service-web). This sample can be used in a .NET Azure App Service app as well as in a Custom Container Azure App Service app.

## Log in to Azure Container Registry

Using the Azure CLI, log in to the Azure Container Registry (ACR):

```azurecli
az acr login -n <your_registry_name>
```

## Running in a Docker Container

This repository contains 2 Dockerfiles, a Linux container and a Windows container.

### Publish the Windows image to your Registry

To build the Windows image locally and publish to ACR, run the following command:

```docker
docker build -f Dockerfile.windows -t dotnetcore-docs-hello-world-windows . 
docker tag dotnetcore-docs-hello-world-windows <your_registry_name>.azurecr.io/dotnetcore-docs-hello-world-windows:latest
docker push <your_registry_name>.azurecr.io/dotnetcore-docs-hello-world-windows:latest
```

### Publish the Linux image to your Registry

To build the Windows image locally and publish to ACR, run the following command:

```docker
docker build -f Dockerfile.linux -t dotnetcore-docs-hello-world-linux . 
docker tag dotnetcore-docs-hello-world-windows <your_registry_name>.azurecr.io/dotnetcore-docs-hello-world-linux:latest
docker push <your_registry_name>.azurecr.io/dotnetcore-docs-hello-world-linux:latest
```

# Contributing

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
