if (interactive() || isatty(stdout())) {
  options(colorout.verbose = 0)
  if (require("colorout", quietly = TRUE)) {
    # General ----------------------------------------
    colorout::setOutputColors(
      index = "\x1b[38;2;131;148;150m",
      normal = "\x1b[38;2;238;232;213m",
      number = "\x1b[38;2;181;137;0m",
      negnum = "\x1b[38;2;203;75;22m",
      zero = "\x1b[38;2;131;148;150m", zero.limit = 0.01,
      infinite = "\x1b[38;2;211;54;130m",
      string = "\x1b[38;2;133;153;0m",
      date = "\x1b[38;2;211;54;130m",
      const = "\x1b[38;2;108;113;196m",
      true = "\x1b[38;2;133;153;0m",
      false = "\x1b[38;2;220;50;47m",
      warn = "\x1b[38;2;181;137;0m",
      stderror = "\x1b[38;2;211;54;130m", error = "\x1b[38;2;211;54;130m",
      verbose = FALSE
    )
  }
}


options(repos = c(CRAN = "https://mirrors.nic.cz/R/"))

q <- function(save = "no", ...) {
  quit(save = save, ...)
}

options(device=httpgd::hgd)
