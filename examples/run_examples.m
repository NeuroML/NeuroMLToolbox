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
SwingDataViewerFactory.initialize(); % Remove for no GUI
DefaultLogger.initialize();
Utils.runLemsFile(lems_file, true); % false for no GUI

