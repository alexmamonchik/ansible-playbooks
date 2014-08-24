ansible-playbooks
=================

My playbooks
1.Ruby-simple
- nginx
- git
- rbenv (used zzet.rbenv role from ansible-galaxy)
- ruby v 2.0.0-p481
- postgres (used pjan.vandaele.postgresql role from ansible-galaxy)

## Command

```
$ ansible-galaxy install zzet.rbenv
$ ansible-galaxy install pjan.vandaele.postgresql
$ ansible-playbook site.yml -i hosts --ask-sudo-pass
```
