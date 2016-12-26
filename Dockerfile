FROM node:0.10

RUN apt-get update && apt-get -qqy install nano

WORKDIR /opt/iobroker

RUN npm cache clean && npm install iobroker
ADD scripts/run.sh /opt/iobroker/run.sh
RUN echo $(hostname) >.install_host

EXPOSE 9876

CMD /opt/iobroker/run.sh
CMD /opt/iobroker add admin --enabled --port 9876
