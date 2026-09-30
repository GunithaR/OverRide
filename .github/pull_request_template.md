## What this PR does

<!-- One or two sentences. Link the issue: "Closes #12" -->

## Area

<!-- e.g. [Player] [Weapon] [Hunter] [Level] [Art] [Motor] ... -->

## How to test

1. Open scene: `Assets/_Project/Scenes/...`
2. Steps:
3. Expected result:

## Screenshots / clip

<!-- Optional but helpful, especially for visual or AI debug-overlay changes -->

## Checklist (definition of done)

- [ ] Pulled latest `develop` into this branch; no merge conflicts
- [ ] Works in my sandbox and on `develop` with no console errors
- [ ] Only touches files I own, or I told the owner (prefabs, main scene)
- [ ] No `Find` / `GetComponent` / allocations inside per-frame loops
- [ ] Tunable numbers are in ScriptableObjects or serialized fields
- [ ] Public brain methods have XML comments (AI work)
- [ ] Debug overlay or gizmo shows what it is doing (AI work)
- [ ] `.meta` files included for every new or moved asset
- [ ] Design-log entry written in `Docs/DesignLog/<Name>.md`
- [ ] Evidence saved in `Docs/Evidence/<Name>/` if optimization or viva-relevant
- [ ] Contracts unchanged, or the contracts steward approved the change