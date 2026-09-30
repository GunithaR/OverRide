# Shared code contracts

**Owner:** Rithish (Agent Controller, contracts steward). Any change goes through a pull request that
the steward approves. Code lives in `Assets/_Project/Scripts/Core/`.

Source: Game Design Document, Section 11. This file describes the agreed shape; the C# is written by
the owner in `Scripts/Core`.

## `WorldSnapshot`

Read-only view of the world handed to every brain on each tick.

| Field | Meaning | Produced by |
|---|---|---|
| Player pose | Position, facing, stance (crouch / walk / sprint) | Player controller |
| Sightings | Timestamped player sightings from agents and cameras | Sensors |
| Noise events | Position, radius, source type, time | Player / Interaction / Weapon / Gameplay (noise emitters) |
| Door and barricade states | Open / closed / locked; crate positions | Interaction, Level |
| Zone power | Which zones are overridden (lighting state) | Gameplay, Level |
| Alarm level | 0–100 | Gameplay |

## `AgentCommand`

What a brain asks its body to do.

| Field | Meaning | Consumed by |
|---|---|---|
| Path | Array of points to follow | Motor |
| Look target | Point to face or aim at | Motor |
| Fire flag | Whether to fire this tick | Motor / weapon on the agent |
| Animation intent | e.g. Patrol, Search, Pursue, Attack, Peek, Flank | Motor / Animator |

## `IAgentBrain`

```
AgentCommand Tick(WorldSnapshot snapshot)
```

Brains are plain C# classes that never touch GameObjects. Each brain decides at its own interval
(GDD Section 8): Director 3–5 s, Hunter 0.25 s plus on each noise event, Duelist 0.4 s,
Pathfinder 0.5 s plus on graph change.

## `NoiseEvent`

Shared data type, placed in `Scripts/Core` so Sensors and AI can read it without referencing Player.
Emitters are written by the Systems Engineer in `Scripts/Player/Noise`.

| Field | Meaning |
|---|---|
| Position | World position of the source |
| Radius | Metres, from the GDD noise table (tuned in `Data/Noise`) |
| Source | Rifle shot, hack beep, canister impact, footsteps, door, crate… |
| Time | When it happened |

Rule from the GDD: a closed door between source and listener halves the radius.

## Change log

| Date | Change | Approved by |
|---|---|---|
| | | |
