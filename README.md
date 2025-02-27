# Getting Started
This reproducer will build a standalone mac app that uses XGBClassifier from xgboost.
If you have poetry installed running `./build.sh` should be sufficient to exhibit the problem.

# Expected Behavior

After executing `./build.sh` the following file should exist:
```bash
xgboost_macos_problem.app/Contents/MacOS/xgboost/lib/libxgboost.dylib
```

Executing the following command should succeed without errors, too:
```bash
xgboost_macos_problem.app/Contents/MacOS/xgboost_macos_problem
```

# Observed Behavior

The expected `libxgboost.dylib` file isn't present in the built application
and executing the application fails on attempting to load that library.
