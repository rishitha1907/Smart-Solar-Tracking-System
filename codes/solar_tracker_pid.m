clc; clear;

port = "COM3";
baud = 9600;
arduinoObj = serialport(port, baud);
configureTerminator(arduinoObj, "LF");
flush(arduinoObj);

KP = 0.06;
KI = 0.0007;
KD = 0.35;

alpha = 0.25;
deadband = 10;
max_step = 3;
integral_limit = 5000;

servoAngle = 90;
prev_error = 0;
integral = 0;

figure;
tiledlayout(4,1);

ax1 = nexttile;
hEast = animatedline(ax1,'Color','r','DisplayName','East');
hWest = animatedline(ax1,'Color','b','DisplayName','West');
legend(ax1); title('Filtered LDR Values');

ax2 = nexttile;
hBright = animatedline(ax2,'Color','m','DisplayName','Sun Intensity');
legend(ax2); title('Sun Intensity');

ax3 = nexttile;
hAngle = animatedline(ax3,'Color',[1,1,1],'DisplayName','Servo Angle');
legend(ax3); title('Servo Angle');

ax4 = nexttile;
hPID = animatedline(ax4,'Color','g','DisplayName','PID Output');
legend(ax4); title('PID Control Effort');

t0 = tic;
t_prev = toc(t0);
RUNTIME = 120;

f_east = [];
f_west = [];

while toc(t0) < RUNTIME
    dataLine = readline(arduinoObj);
    if strlength(strtrim(dataLine)) == 0
        continue;
    end
    vals = sscanf(dataLine, "%f %f");
    if numel(vals) ~= 2
        continue;
    end
    east = vals(1);
    west = vals(2);
    if isempty(f_east)
        f_east = east;
        f_west = west;
    else
        f_east = alpha*east + (1-alpha)*f_east;
        f_west = alpha*west + (1-alpha)*f_west;
    end

    intensity = (f_east + f_west)/2;

    error = f_east - f_west;
    if abs(error) < deadband
        error = 0;
    end

    P = KP * error;
    integral = integral + error;
    integral = max(min(integral, integral_limit), -integral_limit);
    I = KI * integral;
    derivative = error - prev_error;
    D = KD * derivative;
    prev_error = error;
    PID_output = P + I + D;

    desiredAngle = servoAngle + PID_output;
    delta = desiredAngle - servoAngle;
    if delta > max_step
        delta = max_step;
    elseif delta < -max_step
        delta = -max_step;
    end
    servoAngle = servoAngle + delta;
    servoAngle = max(min(servoAngle,180),0);

    writeline(arduinoObj, string(round(servoAngle)));

    t = toc(t0);
    addpoints(hEast,   t, f_east);
    addpoints(hWest,   t, f_west);
    addpoints(hBright, t, intensity);
    addpoints(hAngle,  t, servoAngle);
    addpoints(hPID,    t, PID_output);
    drawnow limitrate;

    pause(0.04);
end