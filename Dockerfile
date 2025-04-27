FROM ubuntu:24.04

ARG FILE=test.robot
ENV FILE=${FILE}

RUN apt update -y && apt upgrade -y

RUN apt install python3  python3-pip -y

RUN apt install nodejs npm -y
RUN apt install libicu74 -y

RUN mkdir /workspace

RUN pip install robotframework --break-system-packages
RUN pip install robotframework-browser --break-system-packages
RUN rfbrowser init
RUN npx playwright install-deps

WORKDIR /workspace

CMD [ "sh", "-c", "robot $FILE" ]
