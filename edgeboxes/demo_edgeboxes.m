% 构建proposals生成器
%% load pre-trained edge detection model and set opts (see edgesDemo.m)
model=load('I:/201/matlab/tracker_benchmark_v1.0/trackers/ECO_HC_r2/edgeboxes/models/forest/modelBsds'); model=model.model;
model.opts.multiscale=1; model.opts.sharpen=2; model.opts.nThreads=4;
%% set up opts for edgeBoxes (see edgeBoxes.m)
opts_det = edgeBoxes;
opts_det.alpha = .65;       % step size of sliding window search
opts_det.beta  = .55;       % nms threshold for object proposals
opts_det.minScore = .001;   % min score of boxes to detect
opts_det.maxBoxes = 1e4;    % max number of boxes to detect

im = imread('E:\wh\paper\ICAUS\pic\00000088.jpg');
bbs = edgeBoxes(im, model, opts_det);
figure
imshow(im);
hold on;
for bb_idx=1:min(200, length(bbs))
    bb = bbs(bb_idx, 1:4);
    rectangle('Position',bb, 'EdgeColor','r','LineWidth',1);
    hold on;
end
hold off;
