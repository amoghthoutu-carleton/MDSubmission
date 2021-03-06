function [ output_args ] = AddParticleStream(num, x0, y0, PartAng, Type, Ep, Seper)
global AtomSpacing x y AtomType Vx Vy Mass0 Mass1 nAtoms

if Type == 0
    Mass = Mass0;
else
    Mass = Mass1;
end

for p = 0:num - 1
    nAtoms = nAtoms + 1;
    %x(nAtoms) = x0 * AtomSpacing - Seper * p * AtomSpacing * cos(PartAng);
    %y(nAtoms) = y0 * AtomSpacing - Seper * p * AtomSpacing * sin(PartAng);
    
    %random particle angles
    x(nAtoms) = x0 * AtomSpacing - Seper * p * AtomSpacing * cos( pi/4+ (3*pi/4 - pi/4).*rand(1,1));
    y(nAtoms) = y0 * AtomSpacing - Seper * p * AtomSpacing * sin( pi/4+ (3*pi/4 - pi/4).*rand(1,1));
    AtomType(nAtoms) = Type;
end

V = sqrt(2 * Ep / Mass);

for p = 1:num
    Vx(nAtoms - num + p) = V * cos(PartAng);
    Vy(nAtoms - num + p) = V * sin(PartAng);
end

end
