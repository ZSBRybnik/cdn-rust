FROM rustlang/rust:nightly AS build
ADD . /cdn
WORKDIR /cdn
RUN cargo build --release
FROM debian:buster-slim
COPY --from=build /cdn/target/release/cdn_rust /home/cdn_rust
COPY --from=build /cdn/Rocket.toml /home/Rocket.toml
WORKDIR /home
EXPOSE 5002
CMD ["/home/cdn_rust"]