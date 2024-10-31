# Downconversion Mixer Design with Gilbert Cell 

# Tools Needed

## Nix

If you are running a system with Nix, all you need to do to
install all the tools is enter the development shell in
[fbe-flakes](https://github.com/fedeinthemix/fbe-flakes/tree/main) 
with
```shell
nix develop github:fedeinthemix/fbe-flakes#sky130a-dev -c $SHELL
# -c $SHELL is a flag to enter the current shell after
# instantiating the development shell instead of bash
```
