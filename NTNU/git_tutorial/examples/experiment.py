"""Module containing an example function."""
import scipy.signal as sig
import numpy as np


def preprocess_data(signal, window=100, detrend=True):
    """Function that preproccesses some data.
    This functions preproccesses a signal by detrending it
    and then applying a moving average filter.
    Args:
        signal: Input signal
        window: Window size used for the moving average filter
        detrend: Whether or not to detrend the signal
    Output:
        processed: The preprocessed signal
    """
    # Detrend the signal
    if detrend:
        signal = sig.detrend

    # Apply a moving average filter using convolution
    window = np.ones(window)/float(window)
    return np.convolve(signal, window, 'same')
