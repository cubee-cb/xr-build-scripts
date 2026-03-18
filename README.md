Build scripts for my XR stack.

You will need to install any dependencies manually. These should be found on each component's respective build instructions.

`update_all.sh` will fetch changes for each component (WiVRn Dashboard, xrizer, then WayVR), and if there are any it will run `git pull` and build.

`update_all_cubee.sh` does the same, but uses my fork of WayVR instead.

