# Overview

The file and template modules fail to overwrite hard-linked files.

See https://github.com/ansible/ansible/issues/10834.

This repo demonstrates the file module issue. Gists are provided for the template issue.

# Running

```
# have a working ruby
gem install bundler
bundle install
./run_test.sh
```

# Details

## 'template' bug

relevant ansible code: https://github.com/ansible/ansible/blob/devel/lib/ansible/modules/files/file.py#L249

full `ansible -vvv` output from a non-test-kitchen system (including playbook snippet) is at: 
https://gist.github.com/aerickson/6cf9b52e3c70fa3c90f89206f1567699.

### summary

```
fatal: [10.1.0.115]: FAILED! => {"changed": false, "failed": true, "msg": "src and dest are required for creating links"}
```

## 'file' bug

relevant ansible code: https://github.com/ansible/ansible/blob/devel/lib/ansible/modules/files/file.py#L380

full `ansible -vvv` output from this test kitchen image is at https://gist.github.com/aerickson/ffd8bc846d90d32b05de7c6c05f05a96.

full `ansible -vvv` output from a non-test-kitchen system (including playbook snippet) is at: 
https://gist.github.com/aerickson/7318cf031b387ac4dca0f2ca3e1e48d6.

### summary

```
fatal: [localhost]: FAILED! => {"changed": false, "checksum": "bf00f4e07eb95378ff17a8e57378ddd0fee802df", "failed": true, "msg": "absolute paths are required"}
```


