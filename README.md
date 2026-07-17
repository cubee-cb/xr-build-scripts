Build scripts for my XR stack (WiVRn Dashboard, xrizer, WayVR)

Connect your headset and run `build_all.sh` first; this will pull all repos and force a build. From then on you can run just `update_all.sh` and builds will only run if new changes were received.
- Built files will be copied to `/opt/` (you will need sudo permission for this part, though you can also just run from the build folders directly instead)
- Scripts are set up to create Release builds.
- You can also run `XR_UP_FORCE_BUILD=1 ./update_wayvr.sh` for example to skip git checks and force a build.

You will need to install any dependencies for building each application manually. These should be found on each component's respective build instructions.

The WiVRn script will also build and deploy the headset client: it will show up as "WiVRn Local", signifying your locally-built version. This is due to WiVRn's very strict version checking.
- Plug your headset in before running the WiVRn build script, and disconnect any other Android devices from ADB.
- You headset should have Developer Mode enabled and trust your system.
- Your system must have `adb` installed in order to deploy the client to your headset.

WayVR is set up to build Wayland OpenXR support only. To change this, edit `XR_UP_WAYVR_FEATURES` in `update_wayvr.sh` to have the features you want (e.g. `"x11,openvr"` for X11 SteamVR).

Assumptions:
- `/opt/` is where "optional" software will be installed. WiVRn will look for xrizer here.
- `~/.config/environment.d/` is read by the login session to apply "global" environment variables.
  - This is used to set `PRESSURE_VESSEL_IMPORT_OPENXR_1_RUNTIMES` globally, so it doesn't have to be done per-game.
- WayVR is set up to build only Wayland+OpenXR support. To change this, change `XR_UP_WAYVR_FEATURES` in `update_wayvr.sh` to include the features you want (e.g. `"x11,openvr"` for SteamVR on X11).
- The device targeted by `adb install` defaults to your headset.

Issues:
- WiVRn seems to not start up the runtime properly (if at all) when running from outside the build dir - no OpenXR programs can connect to the runtime; WayVR and `xrgears` for example cannot find it.
  - Instead of copying, the script will symlink WiVRn's executables to `opt`.
  - The code to directly install WiVRn to `opt` is still present, however it is commented out.

Reference:
- Git checks - https://stackoverflow.com/a/50737015
