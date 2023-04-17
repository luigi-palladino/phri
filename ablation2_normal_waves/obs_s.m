function obs_s(block)
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
  us = block.InputPort(1).Data;
  vs = block.InputPort(2).Data;
%   e2=block.InputPort(3).Data;
%   if e2 < 1
%       e2 = 1;
%   end
  e2=block.InputPort(4).Data;
%   ust = us.';
%   vst = vs.';

  ts=us;
  qs=vs;
%   tst=ust;
%   qst=vst;

  b = block.InputPort(3).Data;
  block.OutputPort(1).Data = b*qs*qs - (1/(2*b))*((ts+b*qs)*(ts+b*qs)) -b/2*e2*qs*qs;
  
%endfunction

