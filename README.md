# Overview

The copy module fails to overwrite a hard-linked file.

See https://github.com/ansible/ansible/issues/10834.

# Running

```
bundle install
./run_test.sh
```

# Relevant Ansible Code

for 'file' calls involving hard links: https://github.com/ansible/ansible/blob/devel/lib/ansible/modules/files/file.py#L380
for 'template' calls involving hard links: https://github.com/ansible/ansible/blob/devel/lib/ansible/modules/files/file.py#L249

# Details

## 'template' bug

full `ansible -vvv` output from a non-test-kitchen system (including playbook snippet) is at: 
https://gist.github.com/aerickson/6cf9b52e3c70fa3c90f89206f1567699.

### summary

```
fatal: [10.1.0.115]: FAILED! => {"changed": false, "checksum": "dceaaa286a40cf63011b0987438599f565c52e34", "failed": true, "msg": "absolute paths are required"}
```

## 'file' bug

full `ansible -vvv` output from this test kitchen image is at https://gist.github.com/aerickson/ffd8bc846d90d32b05de7c6c05f05a96.

full `ansible -vvv` output from a non-test-kitchen system (including playbook snippet) is at: 
https://gist.github.com/aerickson/7318cf031b387ac4dca0f2ca3e1e48d6.

### summary

```
       fatal: [localhost]: FAILED! => {"changed": false, "checksum": "bf00f4e07eb95378ff17a8e57378ddd0fee802df", "failed": true, "msg": "absolute paths are required"}
```


