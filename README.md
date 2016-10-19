# build-skeleton
This is a template for the collection of scripts needed for performing various CI tasks (test, build,
tag, release).

## Pre-requisites
* [Jenkins](https://jenkins.io/)
* [Job DSL Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Job+DSL+Plugin)
* [Git Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin)

(Additional plugins will likely also be required, depending on what's to be built.)

## Files
* **setup.job** - Job definition file, written in the [Job DSL](https://wiki.jenkins-ci.org/display/JENKINS/Job+DSL+Plugin).
    This is the "Seed Job" responsible for installing the other jobs in Jenkins.
* **<TASK>.sh** - The shell script responsible for performing the work needed for a specific task.

## Installing the seed job.
1. Create a new FreeStyle job.
2. In the General section:
  * Specify a project name.
3. In the "Source Code Management" section:
  1. Select "Git"
  2. Specify the GitHub project (e.g. [https://github.com/NCIOCPL/build-skeleton](https://github.com/NCIOCPL/build-skeleton)).
  3. Select the set of GitHub credentials to use.
  4. Click the "Advanced" button
  5. For "Name" enter "origin"
  6. Verify the value for "Branch Specifier"
3. In the Build section:
  1. Click the "Add build step" button.
  2. Select "Process Job DSLs."
  3. Verify that "Look on Filesystem" is selected.
  4. For "DSL Scripts," specify "setup.job" (the actual script file will be downloaded automatically)
4. Click the "Save" button.

