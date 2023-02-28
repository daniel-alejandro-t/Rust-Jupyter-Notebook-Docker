FROM archlinux
RUN pacman -Syu --noconfirm
RUN pacman -S jupyter-notebook --noconfirm
RUN pacman -S rust rustup cargo --noconfirm
RUN rustup default stable
RUN cargo install evcxr_jupyter
RUN export PATH=/root/.cargo/bin:$PATH
RUN ~/.cargo/bin/evcxr_jupyter --install
RUN rustup component add rust-src
#RUN cargo new datascience && cd datascience
#RUN cargo add ndarray ndarray-rand ndarray-stats noisy_float poloto
EXPOSE 8888
ENTRYPOINT jupyter notebook --allow-root --no-browser --ip=0.0.0.0
