%% Read Video

reader = VideoReader('..\Original\4.mp4');

fprintf('Original - FrameRate=%.1f Frames=%d\n', reader.FrameRate, reader.NumFrames);

% % Display Video
% currAxes = axes;
% while hasFrame(reader)
%     vidFrame = readFrame(reader);
%     image(vidFrame, 'Parent', currAxes);
%     currAxes.Visible = 'off';
%     pause(1/reader.FrameRate);
% end

%% Write Video - Lower FrameRate

writer = VideoWriter('4_less_fps_.mp4','MPEG-4');

framerate = 5;

writer.FrameRate = framerate;

open(writer)

% assume frameRate < vid.FrameRate
frameToExtract = ceil(reader.FrameRate/framerate);
for frame = 1 : reader.numFrames
    % Extract the frame from the movie structure.
    thisFrame = read(reader, frame); 
    if frame == 1 || mod(frame - 1, frameToExtract) == 0
        writeVideo(writer, thisFrame);
    end
end

close(writer);

%% Read New Video

%new = VideoReader('less_fps.avi');

%fprintf('New - FrameRate=%.1f Frames=%d\n', new.FrameRate, new.NumFrames);
