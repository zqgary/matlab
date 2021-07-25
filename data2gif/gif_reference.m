num = 200;% ����a�ĸ����������GIFͼ����ͼƬ����
a_list = linspace(0.5, 5, num);% ���ò���a��ȡֵ��Χ
x = linspace(0, 2*pi, 200);% �����Ա���x�ķ�Χ

pic_num = 1;
for i = 1:num  
    a = a_list(i);
    y = sin(a.*x);% ��һ��ȷ����a�µõ�y=sin(ax)
    figure(1);
    set(figure(1), 'Color', 'white');% ����ͼƬ���ڱ�����ɫΪ��ɫ
    plot(x, y, 'LineWidth', 2, 'Color', [0.0118, 0.0359, 0.4824], 'DisplayName', '{\ita}='+string(roundn(a, -2))); 
    % ����x,y���ߣ��������߿�������ɫ������ͼ������

    grid on;% Ϊ��ͼ���ڼ�������
    set(gca,'FontSize',12,'FontName','Bookman Old Style');% ����ͼƬ������Ĵ�С����ʽ
    xlabel('Label {\itx}', 'FontSize',14);% ����x���ǩ
    xlim([min(x), max(x)]);% ����y���ǩ
    ylim([-1.2, 1.2]);% ����y����ʾ��Χ
    ylabel('Label {\ity}', 'FontSize',14);% ����y���ǩ
    legend('FontSize',14, 'box', 'off');% ΪͼƬ����ͼ��
    title('GIF: {\ity}=sin({\itax})', 'FontSize',14);% ����ͼƬ�ı���
    drawnow;% ����ˢ�µ�ǰ��ͼ���ڣ�����matlab��ͼ�ж�̬չʾ�Ĺؼ�
    
    F = getframe(gcf);  % ��ȡ��ǰ��ͼ���ڵ�ͼƬ
    Im = frame2im(F);   % �������Ӱ֡��ص�ͼƬ����
    [A, map] = rgb2ind(Im, 256); % ��RGBͼƬת��Ϊ����ͼƬ
    if pic_num == 1
        imwrite(A, map, 'sin.gif', 'gif', 'Loopcount', Inf, 'DelayTime', 0.1);
        % ����һ��ͼƬд�롮sin.gif���ļ��У����ҽ�GIF���Ŵ������ó�����������GIFͼ��һֱ����ȥ
    else
        imwrite(A, map,'sin.gif','gif','WriteMode','append','DelayTime',0.1);
        % ���ν�������ͼƬд�뵽GIF�ļ�����
    end
    pic_num = pic_num + 1;
end