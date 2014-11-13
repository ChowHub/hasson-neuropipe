
% starting dir should be <myproject>/subjects/<subjid>/scripts
cd ..
[pathstr subjid] = fileparts(pwd);
runorder0=textread('run-order.txt','%s','delimiter','\n');
i = 1;
for r = 1:length(runorder0)
    if strcmp(runorder0{r}(1),'#')
        continue
    else
        s = strfind(runorder0{r},' ');
        runorder1{i} = runorder0{r}(1:s-1);
        runorder2{i} = runorder0{r}(s+1:end);
        i = i + 1;
    end
end
cd('data/nifti');
d = dir('*.nii.gz');
if length(d) ~= length(runorder1)
    fprintf('Wrong number of runs');
    return
end
for r = 1:length(runorder1)
   movefile([runorder1{r} '.nii.gz'],[subjid '_' runorder2{r} '.nii.gz']);
end
cd ../../scripts
