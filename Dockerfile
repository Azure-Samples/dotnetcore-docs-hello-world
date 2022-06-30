# Start with the .NET SDK for building the app
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
# Work within a folder named `/source`
WORKDIR /source

# Copy everything in this project and build app
COPY . ./dotnetcore-docs-hello-world/
WORKDIR /source/dotnetcore-docs-hello-world
RUN dotnet publish -c release -o /app 

# final stage/image
# We're using a tag that is explicitly a Windows container
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app ./

# Start the app
ENTRYPOINT ["dotnet", "dotnetcoresample.dll"]