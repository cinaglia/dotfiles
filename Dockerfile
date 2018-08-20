FROM ubuntu:18.04

COPY . /root/dotfiles

RUN /bin/bash /root/dotfiles/00-start.sh

CMD ["bash"]
