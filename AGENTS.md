# libvaxis

Zig 0.16.0 terminal UI library with VT/ANSI parsing, Unicode grapheme clustering, OSC 52 clipboard support, and retained `vxfw` widgets. `src/vaxis.zig` owns terminal context, screen buffers, and driver; `src/parser.zig` decodes VT streams; `src/cell.zig` defines styled cells and graphics.

## Invariants

- The VT parser must handle arbitrary terminal input. Run bounded fuzzing after parser changes.
- `vxfw` uses Flutter's BoxConstraints model: constraints go down, sizes go up, and the parent sets position.
- Pass allocators explicitly to widgets and terminal buffers. Do not add hidden background allocations.
- Use `nix develop` for the repository's development environment. This host uses NixOS; declare dependencies in `flake.nix`.
- Use `jj st` for status; do not use raw Git.

## Commands

- `zig build` builds the library and examples.
- `zig build test` runs the test suite.
- `zig build test --fuzz=5000` fuzzes the VT parser.
- `zig fmt --check .` checks formatting.
- `gate` runs the repository gate script.
