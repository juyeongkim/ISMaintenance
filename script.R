library(ImmuneSpaceR)

con <- CreateConnection("", login = Sys.getenv("ISR_login"), password = Sys.getenv("ISR_pwd"))
res <- con$.__enclos_env__$private$.checkRawFiles()

if (!all(vapply(res, function(df) all(df$file_exists), logical(1)))) {
  missing <- lapply(res, function(df) {
    if (nrow(x) > 0) cat(df[!df$file_exists, "file_link"], sep = "\n")
  })
  stop("We are missing raw files!!!")
}
