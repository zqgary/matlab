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
% X为横坐标，Y为纵坐标（支持多维列向量）
% dt为两相邻数据点时间间隔，默认0.05s
% C为描点类型，如'*'、'o',默认为'none'
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
    % 绘制图像
    for i = 1:length(X)
        figure(1);
        set(figure(1), 'Color', 'white');% 设置图片窗口背景颜色为白色
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
            fig3 = plot(X(i), temp(i,:), 'LineWidth', 2); %绘制最新单点marker
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
        drawnow;% 立即刷新当前绘图窗口，这是matlab绘图中动态展示的关键
        
        F(i) = getframe(gcf);  % 获取当前绘图窗口的图片
    end
    
end

function saveGIF(F,dt)
% 该函数保存figure为gif图像
% F为Frame类型入参（一般是多维），dt为gif每帧播放间隔
    [file,path,indx] = uiputfile('*.gif');
    file = fullfile(path,file);
    for pic_num = 1:length(F)
        Im = frame2im(F(pic_num));   % 返回与电影帧相关的图片数据
        [A, map] = rgb2ind(Im, 256); % 将RGB图片转化为索引图片
        if pic_num == 1
            imwrite(A, map, file, 'gif', 'Loopcount', Inf, 'DelayTime', dt);
            % 将第一张图片写入‘sin.gif’文件中，并且将GIF播放次数设置成无穷，即保存的GIF图会一直动下去
        else
            imwrite(A, map,file,'gif','WriteMode','append','DelayTime',dt);
            % 依次将其他的图片写入到GIF文件当中
        end
        pic_num = pic_num + 1;
    end
end