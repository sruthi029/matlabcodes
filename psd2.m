Vt=220;
Vm=sqrt(2)*Vt;
Ia=150;
Ra=0.06;
Ea=Vt-Ia*Ra;
N=875;
for n=1:2
speed(n)=input("\nenter the speed=");
E(n)=(speed(n)/N)*Ea;
Va(n)=E(n)+Ia*Ra;
angle(n)=acos(Va(n)*pi/(2*Vm));
ans(n)=rad2deg(angle(n));
fprintf("\n%d)firing angle for rated motor torque and %d rmp=%g degrees",n,speed(n),ans(n));
end


