
# pymath

[![Test](https://github.com/nimpylib/pymath/actions/workflows/ci.yml/badge.svg)](https://github.com/nimpylib/pymath/actions/workflows/ci.yml)
[![Docs](https://github.com/nimpylib/pymath/actions/workflows/docs.yml/badge.svg)](https://github.com/nimpylib/pymath/actions/workflows/docs.yml)
<!--[![Commits](https://img.shields.io/github/last-commit/nimpylib/pymath?style=flat)](https://github.com/nimpylib/pymath/commits/)-->

---

[Docs](https://nimpylib.github.io/pymath/)


Nim's Python-like math,  but raises no catchable exception,
using `errno` to report math error.
a.k.a. non will be raised (but not for `Defect`s)

which allows fast code.

For Python-like error handler (exception-based), see [Lib/math](https://docs.nimpylib.org/Lib/math.html)

Also
this is not just a module that wraps
Nim's [std/math](https://nim-lang.org/docs/math.html>),

but also providing some extensions that Nim's std/math lacks, for example:

- JavaScript Backend and Compile-time (Nim VM) support for `ldexp`, `frexp`, `cbrt`, etc.
- JavaScript Backend support for `erf`, `erfc`, `gamma`_, `lgamma`_
- `fsum`_, `prod`_, etc.

And fix some non-C99 behavior on some systems,
e.g. log(-ve) -> -Inf on Solaris


