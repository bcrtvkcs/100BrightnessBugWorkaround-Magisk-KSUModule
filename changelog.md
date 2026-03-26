## v1.0.4

* **Enhanced Timing Reliability:** Increased the delay after user unlock to 10 seconds to ensure the system UI is fully stabilized before cycling the screen.

## v1.0.3

* **Dual-Phase Execution:** Implemented a two-stage workaround that triggers both immediately after system boot completion (Pre-Unlock) and again after the first successful user unlock (Post-Unlock). This ensures the brightness bug is bypassed regardless of when it occurs during the startup cycle.
* **Logic Consolidation:** Cleaned up the execution flow to handle both encrypted and decrypted states within a single service routine.

## v1.0.2

* **Added Manual Trigger:** Introduced `action.sh` to allow users to manually execute the workaround from the Magisk or KernelSU manager interface at any time.
* **Enhanced Timing Reliability:** Increased the delay after user unlock to 5 seconds to ensure the system UI is fully stabilized before cycling the screen.

## v1.0.1

* **Added Unlock Detection:** Implemented a check to ensure the workaround triggers exactly 2 seconds after the initial unlock.

## v1.0.0

* Initial release

