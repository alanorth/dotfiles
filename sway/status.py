#!/usr/bin/env python3
#
# Install ttf-twemoji and make sure there are no other emoji fonts like
# noto-fonts-emoji.

from datetime import datetime
from subprocess import check_output
from sys import stdout

from psutil import sensors_battery


def write(data):
    stdout.write("%s\n" % data)
    stdout.flush()


def refresh():
    try:
        ssid = (
            check_output("nmcli -g general.connection device show wlan0", shell=True)
            .strip()
            .decode("utf-8")
        )
    except Exception:
        ssid = "None"

    wifi_status = f"{ssid} 📶"

    try:
        vpn_state = (
            check_output("nmcli -g general.state connection show wg0", shell=True)
            .strip()
            .decode("utf-8")
        )
    except Exception:
        vpn_state = ""

    if vpn_state == "activated":
        wifi_status = f"{wifi_status} 🔐"

    battery_percent = int(sensors_battery().percent)

    # if battery_percent >= 90:
    #    battery_icon = ""
    # elif battery_percent < 90 and battery_percent >= 75:
    #    battery_icon = "🔋"
    # elif battery_percent < 75 and battery_percent >= 50:
    #    battery_icon = ""
    # elif battery_percent < 50 and battery_percent >= 25:
    #    battery_icon = ""
    # elif battery_percent < 25:
    #    battery_icon = ""

    battery_icon = "🔋"
    battery_status = f"{battery_percent} {battery_icon}"
    power_status = "🔌" if sensors_battery().power_plugged else ""

    try:
        # pulsemixer returns "10 10" so we need to split the output to get "10"
        volume_level = (
            check_output("pulsemixer --get-volume", shell=True).strip().decode("utf-8")
        )
        volume_level = int(volume_level.split(" ")[0])

        if volume_level >= 70:
            volume_icon = "🔊"
        elif volume_level >= 30 and volume_level < 70:
            volume_icon = "🔉"
        elif volume_level < 30 and volume_level >= 1:
            volume_icon = "🔈"
        else:
            volume_icon = "🔇"
    except Exception:
        volume_level = ""

    volume_status = f"{volume_level} {volume_icon}"

    date = datetime.now().strftime("%Y-%m-%d %l:%M:%S %p")

    write(f"{wifi_status} {volume_status} {battery_status} {power_status} {date}")


refresh()
