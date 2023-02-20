cat >/etc/caddy/Caddyfile <<-EOF
$domain:443
{
    tls bhoikfostyahya@gmail.com
    encode gzip



    handle_path /vless {
        reverse_proxy localhost:/run/xray/vless_ws.sock

    }
    import vmess
    handle_path /vmess {
        reverse_proxy localhost:/run/xray/vmess_ws.sock
    }

    handle_path /trojan-ws {
        reverse_proxy localhost:/run/xray/trojan_ws.sock
    }


    handle_path /ss-ws {
        reverse_proxy localhost:30300
    }

    handle {
        reverse_proxy https://$domain {
            trusted_proxies 0.0.0.0/0
            header_up Host {upstream_hostport}
        }
    }
}
EOF


cat >/etc/caddy/vmess <<-EOF

@ws_path {
path /worryfree
path /xray
path /vmess
path /*

}


handle @ws_path {
    uri path_regexp /.* /
    reverse_proxy localhost:/run/xray/vmess_ws.sock
}

EOF
