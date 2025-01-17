library(dplyr)

#Baseline constraint model
baseline <- read.csv("baseline model result.csv", header = TRUE)

#does Baseline model predict Monosyllabic Lengthening?
baseline %>%
  filter(brAt == "(brAt)" & led == "(leed)") -> baseline_monosylabic_lengthening
#No

#does Baseline model predict Tonal Flop in OS?
baseline %>%
  filter(vodA == "(vOda)" & ruukA == "(ruu)kA") -> baseline_tonal_flop
#Yes, but in isolation (never in a grammar that likewise displays Monosyllabic lengthening)

#does Baseline model predict Penultimate Lengthening in OS?
baseline %>%
  filter(vodA == "(voo)dA" & ruukA == "(ruu)kA") -> baseline_penultimate_lengthening
#Again, yes, but in isolation (never in a grammar that likewise displays Monosyllabic lengthening)

################

#Constraint model enriched with the local conjunction of Head-H and FootBinarity
lcc <- read.csv("lcc model result.csv", header = TRUE)

#grammars that display monosyllabic lengthening (restricted to toneless monosyllables)
lcc %>%
  filter(brAt == "(brAt)" & led == "(leed)") -> lcc_bcms

#does Baseline model predict tonal flop to stressed heavies (/ruukA/ > [(rUu)ka]), which is unattested in BCMS?
baseline %>%
  filter(ruukA == "(rUu)ka") -> tonal_flop_baseline
tonal_flop_baseline <- tonal_flop_baseline[, c(1,2,3,8)]
