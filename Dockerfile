FROM maven:3.8.6-openjdk-11-slim AS builder
RUN git clone https://github.com/openmrs/openmrs-core.git && cd openmrs-core && mvn clean package

FROM tomcat:9.0
LABEL project="openmrs" author="Sivarani"
COPY --from=builder /openmrs-core/webapp/target/openmrs.war /usr/lib/tomcat/webapps/openmrs.war
EXPOSE 8080