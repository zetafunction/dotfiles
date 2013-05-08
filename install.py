#!/usr/bin/env python

"""Installer script for dotfiles.

The script mirrors the files in this git repository by symlinking them into
$HOME. To make things easier to manage, the script rewrites a leading _
character into a . so that config files aren't hidden by default in the git
repository.

Things that would be nice to have in future versions:
- Substituting the path to the git repo (this implies copy rather than symlink)
  to alleviate the need for _dotfile_deps.
- Appending to files that may already exist (e.g. .profile)
"""

import glob
import os.path
import sys


def main(args):
  git_root = os.path.abspath(os.path.dirname(__file__))
  files = glob.iglob(os.path.join(git_root, '_*'))
  home = os.path.expanduser('~')
  for f in files:
    src = os.path.join(git_root, f)
    dest = os.path.join(home, '.' + os.path.basename(f)[1:])
    if os.path.lexists(dest):
      print 'Error: %s already exists, skipping...' % dest
      continue
    os.symlink(src, dest)


if __name__ == '__main__':
  main(sys.argv[1:])
