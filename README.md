# ssh-wat

`man ssh_config` says about out `StrictHostKeyChecking=no`:

> The host keys of known hosts will be verified automatically in all cases.

Turns out 'verified' means when there is a mismatch, it just prints a warning **but proceeds anyway**!

```console
$ docker build -t ssh-wat . && docker run ssh-wat
```
