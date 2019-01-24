FROM scratch

VOLUME /srv
EXPOSE 10000

COPY .docker.json /.filebrowser.json
COPY filebrowser /filebrowser

ENTRYPOINT [ "/filebrowser" ]
