RE_DASH <- "^[0-9]+-[0-9]+(-[0-9]+)?$"
RE_DOT <- "^[0-9]+\\.[0-9]+(\\.[0-9]+)?$"

redact_port <- function(x) {
  gsub(":[0-9]+", ":<port>", x)
}
