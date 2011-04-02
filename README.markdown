Workzone
========

Intended to be a set of thor tasks for the managment of projects. 

Description
===========

I have many project directories that I create and destroy, when playing 
with things or working out an issue. I use rvm to manage my ruby versions 
and clean gemsets. An example of the workflow I often find myself doing is: 

1. make a new rails app, or a dir for a sinatra app
2. add a .rvmrc file, with a new clean gemset
3. edit the Gemfile to bring in some standard gems
4. `bundle install`
5. `git init && git add . && git commit -m "initial commit"`
6. play with some stuff
7. maybe make some git commits during my play
8. done playing, don't need the dir anymore, archive and delete it
9. kill the gemset

This seems a bit repetitive, so i've begun setting up a workzone environment
where I can create and destroy these play apps without worrying about ending 
up with a pile of dead gemsets and other crap I may forget to clean up.

So the first tasks are being built as follows:

project:create
--------------

`thor project:create NAME` - creates a project directory with some basic 
things like a .rvmrc file and an initialized git repo. 

Future options may include:

* `--github` - make a public github repo for this project
* `--ruby-version=1.9.2` - use the specified version of ruby in the .rvmrc file

project:destroy
---------------

`thor project:destroy NAME` - creates a tar file in projects/abandoned/ and 
deletes the project directory. This task will prompt the user to acknowledge
that they are sure they want to destroy the project. 

Future options may include:

* `--no-tar` - don't create a tar file, just kill the project
* `--github` - also delete the project on github, if there is one
* `--i_am_sure` - avoid the "are you sure?" prompt, and just destroy my 
project already.


Author
======
Christopher Maujean <cmaujean@gmail.com>
