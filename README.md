# NeuroML Toolbox

The NeuroML 2 toolbox for MATLAB works by facilitating access to the [Java NeuroML 2 API][jNeuroML] functionality directly within Matlab.

## Installation

Install [jNeuroML][] following the instructions at https://github.com/NeuroML/jNeuroML.
The quickest route is to go to https://github.com/NeuroML/jNeuroML/releases,
download the latest jNeuroML.zip file, and unzip somewhere suitable on your machine.

Run Matlab and run the `prefdir` command to find the location of your preferences folder.
Create a file `javaclasspath.txt` within that folder containing, on a single line,
the full path to the `jNeuroML-<version>-jar-with-dependencies.jar` file you unpacked above.

For example, on my Mac the preferences folder is
```
/Users/name/Library/Application Support/MathWorks/MATLAB/R2016b
```
and so I created `/Users/name/Library/Application Support/MathWorks/MATLAB/R2016b/javaclasspath.txt` containing
```
/Users/name/projects/jNeuroMLJar/jNeuroML-0.7.7-jar-with-dependencies.jar
```
The specific paths will vary on your machine.

Now restart Matlab and it will know how to find the jNeuroML classes.

You can test that it is working by trying to validate a NeuroML file:

```matlab
import org.neuroml.model.util.NeuroML2Validator
file = java.io.File('/full/path/to/model.nml');
validator = NeuroML2Validator();
validator.validateWithTests(file);
disp(validator.getValidity())
```

## Examples

There are further examples of usage in [examples/run_examples.m](examples/run_examples.m).

[jNeuroML]: https://github.com/NeuroML/jNeuroML
