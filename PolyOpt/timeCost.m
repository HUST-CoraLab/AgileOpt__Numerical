function [cost,grad] = timeCost(coeffs,segpoly)
%TIMECOST 计算时间相关的cost
%   此处显示详细说明
n_seg = segpoly.seg;

cost = 0;
grad = zeros(segpoly.coeffl,1);
gradt = zeros(n_seg,1);

%##########################################################################
TimeOptimal = segpoly.TimeOptimal;
if (TimeOptimal)
    ts = coeffs(end-n_seg + 1:end); % 最后的n_seg个变量是tau
    T = exp(ts);
%     cost = sum(T);
%     gradt = T;
    cost = sum(T.^2);
    gradt = 2*T.^2;
    grad = [grad;gradt];
end

end
