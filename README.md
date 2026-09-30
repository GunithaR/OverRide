# OVERRIDE

A first-person sci-fi shooter in Unity (URP). The player fights through a research facility and hacks
its terminals to shut down **ARGUS**, a rogue security AI whose four units each think with a different
algorithm and adapt every time the player takes a piece of the system away.

Joint project for **SE3032 Graphics & Visualization** and **SE3062 Intelligent Systems**, SLIIT, 2026.

> **Unity version:** `Unity 6.3 LTS (6000.3.25f1)` with the Universal Render Pipeline.
> Everyone must install exactly this version. Do not open the project in any other version.

## Team

| Member | Graphics role (G&V) | IS agent | Shared infrastructure | Buddy |
|---|---|---|---|---|
| Shajeeve | World Builder | Director (ARGUS Core) | Level markup | Rithish |
| Gunitha | Systems Engineer | Hunter (Seeker) | Player controller, weapon, health and damage, noise events | Ilzam |
| Ilzam | Core Developer | Duelist (Warden) | Agent sensors (vision, hearing) | Gunitha |
| Rithish | Agent Controller | Pathfinder (Wisp) | Agent motor, prefab wiring, shared contracts | Shajeeve |

## Opening the project

1. Install Git and Git LFS, then run `git lfs install` once.
2. `git clone <REPO_URL>` and `git checkout develop`.
3. Open the folder in Unity Hub with the pinned version above.
4. Open `Assets/_Project/Scenes/Main/Main.unity` (or your own sandbox scene) and press Play.

Full first-time setup, including the merge driver: [`Docs/SETUP.md`](Docs/SETUP.md).

## Controls

| Action | Key |
|---|---|
| Move | WASD |
| Look | Mouse |
| Fire | Left mouse button |
| Reload | R |
| Interact / hack / push | E |
| Throw | G |
| Switch weapon | 1 / 2 |
| Sprint | Shift |
| Crouch | Ctrl |
| Jump | Space |
| Debug overlay | F1 |
| Pause | Esc |

## Repository layout

```
ArtSource/          Blender source files (.blend). Not inside Assets, so Unity never tries to import them.
Docs/               Design logs, optimization evidence, contracts spec, setup guide.
Assets/_Project/    Everything the team makes.
  Scripts/          Code, split into assemblies (see below).
  Data/             ScriptableObject configs: every tunable number lives here.
  Art/              Exported FBX models, materials, textures, animations, VFX, shaders.
  Prefabs/          Player, agents, interactables, level pieces, VFX, UI.
  Scenes/           Main (World Builder only), Sandbox (one per member), Menus.
  Audio/            SFX, music, mixers.
  Input/            Input System action asset.
  Settings/         URP pipeline assets and post-process volume profiles.
  Tests/            EditMode and PlayMode tests.
Assets/ThirdParty/  Imported CC0 packs, kept apart from our own work.
Tools/github/       Repo helper scripts (labels).
```

### Code assemblies and how data flows

```
Player/Interaction ──(NoiseEvent, door/crate state)──┐
Sensors ──(sightings, heard noises)──────────────────┤
Level markup ──(waypoints, cover, spawns, zones)─────┤
                                                      ▼
                              WorldSnapshot      (Scripts/Core)
                                                      ▼
                         IAgentBrain.Tick()      (Scripts/AI, plain C#)
                                                      ▼
                              AgentCommand       (Scripts/Core)
                                                      ▼
                Motor → movement, rotation, Animator  (Scripts/Motor)
```

| Assembly | May reference |
|---|---|
| `Override.Core` | nothing |
| `Override.AI` | Core |
| `Override.Sensors`, `Override.Motor`, `Override.Level` | Core |
| `Override.Player` | Core, Input System |
| `Override.Gameplay` | Core, AI, Sensors, Motor, Player, Level |
| `Override.UI` | Core, Player, Gameplay, TextMeshPro |
| `Override.DebugOverlay` | Core, AI, Input System |

The compiler enforces these arrows: AI code cannot reach player, level or scene code, which keeps the
AI brains decoupled from visuals.

## Branches and releases

- `main`: milestone releases only, tagged `m1-prototype`, `m2-alpha`, `m3-beta`, `v1.0`.
- `develop`: integration branch (default). No direct pushes.
- `feature/<area>-<thing>`: all work, e.g. `feature/hunter-belief-map`, `feature/wisp-uv`.

Rules for commits, pull requests and scenes: [`CONTRIBUTING.md`](CONTRIBUTING.md).

## Third-party assets

List every external asset here with its source and licence.

| Asset | Source | Licence | Used for |
|---|---|---|---|
| | | | |

## AI-assisted development

The team uses AI tools under the rules in the Workplan (Section 8). Each member notes AI help in their
design log and can explain every line of their own code.
