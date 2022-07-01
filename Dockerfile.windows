# Start with the .NET SDK for building the app
# Using an explicit Windows Server tag
# We are using Windows Nanoserver, a headless server for hosting apps with IIS
FROM mcr.microsoft.com/dotnet/sdk:6.0-nanoserver-ltsc2022 AS build
# Work within a folder named `/source`
WORKDIR /source

# Copy everything in this project and build app
COPY . ./dotnetcore-docs-hello-world/
WORKDIR /source/dotnetcore-docs-hello-world
RUN dotnet publish -c release -o /app 

# final stage/image
# We're using a tag that is explicitly a Windows container
FROM mcr.microsoft.com/dotnet/aspnet:6.0.6-nanoserver-ltsc2022

WORKDIR /app
COPY --from=build /app ./

# Expose port 80
# This is important in order for the Azure App Service to pick up the app
ENV PORT 80
EXPOSE 80

# Start the app
ENTRYPOINT ["dotnet", "dotnetcoresample.dll"]
