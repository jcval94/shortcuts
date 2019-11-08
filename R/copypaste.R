#' A function to import copied data in R via clipboard, the use of Addins is also highly recommended
#'
#'
#' @return A data frame object called "x" in .GlobalEnv
#' @export
#'
#' @importFrom utils read.table
#' @importFrom rstudioapi getActiveDocumentContext
#' @importFrom utils head
#'
#' @examples
#'
#' #Copy (Ctrl+C) a excel/google sheets/ online table such as:
#' #https://en.wikipedia.org/wiki/Standard_normal_table
#'
#' #Run
#' #copypaste()
#'
#' #Check your data
#' #x
#'
copypaste<-function(){
  ctx<-rstudioapi::getActiveDocumentContext()
  if (!is.null(ctx)){
    assign_to_global <- function(pos=1){
      df<-utils::read.table("clipboard")
      assign("x", df, envir=as.environment(pos) )
    }
    sMSG<-suppressWarnings(try(expr = assign_to_global()
                         ,silent = TRUE))
    print(head(sMSG))
  }
  return(invisible())
}