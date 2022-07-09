#!/usr/bin/env bash

# winhost=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }') && echo Windows Host IP from WSL: $winhost #adapted for wsl 2
# winhost=$(hostname).localdomain && echo Windows Host IP from WSL: $winhost #adapted for wsl 2
apt-get update && apt-get install jq -y # install jq for manipulating json from cli

# SOURCE VARIABLES
export token=xxxxxxx
export grafanaurl=http://localhost:8088/api


rm -rf backups
mkdir -p backups
cd backups
echo Starting...


datasources=$(curl -s -H "Authorization: Bearer $token" -X GET $grafanaurl/datasources)
for uid in $(echo $datasources | jq -r '.[] | .uid'); do
  uid="${uid/$'\r'/}" # remove the trailing '/r'
  curl -s -H "Authorization: Bearer $token" -X GET "$grafanaurl/datasources/uid/$uid" | jq > grafana-datasource-$uid.json
  slug=$(cat grafana-datasource-$uid.json | jq -r '.name')
  mv grafana-datasource-$uid.json grafana-datasource-$uid-$slug.json # rename with datasource name and id
  echo "Datasource $uid exported"
done


dashboards=$(curl -s -H "Authorization: Bearer $token" -X GET $grafanaurl/search?folderIds=0&query=)
for uid in $(echo $dashboards | jq -r '.[] | .uid'); do
  uid="${uid/$'\r'/}" # remove the trailing '/r'
  curl -s -H "Authorization: Bearer $token" -X GET "$grafanaurl/dashboards/uid/$uid" | jq > grafana-dashboard-$uid.json
  slug=$(cat grafana-dashboard-$uid.json | jq -r '.meta.slug')
  mv grafana-dashboard-$uid.json grafana-dashboard-$uid-$slug.json # rename with dashboard name and id
  echo "Dashboard $uid exported"
done



# https://www.ifconfig.it/hugo/2021/12/backup-grafana-dashboards-with-api-and-jq/
# https://gist.github.com/crisidev/bd52bdcc7f029be2f295