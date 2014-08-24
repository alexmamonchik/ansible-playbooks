ansible-playbooks
=================

My playbooks
1.Ruby-simple
- nginx
- git
- rbenv (used zzet.rbenv role from ansible-galaxy)
- ruby-build
- ruby v 2.1.1
- postgres

## Command

```
$ ansible-galaxy install zzet.rbenv
$ ansible-playbook site.yml -i hosts --ask-sudo-pass
```
