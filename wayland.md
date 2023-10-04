# Wayland

## Google chrome

1. Go to chrome://flags
2. Search "Preferred Ozone platform"
3. Set it to "Wayland"
4. relaunch

things:
- https://github.com/NixOS/nixpkgs/issues/158175
- https://chromium.googlesource.com/chromium/src/+/refs/heads/main/docs/ozone_overview.md



Install Distrobox

Create archlinux Container

(intel only) install intel-media-driver in both container and in Fedora

Install paru in arch

In arch use paru to compile chromium-wayland-vaapi: sudo paru -Syu chromium-wayland-vaapi

PS: if you have a more powerful machine, you can create the arch container there, compile it, and then move the container over. HowTo

I can also upload a compiled container if you want me to :)

Edit: put the following in $home/.config/chromium-flags.conf to enable it:

--enable-features=UseOzonePlatform

--ozone-platform=wayland

--ignore-gpu-blocklist

--enable-gpu-rasterization

--enable-zero-copy

--disable-gpu-driver-bug-workarounds

--enable-accelerated-video-decode

--enable-features=VaapiVideoDecoder


## firefox

wayland support is native
