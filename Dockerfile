FROM alpine:3.10
RUN apk --no-cache add vsftpd

COPY start_vsftpd.sh /bin/start_vsftpd.sh
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 21000-21010
VOLUME /ftp/ftp

# Nuke xfs as it uses uid 33 which is www-data on Debian based systems
RUN deluser xfs 

ENTRYPOINT ["/bin/start_vsftpd.sh"]

