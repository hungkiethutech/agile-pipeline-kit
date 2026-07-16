# Apply Agile Pipeline Kit to a NEW project

Everything runs inside Claude Code, free (subscription). Do this once per new project.
For the one-command version, see `init.sh` in the README.

## Step A — Create the new project + folders
```bash
mkdir my-new-project && cd my-new-project
git init
mkdir -p specs design arch app qa security infra ops tickets status .claude/agents .claude/commands
```

## Step B — Copy the kit into the project
From the kit's `agile-pipeline-kit/` directory:
```bash
cp agile-pipeline-kit/agents/*.md            my-new-project/.claude/agents/
cp agile-pipeline-kit/commands/run-pipeline.md my-new-project/.claude/commands/
cp agile-pipeline-kit/pipeline.config.yml    my-new-project/
cp -r agile-pipeline-kit/catalog             my-new-project/
cp -r agile-pipeline-kit/templates           my-new-project/
cp agile-pipeline-kit/status/STATUS.template.html my-new-project/status/STATUS.html
```
(Faster: run `init.sh` — see the README "Quick setup".)

## Step C — Configure engines for the project
Open `pipeline.config.yml` and set:
- `project.name`, `project.stack`, `project.db`
- `stages.*.skill` / `stages.*.repo` — pick the engine for each stage
  (see `catalog/engines.md`).

## Step D — Create the first ticket
Create `tickets/T001.md`:
```markdown
# T001 - <feature name>
## Description
<the requirement, in plain words>
## Constraints
<if any>
## Status: NEW   (NEW -> stage1..stage7 -> DONE)
```

## Step E — Run the pipeline (in Claude Code)
Open Claude Code in the project directory and run:
```
/run-pipeline T001
```
The orchestrator will:
1. Read `pipeline.config.yml` + the ticket.
2. Run the 7 teams in order (stages 2 & 3 in parallel), each writing its artifact.
3. PAUSE at 2 human gates: after stage 1 (approve requirements) and before stage 6
   (approve deploy) — review the artifact, type "approve" to continue, or
   "revise: ..." to send it back to that team.
4. Update `status/STATUS.html` after each stage.

Open `status/STATUS.html` in a browser to track progress.

## Step F — (Optional) turn the kit into a reusable scaffold
Register the kit with the `vc-setup` skill so a single command scaffolds the whole
structure + agents + config into a new project, instead of the manual copy in Step B.
(Planned for a future phase.)

## Independence notes (important)
- Each team is a separate subagent with an isolated context — it does not see the internals of others.
- The QA team (stage 5) does NOT read `app/` source; it runs the app and reads `specs/`
  (acceptance criteria) and tests like a real user.
- The Dev team (stage 4) builds to `arch/schema.*` + `arch/openapi.yaml`, not its own invention.
