#!/usr/bin/python
'''
This script is to synchronize the files in *files1* and *filess*.
This script is to be improved
'''
import shutil
import os

HOME=r'/home/navy'

files1=['muttrc','vimrc.vim']
files2=[r'%s/.muttrc'%HOME,
        r'%s/.vim/plugin/vimrc.vim'%HOME]

def fail(message):
    print message
    exit()

def copyFiles(source, dest):
    if len(source)!=len(dest):
        fail("The files number in source and dest are not equle.")
    for i in range(len(source)):
        sfile=source[i]
        dfile=dest[i]
        if not os.path.isfile(sfile):
            fail("No file %s"%sfile)
        if not os.path.isfile(dfile):
            fail("No file %s"%dfile)
        shutil.copy(sfile, dfile)
        print "... copy: %s ---->  %s"%(sfile, dfile)

copyFiles(files2, files1)
