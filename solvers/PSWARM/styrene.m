

function [f] = styrene(x)

global history;

% current version does not support p>1:
s = size(x);
p = s(1,2);
if ( p > 1 )
    fprintf('\nERROR (p>1)\n\n')
    return
end

% check the dimension of x:
if ( s(1,1) ~= 8 )
    fprintf('\nERROR (n!=8)\n\n')
    return
end

% check the bounds:
if ( sum(sum(x<0|x>100) > 0 ) )
    f = ones(1,p) * inf;
    return
end

% create input file with x coordinates:
pid = feature('getpid');
bbe = size(history,1)+1;
input_file_name = 'styrene_tmp_x_';
input_file_name = strcat(input_file_name,int2str(pid),'_',int2str(bbe),'.txt');
input_file = fopen(input_file_name,'w');
fprintf ( input_file , '%.15f\n' , x );
fclose(input_file);

% launch the simulation:
output_file_name = 'styrene_tmp_f_';
output_file_name = strcat(output_file_name,int2str(pid),'_',int2str(bbe),'.txt');

cmd  = sprintf ( '%s%s%s%s' , 'styrene.exe ' , input_file_name , ' > ' , output_file_name );
flag = system(cmd);

if ( flag == 1 )
    f = ones(1,p) * inf;
    return
end

% get the result:
output_file = fopen ( output_file_name,'r');
F=fscanf(output_file,'%f%f');
fclose(output_file);

% erase the input and output files:
delete(input_file_name);
delete(output_file_name);

chk = 1;

% check the output (may be 'ERROR X'):
s=size(F);
if ( s(1,1) ~= 12 )
    f = ones(1,p) * inf;
    chk = 0;
end

% check the constraints:
if ( chk == 1 )
    for i=1:11
        if ( F(i) > 0.0 )
        f = ones(1,p) * inf;
        chk = 0;
        end
    end
end

% objective value:
if ( chk == 1 )
    f = ones(1,p) * F(12);
end

% update history:
bbe = size(history,1)+1;
history = [ history ; bbe x' f ];

return