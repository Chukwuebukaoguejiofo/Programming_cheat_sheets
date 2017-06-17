# Fortran

```fortran
! foo.f95

program hello
   Print *, "Hello World!"
end program Hello
```

```bash
brew install gcc

# compile fortran:
gfortran  -std=f95 foo.f95 -o foo

# execute:
./foo

# output
#=> Hello World!
```
