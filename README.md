# Entity-Extraction-Antisemitism-ACLED

This project focuses on developing and statistically testing an algorithm designed to extract named entities specifically related to organizing events related to antisemitism and anti-Israel activism from the ACLED dataset. 

### Objective
Evaluate the performance of an algorithm designed to extract antisemitic and anti-Israeli entities organizing the events from the ACLED dataset.

### Dataset
The ACLED dataset filtered to include only rows related to antisemitism and anti-Israel activism.

### Design of the Experiment

1. **Dataset Preparation**
   - **Filter Dataset:** Filter the ACLED dataset to retain only rows related to antisemitism and anti-Israel activism.
   - **Random Selection:** Randomly select a subset of these filtered rows for evaluation. The subset size should be large enough to ensure statistical significance.

2. **Manual Annotation**
   - **Single Annotator:** A single annotator manually extracts the organizations related to antisemitism and anti-Israel activism from each selected row.
   - **Record Data:** Record the list of organizations identified manually for each row.
   - **Ignore Empty Rows:** Ignore rows where no organizations are identified manually.

3. **Algorithmic Extraction**
   - **Run Algorithm:** Run the algorithm on the same subset of rows to extract organizations related to antisemitism and anti-Israel activism.
   - **Record Results:** Record the list of organizations identified by the algorithm for each row.

 
