#!/bin/bash

read date < <(date | tr -d '\n')
read freq < <(powerman | grep -i 'freq' | cut -d' ' -f 5)
read stat < <(cat /sys/class/power_supply/AC/online | sed -e 's/1/false/g;s/0/true/g;')

# going to battery power
if [[ $stat == true ]]; then
	powerman cpufreq auto
	powerman cpufreq cold
	read nfreq < <(powerman | grep -i 'freq' | cut -d' ' -f 5)

	printf "%s: Switching to battery power (CPU %s MHz -> %s MHz)\n" "$date" $freq $nfreq >> /var/log/powerman.log
# going to AC power
else
	powerman cpufreq auto
	powerman cpufreq juicy
	read nfreq < <(powerman | grep -i 'freq' | cut -d' ' -f 5)

	printf "%s: Switching to AC power (CPU %s MHz -> %s MHz)\n" "$date" $freq $nfreq >> /var/log/powerman.log
fi;

