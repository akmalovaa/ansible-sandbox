# Ansible Sanbox

Ready-made container and simple templates for Ansible experiments

> Any operating system will do, the main thing is to install docker (podman)

## Running

Build and run sandbox container
```sh
docker-compose up -d --build
```

Exec for play (enter the container)
```sh
docker-compose exec ansible bash
```

### Prepare

1) check config - [ansible.cfg](ansible.cfg)
```sh
ansible-config view
```

2) update hosts file - [hosts.yaml](hosts.yaml)

Сhange your hosts

> You can use a **password** or **ssh_key** to connect.
To connect via ssh, copy your `id_rsa` to the `ansible/ssh` directory.

3) check connect to hosts
```sh
ansible all -m ping
# ansible all -m ping -i hosts.yaml
# ansible all -m shell -a "lsb_release -a"
```
4) debug playbook
```sh
ansible-playbook ansible/debug.yaml
# ansible-playbook ansible/debug.yaml --extra-vars "{ 'my_variable':'test' }"
```

### Playbooks

[playbooks/apt.yaml](https://github.com/akmalovaa/ansible-sandbox/blob/main/ansible/playbooks/apt.yaml) module apt examples update and install packages 
```sh
ansible-playbook ansible/playbooks/apt.yaml
```

[playbooks/loop.yaml](https://github.com/akmalovaa/ansible-sandbox/blob/main/ansible/playbooks/apt.yaml) An example of using loops
```sh
ansible-playbook ansible/playbooks/loop.yaml
```

### Roles

Examples of simple roles

### Finish

`Ctrl + D` (exit the container)

```sh
docker-compose down -v
```
