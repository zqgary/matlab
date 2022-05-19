la = [31.21,31.2,31.2,31.21];
lo = [121.462,121.472,121.462,121.472];
apiKey = '创建自己的API';
figure
plot(lo,la,'.w','MarkerSize',1)
plot_google_map('APIKey',apiKey);