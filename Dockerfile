FROM rustlang/rust:nightly
ADD ./cdn-rust /cdn
ADD ./public /public
WORKDIR /cdn
RUN cargo build --release
RUN mv ./target/release/cdn_rust .
RUN rm -rf target
CMD ["./cdn_rust"]