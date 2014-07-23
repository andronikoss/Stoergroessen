
stoergroesse <- function (N = 1000, select = select, 
                          dichte = F, sim) {
    set.seed(20 + sim)
    if(sim == 0){
        N1 <- rnorm(N, mean=0, sd=sqrt(2))
        N2 <- rnorm(N, mean=0, sd=sqrt(2))
        N3 <- rnorm(N, mean=0, sd=sqrt(2))
        N1[1] <- 0.5 
        N2[1] <- -1.1
        N3[1] <- 0.3
        u1 <- N1[1:select]  
        u2 <- N2[1:select]
        u3 <- N3[1:select]
        
    } else {
    N1 <- rnorm(N, mean=0, sd=sqrt(2))
    N2 <- rnorm(N, mean=0, sd=sqrt(2))
    N3 <- rnorm(N, mean=0, sd=sqrt(2))
    u1 <- N1[1:select]  
    u2 <- N2[1:select]
    u3 <- N3[1:select]
    }
    par(mfrow=c(1,3), mar=c(4,6,3,1))
    #------------------------------------------------------
    #                   Erste Darstellung
    #------------------------------------------------------
    plot(1,1,type="n", xlim = c(-3.5,3.5),
         axes=F, ylim=c(0,0.4),main="Rechnungsbetrag (x = 10)", ylab = "",
         xlab=expression(u[1]), cex.main = 1.8, cex.lab=1.8,cex.axis = 1.7,
         font.main=1)
    lines(x=u1,y=rep(0.02,select),type="h")
    lines(x=u1,y=rep(-0.02,select),type="h")
    # Aktuelle Stichprobe soll mit Rot markiert sein
    lines(x=u1[select],y=0.02,type="h", col="red", lwd=2)
    lines(x=u1[select],y=-0.02,type="h", col="red", lwd=2)
    
    abline(h=0)
    abline(v=0, lty=2)
    box()
    axis(1,at=-3:3,cex.axis = 1.7)

    if(dichte == T & select != 1){
        axis(2,cex.axis = 1.7)
        title(ylab="Dichte", cex.lab=1.8)
        den <- density(u1)
        lines(den, col="darkred")
        polygon(den,col="darkred", density=15)
    }
    
    #------------------------------------------------------
    #                   Zweite Darstellung
    #------------------------------------------------------
    plot(1,1,type="n", xlim = c(-3.5,3.5),
         axes=F,  ylim=c(0,0.4),main="Rechnungsbetrag (x = 30)", ylab = "",
         xlab=expression(u[2]), cex.main = 1.8, cex.lab=1.8,cex.axis = 1.7,font.main=1)
    lines(x=u2,y=rep(0.02,select),type="h")
    lines(x=u2,y=rep(-0.02,select),type="h")
    # Aktuelle Stichprobe soll mit Rot markiert sein
    lines(x=u2[select],y=0.02,type="h", col="red", lwd=2)
    lines(x=u2[select],y=-0.02,type="h", col="red", lwd=2)
    
    abline(h=0)
    abline(v=0, lty=2)
    box()
    axis(1,at=-3:3,cex.axis = 1.7)

    if(dichte == T & select != 1){
        axis(2,cex.axis = 1.7)
        title(ylab="Dichte", cex.lab=1.8)
        den <- density(u2)
        lines(den, col="darkred")
        polygon(den,col="darkred", density=15)
    }
    # Dritte Darstellung
    plot(1,1,type="n", xlim = c(-3.5,3.5),
         axes=F,  ylim=c(0,0.4),main="Rechnungsbetrag (x = 50)", ylab = "",
         xlab=expression(u[3]), cex.main = 1.8, cex.lab=1.8,cex.axis = 1.7,
         font.main=1)
    lines(x=u3,y=rep(0.02,select),type="h")
    lines(x=u3,y=rep(-0.02,select),type="h")
    
    # Aktuelle Stichprobe soll mit Rot markiert sein
    lines(x=u3[select],y=0.02,type="h", col="red", lwd=2)
    lines(x=u3[select],y=-0.02,type="h", col="red", lwd=2)
    
    abline(h=0)
    abline(v=0, lty=2)
    box()
    axis(1,at=-3:3,cex.axis = 1.7)
    
    
    if(dichte == T & select != 1){
        axis(2,cex.axis = 1.7)
        title(ylab="Dichte", cex.lab=1.8)
        den <- density(u3)
        lines(den, col="darkred")
        polygon(den,col="darkred", density=15)
    }    
    
    
    
}  
