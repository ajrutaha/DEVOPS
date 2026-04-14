# DEVOPS
# How can i install  git block
Using winget tool
Install winget tool if you don't already have it, then type this command in command prompt or Powershell.
winget install --id Git.Git -e --source wingeto

Please check out here more [information]: [https://github.com "GitHub Homepage"](https://git-scm.com/install/windows)

## The command i use for git

### For create the new branch:
```
git checkout -b
```
### For add the file i use:
```
git add filename 
```

### for commit that file :
```
git commit -m"feat: information about what i do"
```

### Then we can push with:
```
git push
```

## Git Commands Cheat Sheet

| Action                     | Command                                      | Description                                  |
|----------------------------|----------------------------------------------|----------------------------------------------|
| Create a new branch        | `git checkout -b <branch-name>`              | Creates and switches to a new branch         |
| Add file(s) to staging     | `git add <filename>`                         | Stages specific file(s) for commit           |
|                            | `git add .`                                  | Stages all changes (new, modified, deleted)  |
| Commit changes             | `git commit -m "feat: description"`          | Commits staged changes with a message        |
| Push changes to remote     | `git push`                                   | Pushes committed changes to remote branch    |
|                            | `git push -u origin <branch-name>`           | Pushes and sets upstream for new branch      |


```mermaid
gitGraph
    commit
    commit
    branch develop
    checkout develop
    commit
    commit
    checkout main
    merge develop
    commit
    branch feature
    checkout feature
    commit
    checkout develop
    merge feature
    checkout main
    merge develop
