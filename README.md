# everyandrey_infra
SOME TEXT HERE

task5

## Jump through bastion
ssh -i ~/.ssh/id_rsa -J andrey@35.205.49.149 10.132.0.3


## Jump through
```
### The Bastion Host
Host bastion
  HostName 35.205.49.149

### The Remote Host
Host internalhost
  HostName 10.132.0.3
  ProxyJump bastion

ssh internalhost
```
