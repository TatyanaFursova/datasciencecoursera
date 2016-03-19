corr<-function(directory, threshold=0){
		WD<-"C:/Users/Фурсова Татьяна/Documents/rprog-data-specdata"					
		file_name<-(001:332)
		##my_frame<-data.frame(ID=numeric(0), nobs=numeric(0))
		f_names<-vector('character')
		sx<-vector('numeric')
		nx<-vector('numeric')
		vect_cor<-vector('numeric')
		
		for (f in file_name){
		if (f<10) f_names<-c(f_names, paste("00", f, ".csv", sep=""))
			else {
			if (f<100) f_names<-c(f_names, paste("0", f, ".csv", sep=""))
			else f_names<-c(f_names, paste(f,".csv", sep=""))}				
		}
		
			for (n in 1:length(file_name)) {
			vspom<-0
			fn<-f_names[n]
			DIR<-paste(WD,"/",directory,"/",fn, sep="")
			vspom<-read.csv(DIR)
			#print(vspom)
			z<-0	
			for (k in 1:nrow(vspom)){
				
				if (!is.na(vspom$sulfate[k])& !is.na(vspom$nitrate[k])) 
					{	sx<-c(sx, vspom$sulfate[k])
						nx<-c(nx, vspom$nitrate[k])
						
						z<-z+1 }}
					 if (z>threshold) {
						
vect_cor<-c(vect_cor, cor(sx, nx))}}

print(vect_cor)}
