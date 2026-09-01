function outdir = output_dir()
%OUTPUT_DIR Return/create the repository-level figures folder.
%
% The MATLAB source files are stored in /matlab and generated figures
% are written to the sibling /figures directory. This works irrespective
% of MATLAB's Current Folder.

thisFile = mfilename('fullpath');
scriptDir = fileparts(thisFile);
repoDir = fileparts(scriptDir);

outdir = fullfile(repoDir, 'figures');

if ~exist(outdir, 'dir')
    [ok,msg] = mkdir(outdir);
    if ~ok
        error('Could not create figures directory:\n%s\n%s', outdir, msg);
    end
end
end
