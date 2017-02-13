% Gradient Direction
function result = select_gDir(gmag, gdir, mag_min, angle_low, angle_high)
    % TODO Find and return pixels that fall within the desired mag, angle range
    sal=(angle_low+180)/360;
    sah=(angle_high+180)/360;
    result=gmag>=mag_min/8 & gdir>sal & gdir<sah;
end
