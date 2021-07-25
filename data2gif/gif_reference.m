num = 200;% 参数a的个数，及组成GIF图的总图片个数
a_list = linspace(0.5, 5, num);% 设置参数a的取值范围
x = linspace(0, 2*pi, 200);% 设置自变量x的范围

pic_num = 1;
for i = 1:num  
    a = a_list(i);
    y = sin(a.*x);% 在一个确定的a下得到y=sin(ax)
    figure(1);
    set(figure(1), 'Color', 'white');% 设置图片窗口背景颜色为白色
    plot(x, y, 'LineWidth', 2, 'Color', [0.0118, 0.0359, 0.4824], 'DisplayName', '{\ita}='+string(roundn(a, -2))); 
    % 绘制x,y曲线，并设置线宽，曲线颜色，曲线图例名称

    grid on;% 为绘图窗口加上网格
    set(gca,'FontSize',12,'FontName','Bookman Old Style');% 设置图片中字体的大小，样式
    xlabel('Label {\itx}', 'FontSize',14);% 设置x轴标签
    xlim([min(x), max(x)]);% 设置y轴标签
    ylim([-1.2, 1.2]);% 设置y轴显示范围
    ylabel('Label {\ity}', 'FontSize',14);% 设置y轴标签
    legend('FontSize',14, 'box', 'off');% 为图片加上图例
    title('GIF: {\ity}=sin({\itax})', 'FontSize',14);% 增加图片的标题
    drawnow;% 立即刷新当前绘图窗口，这是matlab绘图中动态展示的关键
    
    F = getframe(gcf);  % 获取当前绘图窗口的图片
    Im = frame2im(F);   % 返回与电影帧相关的图片数据
    [A, map] = rgb2ind(Im, 256); % 将RGB图片转化为索引图片
    if pic_num == 1
        imwrite(A, map, 'sin.gif', 'gif', 'Loopcount', Inf, 'DelayTime', 0.1);
        % 将第一张图片写入‘sin.gif’文件中，并且将GIF播放次数设置成无穷，即保存的GIF图会一直动下去
    else
        imwrite(A, map,'sin.gif','gif','WriteMode','append','DelayTime',0.1);
        % 依次将其他的图片写入到GIF文件当中
    end
    pic_num = pic_num + 1;
end