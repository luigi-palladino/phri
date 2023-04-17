function pcon_m(block)
% Level-2 MATLAB file S-Function for times two demo.

%   Copyright 1990-2009 The MathWorks, Inc.

  setup(block);
  
%endfunction

function setup(block)
  
  %% Register number of input and output ports
  block.NumInputPorts  = 3;
  block.NumOutputPorts = 1;

  block.OutputPort(1).SamplingMode = 'Inherited';
  %block.OutputPort(2).SamplingMode = 'Inherited';
  block.InputPort(1).SamplingMode = 'Inherited';
  block.InputPort(2).SamplingMode = 'Inherited';
  block.InputPort(3).SamplingMode = 'Inherited';
  %block.InputPort(4).SamplingMode = 'Inherited';
  %% Setup functional port properties to dynamically
  %% inherited.
%   block.SetPreCompInpPortInfoToDynamic;
%   block.SetPreCompOutPortInfoToDynamic;


 
  block.InputPort(1).DirectFeedthrough = true;
  block.InputPort(2).DirectFeedthrough = true;
  
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
    POm = block.InputPort(2).Data;
    Im = block.InputPort(3).Data;
    
    
    if POm > 0
      L1=0;
    else
      %L1=-POm*pinv((Vm.')*Vm);
      L1=-POm/(Vm*Vm);
    end
    
    block.OutputPort(1).Data = Im + L1*Vm;
    %block.OutputPort(2).Data = L1;
%endfunction

