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
