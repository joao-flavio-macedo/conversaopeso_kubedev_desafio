FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source
COPY .sln .
COPY ConversaoPeso.Web/.csproj ./ConversaoPeso.Web/
RUN dotnet restore

COPY ConversaoPeso.Web/. ./ConversaoPeso.Web/
WORKDIR /source/ConversaoPeso.Web
RUN dotnet publish -c release -o /cod --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /cod
COPY --from=build /cod ./
EXPOSE 5000
ENTRYPOINT ["dotnet", "ConversaoPeso.Web.dll"]