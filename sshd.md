# SSH TACTICS

/etc/ssh/sshd_config

## NO ROOT
```
PermitRootLogin no
``` 
disable root login via ssh

## PORT
```
Port 2259 
```
change sshd port


## SPECIFIC USERS
```
AllowUsers www@192.168.0.241 qqq
```  
only allow this account login via this ip-addr 

## SPECIFIC ETH0
```
ListenAddress 192.168.0.247 
```
enable sshd-service on this local-addr

## ONLY ALLOW RSA KEY AUTH 

```
RSAAuthentication yes
PubkeyAuthentication yes
PasswordAuthentication no
```

## HANDLE RSA KEY
```
mkdir ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -t rsa
```

then these two files appeared: id_rsa id_rsa.pub

```
mv id_rsa.pub authorized_keys
chmod 400 authorized_keys
chmod 400 id_rsa
```

authorized_keys is placed on the LoginUser@server:/home/LoginUser/.ssh/authorized_keys  

id_rsa is placed on the clienthost://home/CurrentUser/.ssh/id_rsa 

authorized_keys can save multiple rsa-pub-key(using >>): 
```
cat mykey.pub >> $HOME/.ssh/authorized_keys
```

## CHECK SSH LOG
```
grep sshd.\*Failed /var/log/auth.log | less
tail /var/log/auth.log -n 500 | grep sshd.\*Failed
```

## TRY DEAD-END
```
LoginGraceTime 30 
```
The option LoginGraceTime specifies how long in seconds after a connection request the server will wait before disconnecting 
if the user has not successfully logged in.

## USER SPECIFICATION AUTHENCATIOIN
```
Match User qqq 
    RSAAuthentication yes 
    PubkeyAuthentication yes 
    PasswordAuthentication no 
Match User www 
    PasswordAuthentication yes 
```





