#' Gera um grafico de serie
#'
#' Gera um grafico de serie para um municipio da base SINESP
#'
#' @param tab A base sinesp por municipio
#' @param municipio_nome Uma string com nome de um
#' municipio da base SINESP
#'
#' @return um grafico ggplot
#' @export
#'
gerar_grafico_serie <- function(tab, municipio_nome){
  tab %>%
    dplyr::filter(municipio== municipio_nome) %>%
    ggplot2::ggplot() +
    ggplot2::geom_line(
      ggplot2::aes(x = mes_ano, y = vitimas)
    ) +
    ggplot2::labs(
      x = "Mês",
      y = "Número de vítimas",
      title = municipio_nome
    ) +
    ggplot2::theme_minimal()
}
