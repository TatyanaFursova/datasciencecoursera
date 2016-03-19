pollutantmean<-function(directory, pollutant, id=1:332){
					WD<-"C:/Users/Фурсова Татьяна/Documents/rprog-data-specdata"					
					file_name<-(001:332)
					f_names<-vector('character')
					x<-vector('numeric')
					for (f in file_name){
					 if (f<10) f_names<-c(f_names, paste("00", f, ".csv", sep=""))
						else {
						if (f<100) f_names<-c(f_names, paste("0", f, ".csv", sep=""))
						else f_names<-c(f_names, paste(f,".csv", sep=""))}					
}
 
					for (k in id){fn<-f_names[k]
					DIR<-paste(WD,"/",directory,"/",fn, sep="")
					data_file<-read.csv(DIR)
					mix<-unlist(data_file[pollutant])
					polut<-as.vector(mix, mode='numeric')
						for (i in polut){
						if (is.na(i)) next
						else x<-c(x,i)}}
						
				
				##print(x)
				mean(x)}