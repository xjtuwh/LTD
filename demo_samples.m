opts.nPos_init = 500;
opts.nNeg_init = 5000;
opts.posThr_init = 0.7;
opts.negThr_init = 0.5;
opts.scale_factor = 1.05;
im = imread('E:\VOT\VOT_LT2019\sequences\uav1\color\00000001.jpg');
targetLoc = [204.0,359.0,30.0,13.0];
opts.imgSize = size(im);
        
% % draw positive/negative samples
% pos_examples = gen_samples('gaussian', targetLoc, opts.nPos_init*2, opts, 0.1, 5);
% r = overlap_ratio(pos_examples,targetLoc);
% pos_examples = pos_examples(r>opts.posThr_init,:);
% pos_examples = pos_examples(randsample(end,min(opts.nPos_init,end)),:);
% figure(1)
% imshow(im);
% hold on;
% for bb_idx=1:length(pos_examples)
%     bb = pos_examples(bb_idx, :);
%     rectangle('Position',bb, 'EdgeColor','g','LineWidth',1);
%     hold on;
% end
% hold off;

neg_examples = [gen_samples('uniform', targetLoc, opts.nNeg_init, opts, 1, 10);...
gen_samples('whole', targetLoc, opts.nNeg_init, opts)];
r = overlap_ratio(neg_examples,targetLoc);
neg_examples = neg_examples(r<opts.negThr_init,:);
neg_examples = neg_examples(randsample(end,min(opts.nNeg_init,end)),:);
figure(2)
imshow(im);
hold on;
for bb_idx=1:500
    bb = neg_examples(bb_idx, :);
    rectangle('Position',bb, 'EdgeColor','b','LineWidth',1);
    hold on;
end
hold off;