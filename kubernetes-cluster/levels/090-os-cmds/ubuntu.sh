
#!/bin/bash

required_cmd=(tar envsubst jq yq)
sudo add-apt-repository ppa:rmescandon/yq
sudo apt update
sudo apt install "${required_cmd}"