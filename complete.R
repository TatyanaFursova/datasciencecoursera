complete<-function(directory, id=1:332){
		WD<-"C:/Users/Фурсова Татьяна/Documents/rprog-data-specdata"					
		file_name<-(001:332)
		my_frame<-data.frame(ID=numeric(0), nobs=numeric(0))
		f_names<-vector('character')
		x<-vector('numeric')
		
		for (f in file_name){
		if (f<10) f_names<-c(f_names, paste("00", f, ".csv", sep=""))
			else {
			if (f<100) f_names<-c(f_names, paste("0", f, ".csv", sep=""))
			else f_names<-c(f_names, paste(f,".csv", sep=""))}				
		}
		
			for (n in 1:length(id)) {
			fn<-f_names[id[n]]
			DIR<-paste(WD,"/",directory,"/",fn, sep="")
			vspom<-read.csv(DIR)
			##print(vspom)
			z<-0	
			for (k in 1:nrow(vspom)){
				
				if (!is.na(vspom$sulfate[k])& !is.na(vspom$nitrate[k])) z<-z+1 
				
		}
vect<-c(id[n],z)
my_frame[nrow(my_frame)+1,]<-vect
}

print(my_frame)
}