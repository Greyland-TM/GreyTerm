alias ls='exa --icons -a --group-directories-first'
alias tr='exa --tree --level=2'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ngrok-start="ngrok http --domain=darling-bird-tolerant.ngrok-free.app 8000"
alias pa-celery-1="celery -A paperless_controlcenter_backend worker -Q customer_worker_priority_1,customer_worker_priority_2,customer_worker_priority_3  --hostname=z@%h"
alias pa-celery-2="celery -A paperless_controlcenter_backend worker -Q webhook_worker --hostname=x@%h --time-limit=1"
alias pa-celery-3="celery -A paperless_controlcenter_backend worker -Q cron_worker --hostname=y@%h -B --time-limit=1"
alias pa-celery-4="celery -A paperless_controlcenter_backend worker -Q campaigns_worker --hostname=w@%h -B --time-limit=1"
alias pa-ssh-prod="ssh greyland@72.14.191.9 -p922 -i ~/.ssh/paperless"
alias pa-ssh-staging="ssh greyland@45.33.112.8 -p922 -i ~/.ssh/paperless"
alias pa-ssh-dev="ssh greyland@69.164.192.249 -p922 -i ~/.ssh/paperless"
alias pa-ssh-celery-prod="ssh greyland@45.33.9.241 -p922 -i ~/.ssh/paperless"
alias pa-ssh-celery-staging="ssh greyland@45.79.44.129 -p922 -i ~/.ssh/paperless"
alias pmr="python manage.py runserver"
alias pmmm="python manage.py makemigrations"
alias pmm="python manage.py migrate"
alias pms="python manage.py shell_plus"
alias rw-celery-1="celery -A roseware worker"
alias rw-celery-2="celery -A roseware worker -B"
alias pa-start="~/.scripts/paperless_start.sh"
alias cdpb='cd ~/Development/paperless/project/controlcenter-backend'
alias cdpf='cd ~/Development/paperless/project/controlcenter-frontend'
alias cdpp='cd ~/Development/paperless/project'
alias t='tmux attach'
alias ta='tmux attach'

