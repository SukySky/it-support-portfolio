# **New Employee Setup**

## **Purpose**
This Standard Operating Procedure (SOP) defines the steps to onboard a new employee from an IT perspective. Its purpose is to ensure each new hire receives the necessary hardware, software access, and credentials in a consistent, secure manner. By following this SOP, the IT Support team can provide a smooth first-day experience and minimize configuration errors or delays.

## **Scope**
This procedure applies to all new personnel joining the organization (including full-time employees, interns, and contractors) who require IT resources. It covers actions taken by IT from the time a new hire is approved and entered into the HR system, through their first day on the job. Scope includes: account provisioning, equipment setup, and access configuration. Out of scope: HR-specific onboarding (orientation, paperwork) except where it intersects with IT setup.

## **Responsibilities**
- **IT Support / Help Desk**: Carry out the technical onboarding steps (account creation, equipment setup, permissions). Coordinate with other teams for any resources outside IT’s direct control.
- **Human Resources (HR)**: Provide IT with new hire information in advance (start date, department, role, manager, and any special access needs). Initiate the onboarding request/ticket for IT.
- **Hiring Manager / Department Head**: Communicate specific needs for the new hire (software, system permissions beyond standard, special hardware). Ensure any non-standard requests (licensed software, elevated privileges) are approved prior to start.
- **System/Network Administrators**: (If separate from help desk) Support the process by configuring backend systems (e.g., setting up email accounts on server, VPN account creation, network drive permissions) and handle escalated issues that arise during setup.
- **Security/Facilities**: (If applicable) Issue building access cards, and/or include IT in orientation for security policies. This is adjunct to IT’s setup (for example, badge access might tie into IT systems for single sign-on).

## **Prerequisites**
Before beginning the new employee setup, ensure the following prerequisites are met:  

- **Request & Approvals**: A formal request or ticket for new user setup is received, with necessary manager and HR approvals. All relevant information (full name, job title, department, start date) is provided.
- **Equipment Allocation**: A computer (laptop or desktop) and other hardware (monitor, peripherals) have been assigned. Verify the hardware is functional or new. Apply asset tags if required.
- **User Accounts Ready for Creation**: Access to systems where accounts will be created (Active Directory, email system/Office 365 admin portal, VPN management, etc.). Appropriate licenses are available for software (e.g., an available Office 365 license seat).
Standard Image or Build Checklist: If a standard OS image is used, have the latest image prepared. If not imaging, have a checklist of standard software to install on a fresh OS.
- **Network Access**: Verify network ports at the new hire’s workstation (or Wi-Fi credentials for them) are active. For remote hires, prepare VPN credentials or remote access instructions.
- **Welcome Material**: Prepare any IT welcome kit info (quick-start guide, FAQs, support contact info) that will be given to the user.

## **Procedure**
1. **Account Creation & Configuration**:
   - **Active Directory User Account**: (If the company uses Active Directory or on-prem domain)
       
       * Create the user account in Active Directory with the provided username convention (e.g., first initial + last name). Fill in details like name, department, email, etc.
       * Set an initial password and check “User must change password at next logon” for security.
       * Add the account to appropriate security groups (departmental groups, distribution lists, shared drive groups). This will grant access to network resources as needed.
       * If using Azure AD or Office 365 exclusively, create the user in the Microsoft 365 Admin Center (or Azure AD portal) with the proper license assignments (Exchange Online, Teams, etc.) and group memberships.

   - **Email Setup**:
            
     * If using Office 365 or Exchange Online, verify that the new AD account has an Exchange mailbox. Assign an Exchange license and wait for the mailbox to provision.
     * If using on-prem Exchange, create a mailbox for the user or enable email for the AD account.
     * Create any email aliases or distribution list memberships the user needs. Send a test email to the new address (to be received once the user logs in) as a welcome message.  
  
    - **Other Essential Accounts**:

      * **Corporate Applications**: Create accounts or grant access in other systems the user will use (e.g., CRM, ticketing system, ERP). Use standardized usernames (often the corporate email).
      * **VPN/Remote Access**: If the user will work remotely or need remote network access, create VPN credentials or ensure their AD account is enabled for VPN access. Test that the VPN account works.
      * **Phone/Communication**: For roles requiring a desk phone or softphone, set up a phone extension and voicemail. For softphones or collaboration tools (Microsoft Teams, Slack), ensure the user is added and configured.
      * **Badge Access/SSO**: If building access or ID badge systems are tied to IT (via an identity management system), input the user’s details so their badge will work on day one.  
  
2. **Workstation Preparation**:
  
    - **Imaging or OS Installation**:
      
        * If using a standard image: apply the image to the new computer. This image should contain the base OS (e.g., Windows 10/11) and standard software, plus all latest updates.
        * If not using imaging: manually install the operating system, then install all Windows updates. Activate Windows if required.
        * Set the computer name following company convention (for example, **COMP-Laptop-##**# or using the user’s name/ID). Join the computer to the domain or Azure AD as appropriate.

    - **Software Installation**: Install required software that is not in the base image:
            
        * Productivity tools (e.g., Microsoft Office, web browsers, PDF reader).
        * Security software (antivirus/endpoint protection if not included in image, encryption software if required such as BitLocker with TPM).
        * Department-specific or role-specific software (e.g., graphic design software for designers, development tools for engineers, etc.) as identified by the hiring manager.
        * Collaboration tools (Teams/Slack client, Zoom) and any VPN client software.
        * Configure email client (Outlook) if not auto-configured via Exchange/Office 365 and verify it opens without errors.

    - **Updates and Patches**: After software installation, run any additional update tools:
      
        * Ensure Microsoft Office or other installed applications are updated to the latest patches (e.g., run Microsoft Office updates).
        * Verify antivirus definitions are up-to-date.
        * Reboot the machine and ensure no pending updates remain.
  
    - **Local Configuration & Policies**:
      
        * Ensure the new user’s account (domain or local) is added to the local Users (or appropriate) group on the machine. Typically, domain users are automatically added to local Users group when logging in; ensure no admin rights are given unless explicitly approved.
        * Set up any needed local printers or map network printers. (This could also be done when the user logs in, via Group Policy or a print server.)
        * Configure any specific settings (for example, set power management policies if the machine is a laptop, or configure BitLocker encryption on the device and store the recovery key in AD or Azure AD).
        * If applicable, document the computer’s admin credentials (if a local admin account exists for IT) in the IT password manager.
  
3. **Desk/Workspace Setup**:

    - **Hardware Placement**: Set up the workstation at the user’s desk or prepare the shipment if the user is remote:
        * Connect monitor(s), docking station (if laptop), keyboard, mouse, and test that all peripherals function.
        * For multiple monitors, configure display settings (extended mode, correct resolution).
        * Ensure a network connection is active (plug in ethernet cable or verify Wi-Fi credentials will be available).
        * Place any additional equipment (headset, webcam, etc.) at the desk.
   
    - **Welcome Packet**: Leave a printed or digital “welcome to IT” guide if available. This might include how to contact IT support, how to log in to various systems, initial default passwords if any, and other helpful info.
  
    - **Phone Setup**: If a desk phone is provided, ensure it’s connected, with the correct extension configured and tested (call to/from it to verify). If using a softphone or MS Teams calling, ensure the user’s account is enabled and ready for use.
  
    - **Building Access**: Coordinate with Facilities/Security to have the user’s access badge ready and configured for the necessary areas. (While not an IT system, often IT is informed or helps in connecting the badge system with user data.)

4. **Day One Onboarding (IT tasks on the new hire’s first day)**:

    - **Introduction and Handover**: Meet the new hire(in-person or via video call for remote employees). Introduce them to IT support resources. If in person, hand over the laptop and any other devices. Have them sign any IT equipment acceptance forms if required.
  
    - **Credentials and Login**: Ensure the user can log in:
      * If a default initial password was set, assist the user in logging in and guide them through changing their password to a secure one (Ctrl+Alt+Delete > Change Password on Windows, or the prompt at first login).
      * For Azure AD/Office 365 accounts, help the user sign into their laptop (if Azure AD joined) or into Office 365 services.
      * Ensure Multi-Factor Authentication (MFA) enrollment if your organization uses it (help them register their phone or alternate email).
    
    - **Email and Software Access**: Walk the user through opening Outlook (or webmail) to check email functionality. Verify they can send/receive emails. Similarly, have them launch key applications to confirm access:
      * Check that they can reach shared network drives or SharePoint document libraries that their role requires.
      * Test any crucial application login (e.g., the CRM system or other SaaS apps) using the credentials set up.
      * For remote workers, demonstrate connecting to VPN and test at least one resource through the VPN to ensure it works.
  
    - **Orientation to IT Services**: Brief the new hire on IT-related policies and support:
      * Explain acceptable use policies for equipment and internet (if not covered by HR).
      * Review how to get help: provide details on the help desk ticket system, support email, or phone number, including hours of support.
      * Highlight any self-service resources: knowledge base, password reset portal, etc.
      * Emphasize security practices (locking screen, phishing email awareness, not sharing passwords).
    
    - **Issue Resolution**: Be available to troubleshoot any immediate issues that arise on Day One:
      * If the user cannot access something due to permission not granted, quickly grant the access after proper verification/approval.
      * If any hardware is not functioning (e.g., monitor not displaying), resolve it (maybe a faulty cable, etc.).
      * Answer any initial questions they have about using the systems (how to set email signature, connecting to printers, etc.).

5. **Post-Onboarding Follow-Up**:
    - Documentation: Update the onboarding ticket to note completion of all tasks. List accounts created, hardware allocated (with serial numbers), and confirmation that the user logged in successfully. Close the ticket if all tasks are done, or leave it open with a note if waiting on any back-ordered equipment or pending access.
    - Asset Management: Ensure the new equipment issued is recorded in the asset management system and assigned to the new user’s profile.
    - Team Notification: (If applicable) Inform relevant teams or distribution lists that the new employee has joined (often HR or the manager does this, but IT might update an internal directory or email group).
    - Follow-up Check: Schedule a check-in (via email or a brief call) a week or two after the start date. Ask the new hire if they have encountered any IT issues or need additional software/access. Resolve any outstanding requests.
    - Continuous Improvement: Gather any feedback from the new hire or the hiring manager about the onboarding process, and incorporate improvements for next time. For example, if a certain software was missing from the standard setup for this role, update the checklist for future hires.

## **Notes**
- Timing: Begin the IT setup process several days (or weeks for complex setups) before the new hire’s start date. Last-minute setups can lead to errors or missing pieces on day one.
- Standardization: Use a new hire IT checklist (an accompanying document or a checklist in your ITSM system) to track each step for each new employee. This ensures nothing is overlooked, and provides a record of completion.
- Security Measures: Always enforce security policies during onboarding. For example, if issuing a laptop, ensure it’s encrypted (BitLocker) and has the latest security patches. Ensure the user’s initial password is random/temporary and that they change it. If the user will handle sensitive data, confirm they’ve completed any required security training early.
- Departure Coordination: Keep in mind the reverse process (offboarding) and document what was provided so that when the employee eventually leaves, IT can easily reference what to collect and disable. It’s good practice to link the assets and accesses in documentation.
- Exceptional Cases: Some roles may require special setup (e.g., developers needing admin rights on their machine or multiple monitors, executives needing mobile device setups). Handle these exceptions with appropriate approvals and document the deviations from the standard procedure.
