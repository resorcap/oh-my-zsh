# Autocompletion for kubectl, the command line interface for Kubernetes
#
# Author: https://github.com/pstadler

if [ $commands[kubectl] ]; then
  source <(kubectl completion zsh)
fi

# This command is used ALOT both below and in daily life
alias k=kubectl

# Apply a YML file
alias kaf='k apply -f'

# Drop into an interactive terminal on a container
function keti() {
  pod=$1
  command=$2
  kubectl exec -ti $pod -- $command
}

# Manage configuration quickly to switch contexts between local, dev ad staging.
alias kcuc='k config use-context'
alias kcsc='k config set-context'
alias kcdc='k config delete-context'
alias kccc='k config current-context'

# Trainingjob man.
alias kgt='k get trainingjob'
alias kdelt='k delete trainingjob'
alias kdelta="kgt | grep -v NAME | awk '{print \$1}' | xargs kubectl delete trainingjob"

# Pod management.
alias kgp='k get pods'
alias kep='k edit pods'
alias kdp='k describe pods'
alias kdelp='k delete pods'
alias kdelpa="kgp | grep -v NAME | awk '{print \$1}' | xargs kubectl delete pods"

# Job management.
alias kgj='k get job'
alias kdj='k describe job'
alias kdelj='k delete job'
alias kdelja="kgj | grep -v NAME | awk '{print \$1}' | xargs kubectl delete job"


# Service management.
alias kgs='k get svc'
alias kes='k edit svc'
alias kds='k describe svc'
alias kdels='k delete svc'

# Secret management
alias kgsec='k get secret'
alias kdsec='k describe secret'
alias kdelsec='k delete secret'

# Deployment management.
alias kgd='k get deployment'
alias ked='k edit deployment'
alias kdd='k describe deployment'
alias kdeld='k delete deployment'
alias ksd='k scale deployment'
alias krsd='k rollout status deployment'

# Rollout management.
alias kgrs='k get rs'
alias krh='k rollout history'
alias kru='k rollout undo'

# Logs
alias kl='k logs'
alias klf='k logs -f'

zsh_kubectl_plugin_path="$(dirname "$0")"
function ksync() {
  src=$1
  dest=$2
  rsync -ravhPC -e "${zsh_kubectl_plugin_path}/rsync-helper.sh" ${src} ${dest}
}

