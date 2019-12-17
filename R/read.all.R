#' Read all documents in a folder and subfolders assigning them to the global environment; just extensions ".txt" and ".csv" are allowed
#'
#' @param dir directory to read
#'
#' @return data frame objects
#' @export
#'
#' @examples
#'
#'
#' lib<-getwd()
#'
#' read.all(lib)
#'
#'
read.all <- function(dir = getwd()) {
    lt <- list.files(dir)
    SPL <- do.call(c, lapply(lt, function(x)strsplit(x, ".", fixed = TRUE)))
    len <- sapply(SPL,function(x) unlist(length(x)))
    Reed <- lt[len > 1]
    Repeat <- lt[len == 1]
    if (length(Repeat) > 0) {
        read.all(Repeat)
    }
    if (length(Reed) > 0) {
        txt <- Reed[endsWith(Reed, ".txt")]
        csv <- Reed[endsWith(Reed, "csv")]
        dir_txt <- paste0(dir, "/", txt)
        dir_csv <- paste0(dir, "/", csv)
        readd <- function(tt, dir_) {
            i <- 0
            if (length(tt) > 0) {
                for (t in 1:length(tt)) {
                  cname <- gsub(" ", "_", tt[t])
                  ann <- dir_[t]
                  Leer <- try(read.csv(dir_[t]))
                  if (!inherits(Leer,"try-error")) {
                    Leer <- "Reading error"
                  }
                  return(assign(x = substr(cname, 1, nchar(cname) - 4), value = Leer, envir = globalenv()))
                }
            }
        }
        if (length(txt) > 0) {
            readd(txt, dir_txt)
        }
        if (length(csv) > 0) {
            readd(csv, dir_csv)
        }
    }
    invisible()
}
