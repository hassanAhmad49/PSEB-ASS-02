# Error analysis

False negatives: 757 | False positives: 3993

## Injury crashes the model missed
```
 proba  POSTED_SPEED_LIMIT         FIRST_CRASH_TYPE     LIGHTING_CONDITION        DAMAGE
 0.024                 NaN     PARKED MOTOR VEHICLE               DAYLIGHT   OVER $1,500
 0.028                10.0     PARKED MOTOR VEHICLE               DAYLIGHT $501 - $1,500
 0.031                30.0     PARKED MOTOR VEHICLE               DAYLIGHT $501 - $1,500
 0.033                20.0 SIDESWIPE SAME DIRECTION                UNKNOWN $501 - $1,500
 0.034                10.0     PARKED MOTOR VEHICLE DARKNESS, LIGHTED ROAD   OVER $1,500
 0.037                40.0     PARKED MOTOR VEHICLE DARKNESS, LIGHTED ROAD   OVER $1,500
 0.039                15.0     PARKED MOTOR VEHICLE DARKNESS, LIGHTED ROAD $501 - $1,500
 0.040                30.0     PARKED MOTOR VEHICLE               DAYLIGHT  $500 OR LESS
 0.044                30.0     PARKED MOTOR VEHICLE               DARKNESS $501 - $1,500
 0.045                30.0     PARKED MOTOR VEHICLE               DAYLIGHT   OVER $1,500
```

## No-injury crashes flagged as injury
```
 proba  POSTED_SPEED_LIMIT FIRST_CRASH_TYPE     LIGHTING_CONDITION        DAMAGE
 0.981                30.0       PEDESTRIAN DARKNESS, LIGHTED ROAD   OVER $1,500
 0.980                30.0       PEDESTRIAN               DAYLIGHT   OVER $1,500
 0.978                30.0       PEDESTRIAN                   DAWN   OVER $1,500
 0.977                30.0       PEDESTRIAN DARKNESS, LIGHTED ROAD   OVER $1,500
 0.977                30.0       PEDESTRIAN               DAYLIGHT   OVER $1,500
 0.977                30.0       PEDESTRIAN               DAYLIGHT   OVER $1,500
 0.976                35.0       PEDESTRIAN               DAYLIGHT $501 - $1,500
 0.976                30.0       PEDESTRIAN               DAYLIGHT   OVER $1,500
 0.975                35.0       PEDESTRIAN               DARKNESS   OVER $1,500
 0.973                30.0       PEDESTRIAN DARKNESS, LIGHTED ROAD $501 - $1,500
```

## Performance by hour_band
```
      hour_band    n  injury_rate  recall  precision
Afternoon 12-17 8330        0.127   0.684      0.336
   Morning 6-11 5098        0.133   0.713      0.351
  Evening 18-23 4730        0.149   0.770      0.317
      Night 0-5 1802        0.160   0.775      0.310
```

## Performance by LIGHTING_CONDITION
```
    LIGHTING_CONDITION     n  injury_rate  recall  precision
               UNKNOWN   925        0.035   0.562      0.340
              DARKNESS   974        0.117   0.693      0.311
              DAYLIGHT 12754        0.132   0.699      0.337
                  DUSK   580        0.147   0.741      0.366
                  DAWN   342        0.149   0.765      0.355
DARKNESS, LIGHTED ROAD  4385        0.174   0.781      0.318
```

## Performance by WEATHER_CONDITION
```
WEATHER_CONDITION     n  injury_rate  recall  precision
          UNKNOWN  1072        0.049   0.472      0.357
             SNOW   672        0.097   0.631      0.259
  CLOUDY/OVERCAST   597        0.159   0.653      0.341
            CLEAR 15698        0.140   0.729      0.332
             RAIN  1747        0.169   0.767      0.334
```

## Performance by FIRST_CRASH_TYPE
```
            FIRST_CRASH_TYPE    n  injury_rate  recall  precision
    SIDESWIPE SAME DIRECTION 3122        0.050   0.199      0.195
               REAR TO FRONT  214        0.051   0.364      0.286
        PARKED MOTOR VEHICLE 4570        0.038   0.370      0.252
                REAR TO SIDE  121        0.050   0.500      0.200
                    REAR END 4517        0.126   0.539      0.209
                OTHER OBJECT  198        0.167   0.576      0.306
SIDESWIPE OPPOSITE DIRECTION  275        0.084   0.696      0.235
                     TURNING 2791        0.159   0.748      0.243
                FIXED OBJECT  862        0.183   0.797      0.297
                       ANGLE 2218        0.215   0.843      0.332
                     HEAD ON  173        0.254   0.955      0.341
                PEDALCYCLIST  304        0.727   1.000      0.727
                  PEDESTRIAN  464        0.860   1.000      0.860
```

## Permutation importance (drop in PR-AUC, top 10)
```
FIRST_CRASH_TYPE          0.3417
DAMAGE                    0.0630
NUM_UNITS                 0.0444
LATITUDE                  0.0135
INTERSECTION_RELATED_I    0.0133
HIT_AND_RUN_I             0.0112
TRAFFICWAY_TYPE           0.0106
WEATHER_CONDITION         0.0044
LIGHTING_CONDITION        0.0044
LONGITUDE                 0.0034
```