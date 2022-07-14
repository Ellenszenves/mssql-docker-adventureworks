FROM mcr.microsoft.com/mssql/server:2022-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=Password123!
ENV MSSQL_PID=Developer
ENV MSSQL_TCP_PORT=1433
COPY AdventureWorks2019.bak /var/opt/mssql/
COPY SqlCmdScript.sql .
RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" && /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P 'Password123!' -d master -i SqlCmdScript.sql
