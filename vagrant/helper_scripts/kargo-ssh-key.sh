#!/bin/sh -eux
if [ ! -d "/root/.ssh" ]; then
  mkdir /root/.ssh/
  chmod 700 /root/.ssh
fi
cat <<EOF > /root/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClLOG+yaylWNFNt3uLrrkE5IxwSSrI2I3bz46zg5o9/7E3ekQ8QB2v857yErtqPvAkx63S0WnrUftWReexU79YVbRm1tgBo7Lo2lRJPt7F45S6VIBUeEWeFIpfQDZeHS25IagE1jq/qwATXvNxs9RzI7yxCZlSMIO1YKQsNncgSY3y8vsIwzvMCRNvvJG9mxZKP3im4de9UGydZsBgk6YgBVA8HBnKC6h6vKRgjh/dtygeQDc1TkM0fDQ9bLUur6yZW8qwhwyzC099M/u21TdLJz2j/GwxOHSwCwExgWprF+mx4/BRzBjHO59eQAUD42H9pg8T13ewInc9+TD94MDh skamithi@skamithi-personal
EOF
chmod 400 /root/.ssh/authorized_keys
