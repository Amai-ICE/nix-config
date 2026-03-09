# NixOS Configuration - AI Coding Guidelines

## Project Overview
This is a modular NixOS system configuration using Flakes with strict separation of concerns:
- **config/**: Option definitions only (declarations of what CAN be configured)
- **os/**: System implementation (actual services, drivers, boot settings)
- **home/**: User environment (home-manager configuration)
- **hosts/**: Machine-specific settings (hostName, users, enabled features)

## Critical Directory Structure Rules

### `/config/os/` - Option Declarations Only
- **MUST contain**: `options.my.os.<feature> = { ... }` with `lib.mkEnableOption` or `lib.mkOption`
- **MUST NOT contain**: Any `config.*` blocks, `services.*`, `programs.*`, or `hardware.*` implementation
- **Structure**: Each feature gets its own file (e.g., `boot.nix`, `network.nix`, `game.nix`)
- **Pattern**: 
  ```nix
  { options, lib, ... }:
  {
    options.my.os.boot = {
      systemd-boot.enable = lib.mkEnableOption "Enable systemd-boot";
      nvidiaKernelModule.enable = lib.mkEnableOption "Enable NVIDIA in initrd";
    };
  }
  ```

### `/os/` - Implementation Only
- **MUST contain**: `config.*` blocks that implement options declared in `/config/os/`
- **MUST use**: `lib.mkIf cfg.<option>.enable { ... }` to conditionally apply settings
- **MUST reference**: `let cfg = config.my.os.<feature>; in` at file start
- **Examples**: `boot.nix`, `network.nix`, `graphic.nix` contain actual NixOS configuration
- **Pattern**:
  ```nix
  { lib, config, ... }:
  let cfg = config.my.os.boot; in {
    config.boot = lib.mkIf cfg.systemd-boot.enable {
      loader.systemd-boot.enable = true;
    };
  }
  ```

### `/home/` - User Environment Only
- Similar to `/os/` but for user-level settings (home-manager)
- Use `home.packages`, `programs.<app>` configurations
- Never modify system settings or options defined in other layers

### `/hosts/` - Machine-Specific Toggles Only
- **CAN do**: Set `my.os.<feature>.enable = true|false` to enable/disable features
- **CAN do**: Define `networking.hostName`, `users.users."username"`, locale settings
- **CANNOT do**: Add `programs.*`, `services.*`, or other implementation details
- **CANNOT do**: Modify any non-`my.*` enable options directly

## Custom Namespace Pattern: `my.*`

All custom options use `options.my.<layer>.<feature>` naming:
- `my.os.boot.*` - system boot options
- `my.os.network.*` - network options
- `my.os.game.*` - gaming-related options
- `my.home.graphic.*` - graphics options (note: home layer for user config)

**Key**: Always check which layer an option belongs to before modifying.

## Default.nix Rules

Every `default.nix` must contain **ONLY** imports:
```nix
{
  imports = [
    ./submodule1.nix
    ./submodule2.nix
  ];
}
```

❌ **NEVER** add configuration directly in `default.nix`:
```nix
# WRONG - breaks modularity
{ imports = [...]; environment.packages = [...]; }
```

## Module Building Workflow

1. **Add option in `/config/os/<feature>.nix`**:
   - Use `options.my.os.<name>` with `lib.mkEnableOption` or `lib.mkOption`

2. **Implement in `/os/<feature>.nix`**:
   - Import the option with `let cfg = config.my.os.<name>; in`
   - Use `lib.mkIf cfg.enable { config.* = ... }`

3. **Enable in `/hosts/desktop.nix`**:
   - Add `my.os.<feature>.enable = true;` to activate

## Null Checking in Nix

Use `lib.mkIf (! (isNull <value>)) { ... }` for optional values:
```nix
# Check if value is not null before using
config.my.option = lib.mkIf (! (isNull cfg.customPackage)) cfg.customPackage;
```

## Build & Apply Changes

```bash
# Rebuild NixOS system
sudo nixos-rebuild switch

# Check for errors
nixos-rebuild build 2>&1 | grep -i error

# Use nix repl for testing expressions
nix repl
> (import <nixpkgs> {})
```

## Common Patterns to Follow

### Enable/Disable Pattern
```nix
# In config/os/feature.nix - declare
enable = lib.mkEnableOption "Feature description";

# In os/feature.nix - conditionally implement
config = lib.mkIf cfg.enable { 
  services.featureName.enable = true;
};
```

### Optional Package Pattern
```nix
# In config/os/feature.nix - declare
package = lib.mkOption {
  type = lib.types.nullOr lib.types.package;
  default = null;
  description = "Custom package";
};

# In os/feature.nix - use if not null
config = lib.mkIf (! (isNull cfg.package)) {
  environment.systemPackages = [ cfg.package ];
};
```

## Layer Separation Anti-patterns

❌ **WRONG**: Putting implementation in `/config/os/`:
```nix
# config/os/wrong.nix - DO NOT DO THIS
options.my.os.boot = {
  config.boot.loader.systemd-boot.enable = true;  # WRONG!
};
```

❌ **WRONG**: Adding options in `/os/`:
```nix
# os/wrong.nix - DO NOT DO THIS
options.my.os.boot = { ... };  # WRONG! Define in config/ instead
```

❌ **WRONG**: Direct config in `/hosts/desktop.nix`:
```nix
# WRONG - use my.* toggles instead
services.steam.enable = true;
```

## Flake Integration

The flake imports modules in this order:
1. `./config/home/default.nix` - home option declarations
2. `./config/os/default.nix` - os option declarations  
3. `./os/default.nix` - os implementations
4. `./hosts/default.nix` - machine-specific settings
5. `home-manager` module with user config

**Key**: Options from `/config/` must be implemented before hosts can use them.

## File Naming Convention

- Feature-specific files in `/config/os/` and `/os/` use lowercase with hyphens: `display-manager.nix`, `nix-ld.nix`
- Directories group related features: `./windowManager/niri.nix`
- Each module should be self-contained and reusable

## Testing Configuration Changes

```bash
# Validate syntax without building
nix flake check

# Build dry-run to catch errors early
nixos-rebuild build --flake .

# Check what would change
nixos-rebuild dry-run

# Apply after verification
sudo nixos-rebuild switch --flake .
```

## Debugging Tips

- Use `nix repl` to test expressions: `let cfg = config.my.os.boot; in cfg`
- Check errors in `/var/log/syslog` for runtime issues
- Use `lib.mkDefault` for lower-priority defaults that can be overridden
- Remember: `options.*.enable` uses default `false` from `lib.mkEnableOption`
