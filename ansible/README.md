# Ansible

1. `cd ansible`
1. `ansible-playbook -i hosts main.yaml`
1. digite a passphrase

## Comandos

- `ansible-galaxy role init exemplo`: pra gerar arquivos
- `ansible -i hosts all -m ping`
- `ansible -i hosts all -m shell -a "uptime"`
- `ansible -i hosts all -m apt -a "name=mysql-server update_cache=yes state=present"`: atualizar o cache do apt-get, instalar o mysql-server

## Como acessar uma maquina remota?

Use os ips mostrados no output do terraform

ips:
  134.122.21.160
  157.245.245.221
  157.245.243.118

loadbalancer ip:
   138.197.228.92

1. `ssh-copy-id root@157.245.243.118`, caso a máquina remota não tenha a sua chave
1. `ssh root@157.245.243.118`
