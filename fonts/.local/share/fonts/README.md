https://github.com/ejuarezg/containers.git
With private-build-plans.toml in build/
```
docker build -t iosevka_build . -f Dockerfile
docker run -it -v $PWD/build:/build iosevka_build ttf::iosevka-tjk
```
