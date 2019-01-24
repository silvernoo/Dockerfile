FROM scratch

EXPOSE 9081
EXPOSE 9080
EXPOSE 7892

COPY Country.mmdb /config/Country.mmdb
COPY clash /clash

ENTRYPOINT [ "/clash" , "-d" , "/config" ]
