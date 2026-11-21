# Assumptions, limitations, risks and model card

## Data cleaning assumptions
- Blank Y/N flag columns mean 'N'; other blank text means 'UNKNOWN'.
- Speed limit outside 5-80 mph, coordinates outside Chicago and hours outside 0-23 are invalid (set to missing).
- NUM_UNITS is capped at 6. Non-flag columns with more than 60% missing are dropped.
- Not fixed on purpose: missing numeric values are imputed inside the ML pipeline (train data only) to avoid leakage.

## Model card
- Target: HAS_INJURY (1 = at least one person injured). Injury rate: 13.68%.
- Intended use: help road-safety teams prioritise crash types, times and places. Not for decisions about individuals.
- Leaking columns excluded: INJURIES_TOTAL, INJURIES_FATAL, INJURIES_INCAPACITATING, INJURIES_NON_INCAPACITATING, INJURIES_REPORTED_NOT_EVIDENT, INJURIES_NO_INDICATION, INJURIES_UNKNOWN, MOST_SEVERE_INJURY, CRASH_TYPE, PRIM_CONTRIBUTORY_CAUSE, SEC_CONTRIBUTORY_CAUSE, REPORT_TYPE.
- Split: stratified random 80/20 (classes are imbalanced; crashes treated as independent). A time-based split would be stricter.
- Metrics: PR-AUC, recall, precision and F1, because accuracy is misleading with imbalanced classes.
- Chosen model: Hist Gradient Boosting | test recall 0.7228 | precision 0.3308 | PR-AUC 0.5296.
- Limitations: only crashes reported to Chicago Police; reporting may differ by area; model trained on a 100,000-row sample.
- Risks: do not use it to deny resources to an area or to judge individuals.