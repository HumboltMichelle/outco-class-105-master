# Outcode Main

Welcome to the Outco program! We are excited to have you begin on the journey towards mastering the interview process. This repository contains the assignments that you will work on throughout the course. Please make sure that you are familiarized with and have git installed on your personal machine.

**In order to get started, please follow the steps in the [Setup](#setup) section to complete the initial repo setup. This will only need to be done once.** Throughout the program you will need to submit homework assignments to your forked repo using standard git operations/commands, and you can see instructions for that here: [Submitting Homework Assignments](#submitting-homework-assignments). For a breakdown of different git commands, refer to the [Git Commands to Know](#git-commands-to-know) section. For details on how the git repo workflow looks, you can observe the diagram in the [Class Repo Workflow](#class-repo-workflow) section. In addition to your repo homework assignments, we have also provided hackerrank challenges as a checkpoint on your knowledge and additional practice at the end of each week: [Weekly Hackerrank Challenges](#weekly-hackerrank-challenges).

## Table of Contents
* [About Folders in This Repo](#about-folders-in-this-repo)
  * [Homework](#homework)
  * [Target Practice](#target-practice)
  * [Warm Up](#warm-up)
  * [Whiteboarding](#whiteboarding)
* [Setup](#setup)
* [Testing Homework & Target Practice Files](#testing-homework--target-practice-files)
* [Submitting Homework Assignments](#submitting-homework-assignments)
* [Weekly Hackerrank Challenges](#weekly-hackerrank-challenges)
* [Git Commands to Know](#git-commands-to-know)
* [Class Repo Workflow](#class-repo-workflow)


## About Folders in This Repo

Throughout the program you'll see 4 different types of folders/exercises discussed below. As the assignment files appear in the coming days, you'll notice they are prefixed with 'w\#\_d\#'. This will reflect the program **w**&#8203;eek number and **d**&#8203;ay number that assignments are to be started.

### Homework
This folder holds all the homework assignments, they are broken up into different topics which go along with the technical video and online content of the course. You will have the option of several languages to choose from to complete the assignments.

### Target Practice
This folder holds all the class work that you will be working on in pair programming. They are meant to give you repetition and enhance your understanding of the technical topics covered on a technical class day. As with the homework assignments, you'll have several languages to choose from to attempt the practice.

### Warm Up
This folder holds some suggested markdown file problems to consider attempting/reviewing on a particular program day.

### Whiteboarding
This folder holds all the class work files that you will be using for pair mock interviewing in class. They are meant to give you a chance to practice interviewing on technical topics discussed on a technical class day.




## Setup
The following actions need to only be performed once.

**1. Fork Repo** - Since you are here, you are a now a read-only member of this class repository. You will need to generate your own fork of this repo from which you will be working out of during this program.

  ***Click the `Fork` button at the top right corner of the page***

  ***Click your Github username as the place to fork the class repo***

**2. Local Fork Copy**  - After forking the class repo, to get a local copy of the fork, first get the URL of your fork. On your machine terminal, move to a directory you would like to hold this repository and clone the repository by running the command for your fork URL as follows (replacing `{}` placeholders with the relevant details):

```
git clone https://github.com/{YOUR_GITHUB_USERNAME}/outco-class-{CLASSNUMBER}
```

**3. Set Fork Upstream** - After cloning a copy of your fork, you'll need to set the upstream of your fork to the class repo you forked from. While in the directory of the local copy of your fork, run the following from your terminal:

```
git remote add upstream https://github.com/OutcoSF/outco-class-{CLASSNUMBER}
```

This will allow you to pull/rebase new class files (including homework, warmup, target practice, and whilteboarding prompts and solutions) to your fork if you desire. **Pulling/rebasing from the class repo is completely optional, but you are still required to push/submit homework assignments to your fork.**



## Testing Homework & Target Practice Files
Tests are located at the bottom of each homework and target practice file. No testing framework is needed. To view the tests, simply compile and run the file for the language of your choice. You will need to make sure the compiler and code runner for the language is installed on your machine.

**For example when running a python file from terminal on your machine:**
```
python 04_helper_method_recursion.py
```

Or copy the contents of the file into an online compiler such as [Codeinterview.io](https://codeinterview.io/), [Codepad](https://codepad.remoteinterview.io/), or
[Repl.it](https://repl.it/languages/javascript).

Do note that there are no tests for the complexity homework.

## Submitting Homework Assignments
Please view your syllabus to ensure you submit your homework by the deadlines.

To submit an assignment, move into the repository in your terminal and do the following
1. `git add --all` to stage all changes in your local repo
2. `git commit -m "{YOUR_MESSAGE}"` to commit staged changes in your local repo
3. `git push origin master` to push your committed changes to the remote (origin) instance of your fork.

Upon your work being pushed up, we will view your work from GitHub. If you run into any issues pushing to your fork, be sure to run a `git pull` first and resolve any changes before you attempt to push to your fork again.

You can check the section on [Git Commands to Know](#git-commands-to-know) for more information on the git commands in this section.


## Weekly Hackerrank Challenges

Here is a list of Hackerrank challenges that are meant to be taken after each week of the course to help you assess your progress. Let us know if you run into any errors since we can add time to the challenge.

[Week 1](http://hr.gs/outco_week1comp)

[Week 2](http://hr.gs/outco_week2comp)

[Week 3](http://hr.gs/outco_week3comp)

[Week 4](http://hr.gs/outco_week4comp)

## Git Commands to Know

This program requires you to know the basics of using git commands so you should take the time to familiarize yourself with the workflow for your local repository.

Check changed files:
```
git status
```

Command for git adding files for a specific file or for all changed files, respectively:
```
git add PATH/TO/FILE
OR
git add --all
```

Command for git committing:
```
git commit -m "YOUR MESSAGE HERE"
```

Command to set the upstream repo for your fork to refer to:
```
git remote add upstream https://github.com/OutcoSF/outco-class-{CLASSNUMBER}
```


Command for rebasing in any new files rom the upstream repo (**this is completely optional**):
```
git pull --rebase upstream master
```

Command for pushing up to your unique repository on GitHub:
```
git push origin master
```



## Class Repo Workflow
For your clarity, below is a diagram that gives a breakdown of the workflow we are following in this class with this repo and how data will flow as you run the commands mentioned in subsequent sections for this workflow. You are not required to rebase any files from the class repo to your fork, but you are more than welcome to! Just bear in mind that you will need to perform a git merge locally when you do, before you can push anything up to your fork after that.

![Git Workflow](https://res.cloudinary.com/outco-io/image/upload/v1600383288/4-week-program_Repo_workflow.png)
