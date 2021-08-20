__author1__ = 'David Northcote'
__organisation__ = 'The University of Strathclyde'
__date__ = '20th August 2021'
__version_name__ = 'Xilinx Adapt 2021'
__version_number__ = '0.1.0'
__channels__ = 'Dual-channel'
__board__ = 'RFSoC2x2'
__release__ = 'release'
__info__ = 'RFSoC 700MHz & 3500MHz Application'
__support__ = '<a href="https://github.com/strath-sdr/rfsoc_xilinx_adapt" target="_blank" rel="noopener noreferrer">https://github.com/strath-sdr/rfsoc_xilinx_adapt</a>'

about = ''.join(['<br><b>', __info__, '</b><br>', __channels__, ' ', __board__,
                ' ', __release__, '<br>', 'Version ', __version_number__,
                ': ', __version_name__, '<br>Date: ', __date__, '<br><br>',
                '<b>Organisation:</b> <br>', __organisation__,
                '<br><br>', '<b>Support</b>:<br>', __support__])


from pynq import Overlay, allocate
import xrfclk
import xrfdc
import os
from hierarchies import *
from rfsoc_sam.quick_widgets import Image
from ipywidgets import IntProgress
from IPython.display import display
from IPython.display import clear_output
import time
import threading

load_progress = 0
max_count = 100
load_bar = IntProgress(min=load_progress, max=max_count) # instantiate the bar


def generate_about():
    global about
    about = ''.join(['<br><b>', __info__, '</b><br>', __channels__, ' ', __board__,
                    ' ', __release__, '<br>', 'Version ', __version_number__,
                    ': ', __version_name__, '<br>Date: ', __date__, '<br><br>',
                    '<b>Organisation:</b> <br>', __organisation__,
                    '<br><br>', '<b>Support</b>:<br>', __support__])


class Overlay(Overlay):
    
    def __init__(self, init_rf_clks=True, **kwargs):

        global __channels__
        
        this_dir = os.path.dirname(__file__)
        bitfile_name = os.path.join(this_dir, 'bitstream', 'rfsoc_xilinx_adapt.bit')
        __channels__ = 'Multi-Channel OFDM'
        generate_about()       
        
        super().__init__(bitfile_name, **kwargs)
        
        self.init_i2c()

        if init_rf_clks:
            self.init_rf_clks(lmx_freq=360)
            

    def init_i2c(self):
        """Initialize the I2C control drivers on RFSoC2x2.
        This should happen after a bitstream is loaded since I2C reset
        is connected to PL pins. The I2C-related drivers are made loadable
        modules so they can be removed or inserted.
        """
        module_list = ['i2c_dev', 'i2c_mux_pca954x', 'i2c_mux']
        for module in module_list:
            cmd = "if lsmod | grep {0}; then rmmod {0}; fi".format(module)
            ret = os.system(cmd)
            if ret:
                raise RuntimeError(
                    'Removing kernel module {} failed.'.format(module))

        module_list.reverse()
        for module in module_list:
            cmd = "modprobe {}".format(module)
            ret = os.system(cmd)
            if ret:
                raise RuntimeError(
                    'Inserting kernel module {} failed.'.format(module))
                
                
    def init_rf_clks(self, lmk_freq=122.88, lmx_freq=409.6):
        """Initialise the LMX and LMK clocks for RF-DC operation.
        """
        xrfclk.set_ref_clks(lmk_freq=lmk_freq, lmx_freq=lmx_freq)
    
    
    def _update_progress(self):
        while load_bar.value is not 100:
            if load_bar.value < 100:
                load_bar.value = load_bar.value + 1
                time.sleep(0.5)
            else:
                pass
           
        
    def _sam_ofdm_generator(self, config=None):
        def tab_handler(widget):
            tab_idx = widget['new']
            for i in range(0, len(self.radio.receiver.channels)):
                if i is not tab_idx:
                    self.radio.receiver.channels[i].frontend.stop()
            self.radio.receiver.channels[tab_idx].frontend.start()
            
        sam = self.radio.receiver._get_spectrum_analyser(config)
        tab_name = [''.join(['Spectrum Analyzer ', str(j)]) for j in range(0, len(sam))]
        children = [sam[i] for i in range(0, len(sam))]
        tab = ipw.Tab(children=children,
                      layout=ipw.Layout(height='initial',
                                        width='initial'))
        for i in range(0, len(children)):
            tab.set_title(i, tab_name[i])
        tab.observe(tab_handler, 'selected_index')
        return tab
    
        
    def _ctl_ofdm_generator(self, config=None):            
        ctl = self.radio.transmitter._get_transmitter_control(config)
        tab_name = [''.join(['Transmitter Control ', str(j)]) for j in range(0, len(ctl))]
        children = [ctl[i] for i in range(0, len(ctl))]
        tab = ipw.Tab(children=children,
                      layout=ipw.Layout(height='initial',
                                        width='initial'))
        for i in range(0, len(children)):
            tab.set_title(i, tab_name[i])
        return tab


    def _app_ofdm_generator(self, config_analyser=None, config_transmitter=None):
        def tab_handler(widget):
            tab_idx = widget['new']
            for i in range(0, len(self.radio.receiver.channels)):
                if i is not tab_idx:
                    self.radio.receiver.channels[i].frontend.stop()
            for i in range(len(self.radio.receiver.channels), len(self.radio.receiver.channels)*2):
                if i is not tab_idx:
                    self.radio.receiver.channels[len(self.radio.receiver.channels)*2-1-i].frontend._widgets['constellation_enable'].configure_state(False)
            if tab_idx < len(self.radio.receiver.channels):
                self.radio.receiver.channels[tab_idx].frontend.start()
        sam = self.radio.receiver._get_spectrum_analyser(config_analyser)
        ctl = self.radio.transmitter._get_transmitter_control(config_transmitter)
        iqp = self.radio.receiver._get_constellation_plot()
        tab_name = [''.join(['Spectrum Analyzer ', str(j)]) for j in range(0, len(sam))]
        tab_name.extend([''.join(['Constellation Plot ', str(j)]) for j in range(0, len(iqp))])
        tab_name_tx = [''.join(['Transmitter ', str(j)]) for j in range(0, len(sam))]
        children = [sam[i] for i in range(0, len(sam))]
        children.extend([iqp[i] for i in range(0, len(iqp))])
        tab = ipw.Tab(children=children,
                      layout=ipw.Layout(height='initial',
                                        width='initial'))
        tab_tx = ipw.Tab(children=[ctl[i] for i in range(0, len(ctl))],
                         layout=ipw.Layout(height='initial',
                                           width='initial'))
        for i in range(0, len(ctl)):
            tab_tx.set_title(i, tab_name_tx[i])
        for i in range(0, len(children)):
            tab.set_title(i, tab_name[i])
        tab.observe(tab_handler, 'selected_index')
        return ipw.HBox([tab, tab_tx])
    
    
    def spectrum_ofdm_analyzer(self, config=None):
        display(load_bar) # display the bar
        thread = threading.Thread(target=self._update_progress)
        thread.start()
        sam_tab = self._sam_ofdm_generator([config, config])
        ctl_tab = self._ctl_ofdm_generator()
        
        this_dir = os.path.dirname(__file__)
        img = os.path.join(this_dir, 'assets', 'pynq_logo_light.png')
        if config is not None:
            if 'plotly_theme' in config:
                if config['plotly_theme'] == 'plotly_dark':
                    img = os.path.join(this_dir, 'assets', 'pynq_logo_dark.png')
        about_html = ipw.HTML(value=about)
        pynq_image = Image(image_file=img,
                           width=300,
                           height=200)
        sidebar = ipw.VBox([pynq_image.get_widget(), about_html, ])
        app = ipw.HBox([sidebar, sam_tab, ipw.VBox([ipw.HBox([ctl_tab])])])
        load_bar.value = 100
        clear_output(wait=True)
        return app

    
    def spectrum_ofdm_analyzer_application(self, config_rx=None, config_tx=None):
        display(load_bar) # display the bar
        thread = threading.Thread(target=self._update_progress)
        thread.start()
        app_tab = self._app_ofdm_generator(config_analyser=config_rx,
                                           config_transmitter=config_tx)
        this_dir = os.path.dirname(__file__)
        img = os.path.join(this_dir, 'assets', 'pynq_logo_light.png')
        if config_rx is not None:
            for config in config_rx:
                if 'plotly_theme' in config:
                    if config['plotly_theme'] == 'plotly_dark':
                        img = os.path.join(this_dir, 'assets', 'pynq_logo_dark.png')
        about_html = ipw.HTML(value=about)
        pynq_image = Image(image_file=img,
                           width=300,
                           height=200)
        sidebar = ipw.VBox([pynq_image.get_widget(), about_html, ])
        app = ipw.HBox([sidebar, app_tab])
        load_bar.value = 100
        clear_output(wait=True)
        return app