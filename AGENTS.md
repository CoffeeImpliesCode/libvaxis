# libvaxis

**Stack**: Zig 0.16.0 · Terminal UI · VT / ANSI parser · vxfw framework · `jj` (colocated git)  
**Status**: Active — High-performance modern TUI library for Zig

---

## 1. Overview & Architecture

`libvaxis` provides terminal manipulation, event decoding, unicode/grapheme clustering, OSC 52 clipboard integrations, and a Flutter-inspired layout constraint framework (`vxfw`).

```
├── src/
│   ├── main.zig          # Root library entry point
│   ├── vaxis.zig         # Core TUI context, screen buffers, terminal driver
│   ├── parser.zig        # VT sequence parser & escape state machine
│   ├── cell.zig          # Character cell, styling, and graphics
│   └── vxfw/             # Constraint-based retained widget framework
├── build.zig             # Library build & test suite
└── build.zig.zon         # Package metadata
```

---

## 2. Invariants & Framework Rules

1. **VT Parser Fuzzing**:
   - The VT escape parser handles arbitrary terminal streams. All parser alterations must pass bounded fuzz testing.
2. **Widget Constraints Model**:
   - The `vxfw` layout follows Flutter's BoxConstraints model: *Constraints go down, Sizes go up, Parent sets position*.
3. **TigerStyle Memory Management**:
   - Explicit allocator arguments across all widgets and terminal buffers. No hidden background allocations.

---

## 3. Commands & Verification

```bash
zig build                      # Build library & examples
zig build test                 # Run complete test suite
zig build test --fuzz=5000     # Fuzz test VT parser
zig fmt --check .              # Verify formatting
gate                           # Run house gate script
jj st                          # VCS status (NEVER raw git)
```

## NixOS, Development Environment & Shared Notes

- This host uses NixOS. Never install system or development libraries imperatively.
- Declare dependencies, headers, runtime libraries, and tools in `flake.nix`.
- Use the repository's `flake.nix` development shell with `nix develop`.
- Store durable project architecture, design, protocol, and experiment notes under `docs/`.
- Store cross-project or private agent handoff notes in `~/.agents/agent-notes/`. Never commit these notes.
