FROM mcr.microsoft.com/dotnet/sdk:5.0 as builder
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:5.0 as build
WORKDIR /src
COPY ["ConversaoPeso.Web.csproj", "backend/"]
RUN dotnet restore "./backend/ConversaoPeso.Web.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "ConversaoPeso.Web.csproj" -c Release -o /app/build

FROM build as publish
RUN dotnet publish "ConversaoPeso.Web.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/sdk:5.0
WORKDIR /app
COPY --from=publish /app/publish .
EXPOSE 5000
ENTRYPOINT ["dotnet","ConversaoPeso.Web.dll"]