Workzone
========

Intended to be a set of thor tasks for the managment of projects. 

Synopsis
========
  `thor project foobar`
    #=> creates directory `projects/foobar`
    #=> creates a gemset called `foobar` in rvm
    #=> installs basic files and gems
    
  `thor project foobar --destroy --no-tar --i_am_sure`

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

Oh, and also, I wanted to play with Thor a bit.

So the first tasks are being built as follows:

project NAME
------------

`thor project NAME` - creates a project directory at projects/NAME with some basic 
things like a .rvmrc file and an initialized git repo. 

Future options may include:

* `--resurrect` - pull a tar from projects/abandoned and restore it to the projects directory
* `--github` - make a public github repo for this project
* `--ruby-version=1.9.2` - use the specified version of ruby in the .rvmrc file
* `--rails` - install the current version of rails in this project with some defaults
* `--sinatra` - install a sinatra skeleton in this project with some defaults

project NAME --destroy
----------------------

`thor project NAME --destroy` - creates a tar file in projects/abandoned/ and 
deletes the project directory at projects/NAME. This task will prompt the user to acknowledge
that they are sure they want to destroy the project. 

Future options may include:

* `--no-tar` - don't create a tar file, just kill the project
* `--keep-gemset` - don't delete the gemset
* `--github` - also delete the project on github, if there is one
* `--i_am_sure` - avoid the "are you sure?" prompt, and just destroy my 
project already.

License
=======

<a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by-sa/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" href="http://purl.org/dc/dcmitype/Text" property="dct:title" rel="dct:type">workzone</span> by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Christopher Maujean</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">Creative Commons Attribution-ShareAlike 3.0 Unported License</a>.<br />Permissions beyond the scope of this license may be available at <a xmlns:cc="http://creativecommons.org/ns#" href="mailto:cmaujean@gmail.com" rel="cc:morePermissions">mailto:cmaujean@gmail.com</a>.


Author
======
Christopher Maujean <cmaujean@gmail.com>
