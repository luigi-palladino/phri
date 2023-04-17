function obs_m(block)
% Level-2 MATLAB file S-Function for times two demo.

%   Copyright 1990-2009 The MathWorks, Inc.

  setup(block);

%endfunction

function setup(block)
  
  %% Register number of input and output ports
  block.NumInputPorts  = 5;
  block.NumOutputPorts = 1;

  %% Setup functional port properties to dynamically
  %% inherited.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
 
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

  um = block.InputPort(1).Data;
  vm = block.InputPort(2).Data;

  e1=block.InputPort(3).Data;
  
  if e1 < 1
      e1 = 1;
  end
  umt = um.';
  vmt = vm.';
  B = block.InputPort(4).Data;
  M = block.InputPort(5).Data;
  
  %disp(B)
  %disp(M)

  block.OutputPort(1).Data = (2/(1+B))*umt*um + (2/(M*(1+B)))*vmt*vm - (1/(M*(1+B)))*((vm-M*um).')*(vm - M*um)-((1/(M*(1+B)))*e1*vmt*vm);
  
%endfunction

