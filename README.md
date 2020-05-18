**STYRENE** is a blackbox optimization problem offered as a benchmark case for the derivative-free optimization community. It simulates a styrene production process, seen as a blackbox simulation for which derivatives do not exist.
The objective is to maximize the net present value subject to several process and economic constraints.
The code is standard C++ initially developed by [Vincent Béchard](https://www.linkedin.com/in/vincentbechard/).

Two versions are provided in the [`blackbox/`](blackbox/) directory:
- [`blackbox/truth/`](blackbox/truth/) corresponds to the "true" blackbox, the one to optimize.
- [`blackbox/surrogate/`](blackbox/surrogate/) corresponds to a static surrogate, i.e. a cheaper but imprecise approximation of the true blackbox. It is typically used to assist an optimization algorithm for the optimization of the true problem.

The problem is defined by 8 optimization variables, all scaled in `[0;100]`, and 11 constraints of the form `c_j(x) <= 0`, divided in two groups: 4 unrelaxable and nonquantifiable constraints and 7 relaxable and quantifiable constraints, following the taxonomy of constraints defined [here](https://www.mcs.anl.gov/~wild/taxcon/).

The blackbox execution gives 12 outputs: The 11 constraints values and the objective. A point is feasible when the 11 first outputs are lower than or equal to zero.

Finally two starting points are provided in [`points/`](points/):
- [`points/x0_feasible.txt`](points/x0_feasible.txt): Feasible.
- [`points/x0_infeasible.txt`](points/x0_infeasible.txt): Infeasible.


### Compilation:

Makefiles are provided for the true and surrogate problems.
To compile, go to [`blackbox/truth/`](blackbox/truth/) or [`blackbox/surrogate/`](blackbox/surrogate/) and type `make`.
This will create the executable files `blackbox/truth/truth.exe` and `blackbox/surrogate/surrogate.exe`.
To compile on Windows, it is possible to create a MS Visual project from the C++ source files. For convenience, an already compiled executable of the true problem is provided ([`blackbox/truth/truth_WINDOWS.exe`](blackbox/truth/truth_WINDOWS.exe)).

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

`x.txt` is a text file containing the 8 coordinates of the point to evaluate, each in `[0;100]`, separated by spaces or line breaks. Examples of points can be found in [`points/`](points/).

### Best solution:

The current best solution is provided in [`points/xs.txt`](points/xs.txt). Its coordinates are
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

This solution has been obtained with [`NOMAD`](https://www.gerad.ca/nomad/) from a design proposed by [Solène Kojtych](https://www.gerad.ca/en/people/solene-kojtych). The previous best solution was provided by [Mathieu Tanneau](https://www.gerad.ca/en/people/mathieu-tanneau).


### Solvers:

The [`solvers/`](solvers/) directory includes executions of the two solvers [`NOMAD`](https://www.gerad.ca/nomad/) and [`PSwarm`](http://www.norg.uminho.pt/aivaz/pswarm/). Note that the latter showcases an interface between **STYRENE** and MATLAB.


### Reference:
The problem was described in the followind [reference](http://dx.doi.org/doi:10.1007/s10898-007-9234-1).
Please cite it if you use **STYRENE**.

```
@article{AuBeLe08,
  Author    = {C. Audet and V. B\'echard and S. {Le~Digabel}},
  Title     = {Nonsmooth optimization through Mesh Adaptive Direct Search and Variable Neighborhood Search},
  Journal   = {Journal of Global Optimization},
  Volume    = {41},
  Number    = {2},
  Pages     = {299--318},
  Doi       = {10.1007/s10898-007-9234-1},
  Url       = {http://dx.doi.org/doi:10.1007/s10898-007-9234-1},
  Year      = {2008}
}
```
