
```
       PLAYBOOK: default.yml **********************************************************
       1 plays in /tmp/kitchen/default.yml
       
       PLAY [all] *********************************************************************
       
       TASK [Gathering Facts] *********************************************************
       ok: [localhost]
       META: ran handlers
       
       TASK [test_role : copy file] ***************************************************
       task path: /tmp/kitchen/roles/test_role/tasks/main.yml:4
       changed: [localhost] => {"changed": true, "checksum": "bf00f4e07eb95378ff17a8e57378ddd0fee802df", "dest": "/etc/test_file", "gid": 0, "group": "root", "md5sum": "520f4377cb856716c50a96615a312459", "mode": "0644", "owner": "root", "size": 20, "src": "/home/kitchen/.ansible/tmp/ansible-tmp-1486711311.11-195344916131639/source", "state": "file", "uid": 0}
       
       TASK [test_role : make hard link] **********************************************
       task path: /tmp/kitchen/roles/test_role/tasks/main.yml:10
       changed: [localhost] => {"changed": true, "dest": "/etc/test_file_hardlink", "gid": 0, "group": "root", "mode": "0644", "owner": "root", "size": 20, "src": "/etc/test_file", "state": "hard", "uid": 0}
       
       TASK [test_role : copy file 2] *************************************************
       task path: /tmp/kitchen/roles/test_role/tasks/main.yml:16
       fatal: [localhost]: FAILED! => {"changed": false, "checksum": "bf00f4e07eb95378ff17a8e57378ddd0fee802df", "failed": true, "msg": "absolute paths are required - test_file"}
       	to retry, use: --limit @/tmp/kitchen/default.retry
       
       PLAY RECAP *********************************************************************
       localhost                  : ok=3    changed=2    unreachable=0    failed=1   
```