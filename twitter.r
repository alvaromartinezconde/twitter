#install.packages("ROAuth")
#install.packages("base64enc")
#install.packages("twitteR")
#install.packages("streamR")
#install.packages("< xlsx >")

library("ROAuth")
library("base64enc")
library("twitteR")
library("streamR")
library(twitteR)

# Cargar parámetros de configuración
reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
options(httr_oauth_cache=T)

# Cargar las credenciales obtenidas del paso anterior
consumer_key <- "V8F2Bw0zmb8wrJbpoYP4YBL5K"
consumer_secret <-"NcWH6JWeR4xCeyv1eHbGFQhlk4W0wSIT660h195rFZ82SvWMSP"
access_token <-"3243113914-0IExYe53t78wvMLBeAWTdgD1FhxFYeeSs6rvczj"
access_secret <-"f0zMkkXebLDL4ZlriVWKl0J22usbFcSjentrXRj3wnOUQ"

# Ejecutar la autenticación de TwitteR
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


# streamR authentication

credentials_file <- "my_oauth.Rdata"
if (file.exists(credentials_file)){
  load(credentials_file)
} else {
  cred <- OAuthFactory$new(consumerKey = consumer_key, consumerSecret =
                             consumer_secret, requestURL = reqURL, accessURL = accessURL, authURL = authURL)
  cred$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
  save(cred, file = credentials_file)
}


n <- 190
trends <- data.frame( Sys.Date(), getTrends (368150, exclude = NULL))
tendencia1 <- twListToDF(searchTwitter(trends$name[1], n))
tendencia2 <- twListToDF(searchTwitter(trends$name[2], n))
tendencia3 <- twListToDF(searchTwitter(trends$name[3], n))
tendencia4 <- twListToDF(searchTwitter(trends$name[4], n))
tendencia5 <- twListToDF(searchTwitter(trends$name[5], n))
tendencia6 <- twListToDF(searchTwitter(trends$name[6], n))
tendencia7 <- twListToDF(searchTwitter(trends$name[7], n))
tendencia8 <- twListToDF(searchTwitter(trends$name[8], n))
tendencia9 <- twListToDF(searchTwitter(trends$name[9], n))
tendencia10 <- twListToDF(searchTwitter(trends$name[10], n))

remove(trends)
tendencias <- Filter(function(x) is (x, "data,frame"), nget (ls()))
tendMedellin <- do.call(rbind, tendencias)
write.csv(tendeMedellin, file - " .csv")


# Extracción de twitts

tweets <- searchTwitter("#Resign" , n=1000)

tweets_baloncesto <- searchTwitter("#Baloncesto" , n=1000)

tweets_motor <- searchTwitter("#Motor" , n=10000)

tweets_balonc <- searchTwitter("Baloncesto" , n=1000)

tikitakas <- searchTwitter("tikitakas or sociedad" , n=1000)

View(tweets)


# Transformación para poder ver los datos

baloncesto.df <- twListToDF(tweets_baloncesto)

balonc.df <- twListToDF(tweets_balonc)

View(baloncesto.df)

motor.df <- twListToDF(tweets_motor)

tikitakas.df <- twListToDF(tikitakas)


# Extracción a excel

library(xlsx)

write.xlsx(resign.df, "C:/Users/amartinezconde/Documents/tweets.xlsx")

write.xlsx(baloncesto.df, "C:/Users/amartinezconde/Documents/tweets_baloncesto.xlsx")

write.xlsx(balonc.df, "C:/Users/amartinezconde/Documents/tweets_balonc.xlsx")

write.xlsx(motor.df, "C:/Users/amartinezconde/Documents/tweets_motor.xlsx")


# Cargar la librería específica de TwitterR

library(twitteR)

# Leer el fichero de credenciales creado anteriormente, ¡cuidado con la ruta del fichero!.

source('credenciales.R')

# Función que permite buscar: #hastag, @usuarios, palabras

tweets <- searchTwitter("love", n=10, lang="es")

# Quedarse solo con el primer tweet para datos concretos del mismo
tweet <- tweets[[1]];

# Mostrar la estructura del tweet
str(tweet)

# Obtener el texto del tweet:
tweet$getText()

# Obtener información acerca del usuario:
usuario <- getUser(tweet$getScreenName());

# Mostrar la estructura del usuario
str(usuario)

# Obtener el nombre del usuario
usuario$getName()
