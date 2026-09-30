# Contributing to OVERRIDE

Small, frequent, reviewed commits protect the build and everyone's individual Git marks.

## Branches

| Branch | Purpose |
|---|---|
| `main` | Milestone releases only. Tagged `m1-prototype`, `m2-alpha`, `m3-beta`, `v1.0`. |
| `develop` | Integration. Default branch. Everything merges here through a pull request. |
| `feature/<area>-<thing>` | All work. One branch per task. |

Examples: `feature/player-controller`, `feature/weapon-recoil`, `feature/hunter-belief-map`,
`feature/level-greybox-v1`, `feature/wisp-uv`, `feature/motor-arrival`.

## Commits

- One logical change per commit. Commit at least once on every day you work.
- Imperative mood with an area tag: `[Hunter] Add Bayesian update on noise event`.
- Never commit `Library/`, `Temp/`, `Build/`, `Logs/` or `UserSettings/`.
- Commit the `.meta` file with every asset or folder you add, move or rename.
- Core Developer: commit `.blend` files in `ArtSource/` at each stage (blockout, topology, UVs, texture).

### Area tags

| Tag | Covers |
|---|---|
| `[Core]` | Shared contracts, blackboard, shared event types |
| `[Player]` | Movement, camera, crouch, sprint, jump |
| `[Weapon]` | Rifle logic, recoil, sway, reload, effects |
| `[Health]` | Health and damage |
| `[Interaction]` | Doors, barricades, throwable |
| `[Noise]` | Noise events and emitters |
| `[Gameplay]` | Terminals, hacking, waves, game state, respawn |
| `[UI]` | HUD and menus |
| `[Level]` | Greybox, markup, lighting, NavMesh, textures |
| `[Art]` | Models, UVs, materials, rigs |
| `[Sensors]` | Vision and hearing |
| `[Motor]` | Path following, rotation, Animator |
| `[Director]` `[Hunter]` `[Duelist]` `[Pathfinder]` | Agent brains |
| `[Nav]` | Waypoint graph and graph A* |
| `[Debug]` | F1 overlay and gizmos |
| `[Audio]` | Sounds, mixers |
| `[Build]` | Project settings, packages, build config |
| `[Docs]` | Design logs, evidence, README |
| `[Test]` | Tests |

## Pull requests

1. Pull `develop` into your branch and resolve conflicts on your branch.
2. Open a pull request into `develop` using the template.
3. Your buddy reviews it (CODEOWNERS requests them automatically).
4. After merging, whoever merged runs the smoke test: start, reach a terminal, hack it, die once, respawn.

| Author | Reviewer (buddy) |
|---|---|
| Shajeeve | Rithish |
| Gunitha | Ilzam |
| Ilzam | Gunitha |
| Rithish | Shajeeve |

## Scenes and prefabs

- Only the World Builder edits `Scenes/Main/Main.unity`.
- Everyone else works in `Scenes/Sandbox/<Name>.unity` and hands over prefabs.
- Never edit someone else's prefab without telling them; use prefab variants where possible.

## Code standards

- AI brains are plain C# classes that never touch GameObjects; only the motor and sensors do.
- No `Find`, `GetComponent` or allocations inside per-frame loops; cache references.
- Public brain methods have XML comments explaining what they compute and why.
- Tunable numbers live in ScriptableObjects in `Assets/_Project/Data/` or serialized fields, never hard-coded.
- One class per file. PascalCase types and methods, `_camelCase` private fields.
- Changes to `WorldSnapshot`, `AgentCommand` or `IAgentBrain` need the contracts steward's approval.

## Definition of done

- [ ] Works in its sandbox and in `develop` without console errors
- [ ] Pull request reviewed and merged
- [ ] Debug overlay or gizmo shows what it is doing (AI work)
- [ ] Design-log entry written: what was built, key numbers, and why
- [ ] Evidence saved if it relates to optimization or a viva talking point

## Bugs

Every bug is a GitHub Issue with steps to reproduce. Labels: `critical` (crash or blocks progress),
`major` (feature broken), `minor` (visual or small), plus an area label. Critical bugs are fixed before
new feature work.
