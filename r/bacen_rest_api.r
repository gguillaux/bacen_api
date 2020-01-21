library(httr)

base_url    <- 'https://olinda.bcb.gov.br/olinda/servico/Expectativas/versao/v1/odata/'
endpoint    <- 'ExpectativaMercadoMensais'
payload     <- list(
  "$format"  = "text/csv",
  "$filter"  = "Indicador eq 'IPCA' and Data gt '2020-01-01'",
  "$orderby" = "DataReferencia"
)

fetch_bacen <- function(path, params) {
  url <- paste0('https://olinda.bcb.gov.br/olinda/servico/Expectativas/versao/v1/odata/', path)
  print(url)
  return(httr::GET(url, query = params))
}

a <- fetch_bacen(endpoint, payload)

class(a)

b <- data.frame(httr::content(a))
