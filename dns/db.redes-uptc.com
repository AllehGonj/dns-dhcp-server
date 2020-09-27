$TTL    604800
@       IN      SOA     ns1.redes-uptc.com. root.redes-uptc.com. (
                  3       ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800 )   ; Negative Cache TTL
;
; name servers - NS records
     IN      NS      ns1.redes-uptc.com.

; name servers - A records
ns1.redes-uptc.com.          IN      A      172.20.0.2

host1.redes-uptc.com.        IN      A      172.20.0.3
host2.redes-uptc.com.        IN      A      172.20.0.4
