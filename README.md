# dotfiles
dotfiles and configuration from the windows machine

# How to guide
Source: [Harfang's Perch](https://harfangk.github.io/) 

## Manage Dotfiles With a Bare Git Repository
Sep 18, 2016

After switching from Sublime Text to vim, I started looking for a way to manage my dotfiles. It took me a lot of work to configure and understand them, so I wanted to back them up against emergency. And of course I wanted to have those personal settings wherever I work.

At first I considered Vagrant, but it seemed like an overkill for just a few dotfiles. My next idea was to symlink dotfiles to a single directory and manage that folder with git. But that also felt unnecessarily complex - surely there would be a simpler way to do this, right?

And then I found what I was looking for. This method uses a git bare repository, and aliasing git commands to send them to that repo. Simple setup process? Check. Version control in git? Check. Easy installation on different machine? Check. Awesome!

## Setup
Git is the only dependency. The following four lines will set up the bare repository.

```
git init --bare $HOME/.dotfiles.git
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
dotfiles config --local status.showUntrackedFiles no
```

1- Create a git bare repository at `~/.dotfiles.git` to track files.
2- Add alias setting to shell configuration file. I use zsh so it’s .zshrc. For bash, it’d be .bashrc. Note how the paths for git directory and working tree are set.
3- Reload the shell setting.
4- Prevent untracked files from showing up when we call dotfiles status.
5- That finishes the setup. Use the aliased command from the home directory to manage files, and use git remote repo if you want to manage the files online.

```
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles remote add origin https://www.github.com/username/repo.git
dotfiles push origin master
```

## Installing dotfiles to another system
It just needs two shell commands before fetching the remote repo.

```
echo 'alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME"' >> $HOME/.zshrc
source ~/.zshrc
echo ".dotfiles.git" >> .gitignore
git clone --bare https://www.github.com/username/repo.git $HOME/.dotfiles.git
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

1- Create alias to ensure that the git bare repository works without problem.
2- Reload the shell setting to use that alias.
3- Add .dotfiles.git directory to .gitignore to prevent recursion issues.
3- Clone the repo.
4- Check if it works fine.

If you already have configuration files with identical names, checkout will fail. Back up and remove those files. Skip back up if you don’t need them.
Prevent untracked files from showing up on dotfiles status.
That’s about it! Credit goes to anonymous giants in the Internet for coming up with this, and Nicola Paolucci for elegantly documenting the steps. Here’s the link to his original post.
