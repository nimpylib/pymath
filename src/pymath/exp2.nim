
from ./platformUtils import CLike, clikeOr
import ./comptime/exp2 as pure_exp2

when CLike:
  {.push header: "<math.h>".}
  proc c_exp2*(x: cdouble): cdouble{.importc: "exp2".}
  proc c_exp2*(x: cfloat): cfloat{.importc: "exp2f".}
  {.pop.}

func n_exp2*[F: SomeFloat](x: F): F = pure_exp2.exp2(x)

proc exp2*[F: SomeFloat](x: F): F =
  clikeOr(
    c_exp2(x),
    pure_exp2.exp2(x)
  )

