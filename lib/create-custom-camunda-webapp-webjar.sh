#!/usr/bin/env bash
# https://datakurre.pandala.org/2021/01/camunda-cockpit-history-plugin/
# https://github.com/datakurre/camunda-cockpit-plugins/

CAMUNDA_VERSION=7.20.0
#HISTORY_PLUGIN_BASE_URL=https://raw.githubusercontent.com/datakurre/camunda-cockpit-plugins/608f7f1d2c240c810dac466890decb91f4da5688 # version which shows history for all definition versions
HISTORY_PLUGIN_BASE_URL=https://raw.githubusercontent.com/datakurre/camunda-cockpit-plugins/master

LIB_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Download camunda-webapp-webjar"
curl -L https://repo1.maven.org/maven2/org/camunda/bpm/webapp/camunda-webapp-webjar/$CAMUNDA_VERSION/camunda-webapp-webjar-$CAMUNDA_VERSION.jar -o $LIB_DIR/custom-camunda-webapp-webjar-$CAMUNDA_VERSION.jar

echo "Download Camunda Cockpit History plugin"
mkdir -p $LIB_DIR/META-INF/resources/webjars/camunda/app/cockpit/scripts/
curl -L $HISTORY_PLUGIN_BASE_URL/config.js -o $LIB_DIR/META-INF/resources/webjars/camunda/app/cockpit/scripts/config.js
curl -L $HISTORY_PLUGIN_BASE_URL/definition-historic-activities.js -o $LIB_DIR/META-INF/resources/webjars/camunda/app/cockpit/scripts/definition-historic-activities.js
curl -L $HISTORY_PLUGIN_BASE_URL/instance-historic-activities.js -o $LIB_DIR/META-INF/resources/webjars/camunda/app/cockpit/scripts/instance-historic-activities.js
curl -L $HISTORY_PLUGIN_BASE_URL/instance-route-history.js -o $LIB_DIR/META-INF/resources/webjars/camunda/app/cockpit/scripts/instance-route-history.js
curl -L $HISTORY_PLUGIN_BASE_URL/instance-tab-modify.js -o $LIB_DIR/META-INF/resources/webjars/camunda/app/cockpit/scripts/instance-tab-modify.js
curl -L $HISTORY_PLUGIN_BASE_URL/robot-module.js -o $LIB_DIR/META-INF/resources/webjars/camunda/app/cockpit/scripts/robot-module.js
curl -L $HISTORY_PLUGIN_BASE_URL/rollup.config.js -o $LIB_DIR/META-INF/resources/webjars/camunda/app/cockpit/scripts/rollup.config.js
curl -L $HISTORY_PLUGIN_BASE_URL/tasklist-audit-log.js -o $LIB_DIR/META-INF/resources/webjars/camunda/app/cockpit/scripts/tasklist-audit-log.js
curl -L $HISTORY_PLUGIN_BASE_URL/tasklist-config.js -o $LIB_DIR/META-INF/resources/webjars/camunda/app/cockpit/scripts/tasklist-config.js

echo "Customize camunda-webapp-webjar"
jar uf $LIB_DIR/custom-camunda-webapp-webjar-$CAMUNDA_VERSION.jar -C $LIB_DIR META-INF

echo "Cleanup"
rm -rf $LIB_DIR/META-INF
