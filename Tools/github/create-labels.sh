#!/usr/bin/env bash
# Creates the OVERRIDE issue labels. Requires the GitHub CLI (gh), logged in with: gh auth login
# Usage: ./Tools/github/create-labels.sh <owner>/<repo>
set -euo pipefail
REPO="${1:?Usage: $0 <owner>/<repo>}"

label() { gh label create "$1" --repo "$REPO" --color "$2" --description "$3" --force; }

# Type
label "bug"      "d73a4a" "Something is broken"
label "task"     "0e8a16" "Planned piece of work"

# Severity (Workplan Section 10)
label "critical" "b60205" "Crash or blocks progress; fix before any new feature"
label "major"    "d93f0b" "Feature broken"
label "minor"    "fbca04" "Visual or small"

# Areas
label "player"      "1d76db" "Player controller, camera, movement"
label "weapon"      "1d76db" "Rifle, recoil, sway, reload, effects"
label "interaction" "1d76db" "Doors, barricades, throwable"
label "gameplay"    "1d76db" "Terminals, hacking, waves, respawn"
label "ui"          "1d76db" "HUD and menus"
label "audio"       "1d76db" "Sound and mixers"
label "level"       "5319e7" "Greybox, markup, lighting, NavMesh, textures"
label "art"         "5319e7" "Custom models, UVs, materials"
label "sensors"     "0052cc" "Vision and hearing"
label "motor"       "0052cc" "Path following, rotation, animation"
label "director"    "006b75" "Director agent (ARGUS Core)"
label "hunter"      "006b75" "Hunter agent (Seeker)"
label "duelist"     "006b75" "Duelist agent (Warden)"
label "pathfinder"  "006b75" "Pathfinder agent (Wisp)"
label "debug"       "c5def5" "F1 overlay and gizmos"
label "build"       "bfdadc" "Project settings, packages, builds"
label "docs"        "bfdadc" "Design logs, evidence, README"

echo "Labels created on $REPO"
