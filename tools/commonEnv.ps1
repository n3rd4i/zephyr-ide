# Generic environment variables
$GATE_DIR = 'localapp'
$SOURCE_DIR = "$(Join-Path $ENV:userprofile $GATE_DIR)"
$LOCAL_APP_DIR = "$(Join-Path $ENV:systemdrive $GATE_DIR)"

$ZEPHYR_INSTALL_DIR = 'zephyrproject'
$ZEPHYRPROJECT = "$(Join-Path $LOCAL_APP_DIR $ZEPHYR_INSTALL_DIR)"
$ZEPHYR_BASE = "$(Join-Path $ZEPHYRPROJECT zephyr)"
