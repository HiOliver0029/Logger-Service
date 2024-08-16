-- Insert example data into log table
INSERT INTO log_data (HOST_NAME, HOST_IP, SYSTEM_TYPE, LEVEL, PROCESS_NAME, CONTENT)
VALUES
    ("TPEX_DESKTOP1", "172.17.34.31", "EBTS.P", "INFO", "source", "This is example 1."),
    ("TPEX_DESKTOP2", "172.17.34.32", "EBTS.P", "INFO", "source", "This is example 2."),
    ("TPEX_DESKTOP3", "172.17.34.33", "EBTS.P", "INFO", "source", "This is example 3.");