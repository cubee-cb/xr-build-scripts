Build scripts for my XR stack.

You will need to install any dependencies manually. These should be found on each component's respective build instructions.

`update_all.sh` will fetch changes for each component (WiVRn Dashboard, xrizer, then WayVR), and if there are any it will run `git pull` and build.

`update_all_cubee.sh` does the same, but uses my fork of WayVR instead.

`update_wivrn_headless.sh` will be called by update_all.sh if `XR_UP_HEADLESS` is defined. It also depends on and restarts a `wivrn-git` systemd service after updating. This is intended for, as it says on the tin, headless usage, and thus doesn't build the dashboard.
