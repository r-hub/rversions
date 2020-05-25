
cached_nicks <- function() {
  c("0.60" = NA, "0.61" = NA, "0.61.1" = NA,
    "0.61.2" = NA, "0.61.3" = NA, "0.62" = NA,
    "0.62.1" = NA, "0.62.2" = NA, "0.62.3" = NA,
    "0.62.4" = NA, "0.63" = NA, "0.63.1" = NA,
    "0.63.2" = NA, "0.63.3" = NA, "0.64" = NA,
    "0.64.1" = NA, "0.64.2" = NA, "0.65" = NA,
    "0.65.1" = NA, "0.90" = NA, "0.90.1" = NA,
    "0.99" = NA, "1.0" = NA, "1.0.1" = NA, "1.1" = NA,
    "1.1.1" = NA, "1.2" = NA, "1.2.1" = NA, "1.2.2" = NA,
    "1.2.3" = NA, "1.3" = NA, "1.3.1" = NA, "1.4" = NA,
    "1.4.1" = NA, "1.5.0" = NA, "1.5.1" = NA,
    "1.6.0" = NA, "1.6.1" = NA, "1.6.2" = NA,
    "1.7.0" = NA, "1.7.1" = NA, "1.8.0" = NA,
    "1.8.1" = NA, "1.9.0" = NA, "1.9.1" = NA,
    "2.0.0" = NA, "2.0.1" = NA, "2.1.0" = NA,
    "2.1.1" = NA, "2.2.0" = NA, "2.2.1" = NA,
    "2.3.0" = NA, "2.3.1" = NA, "2.4.0" = NA,
    "2.4.1" = NA, "2.5.0" = NA, "2.5.1" = NA,
    "2.6.0" = NA, "2.6.1" = NA, "2.6.2" = NA,
    "2.7.0" = NA, "2.7.1" = NA, "2.7.2" = NA,
    "2.8.0" = NA, "2.8.1" = NA, "2.9.0" = NA,
    "2.9.1" = NA, "2.9.2" = NA, "2.10.0" = NA,
    "2.10.1" = NA, "2.11.0" = NA, "2.11.1" = NA,
    "2.12.0" = NA, "2.12.1" = NA, "2.12.2" = NA,
    "2.13.0" = NA, "2.13.1" = NA, "2.13.2" = NA,
    "2.14.0" = "Great Pumpkin", "2.14.1" = "December Snowflakes",
    "2.14.2" = "Gift-Getting Season",
    "2.15.0" = "Easter Beagle", "2.15.1" = "Roasted Marshmallows",
    "2.15.2" = "Trick or Treat", "2.15.3" = "Security Blanket",
    "3.0.0" = "Masked Marvel", "3.0.1" = "Good Sport",
    "3.0.2" = "Frisbee Sailing", "3.0.3" = "Warm Puppy",
    "3.1.0" = "Spring Dance", "3.1.1" = "Sock it to Me",
    "3.1.2" = "Pumpkin Helmet", "3.1.3" = "Smooth Sidewalk",
    "3.2.0" = "Full of Ingredients", "3.2.1" = "World-Famous Astronaut",
    "3.2.2" = "Fire Safety", "3.2.3" = "Wooden Christmas-Tree",
    "3.2.4" = "Very Secure Dishes", "3.2.5" = "Very, Very Secure Dishes",
    "3.3.0" = "Supposedly Educational", "3.3.1" = "Bug in Your Hair",
    "3.3.2" = "Sincere Pumpkin Patch", "3.3.3" = "Another Canoe",
    "3.4.0" = "You Stupid Darkness", "3.4.1" = "Single Candle",
    "3.4.2" = "Short Summer", "3.4.3" = "Kite-Eating Tree",
    "3.4.4" = "Someone to Lean On", "3.5.0" = "Joy in Playing",
    "3.5.1" = "Feather Spray", "3.5.2" = "Eggshell Igloo",
    "3.5.3" = "Great Truth", "3.6.0" = "Planting of a Tree",
    "3.6.1" = "Action of the Toes", "3.6.2" = "Dark and Stormy Night",
    "3.6.3" = "Holding the Windsock", "4.0.0" = "Arbor Day"
  )
}

get_nicknames <- function(vers = r_versions(dots = TRUE)$version) {
  dash_vers <- gsub(".", "-", vers, fixed = TRUE)
  first_nick <- match("2-15-0", dash_vers)
  if (is.na(first_nick)) first_nick <- 1L
  urls <- sprintf(
    "https://svn.r-project.org/R/tags/R-%s/VERSION-NICK",
    dash_vers[first_nick:length(dash_vers)])

  nicks <- fetch_all(urls)
  res <- rep(NA_character_, length(dash_vers))
  names(res)[first_nick:length(dash_vers)] <- urls
  res[names(nicks)] <- unname(nicks)
  structure(unlist(unname(res)), names = vers)
}

fetch_all <- function(urls) {
  pool <- curl::new_pool(total_con = 100, host_con = 6, multiplex = TRUE)
  results <- list()
  lapply(urls, function(u) {
    h <- curl::new_handle(url = u)
    curl::multi_add(
       h, pool = pool,
       done = function(resp) results[[u]] <<- resp,
       fail = function(err) results[[u]] <<- err)
  })
  curl::multi_run(pool = pool)

  lapply_named(results, get_content)
}

get_content <- function(response, url) {
  if (!is.list(response) || is.null(response$content)) {
    stop("Failed to download ", squote(url))
  }
  str_trim(rawToChar(response$content))
}

lapply_named <- function(X, FUN, ...) {
  mapply(FUN, X, names(X), ..., SIMPLIFY = FALSE)
}

str_trim <- function(x) {
  sub("\\s$", "", sub("^\\s", "", x))
}

squote <- function(x) {
  paste0("'", x, "'")
}
