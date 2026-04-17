Build scripts for my XR stack (WiVRn Dashboard, xrizer, WayVR)

Run `build_all.sh` first; this will pull all repos and force a build. From then on you can run just `update_all.sh` and builds will only run if new changes were received.
- Built files will be copied to `/opt/` (you will need permission to run sudo)
- Scripts are set up to create Release builds.
- You can also run `XR_UP_FORCE_BUILD=1 ./update_wayvr.sh` for example to skip git checks and force a build.

You will need to install any dependencies for building each application manually. These should be found on each component's respective build instructions.

WayVR is set up to build Wayland OpenXR support only. To change this, edit `XR_UP_WAYVR_FEATURES` in `update_wayvr.sh` to have the features you want (e.g. `"x11,openvr"` for X11 SteamVR).

Issues:
- WiVRn seems to not set up the runtime properly when running from outside the build dir - no OpenXR programs can connect to the runtime; WayVR and `xrgears` for example cannot find it.
  - Instead, 
  - The code to install WiVRn to `opt` is still present, however it is commented out.

Reference:
- Git checks - https://stackoverflow.com/a/50737015
