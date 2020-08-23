## code to prepare `dados_sinesp` dataset goes here

caminho <- "data-raw/xlsx/indicadoressegurancapublicamunicmar20.xlsx"
abas <- readxl::excel_sheets(caminho)

dados_sinesp <- purrr::map(
  abas,
  ~readxl::read_excel(
    caminho, sheet = .x,
    col_types = c("text", "text", "text", "date", "numeric")
  )

)

dados_sinesp <- dplyr:::bind_rows(dados_sinesp)

#Arrumacao
dados_sinesp <- janitor::clean_names(dados_sinesp)

#readr::write_rds(
  #dados_sinesp,
 # "data/dados_sinesp.rds",
 # compress = 'gz'
#)


usethis::use_data(dados_sinesp, overwrite = TRUE)

#.rda for saving multiple objects into a single file. Use save() and load() to work with these.
#rda só data e é mais comprimido e pra pacote rda
#.rds for saving a single object. Use saveRDS() and readRDS() to work with these.

