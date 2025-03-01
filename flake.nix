{
  description = "Elyth's NeoVim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    pkgs-by-name-for-flake-parts.url = "github:drupol/pkgs-by-name-for-flake-parts";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    snacks-nvim = {
      url = "github:folke/snacks.nvim";
      flake = false;
    };
    trouble-nvim = {
      url = "github:folke/trouble.nvim";
      flake = false;
    };
    typr-nvim = {
      url = "github:nvzone/typr";
      flake = false;
    };
    volt-nvim = {
      url = "github:nvzone/volt";
      flake = false;
    };
    showkeys-nvim = {
      url = "github:nvzone/showkeys";
      flake = false;
    };
    avante-nvim = {
      url = "github:yetone/avante.nvim";
      flake = false;
    };
    # remark-markdown-unist の入力を追加
    remark-markdown-unist = if builtins.pathExists ./remark-markdown-unist
      then ./remark-markdown-unist
      else {
        url = "github:ryotarofr/remark-markdown-unist";
        flake = false;
      };
  };

  outputs = { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      imports = [ ./flake ];
    };
}
