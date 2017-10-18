export TOKEN=$( head -c 30 /dev/urandom | xxd -p )
docker run --net=host -d -e CONFIGPROXY_AUTH_TOKEN=$TOKEN --name=proxy jupyter/configurable-http-proxy --default-target http://127.0.0.1:9999
# docker run --net=host -d -e CONFIGPROXY_AUTH_TOKEN=$TOKEN -v /var/run/docker.sock:/docker.sock jupyter/tmpnb python orchestrate.py --image='biosustain/cobra-notebook' --command="start-notebook.sh --notebook-dir='notebooks' --NotebookApp.base_url={base_path} --ip=0.0.0.0 --port {port} --NotebookApp.trust_xheaders=True"

docker run --net=host -d -e CONFIGPROXY_AUTH_TOKEN=$TOKEN \
           -v /var/run/docker.sock:/docker.sock \
           jupyter/tmpnb python orchestrate.py --image='biosustain/cobra-notebook' --command="jupyter notebook --NotebookApp.base_url={base_path} --ip=0.0.0.0 --port {port}  --NotebookApp.trust_xheaders=True --NotebookApp.token="" --NotebookApp.disable_check_xsrf=True"

