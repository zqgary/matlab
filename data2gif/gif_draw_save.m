T = linspace(0,25,100);
sys1 = tf(1,[1 0.5 1]);
sys2 = tf(1,[1 1 1]);
sys3 = tf(1,[1 2 1]);
Y1 = step(sys1,T);
Y2 = step(sys2,T);
Y3 = step(sys3,T);

F = genGIF(T,[Y1 Y2 Y3],0.001,{'*','o','s'},{'Y1','Y2','Y3'});
saveGIF(F,0.01);
function F = genGIF(X,Y,varargin)
% XΪ�����꣬YΪ�����֧꣨�ֶ�ά��������
% dtΪ���������ݵ�ʱ������Ĭ��0.05s
% CΪ������ͣ���'*'��'o',Ĭ��Ϊ'none'
    switch length(varargin)
        case 1
            dt = varargin{1};
        case 2
            dt = varargin{1};
            marker = varargin{2};
        case 3
            dt = varargin{1};
            marker = varargin{2};
            label = varargin{3};
        otherwise
            dt = 0.05;
    end
    % ����ͼ��
    for i = 1:length(X)
        figure(1);
        set(figure(1), 'Color', 'white');% ����ͼƬ���ڱ�����ɫΪ��ɫ
        [rowY,colY] = size(Y);
        temp = [Y(1:i,:);nan([rowY-i colY])];
        if i == 1
            fig = plot(X, temp, 'LineWidth', 2);
            hold on;
            for j = 1:colY
                sigColor{j} = fig(j).Color;
            end
        else
            fig2 = plot(X, temp, 'LineWidth', 2);
            hold on;
            fig3 = plot(X(i), temp(i,:), 'LineWidth', 2); %�������µ���marker
            legend;
            for j = 1:colY
                fig2(j).Color = sigColor{j};
                fig3(j).Color = sigColor{j};
                if exist('label')
%                     fig3(j).DisplayName = label{j};
                    legend(label);
                end
                if exist('marker')
                    fig2(j).Marker = 'none';
                    fig3(j).Marker = marker{j};
                    hold off;
                end
            end
        end
        grid on;
        
        pause(dt);
        drawnow;% ����ˢ�µ�ǰ��ͼ���ڣ�����matlab��ͼ�ж�̬չʾ�Ĺؼ�
        
        F(i) = getframe(gcf);  % ��ȡ��ǰ��ͼ���ڵ�ͼƬ
    end
    
end

function saveGIF(F,dt)
% �ú�������figureΪgifͼ��
% FΪFrame������Σ�һ���Ƕ�ά����dtΪgifÿ֡���ż��
    [file,path,indx] = uiputfile('*.gif');
    file = fullfile(path,file);
    for pic_num = 1:length(F)
        Im = frame2im(F(pic_num));   % �������Ӱ֡��ص�ͼƬ����
        [A, map] = rgb2ind(Im, 256); % ��RGBͼƬת��Ϊ����ͼƬ
        if pic_num == 1
            imwrite(A, map, file, 'gif', 'Loopcount', Inf, 'DelayTime', dt);
            % ����һ��ͼƬд�롮sin.gif���ļ��У����ҽ�GIF���Ŵ������ó�����������GIFͼ��һֱ����ȥ
        else
            imwrite(A, map,file,'gif','WriteMode','append','DelayTime',dt);
            % ���ν�������ͼƬд�뵽GIF�ļ�����
        end
        pic_num = pic_num + 1;
    end
end