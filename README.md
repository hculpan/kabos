# Development Notes

Sources:
https://github.com/cfenollosa/os-tutorial
http://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/

Setup:
1) Go to https://github.com/cfenollosa/os-tutorial/tree/master/11-kernel-crosscompiler
  - When building gcc, may have to specify path to gmp.h.  If you've installed with brew,
  then it will be /usr/local/include.  If configure fails, add argument
  "--with-gmp=/usr/local" and try again.
  - Add path to .profile
  - Building with gcc 4.9.4 instead of version specified in notes

2) Install nasm with brew

3) Install qemu with brew
