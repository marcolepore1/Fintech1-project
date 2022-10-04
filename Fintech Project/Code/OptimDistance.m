function [bestDistance bestF1] = OptimDistance(ycval,d)
bestDistance = 0;
bestF1 = 0;
stepsize = (max(d) - min(d)) / 1000;

for distance = min(d):stepsize:max(d)

    predictions = d > distance;
    tp = sum((predictions == 1) & (ycval == 1));
    fp = sum((predictions == 1) & (ycval == 0));
    fn = sum((predictions == 0) & (ycval == 1));
    prec = tp / (tp + fp);
    rec = tp / (tp + fn);
    F1 = 2 * prec * rec / (prec + rec);

    if F1 > bestF1
        bestF1 = F1;
        bestDistance = distance;
    end
    
end

end

