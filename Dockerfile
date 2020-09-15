FROM rustlang/rust:nightly
ADD . /cdn
WORKDIR /cdn
RUN cargo build --release
RUN mv ./target/release/cdn_rust .
RUN rm -rf target
CMD ["./cdn_rust"]