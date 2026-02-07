#!/bin/sh

echo +++ Creating builddir... +++
rm -rf builddir
flatpak build-init builddir com.factorio.Factorio org.freedesktop.Sdk org.freedesktop.Platform 24.08

echo +++ Building... +++
rm -rf cache && mkdir cache
flatpak build builddir tar -xf factorio*.tar.xz --directory cache
flatpak build builddir mkdir /app/factorio
flatpak build builddir mv cache/factorio/bin /app/factorio
flatpak build builddir mv cache/factorio/data /app/factorio
flatpak build builddir install -Dm755 factorio.sh /app/bin/factorio
flatpak build builddir install -D /app/factorio/data/core/graphics/factorio-icon.png /app/share/icons/hicolor/64x64/apps/com.factorio.Factorio.png
flatpak build builddir install -D com.factorio.Factorio.desktop /app/share/applications/com.factorio.Factorio.desktop
rm -rf cache

echo +++ Finishing build... +++
flatpak build-finish --command factorio --socket wayland --socket x11 --socket fallback-x11 --device dri --socket pulseaudio --share network --persist data builddir

echo +++ Installing... +++
flatpak build-export repo builddir
flatpak remote-add --user --no-gpg-verify --no-enumerate --prio 0 factorio-origin ./repo
flatpak install -y --user factorio-origin com.factorio.Factorio

echo +++ Changing timestamp... +++
find ~/.local/share/flatpak/app/com.factorio.Factorio/current/active/files/factorio -type f -exec /usr/bin/touch "{}" \;
