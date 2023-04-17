function obs_m(block)
% Level-2 MATLAB file S-Function for times two demo.

%   Copyright 1990-2009 The MathWorks, Inc.

  setup(block);

%endfunction

function setup(block)
  
  %% Register number of input and output ports
  block.NumInputPorts  = 4;
  block.NumOutputPorts = 1;

  %% Setup functional port properties to dynamically
  %% inherited.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
 
  block.InputPort(1).DirectFeedthrough = true;
  block.InputPort(2).DirectFeedthrough = true;
  block.InputPort(3).DirectFeedthrough = true;
  block.InputPort(4).DirectFeedthrough = true;
  
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

  %e1=block.InputPort(3).Data;
  
%   if e1 < 1
%       e1 = 1;
%   end
  e1=block.InputPort(4).Data;
%   umt = um.';
  %vmt = vm.';
  b = block.InputPort(3).Data;
  
  %disp(B)
  %disp(M)
  Tm=um;
  qm=vm;
%   Tmt=umt;
  %qmt=vmt;
  block.OutputPort(1).Data = (1/b)*Tm*Tm - (1/(2*b))*((Tm-b*qm)*(Tm-b*qm)) - (1/(2*b))*e1*Tm*Tm;

%endfunction

