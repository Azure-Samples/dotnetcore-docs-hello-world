# Start with the .NET SDK for building the app
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
# Work within a folder named `/source`
WORKDIR /source

# Copy everything in this project and build app
COPY . ./SampleMicroservice/
WORKDIR /source/SampleMicroservice
RUN dotnet publish -c release -o /app 

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app ./

# Expose port:
ENV ASPNETCORE_URLS "http://+:8082"
EXPOSE 8082

# Start the app
ENTRYPOINT ["dotnet", "SampleMicroservice.dll"]
