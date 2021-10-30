FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY . .
COPY ["ConversaoPeso.Web.csproj", "backend/"]
RUN dotnet restore "./backend/ConversaoPeso.Web.csproj"

COPY ConversaoPeso.Web/. ./ConversaoPeso.Web/
WORKDIR /src/ConversaoPeso.Web 
RUN dotnet publish -c release -o /app/publish --no-restore

FROM mcr.microsoft.com/dotnet/aspnet
WORKDIR /app
COPY --from=publish /app/publish ./
EXPOSE 8080
ENTRYPOINT ["dotnet","ConversaoPeso.Web.dll"]