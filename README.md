<h3 align="center">
  <img src="https://github.com/42willow/flake/blob/main/docs/public/flake-macchiato.png?raw=true" width="100" alt="Nix Logo" /><br />
  <img src="https://github.com/42willow/flake/blob/main/docs/public/transparent.png?raw=true" height="30" width="0px" alt="" />
  willow's wallpaper dump
  <img src="https://github.com/42willow/flake/blob/main/docs/public/transparent.png?raw=true" height="30" width="0px" alt="" />
</h3>

<h6 align="center">
  <a href="#usage">Usage</a>
  ·
  <a href="#previews">Previews</a>
  ·
  <a href="#credits">Credits</a>
</h6>

<p align="center">
  <img
    src="https://github.com/42willow/flake/blob/main/docs/public/macchiato.png?raw=true"
    width="400"
    alt="Catppuccin Macchiato Palette"
  />
</p>

<p align="center">
  <a href="https://github.com/42willow/wallpapers/stargazers">
    <img
      alt="Stargazers"
      src="https://img.shields.io/github/stars/42willow/wallpapers?style=for-the-badge&logo=starship&color=7dc4e4&logoColor=white&labelColor=363a4f"
  /></a>
  <a href="https://github.com/42willow/wallpapers">
    <img
      alt="Repo Size"
      src="https://img.shields.io/github/repo-size/42willow/wallpapers.svg?style=for-the-badge&logo=github&color=a6da95&logoColor=white&labelColor=363a4f"
  /></a>
  <a href="https://github.com/42willow/wallpapers/issues">
    <img
      alt="Issues"
      src="https://img.shields.io/github/issues/42willow/wallpapers?style=for-the-badge&logo=gitbook&color=f5a97f&logoColor=white&labelColor=363a4f"
  /></a>
  <a href="https://github.com/42willow/wallpapers/tree/main/LICENSE">
    <img
      alt="GitHub License"
      src="https://img.shields.io/github/license/42willow/wallpapers?style=for-the-badge&logo=data%3Aimage%2Fsvg%2Bxml%3Bbase64%2CPHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0IiBmaWxsPSJub25lIiBzdHJva2U9IndoaXRlIiBzdHJva2Utd2lkdGg9IjIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgY2xhc3M9Imx1Y2lkZSBsdWNpZGUtc2NhbGUiPjxwYXRoIGQ9Im0xNiAxNiAzLTggMyA4Yy0uODcuNjUtMS45MiAxLTMgMXMtMi4xMy0uMzUtMy0xWiIvPjxwYXRoIGQ9Im0yIDE2IDMtOCAzIDhjLS44Ny42NS0xLjkyIDEtMyAxcy0yLjEzLS4zNS0zLTFaIi8%2BPHBhdGggZD0iTTcgMjFoMTAiLz48cGF0aCBkPSJNMTIgM3YxOCIvPjxwYXRoIGQ9Ik0zIDdoMmMyIDAgNS0xIDctMiAyIDEgNSAyIDcgMmgyIi8%2BPC9zdmc%2B&logoColor=%23cad3f5&labelColor=%23363a4f&color=%23c6a0f6"
    />
  </a>
</p>

---

This repo provides a curated collection of wallpapers that are hand-picked for high resolution displays. Each wallpaper has been (or will be!) converted to the four colour schemes of [Catppuccin](https://catppuccin.com). Other colour schemes can be added in future if requested.

## Usage

### Download

See instructions on the [GitHub release page](https://github.com/42willow/wallpapers/releases/tag/wallpapers).

### Nix

`nix flake show github:42willow/wallpapers`

Package inputs:

- `full` (default)
- `latte`
- `frappe`
- `macchiato`
- `mocha`

#### With Flakes

`flake.nix`
```nix
inputs = {
  wallpapers = {
    url = "github:42willow/wallpapers";
    inputs.nixpkgs.follows = "nixpkgs";
    # «https://github.com/nix-systems/nix-systems»
    # inputs.systems.follows = "systems"; # if using nix-systems
  };
};
```

`configuration.nix`
```nix
{inputs, pkgs, ...}: {
  environment = {
    etc."wallpapers".source = inputs.wallpapers.packages.${pkgs.system}.full;
  };
}
```

#### Without Flakes

```bash
$ nix profile install github:42willow/wallpapers#full
```

<sub>Nix instructions adapted from [NotAShelf/wallpkgs](https://github.com/NotAShelf/wallpkgs?tab=readme-ov-file#installing), please read there for more detail.</sub>

## Previews

Check out the [website](https://42willow.github.io/wallpapers/)!

## Credits

A huge thanks to [NotAShelf](https://github.com/NotAShelf) for his [wallpkgs](https://github.com/NotAShelf/wallpkgs) that this is based on.
I would recommend checking out his projects and maybe even giving them a star!

All images are sourced from the internet and are not my own work. If you are the original artist and would like me to remove your work, please contact me via email at `42willow [at] pm [dot] me`.

### Collections

- [Flick0](https://github.com/flick0/kabegami)
- [DragonDev07 (for more script features)](https://github.com/DragonDev07/Wallpapers/blob/main/markdown.py)
- [Biohazardia](https://www.deviantart.com/biohazardia/gallery)
- [Imgur Pixel Art Dump](https://imgur.com/gallery/SELjK)
- [Kurzgesagt - AI upscaled](https://www.reddit.com/r/kurzgesagt/comments/15pvf7h/kurzgesagt_4k_wallpapers_3840x2160/)

### Tools

- [tineye](https://www.tineye.com/) - Reverse image search
- [faerber](https://github.com/nekowinston/faerber) - CLI tool to match images to colour schemes
- [lutgen](https://github.com/ozwaldorf/lutgen-rs) - CLI tool to generate LUTs and apply them to images
- [pixeldetector](https://github.com/Astropulse/pixeldetector) - CLI tool to downscale and colour palette limit pixel art
