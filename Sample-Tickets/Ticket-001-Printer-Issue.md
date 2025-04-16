# **Ticket 001 - Printer Not Printing**

## **Issue**

**User Report**: An employee from the Finance department (Jane Doe) reported that she could not print to the **HP LaserJet 4000** network printer on the 3rd floor. Print jobs were getting stuck in her queue and nothing was coming out of the printer. The user tried restarting her PC and the printer, but the issue persisted.   

**Impact**: The user was unable to print time-sensitive financial reports needed for a meeting. No other users had reported issues with this printer at the time, so it appeared to be an isolated incident to this user or workstation.   

**Ticket Details**:  
- **Ticket ID**: 001
- **Opened**: 2025-04-10 09:30 AM
- **Priority**: Medium (User productivity impacted)
- **Assigned Technician**: John Smith

## **Environment**

- **User Device**: Dell OptiPlex 7080 desktop running Windows 10 Pro (21H2).
- **Printer**: HP LaserJet 4000 (Networked via Ethernet, static IP 10.1.10.25) configured on print server PRN-SRV-01.
- **Network**: The user’s PC and the printer are on the same LAN (10.1.10.0/24). The PC communicates with the printer through the company print server.
- **Software/Driver**: HP Universal Print Driver (v7.x) installed on the print server and deployed to client via Group Policy.

## **Troubleshooting Steps**

- **Initial Triage (09:45 AM)**: Contacted the user to gather details and walked her through basic checks:
  - Verified the printer’s power and network status: The printer’s display showed “Ready” and it was online (no error lights). She had already power-cycled the printer once.
  - The user had no other printing alternatives, so the issue needed to be resolved on this printer.
 
- **Replicate the Issue**: Remotely connected to the user’s PC to observe the problem:
  - Found three documents in the print queue for the HP LaserJet, all in a stuck state (the status of the first job was “Error - Printing”).
  - Attempted to print a Windows test page from her PC. The test page also got stuck in the queue and did not print.
 
- **Clear Stuck Print Jobs (09:50 AM)**: Cleared the user’s print queue:
  - Cancelled all pending print jobs for the HP printer on the user’s PC.
  - Confirmed the queue was empty, then initiated another test print (to start fresh and see if a new job would go through).

- **Printer Status Check**: Noticed the printer icon on the user’s PC was showing as “Offline” even after clearing the queue:
  - Checked the printer properties. The port configuration was correct (pointing to the print server queue).
  - Verified that “**Use Printer Offline**” was NOT enabled (sometimes users accidentally toggle this). It was not toggled – Windows was genuinely seeing it as offline.

- **Network Connectivity (09:55 AM)**: Ensured the PC could reach the printer:
  - Used the command prompt to ```ping 10.1.10.25``` (printer’s IP). The ping replies were successful with low latency, indicating network connectivity to the printer was fine.
  - RDP’ed into **PRN-SRV-01** (the print server) to check the printer’s status from the server side. On the server, the printer showed as “Ready” with no jobs in its queue. This implied the jobs weren’t reaching the server from the user’s PC.
 
- **Restart Print Spooler (10:00 AM)**: Suspected a Windows spooler service issue on the user’s machine:
  - On the user’s PC, opened Services (services.msc) and located Print Spooler. It was running, but we chose to restart it.
  - After restarting the spooler service, the printer status on the user’s PC changed from “Offline” to “Ready”. This was a good sign that the spooler reset re-established connection with the printer queue.
 
- **Test After Spooler Reset (10:05 AM)**: Printed a test page post-spooler restart:
  - The Windows test page successfully sent and **printed** on the HP LaserJet 4000.
  - The user confirmed the test page came out. We then had her try printing one of the original documents again.

- **User Confirmation (10:10 AM)**: The user printed her financial report and it printed normally. Verified:
  - The print job appeared in the server queue and then on the printer, and the document came out correctly.
  - The user reported no further errors on her PC. The printer now showed as Online and functioning.

- **Closure (10:15 AM)**: Given the successful test:
  - Instructed the user to monitor the printer for any recurring issues and to reach out if it goes offline again.
  - Concluded that the issue was resolved with the spooler reset. No hardware faults or driver reinstalls were necessary at this time.
 
## **Resolution**

**Resolved:** The technician restarted the Windows Print Spooler service on the user’s PC, which cleared the stuck jobs and brought the printer back online. After this, print jobs processed normally.

- **Root Cause**: Likely a corrupted print job or a glitch in the local Print Spooler service caused the printer to appear offline to the user’s computer. The print server and printer were functioning, but the user’s PC wasn’t communicating properly until the spooler was reset.
- **Resolution Steps**: Cleared print queue -> Restarted Print Spooler -> Verified printer came online -> Tested printing (successful).
- **Status**: Ticket closed as **Resolved** on 2025-04-10 10:20 AM.

## **Notes**

- The user’s issue was isolated; no other users reported problems with that printer. If multiple users had similar issues, the troubleshooting would extend to the network or server side (checking the print server service, printer network connection, etc.).
- A spooler service restart on a user’s machine is a quick fix for many printing issues where jobs are stuck. It’s a good first step after verifying basic connectivity.
- Documented this solution in the knowledge base under “Printer shows offline/stuck jobs – resolve via spooler restart” for future reference.
- The user was advised on how to manually clear her print queue and check printer status (to empower her if it happens again). Also recommended if the issue recurs frequently, IT can update or reinstall the printer driver on her PC as a more permanent solution.

