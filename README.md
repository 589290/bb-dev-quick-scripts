# BigBang Dev Quick Scripts

These scripts take a small chunk out of the work of spinning up a cluster and both deploying and tearing-down BigBang since you can just use tab completion to launch the scripts in order: ./0tab⏎ ./1tab⏎ ./2tab⏎ ./3tab⏎. This becomes useful when doing these things frequently.  

Assuming ~/bigbang is where you have cloned [that repo](https://repo1.dso.mil/platform-one/big-bang/bigbang) and you also have an ~/overrides folder for values YAML files, place these scripts in ~ and change the registry1 credentials (user/pass) in `1-registry1+flux.sh` and `overrides/ib_creds.yaml` to your own. Lastly, update the lines like `export KUBECONFIG=~/.kube/username-dev-config` to point directly towards the kube config the k3d script creates in your `~/.kube` folder.  
  
## [./0-k3d.sh](0-k3d.sh)  
Runs the VM passing parameters like `-m` or `-d` to the script.  
  
## [./1-registry1+flux.sh](1-registry1+flux.sh)  
Applies the kube config context from k3d, logins into registry1 (docker), deploys flux, and shows the flux ns pod statuses  
  
## [./2-bb.sh](2-bb.sh)  
Deploys BB ~ you will definitely be changing the yaml file parameters here  
  
## [./3-teardown-bb.sh](3-teardown-bb.sh)  
Tears down the BB deployment and readies the cluster for the next task  
  
## [overrides/ib_creds.yaml](overrides/ib_creds.yaml)  
Retains your IB credentials for deploying BB  
  
#  
Happy sailing! ⛵