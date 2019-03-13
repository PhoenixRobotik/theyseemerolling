$fn=200;

function in(inches) = inches *25.4;

height_bottom = (in(0.3) - in(0.15))/2 + 0.5;
diam_in1 = in(0.8)+1.6;
diam_in2 = 22+0.6+1;

diam_pos_screw = 10.75;
diam_screw = 6;

diam_pulley_out = 31.5;

module fixup_wheel(height=0, diam_in=0, diam_out=30) {
    difference() {
        union() {
            cylinder(d=diam_out, h=height_bottom);
            
            translate([0, 0, height_bottom])
            cylinder(d=diam_out, h=height);
        }
        union() {
            // Wheel
            translate([0,0,-0.001])
            cylinder(d1=diam_in2, d2=diam_in1, h=height_bottom+0.002);
            
            // Bearing
            cylinder(d=diam_in, h=10);
            
            // Screws
            for(i=[0:2]) rotate([0,0,120*i]) {
                translate([diam_pos_screw, 0, 0]) cylinder(center=true, d=diam_screw, h=20);
            }
        }
    }
}

module fixup_pulley() {
    height_fixup_pulley = 4;
    difference() {
        cylinder(h=height_fixup_pulley,   d=diam_pulley_out + 2.5);
        translate([0,0,-1])
        cylinder(h=height_fixup_pulley+2, d=diam_pulley_out + 0.5);
    }
}

// fixup_wheel(height = 0.5,           diam_in = 15);
fixup_wheel(height = 10-in(0.3)-0.6,    diam_in = 16.2, diam_out = diam_pulley_out);
//translate([0,0,1.5]) #fixup_pulley();







