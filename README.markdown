Workzone
========

A thor based tool for the managment of sandbox project directories. 

Synopsis
========
    $ gem install workzone
    $ wz config --home=~/projects # TODO: not implemented
    $ wz project foobar
    ... do some work/play/investigation here ...
    $ wz ditch foobar --no-tar --i_am_sure # TODO: not implemented

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

This seems a bit repetitive, and I alt-tab and type faster than I click, so 
I've begun setting up a shell based workzone environment where I can create 
and destroy these play apps without worrying about ending up with a pile of 
dead gemsets and other crap I may forget to clean up. 

Finally, I wanted to play with Thor a bit because it looks very nice.

Documentation
=============

project NAME
------------

`wz project NAME [--no-git]` - creates a project directory at projects/NAME with some basic 
things like a .rvmrc file and an initialized git repo. If `--no-git` is given, the git repo
and .gitignore file are skipped. 

Future options may include:

* `--resurrect` - pull a tar from projects/abandoned and restore it to the projects directory
* `--github` - make a public github repo for this project
* `--ruby-version=1.9.2` - use the specified version of ruby in the .rvmrc file
* `--rails` - install the current version of rails in this project with some defaults
* `--sinatra` - install a sinatra skeleton in this project with some defaults

ditch NAME
----------

`wz ditch NAME` - creates a tar file containing the project and it's gemset 
in projects/abandoned/ and deletes the project directory at projects/NAME. 
This task will prompt the user to acknowledge that they are sure they want 
to destroy the project. 

Future options may include:

* `--no-tar` - don't create a tar file, just kill the project
* `--gemset-keep` - don't delete the gemset
* `--github` - also delete the project on github, if there is one
* `--i_am_sure` - avoid the "are you sure?" prompt, and just ditch it already.
