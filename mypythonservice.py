#!/usr/bin/env python3

import logging
import os
import time
from watchdog.observers import Observer
from watchdog.events import LoggingEventHandler

# load variables from environment variables
verbose = int(os.environ.get('VERBOSE', 0))
directory = os.environ.get('DIRECTORY', '/tmp/')

if __name__ == "__main__":
    if verbose:
        logging.basicConfig(level=logging.INFO,
                            format='%(asctime)s - %(message)s',
                            datefmt='%Y-%m-%d %H:%M:%S')

    event_handler = LoggingEventHandler()

    observer = Observer()
    observer.schedule(event_handler, directory, recursive=True)
    observer.start()

    try:
        while True:
            time.sleep(1)
    finally:
        observer.stop()
        observer.join()