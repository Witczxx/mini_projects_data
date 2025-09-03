# Lade Bibliotheken
library(tidyverse)
library(viridis)

# Erstellen des Krankenhaus-Datensatzes (2019)
# Quelle: Statistisches Bundesamt (Destatis), 
# zitiert nach Krankenhausreport 2022
KHR_2019 <- tribble(
  ~Abteilung,  ~Abt_Anzahl, ~Abt_Betten, ~Nutzungsgrad, ~Fallzahl, ~Avg_Verweildauer,
  "Innere Medizin", 1047, 111481, 78.1, 5889078, 5.4,
  "Geriatrie", 322, 18101, 86.9, 374462, 15.3,
  "Kardiologie", 206, 14800, 83.6, 955424, 4.7,
  "Nephrologie", 62, 2186, 83.5, 96053, 6.9,
  "Hämatologie und internistische Onkologie", 102, 5096, 79.9, 201198, 7.4,
  "Endokrinologie", 18, 501, 83.3, 23432, 6.5,
  "Gastroenterologie", 126, 7203, 82.5, 418259, 5.2,
  "Pneumologie", 64, 3689, 79.4, 178007, 6.0,
  "Rheumatologie", 33, 1096, 72.1, 38126, 7.6,
  "Pädiatrie", 339, 15447, 63.2, 926516, 3.8,
  "Kinderkardiologie", 23, 588, 65.0, 19087, 7.3,
  "Neonatologie", 99, 2097, 72.3, 56492, 9.8,
  "Kinderchirugie", 83, 1592, 63.8, 124763, 3.0,
  "Lungen- und Bronchialheilkunde", 18, 1775, 69.5, 62763, 7.2,
  "Allgemeine Chirugie", 1068, 67902, 69.8, 3195674, 5.4,
  "Unfallchirugie", 308, 17303, 78.1, 840038, 5.9,
  "Neurochirugie", 178, 6642, 77.6, 256956, 7.3,
  "Gefäßchirugie", 186, 5529, 72.3, 189430, 7.7,
  "Plastische Chirugie", 132, 1936, 69.2, 89349, 5.5,
  "Thoraxchirugie", 56, 1546, 67.8, 50570, 7.6,
  "Herzchirugie", 71, 4614, 77.5, 152524, 8.6,
  "Urologie", 500, 14036, 74.4, 886904, 4.3,
  "Orthopädie", 435, 23078, 68.5, 904191, 6.4,
  "Frauenheilkunde und Geburtshilfe", 759, 25039, 60.8, 1548418, 3.6,
  "Geburtshilfe", 86, 2205, 78.3, 180552, 3.5,
  "Hals-, Nasen-, Ohrenheilkunde", 592, 8672, 60.5, 562945, 3.4,
  "Augenheilkunde", 264, 4219, 65.4, 360377, 2.8,
  "Neurologie", 455, 26716, 81.2, 1092503, 7.2,
  "Allgemeine Psychiatrie", 394, 57269, 94.0, 769076, 24.7,
  "Kinder- und Jugendpsychiatrie", 144, 6696, 88.7, 59578, 36.4,
  "Psychosomatik/Psychotherapie", 275, 12394, 90.1, 93160, 43.7,
  "Nuklearmedizin", 96, 724, 44.9, 36061, 3.3,
  "Strahlenheilkunde", 145, 2489, 68.8, 70938, 8.8,
  "Dermatologie", 109, 4575, 77.3, 240506, 5.4,
  "Zahn- und Kieferheilkunde, Mund- und Kieferchirugie", 183, 2041, 65.4, 116377, 4.2,
  "Intensivmedizin", 260, 6568, 77.0, 474544, 3.9,
  "Sonstige Fachabteilung", 305, 6481, 73.5, 269292, 6.5
)

# Erstellen des Krankenhaus-Datensatzes (2022)
# Quelle: Statistisches Bundesamt (Destatis), 
# zitiert nach Krankenhausreport 2024
KHR_2022 <- tribble(
  ~Abteilung,  ~Abt_Anzahl, ~Abt_Betten, ~Nutzungsgrad, ~Fallzahl, ~Avg_Verweildauer,
  "Innere Medizin", 1002, 102760, 69.6, 4881453, 5.3,
  "Geriatrie", 337, 18380, 71.6, 315071, 15.3,
  "Kardiologie", 260, 18316, 72.0, 1029244, 4.7,
  "Nephrologie", 67, 2230, 75.7, 88989, 6.9,
  "Hämatologie und internistische Onkologie", 121, 5452, 74.9, 200535, 7.4,
  "Endokrinologie", 14, 498, 66.7, 16031, 7.6,
  "Gastroenterologie", 155, 8137, 77.3, 423211, 5.4,
  "Pneumologie", 85, 4495, 70.3, 196123, 5.9,
  "Rheumatologie", 34, 1170, 59.0, 33312, 7.6,
  "Pädiatrie", 326, 14920, 57.8, 830083, 3.8,
  "Kinderkardiologie", 22, 506, 61.3, 17209, 6.6,
  "Neonatologie", 103, 2143, 63.5, 50565, 9.8,
  "Kinderchirugie", 82, 1502, 56.4, 112573, 2.7,
  "Lungen- und Bronchialheilkunde", 17, 1381, 59.9, 43949, 6.9,
  "Allgemeine Chirugie", 1061, 63342, 61.2, 2730873, 5.2,
  "Unfallchirugie", 354, 18255, 69.8, 825194, 5.6,
  "Neurochirugie", 186, 6554, 69.8, 242866, 6.9,
  "Gefäßchirugie", 205, 5581, 64.1, 176349, 7.4,
  "Plastische Chirugie", 142, 2029, 57.9, 87850, 4.9,
  "Thoraxchirugie", 69, 1623, 60.7, 52361, 6.9,
  "Herzchirugie", 71, 4291, 66.9, 124049, 8.4,
  "Urologie", 492, 13431, 65.4, 807178, 4.0,
  "Orthopädie", 377, 19381, 60.2, 712411, 6.0,
  "Frauenheilkunde und Geburtshilfe", 722, 23119, 54.8, 1394024, 3.3,
  "Geburtshilfe", 74, 2235, 64.7, 162564, 3.2,
  "Hals-, Nasen-, Ohrenheilkunde", 539, 7583, 51.0, 437442, 3.2,
  "Augenheilkunde", 236, 4000, 56.3, 308103, 2.7,
  "Neurologie", 470, 26948, 73.0, 985359, 7.3,
  "Allgemeine Psychiatrie", 403, 57011, 86.3, 746209, 24.1,
  "Kinder- und Jugendpsychiatrie", 144, 6763, 82.7, 64032, 31.9,
  "Psychosomatik/Psychotherapie", 279, 12844, 84.0, 89699, 43.9,
  "Nuklearmedizin", 92, 748, 42.1, 34508, 3.3,
  "Strahlenheilkunde", 141, 2250, 59.0, 57839, 8.4,
  "Dermatologie", 111, 4379, 63.2, 197743, 5.1,
  "Zahn- und Kieferheilkunde, Mund- und Kieferchirugie", 169, 1890, 56.5, 98140, 4.0,
  "Intensivmedizin", 286, 7558, 67.4, 467038, 4.0,
  "Sonstige Fachabteilung", 306, 6677, 65.3, 283321, 5.6
)

# Überblick Datensatz
head(KHR_2019)

# Übersicht Bettenzahl pro Station
KHR_2019 |> 
  mutate(Abteilung = fct_reorder(Abteilung, Abt_Betten)) |> 
  ggplot(aes(y = Abteilung, x = Abt_Betten)) +
  geom_col() +
  labs(
    title = "Bettenzahlen nach Fachabteilung (2019)",
    x = "Anzahl der Betten",
    y = "Fachabteilung",
    caption = "Quelle: Statistisches Bundesamt (Destatis, 2021)") +
  theme_minimal()

# Übersicht Fallzahl pro Station
KHR_2019 |> 
  mutate(Abteilung = fct_reorder(Abteilung, Fallzahl)) |> 
  ggplot(aes(y = Abteilung, x = Fallzahl)) +
  geom_col() +
  labs(
    title = "Fallzahlen nach Fachabteilung (2019)",
    x = "Fallzahl",
    y = "Fachabteilung",
    caption = "Quelle: Statistisches Bundesamt (Destatis, 2021)") +
  theme_minimal()

# Korrelationsanalyse - Fallzahl/Bettenzahl
ggplot(KHR_2019, aes(x = Fallzahl, y = Abt_Betten)) +
  geom_point(alpha = 0.6, color = "steelblue") +
  geom_smooth(method = "lm", color = "red", se = TRUE) +
  labs(
    title = "Beziehung zwischen Fallzahlen und Bettenzahlen (2019)",
    x = "Fallzahlen",
    y = "Bettenzahlen",
    caption = "Quelle: Statistisches Bundesamt (Destatis, 2021)") +
  theme_minimal()

# Top 10 Abteilungen: 
# 80 % der Fallzahlen und entsprechende Bettenzahlen (2019)
### Rechnung
KHR_2019_long <- KHR_2019 |> 
  # Sortiere Stationen nach Fallzahlen statt alphabetisch
  mutate(Abteilung = fct_reorder(Abteilung, Fallzahl, .desc = TRUE)) |> 
  # Für bessere Lesbarkeit in der Visualisierung
  rename(Bettenzahl = Abt_Betten) |> 
  # Top 80% der Abteilungen
  arrange(desc(Fallzahl)) |>
  mutate(rel_cumsum_Fallzahl = cumsum(Fallzahl) / sum(Fallzahl)) |>
  filter(rel_cumsum_Fallzahl <= 0.8) |> 
  # 2 Hauptvariabel-Titel werden zu Spalten im Tibble 
  pivot_longer(cols = c(Bettenzahl, Fallzahl),
               names_to = "Kennzahl",
               values_to = "Wert") |> 
  # Bug-Fix: paste0() funktionierte nicht - Rechnung wurde ausgegliedert
  group_by(Kennzahl) |>
  mutate(Anteil = Wert / sum(Wert)) 
### Visualisierung
  ggplot(data = KHR_2019_long, aes(
    x = Kennzahl, y = Wert, fill = Abteilung)) +
    # Alle Variablen skalieren unabhängig bis 100% dank position = "fill"
    geom_col(position = "fill") +  
    # Fallzahlen separiert (skalieren unterschiedlich)
    geom_text(data = filter(KHR_2019_long, Kennzahl == "Fallzahl"), 
              # Rechnung wurde ausgegliedert - Bug-Fix
              aes(label = paste0(round(Anteil * 100, 0), "%")), 
                  # Notwendig, damit Zahl korrekt Diagramm überlappt
                  position = position_fill(vjust = 0.5), 
                  color = "white",
                  size = 3) +
    # Bettenzahlen separiert (skalieren unterschiedlich)
    geom_text(data = filter(KHR_2019_long, Kennzahl == "Bettenzahl"), 
              # Rechnung wurde ausgegliedert - Bug-Fix
              aes(label = paste0(round(Anteil * 100, 0), "%")), 
                  # Notwendig, damit Zahl korrekt Diagramm überlappt
                  position = position_fill(vjust = 0.5), 
                  color = "white", 
                  size = 3) +
    scale_y_continuous(labels = scales::percent) +
    theme_minimal() +
    # Farbschema [viridis Bibliothek]
    scale_fill_viridis_d(option = "turbo", direction = -1) + 
    labs(x = "", y = "", 
         title = "Verteilung von Fallzahlen und Betten 
         in deutschen Krankenhaus-Stationen (2019)",
         subtitle = "Top 10 Abteilungen, 
         die zusammen 80% aller Fallzahlen abdecken",
         caption = "Quelle: Statistisches Bundesamt (Destatis, 2021)")


# Analyse der Verweildauer: Psychiatrie als Ausreißer
KHR_2019 |> 
   arrange(desc(Fallzahl)) |> 
   mutate(rel_cumsum_Fallzahl = cumsum(Fallzahl) / sum(Fallzahl)) |> 
   filter(rel_cumsum_Fallzahl <= 0.8) |> 
   mutate(Abteilung = fct_reorder(Abteilung, Avg_Verweildauer)) |> 
   ggplot(aes(y = Abteilung, x = Avg_Verweildauer)) +
   geom_col() +
   labs(
     x = "Durchschnittliche Verweildauer (Tage)",
     y = "Abteilung",
     title = "Durchschnittliche Verweildauer in Top-10-Abteilungen",
     subtitle = "Psychiatrie fällt durch 
     besonders lange Verweildauer auf") +
   theme_minimal()

# Analyse der Nutzungsgrade: Innere Meidzin
KHR_2019 |> 
   arrange(desc(Fallzahl)) |> 
   mutate(rel_cumsum_Fallzahl = cumsum(Fallzahl) / sum(Fallzahl)) |> 
   filter(rel_cumsum_Fallzahl <= 0.8) |> 
   mutate(Abteilung = fct_reorder(Abteilung, Nutzungsgrad)) |> 
   ggplot(aes(y = Abteilung, x = Nutzungsgrad)) +
   geom_col() +
   labs(
     x = "Nutzungsgrad (%)",
     y = "Abteilung",
     title = "Durchschnittlicher Betten-Nutzungsgrad 
     in Top-10-Abteilungen",
     subtitle = "Innere Medizin und Kardiologie fallen durch 
     hohe Auslastung auf") +
   theme_minimal()

