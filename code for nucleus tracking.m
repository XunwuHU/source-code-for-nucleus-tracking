% Load your data using 'Import data' at 'HOME', then rename your
% datafile(data variable?) to 'data'

 

id_old=0;

tracex=[];

tracey=[];

k=1

for idata=1:height(data)

    id_new=data.TRACK_ID(idata);

    if id_new==id_old

        tracex=[tracex,data.POSITION_X(idata)];

        tracey=[tracey,data.POSITION_Y(idata)];
        if idata~=1
        pace(k)=(sqrt(data.POSITION_X(idata)-data.POSITION_X(idata-1))^2+(data.POSITION_Y(idata)-data.POSITION_Y(idata-1))^2);
        k=k+1;
        end
    else

        if length(tracex) <=50
            
%             if length(tracex)>40
%                 disp(id_old)
%             end
% 
             plot(tracex-tracex(1),tracey-tracey(1),'LineWidth',2);
             alpha(.5)
             hold on

        end

        tracex=[data.POSITION_X(idata)];

        tracey=[data.POSITION_Y(idata)];

    end

    id_old=id_new;

end


% x1=[0,0]
% 
% y1=[-200,200]
% 
% x2=[-200,200]
% 
% y2=[0,0]
% 
% plot(x1,y1,'k');
% hold on
% plot(x2,y2,'k');
% hold on

axis([-175 175 -175 175])