app-id := "in.gxanshu.TextEditor"
manifest := "in.gxanshu.TextEditor.json"

# Native (fast, host) build/run — for day-to-day development

build:
    #!/usr/bin/env bash
    set -euo pipefail
    if [ ! -d _build ]; then
        meson setup _build
    fi
    ninja -C _build

run: build
    _build/src/text-editor

# Install native build dependencies (Fedora)
deps:
    sudo dnf install $(grep -v '^#' requirements.txt)

# Flatpak (sandboxed, production) build/run — matches what users actually get

# One-time setup: flatpak-builder tool + SDK/Platform runtimes + Vala extension
flatpak-deps:
    flatpak install --user -y flathub org.flatpak.Builder
    flatpak install --user -y flathub org.gnome.Sdk//48 org.gnome.Platform//48
    flatpak install --user -y flathub org.freedesktop.Sdk.Extension.vala//24.08

flatpak-build:
    flatpak run org.flatpak.Builder --user --install --force-clean builddir {{manifest}}

flatpak-run:
    flatpak run {{app-id}}

# Build then run the production flatpak in one go
flatpak: flatpak-build flatpak-run
