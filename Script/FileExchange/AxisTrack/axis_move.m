test_mouse_track;

% ������
%%
function test_mouse_track()
figure;
axis([-10,10,0,5]);
set(gcf,'WindowButtonDownFcn',@ButttonDownFcn);
end
% �ص�����
function ButttonDownFcn(src,event)
pt = get(gca,'CurrentPoint');
x = pt(1,1);
y = pt(1,2);
fprintf('x=%f,y=%f\n',x,y);
end