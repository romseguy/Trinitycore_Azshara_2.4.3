update playercreateinfo set
map =1,
zone =1637,
position_x = 2126.657227,
position_y = -4732.455078,
position_z = 50.196129,
orientation = 2.535217
where race in (2, 5, 6, 8, 10);

update playercreateinfo set
map =0,
zone =1519,
position_x = -8589.630,
position_y = 800.852051,
position_z = 106.514336,
orientation = 3.801426
where race in (1, 3, 4, 7, 11);
