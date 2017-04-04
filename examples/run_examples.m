% Run some test cases of the Matlab NeuroML 2 "toolbox"

% Import classes for reduced typing
import java.io.File
import org.neuroml.model.util.NeuroML2Validator
import org.neuroml.export.utils.Utils
import org.lemsml.jlems.io.out.FileResultWriterFactory
import org.lemsml.jlems.viz.datadisplay.SwingDataViewerFactory
import org.lemsml.jlems.io.logging.DefaultLogger

% Construct absolute paths to example files.
% Note that we need to pass an absolute path for the first argument of the File() constructor.
% We could also pass a single argument with the absolute path to a file directly.
folder = fileparts(mfilename('fullpath'));
hh_model = File(folder, 'NML2_SingleCompHHCell.nml');
lems_file = File(folder, 'LEMS_NML2_Ex5_DetCell.xml');

% Test validation
validator = NeuroML2Validator();
validator.validateWithTests(hh_model);
disp(validator.getValidity())

% Test running a LEMS file
FileResultWriterFactory.initialize();
%SwingDataViewerFactory.initialize(); % Uncomment for GUI
DefaultLogger.initialize();
Utils.runLemsFile(lems_file, false); % true for GUI

% Hardcoded knowledge of what is output by the above!
v = load('results/ex5_v.dat');
t = v(:,1); v = v(:,2);
mhn = load('results/ex5_vars.dat');
m = mhn(:,2); h = mhn(:,3); n = mhn(:,4);

figure;
subplot(1,2,1);
plot(t, v);
xlabel('Time');
ylabel('Membrane potential');

subplot(1,2,2);
plot(t, m, t, h, t, n);
legend('m', 'h', 'n');
xlabel('Time');
ylabel('Gating variables');
