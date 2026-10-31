% =========================================================================
% Graf počtu objevených exoplanet v jednotlivých letech
% =========================================================================
clear; clc; close all;
% 1. Načtení dat (přeskočení řádků s komentáři začínajícími '#')
filename = 'PS_2026.10.13_07.13.06.csv';
opts = detectImportOptions(filename, 'FileType', 'text', 'CommentStyle', '#');
data = readtable(filename, opts);
% 2. Zpracování dat – spočítání počtu objevů pro každý rok
years = data.disc_year;
unique_years = unique(years);
counts = histcounts(years, [unique_years; max(unique_years)+1]);
% 3. Vytvoření grafu
figure('Name', 'Exoplanety podle roku objevu', 'Position', [100, 100, 1000, 600]);
bar(unique_years, counts, 'FaceColor', [0.15, 0.45, 0.75], 'EdgeColor', 'none');
title('Počet objevených a potvrzených exoplanet v jednotlivých letech', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Rok objevu', 'FontSize', 12);
ylabel('Počet exoplanet', 'FontSize', 12);
grid on;
box on;
set(gca, 'FontSize', 11);
% Úprava osy X pro lepší čitelnost (zobrazení každého 2. až 5. roku dle potřeby)
xlim([min(unique_years)-1, max(unique_years)+1]);
% =========================================================================
% Grafy počtu objevených exoplanet (Sloupcový a Koláčový graf)
% =========================================================================
clear; clc; close all;
% 1. Načtení dat (přeskočení řádků s komentáři začínajícími '#')
filename = 'PS_2026.10.13_07.13.06.csv';
opts = detectImportOptions(filename, 'FileType', 'text', 'CommentStyle', '#');
data = readtable(filename, opts);
% =========================================================================
% 2. SLOUPCOVÝ GRAF: Počet objevů podle roku
% =========================================================================
years = data.disc_year;
valid_years = years(~isnan(years));
unique_years = unique(valid_years);
counts = histcounts(valid_years, [unique_years; max(unique_years)+1]);
figure('Name', 'Exoplanety podle roku objevu', 'Position', [100, 100, 1000, 600]);
bar(unique_years, counts, 'FaceColor', [0.15, 0.45, 0.75], 'EdgeColor', 'none');
title('Počet objevených a potvrzených exoplanet v jednotlivých letech', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Rok objevu', 'FontSize', 12);
ylabel('Počet exoplanet', 'FontSize', 12);
grid on;
box on;
set(gca, 'FontSize', 11);
xlim([min(unique_years)-1, max(unique_years)+1]);
% =========================================================================
% 3. KOLÁČOVÝ GRAF: Podíl metod objevu (Pie Chart)
% =========================================================================
methods = data.discoverymethod;
% Odstranění chybějících hodnot (pokud nějaké jsou)
methods = methods(~cellfun(@isempty, methods));
[unique_methods, ~, idx] = unique(methods);
method_counts = accumarray(idx, 1);
% Seřazení metod od nejčastější po nejméně častou
[sorted_counts, sort_idx] = sort(method_counts, 'descend');
sorted_methods = unique_methods(sort_idx);
% Seskupení méně častých metod do kategorie "Ostatní" pro přehlednost
max_slices = 6; % Maximální počet výsečí v koláči
if length(sorted_counts) > max_slices
    top_counts = sorted_counts(1:max_slices-1);
    other_count = sum(sorted_counts(max_slices:end));
    final_counts = [top_counts; other_count];
    final_labels = [sorted_methods(1:max_slices-1); {'Ostatní'}];
else
    final_counts = sorted_counts;
    final_labels = sorted_methods;
end
figure('Name', 'Exoplanety podle metody objevu', 'Position', [1150, 100, 850, 600]);
pie(final_counts);
% Přidání přehledné legendy s názvy metod
legend(final_labels, 'Location', 'eastoutside', 'FontSize', 11);
title('Podíl metod použitých při objevu exoplanet', 'FontSize', 14, 'FontWeight', 'bold');
% Koláčový graf podle dekád
decades = floor(valid_years / 10) * 10;
[unique_decades, ~, idx_dec] = unique(decades);
decade_counts = accumarray(idx_dec, 1);
figure('Name', 'Exoplanety podle dekád', 'Position', [1150, 100, 800, 600]);
pie(decade_counts);
decade_labels = arrayfun(@(d) sprintf('%ds', d), unique_decades, 'UniformOutput', false);
legend(decade_labels, 'Location', 'eastoutside', 'FontSize', 11);
title('Podíl objevů exoplanet podle dekád', 'FontSize', 14, 'FontWeight', 'bold');