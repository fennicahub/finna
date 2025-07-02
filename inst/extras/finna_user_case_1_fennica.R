# Load libraries
library(dplyr)
library(ggplot2)
library(scales)
library(forcats)
library(patchwork)


nineteen_cen <- readRDS("~/finna/nineteen_cen.rds")
# STEP 1: Collapse to top 5 languages
top_langs <- nineteen_cen %>%
  count(Language, sort = TRUE) %>%
  top_n(5, n) %>%
  pull(Language)

# STEP 2: Clean metadata and collapse language
nineteen_cen_clean <- nineteen_cen %>%
  filter(!is.na(Language), !is.na(Year)) %>%
  mutate(
    Language = tolower(Language),
    Language = ifelse(Language %in% top_langs, Language, "other"),
    Year = as.numeric(Year),
    Decade = floor(Year / 10) * 10
  )

# STEP 3: Plot 1 - Publications per decade
p1 <- nineteen_cen_clean %>%
  group_by(Decade) %>%
  summarise(Publications = n()) %>%
  ggplot(aes(x = Decade, y = Publications)) +
  geom_col(fill = "steelblue") +
  labs(title = "Publications in Fennica", x = "Decade", y = "Number of Publications") +
  theme_minimal() +
  theme(legend.position = "none")

# STEP 4: Plot 2 - Annual publication trend
p2 <- nineteen_cen_clean %>%
  group_by(Year) %>%
  summarise(Publications = n()) %>%
  ggplot(aes(x = Year, y = Publications)) +
  geom_line(color = "darkgreen") +
  geom_smooth(method = "loess", se = FALSE, linetype = "dashed") +
  labs(title = "Annual Publications in Fennica", x = "Year", y = "Number of Publications") +
  theme_minimal() +
  theme(legend.position = "none")

# STEP 5: Plot 3 - Top languages (simplified)
p3 <- nineteen_cen_clean %>%
  count(Language, sort = TRUE) %>%
  ggplot(aes(x = fct_reorder(Language, n), y = n)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(title = "Top Publication Languages in Fennica", x = "Language", y = "Number of Publications") +
  theme_minimal() +
  theme(legend.position = "none")

# STEP 6: Plot 4 - Language shifts (absolute counts)
lang_trends <- nineteen_cen_clean %>%
  group_by(Decade, Language) %>%
  summarise(Count = n(), .groups = "drop")

p4 <- ggplot(lang_trends, aes(x = Decade, y = Count, fill = Language)) +
  geom_col() +
  labs(title = "Language Shifts in Finnish Publications", x = "Decade", y = "Number of Publications") +
  theme_minimal() +
  theme(legend.position = "none")

# STEP 7: Plot 5 - Language proportions per decade
lang_share <- lang_trends %>%
  group_by(Decade) %>%
  mutate(Proportion = Count / sum(Count))

p5 <- ggplot(lang_share, aes(x = Decade, y = Proportion, fill = Language)) +
  geom_col(position = "fill") +
  scale_y_continuous(labels = percent_format()) +
  labs(title = "Language Proportions by Decade", x = "Decade", y = "Proportion of Publications") +
  theme_minimal() +
  theme(legend.position = "bottom")

# STEP 10: Plot 6 - Format distribution
p6 <- nineteen_cen_clean %>%
  filter(!is.na(Formats)) %>%
  mutate(Format = gsub(",.*", "", Formats)) %>%  # simplify if multiple formats
  count(Format, sort = TRUE) %>%
  top_n(10, n) %>%
  ggplot(aes(x = fct_reorder(Format, n), y = n)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(title = "Top Formats in Fennica", x = "Format", y = "Number of Publications") +
  theme_minimal() +
  theme(legend.position = "none")


# STEP 11: Combine all six plots (p1–p6) in 3x2 grid
combined_plot_6 <- (p1 + p2) / (p3 + p4) / (p5 + p6) +
  plot_layout(guides = "collect") +
  plot_annotation(title = "Fennica Metadata Analysis: Language, Format, and Publication Trends (1809–1918)") &
  theme(
    legend.position = "bottom",
    legend.text = element_text(size = 8),
    axis.text = element_text(size = 8),
    axis.title = element_text(size = 9),
    plot.title = element_text(size = 12, face = "bold")
  )

# Show
print(combined_plot_6)

# Save if needed
# ggsave("fennica_combined_6panel.png", combined_plot_6, width = 14, height = 14, dpi = 300)
