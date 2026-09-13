# AGENTS.md - Agent Guidelines for ikta-nix

## Project Overview

This is a **NixOS flake-based system configuration** (ZaneyOS). It manages a NixOS desktop setup with Hyprland (Wayland compositor), Home Manager for user configuration, and various custom modules for theming, scripts, and hardware support.

The project follows the standard ZaneyOS structure:
- `flake.nix` - Main flake entry point with inputs and outputs
- `hosts/` - Host-specific configurations (ikta, default, etc.)
- `modules/` - Reusable NixOS modules (core/, home/, drivers/)
- `profiles/` - GPU profile configurations (nvidia, amd, intel, etc.)

---

## Build / Lint / Test Commands

### Building the System

```bash
# Rebuild the NixOS system from the flake
sudo nixos-rebuild switch --flake .#nvidia

# Available profiles: amd, nvidia, nvidia-laptop, amd-hybrid, intel, vm
# Replace 'nvidia' with your desired profile

# Short alias (available in shell after first build)
fr
```

### Formatting (Alejandra - Nix formatter)

```bash
# Format all Nix files in the project
alejandra .

# Or use the nix fmt command from the flake
nix fmt
```

### Linting / Validation

```bash
# Check NixOS configuration without building
nixos-rebuild dry-build --flake .#nvidia

# Evaluate the flake to check for errors
nix flake show

# Check for unused imports or variables (nix-linter)
nix-linter ./modules

# Check with nil (language server)
nil . --refresh
```

### Running Tests

There are **no traditional unit tests** in this project. To validate:

```bash
# Dry-run build to verify configuration correctness
nixos-rebuild dry-build --flake .#<profile>

# Evaluate specific host config
nix eval .#nixosConfigurations.nvidia.config.system.build.toplevel

# Test Home Manager configuration
home-manager -b bak switch --flake .#ikta@linux
```

---

## Code Style Guidelines

### General Conventions

1. **File Organization**
   - Use `default.nix` files for module exports
   - Group related options in separate files (e.g., `boot.nix`, `network.nix`)
   - Host-specific configs go in `hosts/<hostname>/`
   - Profile-specific configs go in `profiles/<profile>/`

2. **Imports**
   - Use relative paths with `./` for local imports
   - Use `inputs.<flake>.nixosModules.<module>` for flake inputs
   - Always import in `imports = []` list at the top of modules

3. **Attribute Sets**
   - Use trailing commas for all attributes (last one too)
   - Align keys consistently (recommended 2-4 space indent)
   - Prefer `key = value;` over `key= value;` (spaces around `=`)

### Nix Language Style

```nix
# Good
{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    ./boot.nix
    ./packages.nix
  ];

  option = true;

  environment.systemPackages = with pkgs; [
    pkg1
    pkg2
  ];
}

# Avoid
{
  pkgs, config, ...}:
{
  imports = [ ./boot.nix ];
  option=true;
  environment.systemPackages = with pkgs; [pkg1 pkg2];
}
```

### Naming Conventions

- **Files**: kebab-case (e.g., `nvidia-drivers.nix`, `host-packages.nix`)
- **Options**: camelCase for NixOS options (e.g., `enableNFS`, `monitorSettings`)
- **Variables**: camelCase in Nix code
- **Modules**: descriptive, singular (e.g., `boot.nix`, `network.nix`)

### Types and Attrsets

- Always define proper types for custom options using `lib.types.*`
- Use `mkOption` with `type`, `default`, `example`, and `description`
- Document all public options with descriptions

```nix
lib.mkOption {
  type = lib.types.bool;
  default = false;
  description = "Enable NFS support for mounting network shares.";
}
```

### Error Handling

- Use `lib.asserts` for configuration validation
- Provide meaningful error messages with `lib.warn` or `lib.throwIfNot`
- Check for required packages availability before use

### Strings and Paths

- Use raw strings (`''`) for multi-line strings
- Use paths (`./relative/path`) for local files, not strings
- Use `lib.fileset.toSource` for file filtering

---

## Configuration Structure

### Hosts

Each host directory contains:
- `default.nix` - Host-specific NixOS configuration
- `hardware.nix` - Generated hardware configuration
- `host-packages.nix` - Machine-specific packages
- `variables.nix` - User-configurable variables

### Profiles

GPU/hardware profiles in `profiles/`:
- `amd/` - AMD GPU
- `nvidia/` - NVIDIA GPU
- `intel/` - Intel integrated graphics
- `amd-nvidia-hybrid/` - AMD CPU + NVIDIA GPU
- `nvidia-laptop/` - NVIDIA laptop (optimus)
- `vm/` - Virtual machine

### Modules

- `modules/core/` - System-wide NixOS configuration
- `modules/home/` - Home Manager user configuration
- `modules/drivers/` - Hardware driver modules
- `modules/home/scripts/` - User scripts (shell scripts in .nix)

---

## Adding New Packages

### System-wide packages (all users)

Edit `modules/core/packages.nix`:
```nix
environment.systemPackages = with pkgs; [
  new-package
];
```

### User-specific packages

Edit `modules/core/user.nix` or use Home Manager in `modules/home/`

### Per-host packages

Edit `hosts/<hostname>/host-packages.nix`

---

## Common Tasks

### Adding a new module

1. Create `modules/<category>/<module-name>.nix`
2. Import in `modules/<category>/default.nix`
3. Configure in host or profile

### Adding a new host

```bash
cp -r hosts/default hosts/<new-hostname>
# Edit variables.nix and other host files
# Update flake.nix if needed
```

### Switching GPU profile

Edit `flake.nix`:
```nix
profile = "nvidia";  # Change to amd, intel, etc.
```

---

## Dependencies

Key flake inputs:
- `nixpkgs` - NixOS packages (release-25.11)
- `home-manager` - User environment management
- `hyprland` - Wayland compositor
- `stylix` - Automatic theming
- `alejandra` - Nix code formatter
- `nvf` - Neovim flake module
- `noctalia` - Shell integration

---

## Important Notes

1. **Always format with alejandra** before committing
2. **Test changes with `dry-build`** before applying
3. **Back up configuration** before major changes
4. **Use descriptive commit messages**
5. **Keep secrets out of the repo** (use home-manager secrets or environment variables)
