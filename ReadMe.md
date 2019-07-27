# ZephyrProeject IDE Setup guide

## Dependencies
1. [System](https://docs.zephyrproject.org/latest/getting_started/installation_win.html#windows-install-native)
	* `choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System'`
	* `choco install git.install --params "/NoAutoCrlf"`
	* `choco install python ninja dtc-msys2 gperf`
1. [Pip](https://docs.zephyrproject.org/latest/getting_started/index.html#bootstrap-west)
	* `pip3 install west`
1. Create [user accesible folder](https://superuser.com/a/1396402) in %systemdrive%
	* `mkdir %USERPROFILE%\localapp`
	* `mklink /J localapp %USERPROFILE%\localapp`
	* `cd %systemdrive%\localapp`
1. Clone the Zephyr Repositories (in %systemdrive%\localapp)
	* `west init zephyrproject`
	* `cd zephyrproject`
	* `west update`
1. Set Up a Toolchain (GNUARMEMB_TOOLCHAIN_PATH, ZEPHYR_BASE, ZEPHYR_TOOLCHAIN_VARIANT)
	* `setx GNUARMEMB_TOOLCHAIN_PATH C:\ProgramData\chocolatey\lib\gcc-arm-embedded\tools`
	* `setx ZEPHYR_BASE %systemdrive%\localapp\zephyrproject\zephyr`
	* `setx ZEPHYR_TOOLCHAIN_VARIANT gnuarmemb`
1. [Install Python Dependencies](https://docs.zephyrproject.org/latest/getting_started/index.html#install-python-dependencies)
	* `pip3 install -r %ZEPHYR_BASE%/scripts/requirements.txt`
1. Install [VSCode](http://aka.ms/vscode)
	* `choco install vscode`
	* `choco install vscode-cpptools`
	* `choco install vscode-cortex-debug`
	* `choco install vscode-astyle`
