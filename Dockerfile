


FROM microsoft/dotnet:2.1-sdk AS build-env
WORKDIR /app

COPY . ./

RUN dotnet restore DockerDemoApp/*.csproj



RUN dotnet publish DockerDemoApp/*.csproj -c Release -o out

FROM microsoft/dotnet:2.1-aspnetcore-runtime 
WORKDIR /app
COPY --from=build-env /app/DockerDemoApp/out ./
ENTRYPOINT ["dotnet", "DockerDemoApp.dll"]
