function wave_m(block)
% Level-2 MATLAB file S-Function for times two demo.

%   Copyright 1990-2009 The MathWorks, Inc.

  setup(block);
  
%endfunction

function setup(block)
  
  %% Register number of input and output ports
  block.NumInputPorts  = 3;
  block.NumOutputPorts = 2;

  block.OutputPort(1).SamplingMode = 'Sample';
  block.OutputPort(2).SamplingMode = 'Sample';
  block.InputPort(1).SamplingMode = 'Sample';
  block.InputPort(2).SamplingMode = 'Sample';
  block.InputPort(3).SamplingMode = 'Sample';
  %% Setup functional port properties to dynamically
  %% inherited.
%   block.SetPreCompInpPortInfoToDynamic;
%   block.SetPreCompOutPortInfoToDynamic;


 
  block.InputPort(1).DirectFeedthrough = true;
  block.InputPort(2).DirectFeedthrough = true;
  block.InputPort(3).DirectFeedthrough = true;
  
  %% Set block sample time to inherited
  block.SampleTimes = [-1 0];
  
  %% Set the block simStateCompliance to default (i.e., same as a built-in block)
  block.SimStateCompliance = 'DefaultSimState';

  %% Run accelerator on TLC
  block.SetAccelRunOnTLC(true);
  
  %% Register methods
  block.RegBlockMethod('Outputs',                 @Output);  
  

%endfunction


function Output(block)
    % write here passive observer equation
    
    Vm = block.InputPort(1).Data;
    vm = block.InputPort(2).Data;
    b = block.InputPort(3).Data;
    
    % Im
    block.OutputPort(1).Data = b*Vm;
    %um
    block.OutputPort(2).Data = vm;
%endfunction

