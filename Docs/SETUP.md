# First-time setup

## A. Repo owner (one person, once)

1. **Pin the Unity LTS version** with the team and write it into `README.md`.
2. **Create the GitHub organization** (e.g. `override-team`) and a **private** repository `override-game`.
   Invite all four members.
3. **Create the Unity project.** In Unity Hub, create a new **Universal 3D (URP)** project named
   `override-game` in an empty location. (Unity Hub may refuse to create a project inside a non-empty
   folder, which is why the project comes first and the starter files are copied in afterwards.)
4. **Copy the starter files** into the project folder so `.gitignore`, `.gitattributes`, `README.md`,
   `Docs/`, `ArtSource/`, `Tools/`, `.github/` and `Assets/_Project/` sit next to Unity's
   `Assets/`, `Packages/` and `ProjectSettings/`. Merge the `Assets/` folders.
5. **Unity settings** (Edit → Project Settings → Editor):
   - Version Control → Mode: **Visible Meta Files**
   - Asset Serialization → Mode: **Force Text**
   Then Edit → Project Settings → Player → Active Input Handling: **Input System Package (New)**,
   and install the **Input System** package if it is not already there.
6. Open the project once so Unity creates `.meta` files for every folder and asmdef.
   Check the Console: there should be no compile errors.
7. **First commit and push:**
   ```
   git init
   git lfs install
   git add .gitattributes .gitignore
   git commit -m "[Build] Add gitignore and LFS attributes"
   git add .
   git commit -m "[Build] Add Unity URP project and folder structure"
   git branch -M main
   git remote add origin <REPO_URL>
   git push -u origin main
   git checkout -b develop
   git push -u origin develop
   ```
   Commit `.gitattributes` **before** any binary file, otherwise those files go into normal Git
   instead of LFS.
8. **GitHub settings:**
   - Settings → General → Default branch: `develop`.
   - Settings → Rules (rulesets) or Branches → protect `main` and `develop`: require a pull request,
     1 approval, review from Code Owners, block force pushes and deletions.
     Branch protection on **private** repos may require a paid or education plan; check GitHub's
     current plans (the GitHub Student Developer Pack may cover it).
   - Replace the placeholder usernames in `.github/CODEOWNERS`.
   - Run `Tools/github/create-labels.sh` to create the bug and area labels.
   - Create a GitHub Project board with columns: Backlog, This phase, In progress, Review, Done.
9. Check GitHub's current **Git LFS storage and bandwidth limits** for your plan. Four people cloning
   textures and models can use up a small free quota quickly.

## B. Every member (once)

1. Install Git, Git LFS and the pinned Unity version (with URP).
2. `git lfs install`
3. `git clone <REPO_URL>` then `git checkout develop`
4. Open in Unity Hub. Create your sandbox scene: `Assets/_Project/Scenes/Sandbox/<Name>.unity`.
5. Create your design log (already present) at `Docs/DesignLog/<Name>.md`.
6. **Register Unity's YAML merge tool** (used by `.gitattributes` for scenes and prefabs).
   Replace the path with your own install; check Unity's "Smart Merge" documentation for your version.

   Windows (Git Bash):
   ```
   git config merge.unityyamlmerge.name "Unity SmartMerge"
   git config merge.unityyamlmerge.driver "'C:/Program Files/Unity/Hub/Editor/<VERSION>/Editor/Data/Tools/UnityYAMLMerge.exe' merge -p %O %B %A %A"
   git config merge.unityyamlmerge.recursive binary
   ```
   macOS:
   ```
   git config merge.unityyamlmerge.name "Unity SmartMerge"
   git config merge.unityyamlmerge.driver "'/Applications/Unity/Hub/Editor/<VERSION>/Unity.app/Contents/Tools/UnityYAMLMerge' merge -p %O %B %A %A"
   git config merge.unityyamlmerge.recursive binary
   ```

## C. Daily loop

```
git checkout develop && git pull
git checkout -b feature/<area>-<thing>
# work, commit small: "[Area] Do the thing"
git pull origin develop        # before opening the PR
git push -u origin feature/<area>-<thing>
# open a pull request into develop; your buddy reviews
```
