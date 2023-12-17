%=========================================================================%
%                  Event_generator for EEGlab Script                      %
%=========================================================================%
% Authors: Po-Yu Fong 
% Date last updated: 23-11-2023
% This function helps to insert event into contineous EEG data for
% epoching. The output return the new EEG.event back to EEGlab.
% Import parameters: 
% 1)EEG.event from EEGlab -> EEGevent in the function
% 2)EEG.times from EEGlab -> EEGtimes in the function
% 3)EEG.srate from EEGlab -> EEGsrate in the function
% 4)desirble length of each epoch -> EEGsrate in the function
function output=event_generator(EEGevent, EEGtimes, EEGsrate, length_epoch)
    s = fix(length(EEGtimes)/EEGsrate);
    no_event=s/length_epoch;
    for i=1:no_event
        EEGevent(i).latency=((EEGsrate*i)+(EEGsrate*(i-1)));
        EEGevent(i).duration=1;
        EEGevent(i).channel=0;
        EEGevent(i).type='S 1';
        EEGevent(i).unevent=1;
    end
    output=EEGevent;
end