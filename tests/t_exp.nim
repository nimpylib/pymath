
import std/unittest
import std/math

import pymath/exp2 as pub_exp2
import pymath/comptime/exp2 as pure_exp2

template checkClose(got, expected: float; tol = 1e-14) =
  check abs(got - expected) <= tol * max(1.0, abs(expected))

test "exp2 exact powers":
  check pub_exp2.exp2(0.0) == 1.0
  check pub_exp2.exp2(1.0) == 2.0
  check pub_exp2.exp2(10.0) == 1024.0
  check pub_exp2.exp2(-4.0) == 0.0625

test "exp2 fractional values":
  checkClose pub_exp2.exp2(0.5), sqrt(2.0)
  checkClose pub_exp2.exp2(-0.5), 1.0 / sqrt(2.0)
  checkClose pub_exp2.exp2(3.25), 9.513656920021768
  checkClose pub_exp2.exp2(-12.75), 0.0001451668841556056

test "compiletime exp2":
  const
    a = pure_exp2.exp2(0.5)
    b = pure_exp2.exp2(-8.0)
    c = pure_exp2.exp2(5.25'f32)
  checkClose a, sqrt(2.0)
  check b == 1.0 / 256.0
  check abs(c - 38.054627'f32) <= 1e-5'f32

test "exp2 special values":
  check pub_exp2.exp2(Inf) == Inf
  check pub_exp2.exp2(NegInf) == 0.0
  check pub_exp2.exp2(1025.0) == Inf
  check pub_exp2.exp2(-1076.0) == 0.0
  check classify(pub_exp2.exp2(NaN)) == fcNan

