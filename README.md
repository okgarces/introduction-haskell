# First steps

1. Download Docker Image 
```
docker pull haskell
```

2. Run image and mount host volume
```
docker run -v `pwd`:/home -w /home -it -rm haskell
```

or you can run the make file

```
make start
```
