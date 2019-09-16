# $ErrorActionPreference = 'Stop';
Update-SessionEnvironment
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$(Join-Path $toolsDir commonEnv.ps1)"

# Installed in 'User Space' using juntion
Start-ChocolateyProcessAsAdmin "/C if not exist `"$SOURCE_DIR`" mkdir `"$SOURCE_DIR`"" $ENV:COMSPEC
Start-ChocolateyProcessAsAdmin "/C if not exist $LOCAL_APP_DIR mklink /J $LOCAL_APP_DIR `"$SOURCE_DIR`"" $ENV:COMSPEC

# https://docs.zephyrproject.org/latest/getting_started/index.html#bootstrap-west
Start-ChocolateyProcessAsAdmin '/C pip3 install -U west' $ENV:COMSPEC

# https://docs.zephyrproject.org/latest/getting_started/index.html#clone-the-zephyr-repositories
& $ENV:COMSPEC /C pushd $LOCAL_APP_DIR '&&' west init $ZEPHYR_INSTALL_DIR
& $ENV:COMSPEC /C pushd $ZEPHYRPROJECT '&&' west update
Install-ChocolateyEnvironmentVariable "ZEPHYR_BASE" "$ZEPHYR_BASE"

# https://docs.zephyrproject.org/latest/getting_started/index.html#install-python-dependencies
& $ENV:COMSPEC /C pushd $ZEPHYRPROJECT '&&' pip3 install -r zephyr/scripts/requirements.txt

## This line is here because could not use installargs to the choco dependency
## choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System'
Install-ChocolateyPath 'C:\Program Files\CMake\bin' -PathType 'Machine'
