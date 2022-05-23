function [seq, ground_truth] = load_video_info(video_path)

% ground_truth = dlmread([video_path '/groundtruth_rect.txt']);
ground_truth = dlmread([video_path '/groundtruth.txt']);
seq.format = 'otb';
seq.len = size(ground_truth, 1);
seq.init_rect = ground_truth(1,:);

% img_path = [video_path '/img/'];
img_path = [video_path '/color/'];
if exist([img_path num2str(1, '%08i.png')], 'file'),
    img_files = num2str((1:seq.len)', [img_path '%04i.png']);
% elseif exist([img_path num2str(2051, '%08i.jpg')], 'file'),
% elseif exist([img_path num2str(51, '%08i.jpg')], 'file'),
elseif exist([img_path num2str(1, '%08i.jpg')], 'file'),
% elseif exist([img_path num2str(1, '%05i.jpg')], 'file'),
%     img_files = num2str((1:seq.len)', [img_path '%04i.jpg']);
%     img_files = num2str((2051:2051+seq.len-1)', [img_path '%08i.jpg']);
    img_files = num2str((1:seq.len)', [img_path '%08i.jpg']);
%     img_files = num2str((1:seq.len)', [img_path '%05i.jpg']);
elseif exist([img_path num2str(1, '%08i.bmp')], 'file'),
    img_files = num2str((1:seq.len)', [img_path '%04i.bmp']);
else
    error('No image files to load.')
end

seq.s_frames = cellstr(img_files);

end

