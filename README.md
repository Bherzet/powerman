# powerman
Linux power management utility for Lenovo Thinkpad X201.

## Requirements and setup
This utility was specifically designed for a Lenovo Thinkpad X201 laptop with core-i5 processor and Linux Mint 17.
It is likely to work on other platforms as well, but it may need some customizations.

Installation is pretty simple. All you need to do is download the `*.deb` package and install it:

    # wget https://github.com/tzima/powerman/blob/master/dist/powerman.deb
    # dpkg -i powerman.deb
    
Powerman requires utility `cpupower` (provided by `linux-tools-common`). Be sure to run `cpupower` and check it runs
OK. It might throw an error and require you to install package `linux-tools-3.13.0-24-generic` or similar (according
to your kernel version). Generated `*.deb` package tries to solve this and install all dependencies, but it may fail.
You've been warned.

## Using
By calling `powerman` (as root!), you will get an output similar to this one:

    # sudo powerman
    CPU cur freq:  2400 MHz
    
    CPU tmp core0: 40.0°C
    CPU tmp core2: 43.0°C
    
    Wifi:          enabled
    Bluetooth:     disabled
    WWAN:          disabled
    
From the output above, capabilities of the utility are pretty clear. It allows you to change CPU frequency and
enable or disable wireless devices. Just run `powerman help` to get more informations.

When you disconnect AC adapter and run from battery, it will automatically make CPU to run on the minimal possible
frequency. After connecting laptop back to AC power again, it will alter it back to the maximal performance.

There's also a BASH completition support, so you don't have to type commands at full length; just press `[TAB]`.
