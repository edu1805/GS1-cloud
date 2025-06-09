# Etapa de build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copia a solution e o csproj
COPY GS1-dotnet/SOS_natureza.sln .
COPY GS1-dotnet/SOS_natureza.csproj ./

# Restaura dependências
RUN dotnet restore "./SOS_natureza.csproj"

# Copia o restante do código-fonte
COPY GS1-dotnet/ ./

# Publica o projeto
RUN dotnet publish -c Release -o /app/publish \
    /p:GenerateDocumentationFile=true \
    /p:DocumentationFile=/app/publish/SOS_natureza.xml

# Etapa de runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Cria um usuário não-root
RUN addgroup --system --gid 1000 appuser && \
    adduser --system --uid 1000 --ingroup appuser --disabled-password appuser

# Copia arquivos publicados do build
COPY --from=build --chown=appuser:appuser /app/publish .

# Define variáveis de ambiente
EXPOSE 5000
ENV ASPNETCORE_URLS=http://+:5000
ENV ASPNETCORE_ENVIRONMENT=Development
ENV DOTNET_RUNNING_IN_CONTAINER=true
ENV ASPNETCORE_FORWARDEDHEADERS_ENABLED=true

# Usa o usuário criado
USER appuser

# Comando de inicialização
CMD ["dotnet", "SOS_natureza.dll"]
