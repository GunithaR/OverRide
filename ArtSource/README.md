# ArtSource

Blender source files (`.blend`) for the custom models, stored through Git LFS.

This folder is outside `Assets/` on purpose: Unity only imports `.blend` files when Blender is installed
on that machine, which would break the project for teammates without it. Export FBX into
`Assets/_Project/Art/Models/<Model>/` instead.

| Folder | Model | Triangle budget (GDD, suggested) | Status |
|---|---|---|---|
| `Wisp/` | Wisp drone, hard-surface, simple rig | ≤ 5,000 | Required |
| `Terminal/` | Override terminal, hard-surface prop | ≤ 3,000 | Required |
| `Rifle/` | Player rifle (on screen all game) | ≤ 5,000 | Required |
| `Warden/` | Warden sentry, one bone per part | ≤ 10,000 | Stretch |
| `Seeker/` | Seeker sensor orb | — | Planned |

Commit at each stage so the history shows the process: blockout → topology → UVs → texture.
Suggested file names: `Wisp_v01_blockout.blend`, `Wisp_v02_topology.blend`… or one file per model
committed at each stage with a clear message, e.g. `[Art] Wisp: finish UV unwrap`.
