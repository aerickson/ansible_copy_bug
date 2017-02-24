# Overview

The copy module fails to overwrite a hard-linked file.

See https://github.com/ansible/ansible/issues/10834.

# Running

```
bundle install
./run_test.sh
```

# Details

full `ansible -vvv` output at https://gist.github.com/aerickson/ffd8bc846d90d32b05de7c6c05f05a96

summary:

```
       PLAY [all] *********************************************************************
       
       TASK [Gathering Facts] *********************************************************
       ok: [localhost]
       META: ran handlers
       
       TASK [test_role : copy file] ***************************************************
       task path: /tmp/kitchen/roles/test_role/tasks/main.yml:4
       changed: [localhost] => {"changed": true, "checksum": "bf00f4e07eb95378ff17a8e57378ddd0fee802df", "dest": "/etc/test_file_noprob", "gid": 0, "group": "root", "md5sum": "520f4377cb856716c50a96615a312459", "mode": "0644", "owner": "root", "size": 20, "src": "/home/kitchen/.ansible/tmp/ansible-tmp-1486713651.35-152308596723080/source", "state": "file", "uid": 0}
       
       TASK [test_role : copy file] ***************************************************
       task path: /tmp/kitchen/roles/test_role/tasks/main.yml:7
       changed: [localhost] => {"changed": true, "checksum": "bf00f4e07eb95378ff17a8e57378ddd0fee802df", "dest": "/etc/test_file", "gid": 0, "group": "root", "md5sum": "520f4377cb856716c50a96615a312459", "mode": "0644", "owner": "root", "size": 20, "src": "/home/kitchen/.ansible/tmp/ansible-tmp-1486713651.67-50026778395887/source", "state": "file", "uid": 0}
       
       TASK [test_role : make hard link] **********************************************
       task path: /tmp/kitchen/roles/test_role/tasks/main.yml:11
       changed: [localhost] => {"changed": true, "dest": "/etc/test_file_hardlink", "gid": 0, "group": "root", "mode": "0644", "owner": "root", "size": 20, "src": "/etc/test_file", "state": "hard", "uid": 0}
       
       TASK [test_role : copy file 2] *************************************************
       task path: /tmp/kitchen/roles/test_role/tasks/main.yml:17
       fatal: [localhost]: FAILED! => {"changed": false, "checksum": "bf00f4e07eb95378ff17a8e57378ddd0fee802df", "failed": true, "msg": "absolute paths are required"}
       	to retry, use: --limit @/tmp/kitchen/default.retry
       
       PLAY RECAP *********************************************************************
       localhost                  : ok=4    changed=3    unreachable=0    failed=1   
```


