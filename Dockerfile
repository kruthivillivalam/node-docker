FROM node:8.2.1

COPY startup /opt/startup

RUN apt update \
	&& echo "After update" \
	&& cd /opt/startup \
	&& npm install \
	&& chmod 755 /opt/startup/init_container.sh

EXPOSE 2222 8080

ENV PORT 8080
RUN echo "Before init_container"

ENTRYPOINT ["/opt/startup/init_container.sh"]