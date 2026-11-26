FROM mikefarah/yq:4.49.2 AS yq
FROM ghcr.io/mapleprivacylabs/maple-proxy:0.5.1@sha256:2fdff64378e418c4baf4542a5f1f933175f6592107736077eadadcda57b25c3c

USER root
RUN apt-get update && apt-get install -y --no-install-recommends nginx-light tini && rm -rf /var/lib/apt/lists/*
COPY --from=yq /usr/bin/yq /usr/local/bin/yq
COPY assets/ui/nginx.conf /etc/nginx/sites-available/default
COPY assets/ui/index.html /usr/share/nginx/html/index.html
COPY legacy/start.sh /usr/local/bin/start-maple
