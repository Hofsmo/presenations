% Read data set 1
data=read_data('data1.csv');
df = process_data(data, 0.02, 1);
plot(df);

% Read data set 1
data=read_data('data2.csv');
df = process_data(data, 0.02, 1);
plot(df);