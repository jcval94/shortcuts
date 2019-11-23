#' Displays all arguments and its values from a selected R function
#' @return arguments ready to run
#' @export
#'
#' @examples
#'
#' #Copy and paste the following code in RStudio
#' 
#' #Select the following line of code & push Addins -> shortcuts / Read Arguments
#' rnorm(n=100)
#' 
#' #Result
#' n=100;mean=1;sd=0
#'
r.args<-function(){
  ctx <- rstudioapi::getActiveDocumentContext()
  if (!is.null(ctx)) {
    if (ctx$selection[[1]]$text != "") {
      bits<-ctx$selection[[1]]$text
      fun<-strsplit(bits,split = "[(]")[[1]]
      if(length(fun)>2){
        fun[2]<-paste0(fun[-1],collapse = "(")
        fun<-fun[1:2]
      }
      fun[2]<-gsub(" ","",gsub("\n","",fun[2]))
      if(exists(fun[1])){
        EVALU<-eval(parse(text = fun[1]))
        if(is.function(EVALU)){
          comp_args<-formals(fun)
          args<-names(comp_args)
          args<-args[args != "..."]
          if(!is.null(args)){
            cond_pred<-sapply(comp_args,nchar) != 0
            args_n<-comp_args[cond_pred]
            args_predef<-names(args_n)
            args_n<-paste0(names(args_n),"=",sapply(args_n,function(x){as.character(x[[1]])}))
            if(substr(fun[2],nchar(fun[2]),nchar(fun[2]))==")"){
              fun[2]<-substr(fun[2],1,nchar(fun[2])-1)
            }
            sr<-strsplit(fun[2],"")[[1]]
            p1<-(1:length(sr))[sr=="("]
            p2<-(1:length(sr))[sr==")"]
            c1<-(1:length(sr))[sr==","]
            ss<-ss2<-c()
            for(i in 1:length(c1)){ss<-c()
            for(k in 1:(length(p1))){
              app<-c1[i]>p1[k] & c1[i] <p2[k]
              ss<-c(ss,app)
            }
            ss2<-c(ss2,any(ss))
            }
            sr[c1[ss2]]<-"?"
            fun[2]<-paste0(sr,collapse = "")
            
            values<-strsplit(fun[2],",")[[1]]
            values<-gsub("[?]",",",values)
            values<-gsub("==","?",values)
            values2<-strsplit(values,"=")
            len_val<-sapply(values2,length)
            cond<-len_val==2
            values<-gsub("[?]","==",values)
            values2<-sapply(values2,function(x){gsub("[?]","==",x)})
            if(class(values2)=="matrix"){args_writ<-values2[1,]}else{
              args_writ<-as.character(sapply(values2,function(x){x[[1]][1]})[cond])
            }
            args_no_escritos<-args[!args %in% args_writ]
            pred<-data.frame(A=args_predef,B=args_n)
            writ<-data.frame(A=args_writ,B=values[cond])
            extr<-writ[-(1:nrow(writ)),]
            if(length(args_no_escritos)==length(values[!cond])){
              extr<-data.frame(A=args_no_escritos,B=paste0(args_no_escritos,"=",values[!cond]))
            }else{
              valores_sin_arg<-values[!cond]
              if(length(valores_sin_arg)!=0){
                arg_rellenados<-args_no_escritos[1:length(valores_sin_arg)]
                if(length(values[!cond])>0){
                  extr<-data.frame(A=arg_rellenados,B=paste0(arg_rellenados,"=",valores_sin_arg))
                }
              }
            }
            if(length(values[!cond])>0){
              we<-rbind(writ,extr)
            }else{we<-writ}
            run<-(rbind(we,pred[!pred[[1]] %in% we[[1]],]))
            levels(run[[1]])<-args
            run<-run[order(run[[1]]),]
            run<-(paste0(run[[2]],collapse=";"))
            rstudioapi::modifyRange(ctx$selection[[1]]$range,
                                    paste0(bits,"\n",run))
          }
        }
      }
    }
  }
  return(invisible())
}