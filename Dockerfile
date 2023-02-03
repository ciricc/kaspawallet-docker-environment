FROM ubuntu:20.04
RUN apt update
RUN apt install wget unzip -y

RUN mkdir /kaspawallet
WORKDIR /kaspawallet

ENV RPC_SERVER=localhost
ENV KASPAD_URL=https://github.com/kaspanet/kaspad/releases/download/v0.12.11/kaspad-v0.12.11-linux.zip

RUN wget $KASPAD_URL
RUN unzip $(ls | grep kaspad)
RUN mv bin/* /usr/local/bin/

EXPOSE 8082

CMD ["sh", "-c", "kaspawallet start-daemon -l 0.0.0.0:8082 --rpcserver ${RPC_SERVER}"]