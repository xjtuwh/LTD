
% This demo script runs the ECO tracker with hand-crafted features on the
% included "Crossing" video.

% Add paths
setup_paths();

% Load video information
%snow_right_object video_car1
% video_path = 'I:/201/benchmark/grass_motion_object_1';%bicycle
video_path = 'I:/data/VOT/vot_2018_lt/vot_2018_lt_new/sequences/following';
[seq, ground_truth] = load_video_info(video_path);

% Run ECO
results = testing_ECO_HC(seq);