#' A function to import copied data in RStudio via clipboard, the use of Addins is also highly recommended
#'
#'
#' @return A data frame object named "x" in .GlobalEnv
#' @export
#'
#' @importFrom utils read.table
#' @importFrom rstudioapi getActiveDocumentContext
#' @importFrom utils head
#'
#' @examples
#'
#' #Copy (Ctrl+C) a excel/google sheets/ online table such as the table:
#' #https://en.wikipedia.org/wiki/Standard_normal_table
#'
#' #Then push Addins -> shortcuts / Copy Paste or Run the following code:
#' copypaste()
#'
#' #Check your data
#' if("x" %in% ls()){x}
#'
copypaste<-function(){
  ctx<-try(rstudioapi::getActiveDocumentContext(),silent=TRUE)
  if (!inherits(ctx,"try-error")){
    assign_to_global <- function(pos=1){
      df<-try(utils::read.table("clipboard"),silent=TRUE)
      if(inherits(df,"try-error")){
        assign("x", df, envir=as.environment(pos))
      }
    }
    sMSG<-suppressWarnings(try(expr = assign_to_global()
                               ,silent = TRUE))
    print(head(sMSG))
  }
  return(invisible())
}
