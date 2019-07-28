# ZephyrProject IDE Setup guide

## Dependencies
1. [System](https://docs.zephyrproject.org/latest/getting_started/installation_win.html#windows-install-native)
	* `choco install cmake --installargs 'ADD_CMAKE_TO_PATH=System'`
	* `choco install git.install --params "/NoAutoCrlf"`
	* `choco install python ninja dtc-msys2 gperf`
	* `choco install nrfjprog --version 10.2.1`
		* `nrfjprog`
			* [flashing](https://docs.zephyrproject.org/latest/guides/tools/nordic_segger.html?highlight=nrfjprog#flashing)
		* `jlink`
			* [using-segger-j-link](https://docs.zephyrproject.org/latest/guides/debugging/probes.html#using-segger-j-link)
	* `choco install openocd --version 0.10.0.20190715`
		* `openocd`
			* [setting-up-openocd-for-programming-the-nordic-nrf52832-chip](https://primalcortex.wordpress.com/2017/06/10/setting-up-openocd-for-programming-the-nordic-nrf52832-chip/)
			* [programming-nrf52-with-openocd](https://devzone.nordicsemi.com/f/nordic-q-a/29029/programming-nrf52-with-openocd)
1. Set Up a Toolchain (GNUARMEMB_TOOLCHAIN_PATH, ZEPHYR_TOOLCHAIN_VARIANT)
	* `choco install zephyr-gnuarmemb --version 7.2.1.20170904`
		* `setx GNUARMEMB_TOOLCHAIN_PATH C:\ProgramData\chocolatey\lib\gcc-arm-embedded\tools`
		* `setx ZEPHYR_TOOLCHAIN_VARIANT gnuarmemb`
1. [Pip](https://docs.zephyrproject.org/latest/getting_started/index.html#bootstrap-west)
	* `pip3 install west`
1. Create [user accesible folder](https://superuser.com/a/1396402) in %systemdrive%
	* `if not exist %USERPROFILE%\localapp mkdir %USERPROFILE%\localapp`
	* `if not exist %systemdrive%\localapp mklink /J %systemdrive%\localapp %USERPROFILE%\localapp`
	* `cd %systemdrive%\localapp`
1. Clone the Zephyr Repositories (in %systemdrive%\localapp)
	* `west init zephyrproject`
	* `cd zephyrproject`
	* `west update`
1. Set Up a `ZEPHYR_BASE`
	* `setx ZEPHYR_BASE %systemdrive%\localapp\zephyrproject\zephyr`
1. [Install Python Dependencies](https://docs.zephyrproject.org/latest/getting_started/index.html#install-python-dependencies)
	* `pip3 install -r %ZEPHYR_BASE%/scripts/requirements.txt`
		* `pyocd`
			* [target_nRF52832_xxAA](https://github.com/mbedmicro/pyOCD/blob/master/pyocd/target/builtin/target_nRF52832_xxAA.py)
			* [pyocd-debug-host-tools](https://docs.zephyrproject.org/latest/guides/debugging/host-tools.html#pyocd-debug-host-tools)
1. Install [VSCode](http://aka.ms/vscode)
	* `choco install vscode`
	* `choco install vscode-cpptools`
	* `choco install vscode-cortex-debug`
	* `choco install vscode-astyle`
