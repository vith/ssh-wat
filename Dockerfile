FROM ubuntu
RUN apt update && apt install -y openssh-server openssh-client

ADD ssh-test.bash .

CMD ./ssh-test.bash
