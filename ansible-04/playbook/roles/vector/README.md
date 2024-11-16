Role Name
=========

Install vector

Role Variables
--------------

vector_version:  "0.42.0-1"
vector_config_dir: "/etc/vector"

Example Playbook
----------------

- name: Install Vector
  hosts: vector
  remote_user: admin
  roles:
    - vector

License
-------
MIT

Author Information
------------------

Valerii Bazanov
