# CrossBox

CrossBox contains common POSIX utilities writen with cross-platform C/C++.

This project is similar to BusyBox and Toybox, but has a different goal. Leveraging the capabilities of the modern C/C++ standard library, CrossBox implements cross-platform tools using *only* the standard library, eschewing conditional compilation and system-specific dependencies. The goal is to explore the limits of what can be achieved with pure standard C/C++.

CrossBox is currently under active development. Below is a list of the utilities that have been completed so far:

- true
- false
