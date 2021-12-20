# cc-setup-ubuntu

Sets up `apt` to work with `multi-arch`, so that you can pull dependency libraries for `arm64` and `armhf`. 

# How

```
git clone https://github.com/AENAC/cc-setup-ubuntu
sudo cc-setup-ubuntu/setup_arm_apt.sh
```

you're good to go.

```
sudo apt update
```

Then install what you need, for example: `sudo apt install libcurl4:arm64`. 

# What?

If you want to cross compile your C/C++ systems code for arm, you have four options:

1. Compile in a docker instance, which requires root privilidges, docker, and a build system that *understands it has to invoke docker*. That's heavy.
2. Compile in a `qemu` + `chroot` environment. That's also a tad heavy to set up
3. Cross-Compile all your dependencies, keep them in a safe place, and enforce that your compiler / linker look in those places. This is probably the best, but you may depend on a project that has a ... *strange* build system, meaning you now maintain some branch of those libraries that builds sanely on your system.  if you need to statically link to, say, `openssl`, good luck.
4. use debian `multiarch` to install local copies of the libraries for your target architecture. This *will* pollute your `/lib` directory with multiple copies.

We're of the opinion that, for most projects, (4) is the best option. 

In a sane world, you could simply run `dpkg --add-architecture <arch>`, then `apt update` and `apt install <pkg>:<arch>` as intended. This is ubuntu, so they made it a little harder.

This script will sort all that out for you.

# deb file

Is coming, alleviating any clone/sudo bash

