#Rancher Linode Image 

This packer will build an patched and updated Linode image to use with Rancher. You will need to set the value for the linode_api_token_secret variable.


```
git clone git@github.com:Sudo-Whodo/Packer-Linode-RancherNode-Ubuntu22.04.git
cd Packer-Linode-Ubuntu22.04
export PKR_VAR_linode_api_token_secret=LINODE_API_KEY
packer init .
packer build .
```
