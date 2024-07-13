% Financial Data
revenue = [1000, 1100, 1200, 1300, 1400]; % Revenue over 5 years
expenses = [500, 600, 650, 750, 900]; % Expenses over 5 years
assets = [5000, 5500, 6000, 6500, 7000]; % Total assets over 5 years
liabilities = [3000, 3200, 3400, 3600, 3800]; % Total liabilities over 5 years
 
% Profit Calculation
profit = revenue - expenses;
 
% Calculate Financial Ratios
net_profit_margin = profit ./ revenue; % Net Profit Margin
return_on_assets = profit ./ assets; % Return on Assets
debt_to_equity_ratio = liabilities ./ assets; % Debt-to-Equity Ratio
 
% Display Results
fprintf('Year\tRevenue\tExpenses\tProfit\tNet Profit Margin\tReturn on Assets\tDebt-to-Equity Ratio\n');
for i = 1:length(revenue)
    fprintf('%d\t\t%d\t\t%d\t\t%d\t\t%.2f\t\t%.2f\t\t%.2f\n', i, revenue(i), expenses(i), profit(i), net_profit_margin(i), return_on_assets(i), debt_to_equity_ratio(i));
end
 
% Digital Signal Processing
fs = 1; % Sampling frequency (1 sample per year)
t = (0:length(revenue)-1) / fs; % Time vector
 
% Apply a low-pass filter to smooth the data
fc = 0.2; % Cut-off frequency
[b, a] = butter(2, fc, 'low'); % 2nd order Butterworth filter
revenue_filtered = filter(b, a, revenue);
expenses_filtered = filter(b, a, expenses);
profit_filtered = filter(b, a, profit);
 
% Compute the Fourier Transform to analyze frequency components
revenue_fft = fft(revenue);
expenses_fft = fft(expenses);
profit_fft = fft(profit);
 
% Plotting
years = 1:length(revenue);
figure;
subplot(2, 2, 1);
plot(years, revenue, 'b-o', years, revenue_filtered, 'b--');
xlabel('Year');
ylabel('Revenue');
title('Revenue Trend');
legend('Original', 'Filtered');
 
subplot(2, 2, 2);
plot(years, expenses, 'r-o', years, expenses_filtered, 'r--');
xlabel('Year');
ylabel('Expenses');
title('Expenses Trend');
legend('Original', 'Filtered');
 
subplot(2, 2, 3);
plot(years, profit, 'g-o', years, profit_filtered, 'g--');
xlabel('Year');
ylabel('Profit');
title('Profit Trend');
legend('Original', 'Filtered');
 
subplot(2, 2, 4);
f = (0:length(revenue_fft)-1) * fs / length(revenue_fft); % Frequency vector
plot(f, abs(revenue_fft), 'b-o', f, abs(expenses_fft), 'r-o', f, abs(profit_fft), 'g-o');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
legend('Revenue FFT', 'Expenses FFT', 'Profit FFT');
title('Frequency Components');
 
% Analyzing financial ratios with filters and Fourier Transform
net_profit_margin_fft = fft(net_profit_margin);
return_on_assets_fft = fft(return_on_assets);
debt_to_equity_ratio_fft = fft(debt_to_equity_ratio);
 
figure;
subplot(3, 1, 1);
plot(f, abs(net_profit_margin_fft), 'm-o');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Net Profit Margin FFT');
 
subplot(3, 1, 2);
plot(f, abs(return_on_assets_fft), 'c-o');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Return on Assets FFT');
 
subplot(3, 1, 3);
plot(f, abs(debt_to_equity_ratio_fft), 'k-o');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Debt-to-Equity Ratio FFT');
