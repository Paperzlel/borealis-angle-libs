# borealis-angle-libs
This is a wrapper around Google's ANGLE libs to build `libEGL`, `libANGLE` and `libGLESv2` by using Make instead of Ninja and automake, which overcomplicates the buildsystem for Borealis. The original necessary file list was taken from the [Godot implementation](https://github.com/godotengine/godot-angle-static) and all credit to them for getting the proper build flags set up. Unlike Godot, we are supporting Windows only as ANGLE is not required to be built on Linux distributions

Current ANGLE version is GH-bc81d7d