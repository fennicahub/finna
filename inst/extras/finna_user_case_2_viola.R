# Load libraries
library(dplyr)
library(ggplot2)
library(forcats)
library(scales)
library(patchwork)
# STEP 1: Clean and preprocess
viola_clean <- viola_collection %>%
filter(!is.na(Language), !is.na(Year)) %>%
mutate(
Language = tolower(Language),
Year = as.numeric(Year),
Decade = floor(Year / 10) * 10
)
# STEP 2: Collapse languages to top 5 + "other"
top_langs <- viola_clean %>%
count(Language, sort = TRUE) %>%
top_n(5, n) %>%
pull(Language)
viola_clean <- viola_clean %>%
mutate(Language = ifelse(Language %in% top_langs, Language, "other"))
# Automatically get full decade range for axis
decade_max <- ceiling(max(viola_clean$Year, na.rm = TRUE) / 10) * 10
# STEP 3: Plot 1 - Publications by decade
p1 <- viola_clean %>%
count(Decade) %>%
ggplot(aes(x = Decade, y = n)) +
geom_col(fill = "steelblue") +
labs(title = "Publications in Viola by Decade", x = "Decade", y = "Count") +
scale_x_continuous(limits = c(min(viola_clean$Decade), decade_max)) +
theme_minimal() +
theme(legend.position = "none")
# STEP 4: Plot 2 - Annual publication trend
p2 <- viola_clean %>%
count(Year) %>%
ggplot(aes(x = Year, y = n)) +
geom_line(color = "darkgreen") +
geom_smooth(method = "loess", se = FALSE, linetype = "dashed", color = "blue") +
labs(title = "Annual Publications in Viola", x = "Year", y = "Count") +
scale_x_continuous(limits = c(min(viola_clean$Year), 2025)) +
theme_minimal() +
theme(legend.position = "none")
# STEP 5: Plot 3 - Top publication languages
p3 <- viola_clean %>%
count(Language, sort = TRUE) %>%
ggplot(aes(x = fct_reorder(Language, n), y = n)) +
geom_col(fill = "steelblue") +
coord_flip() +
labs(title = "Top Publication Languages", x = "Language", y = "Count") +
theme_minimal() +
theme(legend.position = "none")
# STEP 6: Plot 4 - Language shifts by decade
p4 <- viola_clean %>%
count(Decade, Language) %>%
ggplot(aes(x = Decade, y = n, fill = Language)) +
geom_col() +
labs(title = "Language Shifts in Viola", x = "Decade", y = "Count") +
scale_x_continuous(limits = c(min(viola_clean$Decade), decade_max)) +
theme_minimal() +
theme(legend.position = "none")
# STEP 7: Plot 5 - Language proportions by decade
p5 <- viola_clean %>%
count(Decade, Language) %>%
group_by(Decade) %>%
mutate(Proportion = n / sum(n)) %>%
ggplot(aes(x = Decade, y = Proportion, fill = Language)) +
geom_col(position = "fill") +
scale_y_continuous(labels = percent_format()) +
scale_x_continuous(limits = c(min(viola_clean$Decade), decade_max)) +
labs(title = "Language Proportions by Decade", x = "Decade", y = "Proportion") +
theme_minimal() +
theme(legend.position = "bottom")
# STEP 8: Plot 6 - Top formats
p6 <- viola_clean %>%
filter(!is.na(Formats)) %>%
mutate(Format = gsub(",.*", "", Formats)) %>%
count(Format, sort = TRUE) %>%
top_n(10, n) %>%
ggplot(aes(x = fct_reorder(Format, n), y = n)) +
geom_col(fill = "steelblue") +
coord_flip() +
labs(title = "Top Formats in Viola", x = "Format", y = "Count") +
theme_minimal() +
theme(legend.position = "none")
# STEP 9: Combine all plots into a 3x2 grid
viola_combined <- (p1 + p2) / (p3 + p4) / (p5 + p6) +
plot_layout(guides = "collect") +
plot_annotation(title = "Viola Collection Trends and Language Analysis") &
theme(
legend.position = "bottom",
legend.text = element_text(size = 8),
plot.title = element_text(size = 12, face = "bold"),
axis.text = element_text(size = 8),
axis.title = element_text(size = 9)
)
# STEP 10: Print or save
print(viola_combined)
# Optional: Save to file
# ggsave("viola_analysis_2025.png", viola_combined, width = 14, height = 12, dpi = 300)