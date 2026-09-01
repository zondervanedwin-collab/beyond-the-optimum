function outdir = output_dir()
%OUTPUT_DIR Return/create a figures folder next to the MATLAB scripts.
%
% This avoids problems when MATLAB's Current Folder is not the same folder
% as main.m.

thisFile = mfilename('fullpath');
scriptDir = fileparts(thisFile);
outdir = fullfile(scriptDir, 'figures');

if ~exist(outdir, 'dir')
    [ok,msg] = mkdir(outdir);
    if ~ok
        error('Could not create figures directory:\n%s\n%s', outdir, msg);
    end
end
end
