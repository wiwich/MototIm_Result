function writeTriggerFile(START_LEFTSIDE_MIN, START_RIGHTSIDE_MIN, FileWriteName)

Left = datetime(START_LEFTSIDE_MIN) + seconds(0:9:261); % 261 = 9s/time * 30-1 times
Right = datetime(START_RIGHTSIDE_MIN) + seconds(0:9:261);

FileDataWrite = fopen(FileWriteName, 'w');

fprintf(FileDataWrite,'Left');
fprintf(FileDataWrite,'\n');
fprintf(FileDataWrite, '%s,', timeofday(Left));
fprintf(FileDataWrite,'\n');
fprintf(FileDataWrite, 'Right');
fprintf(FileDataWrite,'\n');
fprintf(FileDataWrite, '%s,', timeofday(Right));
