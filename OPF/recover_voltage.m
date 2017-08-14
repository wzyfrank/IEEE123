function phasor=recover_voltage(raw, num)

s = num2str(num);
len = length(s);

phasor=zeros(1,6);
idx = 1;
for k=1:len
    cur = str2num(s(k));
    phasor(2*cur-1:2*cur)=[abs(raw(idx)),angle(raw(idx)) * 180 / pi];
    idx = idx+1;
end


