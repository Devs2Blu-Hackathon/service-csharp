FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS builder
WORKDIR /source

COPY ServiceCsharp/ServiceCsharp.csproj ./ServiceCsharp/
RUN dotnet restore "./ServiceCsharp/ServiceCsharp.csproj"

COPY . .
WORKDIR /source/ServiceCsharp
RUN dotnet publish -c Release -o /app --no-restore /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=builder /app .
RUN chown -R appuser:appgroup /app
USER appuser

ENV ASPNETCORE_URLS=http://+:8080
EXPOSE 8080

ENTRYPOINT ["dotnet", "ServiceCsharp.dll"]