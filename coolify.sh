#!/bin/bash
echo "Installing coolify the manual way"
mkdir -p /data/coolify/{source,ssh,applications,databases,backups,services,proxy,webhooks-during-maintenance}
mkdir -p /data/coolify/ssh/{keys,mux}
mkdir -p /data/coolify/proxy/dynami

ssh-keygen -f /data/coolify/ssh/keys/id.root@host.docker.internal -t ed25519 -N '' -C root@coolify
