%=========================================================================%
%                           MEP visual inspection                         %
%=========================================================================%
% Authors: Po-Yu Fong 
% Date last updated: 18-12-2023
% To display all the waveforms of MEP recording with 1000 samples in time.
% Range of amplitude: -50uV ~ 50uV.
% Variables:
% page_max: maximum number of the page for the waveforms.
% MEP_state: MEP data of this state (or conditon)
% no_M1: the sequence number of the trial (MEP recording)
% no_plot: the plot correlate to the no_M1
% position: the sequence number of the plot in a page (1-30).

page_max=ceil(length(MEP_state)/30); %how many page to show the MEP waveforms. Each page include 30 MEP trials.
    for k=1:page_max
         figure;
         position=1;
         for no_plot=1+((k-1)*30):30+((k-1)*30)
             n_M1=MEP_state{no_plot};
             subplot(6,5,position);plot(1:1000,MEP_state{no_plot});ylim([-0.05 0.05]);
             title(no_plot);
             position=position+1;

         end
    end