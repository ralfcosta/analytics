# Manipulation

library(magrittr)
library(dplyr)
library(tidyr)

data(pnud_muni, package = 'abjutils')

# dplyr
# example of select
pnud_muni %>%
    tbl_df() %>%
    select(municipio, ufn, ano, gini, starts_with('idhm')) -> x

#  example of filter
pnud_muni %>%
    tbl_df() %>%
    select(municipio, ufn, ano, gini, starts_with('idhm')) %>%
    filter(ano==2010, gini > 0.5 | idhm > 0.7) -> x

#  example of mutate
pnud_muni %>%
    tbl_df() %>%
    select(municipio, ufn, ano, gini, starts_with('idhm')) %>%
    filter(ano==2010, gini > 0.5 | idhm > 0.7) %>%
    mutate(idhm2 = paste(idhm * 100, "%")) -> x

# example of arrange
pnud_muni %>%
    tbl_df() %>%
    select(municipio, ano, idhm) %>%
    filter(ano==2010) %>%
    arrange(desc(idhm)) %>%
    top_n(.,10)

# example of summarise
# n() count of group_by
# n_distinct() count of distinct for specified variable
pnud_muni %>%
    tbl_df() %>%
    select(ufn, ano, espvida, popt) %>%
    filter(ano==2000) %>%
    group_by(ufn) %>%
    summarise(mean_lifeexp = sum(espvida*popt)/sum(popt)) %>%
    arrange(desc(mean_lifeexp))

# tidyr
# example of spread (columns, values)

pnud_muni %>%
    group_by(ano,ufn) %>%
    summarise(populacao=sum(popt)) %>%
    ungroup() %>%
    spread(ano, populacao)

#example of gather (column_names, column_values)

pnud_muni %>%
    filter(ano == 2010) %>%
    select(ufn, municipio, starts_with('idhm_')) %>%
    gather(tipo_idh, idh, starts_with('idhm_'))







