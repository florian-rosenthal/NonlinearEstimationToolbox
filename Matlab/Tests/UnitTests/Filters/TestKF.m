
classdef TestKF < matlab.unittest.TestCase
    % Provides unit tests for the KF class.
    
    % >> This function/class is part of the Nonlinear Estimation Toolbox
    %
    %    For more information, see https://bitbucket.org/nonlinearestimation/toolbox
    %
    %    Copyright (C) 2015  Jannik Steinbring <jannik.steinbring@kit.edu>
    %
    %                        Institute for Anthropomatics and Robotics
    %                        Chair for Intelligent Sensor-Actuator-Systems (ISAS)
    %                        Karlsruhe Institute of Technology (KIT), Germany
    %
    %                        http://isas.uka.de
    %
    %    This program is free software: you can redistribute it and/or modify
    %    it under the terms of the GNU General Public License as published by
    %    the Free Software Foundation, either version 3 of the License, or
    %    (at your option) any later version.
    %
    %    This program is distributed in the hope that it will be useful,
    %    but WITHOUT ANY WARRANTY; without even the implied warranty of
    %    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    %    GNU General Public License for more details.
    %
    %    You should have received a copy of the GNU General Public License
    %    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    methods (Test)
        function testConstructor(obj)
            f = KFStub();
            
            obj.verifyEqual(f.getName(), 'KFStub');
            obj.verifyEqual(f.getMaxNumIterations(), 1);
            obj.verifyEqual(f.getMeasValidationThreshold(), 1);
            
            [measurement, ...
             measMean, ...
             measCov, ...
             stateMeasCrossCov, ...
             numIterations] = f.getLastUpdateData();
            
            obj.verifyEmpty(measurement);
            obj.verifyEmpty(measMean);
            obj.verifyEmpty(measCov);
            obj.verifyEmpty(stateMeasCrossCov);
            obj.verifyEqual(numIterations, 0);
        end
    end
end