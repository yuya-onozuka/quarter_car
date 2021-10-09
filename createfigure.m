function createfigure(x,y)

f = figure;
t = tiledlayout(1,1,'Padding','none');
f.PaperUnits      = 'centimeters';
f.PaperPosition   = [0,0,15.3,8];
f.Units           = 'centimeters';
f.Position        = [0,0,15.3,8];
f.Color           = 'w';
f.InvertHardcopy  = 'off';
t.Units = 'centimeters';
t.InnerPosition = [1.7 1.0 13.3 6.5];
nexttile
plot(x, y,'LineWidth',1);
xlabel('Time [s]');
yline(0,'--')

ax = gca;
%ax.FontName = 'Times New Roman';
ax.FontSize = 11;