# cobra-docker
A docker image based on Jupyter/demo that features COBRA tools

Notes:

- In order to start a tmpnb server with this image run `run_cobranb.sh`.
- Set the following iptables rule to redirect traffic from 80 to 8000: `iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to 8000`

