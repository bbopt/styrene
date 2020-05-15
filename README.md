# UNDER CONSTRUCTION


# STYRENE

### Description:

The STYRENE blackbox optimization problem.

SGTE

BENCHMARK

C++

BORNES
X0


### Compilation:

Makefiles are provided for the true and surrogate problems.
To compile, go to ```./blackbox/truth/``` or ```./blackbox/surrogate/``` and type ```make```.
This will create the executable files ```./blackbox/truth/truth.exe``` and ```./blackbox/surrogate/surrogate.exe```.
To compile on Windows, it is possible to create a MS Visual project from the C++ source files. For convenience, an already compiled executable of the true problem is provided (```./blackbox/truth/truth_WINDOWS.exe```).

### Usage:

From the top directory of the project, type
```
./blackbox/truth/truth.exe x.txt
```
to execute the true blackbox and
```
./blackbox/surrogate/surrogate.exe x.txt
```
to execute the surrogate.

```x.txt``` is a text file containing the 8 coordinates of the point to evaluate, each in [0;100], separated by spaces or line breaks.

### Best solution:

The current best solution is provided in ```points/xs.txt```. Its coordinates are
```
100 87.78846202 95.30539348 0.01984 0 49.03658841 32.27499794 41.10932603
```

The outputs of the blackbox are obtained with the command
```
./blackbox/truth/truth.exe ./points/xs.txt
```
which gives
```
0 0 0 0 -0.00712888 -0.00920394 -0.581333 -0.75 -6696 -0.566366 -0.413865 -3.37101e+07
```
for an objective value of ```-3.37101e+07```.

This solution has been obtained from a design proposed by [Solène Kojtych](https://www.gerad.ca/en/people/solene-kojtych). The previous best solution was provided by [Mathieu Tanneau](https://www.gerad.ca/en/people/mathieu-tanneau).


### Solvers:

MATLAB


### Reference:
The problem was described in the followind [reference](http://dx.doi.org/doi:10.1007/s10898-007-9234-1).
Please cite it if you use STYRENE.

```
@article{AuBeLe08,
  Author    = {C. Audet and V. B\'echard and S. {Le~Digabel}},
  Title     = {Nonsmooth optimization through Mesh Adaptive Direct Search
               and Variable Neighborhood Search},
  Journal   = {Journal of Global Optimization},
  Volume    = {41},
  Number    = {2},
  Pages     = {299--318},
  Publisher = {Springer},
  Issn      = {0925-5001 (Print) 1573-2916 (Online)},
  Doi       = {10.1007/s10898-007-9234-1},
  Url       = {http://dx.doi.org/doi:10.1007/s10898-007-9234-1},
  Year      = {2008}
}
```
