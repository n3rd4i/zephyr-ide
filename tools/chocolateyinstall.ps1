
$ErrorActionPreference = 'Stop';
# Update-SessionEnvironment
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"
. "$toolsDir\dependenciesEnv.ps1"

Start-ChocolateyProcessAsAdmin "/C mkdir `"$SOURCE_DIR`"" $ENV:COMSPEC
Start-ChocolateyProcessAsAdmin "/C mklink /J $LOCAL_APP_DIR `"$SOURCE_DIR`"" $ENV:COMSPEC

Start-ChocolateyProcessAsAdmin '/C pip3 install west' $ENV:COMSPEC

# Start-ChocolateyProcessAsAdmin does not change my working directory, unclear why
& $ENV:COMSPEC /C pushd $LOCAL_APP_DIR '&&' west init $ZEPHYR_INSTALL_DIR
& $ENV:COMSPEC /C pushd $ZEPHYRPROJECT '&&' west update
& $ENV:COMSPEC /C pushd $ZEPHYR_BASE '&&' pip3 install -r scripts/requirements.txt

Install-ChocolateyEnvironmentVariable "GNUARMEMB_TOOLCHAIN_PATH" "$GNUARMEMB_TOOLCHAIN_PATH"
Install-ChocolateyEnvironmentVariable "ZEPHYR_BASE" "$ZEPHYR_BASE"
Install-ChocolateyEnvironmentVariable "ZEPHYR_TOOLCHAIN_VARIANT" "gnuarmemb"
