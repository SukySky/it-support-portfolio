# ******Reset Windows Password******

## ****Overview****
Forgetting or losing a Windows account password can lock a user out of their system. This guide explains how IT support personnel can safely reset a Windows 10/11 user password. It covers scenarios for local accounts (standalone PCs), Active Directory domain accounts, and Microsoft (cloud) accounts. Always verify the type of account and follow company policies for identity verification before resetting any password.

## ****Tools Required****
- **Administrator access**: Credentials for an existing administrator account on the PC (for local password resets) or domain admin rights (for domain accounts).  
- **Windows Installation Media (USB/DVD)**: Required if no admin access is available (to use Windows Recovery Environment for offline password reset).  
- **Password reset disk**: (If available) A USB password reset disk that the user created previously for their local account.  
- **Internet access**: Needed if resetting a Microsoft online account password (to connect for credential verification).  

## ****Procedure****
### 1. **Determine Account Type**:
Identify whether the user account is a Local account, Domain account, or a Microsoft (online) account. This can be inferred from the login screen or account details:

- _Domain account_: Usually signs in with “DomainName\Username” or user@domain.com (in Azure AD joined devices). Managed centrally via a server (Active Directory).
- _Microsoft account_: Uses an email address (e.g., user@example.com) to log in, indicating the account is linked to Microsoft’s online services.
- _Local account_: A standalone account specific to that PC, not tied to an external service or domain.
        
Determining the account type directs the appropriate reset method:

### 2. **Domain Account Password Reset**:
If the user is on a domain (e.g., corporate network login):

- Verify the user’s identity (per company security policy) before proceeding.
- Use Active Directory Users and Computers (ADUC) or the appropriate admin tool to locate the user’s account in the directory.
- Reset the password via ADUC: Right-click the user account and select “Reset Password…”. Set a temporary password and (if policy requires) check “User must change password at next logon.”
- Inform the user of the new temporary password securely (e.g., via phone or in person, never via email or written in a ticket).
- Have the user log in with the temporary password and ensure they set a new personal password when prompted.
- Note: Resetting a domain password affects all services using that domain login (email, VPN, etc.). Advise the user to update saved credentials on other devices (like mobile email) to avoid account lockouts due to old passwords.

### 3. **Microsoft Account Password Reset (Windows 10/11 Microsoft Account)**:
If the user’s Windows login is a Microsoft account:  

- Guide the user to Microsoft’s password reset page on another device: **https://account.live.com/ResetPassword**.
- Walk them through the identity verification steps (this may involve a code sent to their backup email or phone).
- Once they successfully set a new password online, ensure the PC is connected to the internet at the login screen (use the network icon on the login screen to connect to Wi-Fi or ethernet).
- Have the user enter the new password on the Windows login screen. The computer will sync with Microsoft and allow access if the credentials are correct.
- Note: Microsoft account resets are handled entirely online. IT support can only guide the user, as you cannot directly change a cloud account password without the user’s involvement (unless you have administrative access to their Microsoft account organization, if applicable).

### 4. **Local Account Password Reset (with Administrator Access)**:
For standalone machines or local accounts on workstations:

- If **another administrator account** exists on the computer (or a default IT admin account), log in with those credentials.
- Open **Computer Management** (Right-click on Start menu, select _Computer Management_) and navigate to **System Tools > Local Users and Groups > Users**. Find the account in question, right-click it, and choose “**Set Password**…”. Proceed with the on-screen instructions to set a new password.
- Alternatively, use an elevated Command Prompt/Powershell: Right-click Start, select **Windows PowerShell (Admin)**, and run the command:  
  ```net user <username> <newpassword>```  
  Replace `<username>` with the locked account’s username and `<newpassword>` with a temporary password of your choice.
- Confirm that the command executed successfully or that the password was set in the management console.
- Log off and test logging in with the new password. **Immediately instruct the user to change this temporary password** to a secure one they choose (they can do this via Ctrl+Alt+Delete > Change a password, after logging in).

### 5. **Local Account Password Reset (no Admin Access available)**:
If no administrative access is available (the user is completely locked out and there is no other admin account):

- **Using Password Reset Disk**: If the user had previously created a Password Reset Disk (USB):
  * Insert the password reset disk into the locked computer.
  * At the Windows login screen, enter an incorrect password. Windows will display a “Reset password” option (for local accounts with a password reset disk).
  * Click “**Reset password**” and follow the Password Reset Wizard. Select the inserted disk when prompted and set a new password for the account.
  * Log in with the new password. (The user should make a new password reset disk afterwards, as the old one is now outdated.)

- **Using Windows Recovery Environment**: If no reset disk is available and no other admin account exists, you will need to use the Windows Recovery Environment to enable a password reset via Command Prompt:
  * **Option 1 – Advanced Startup (no media)**:  
       From the Windows login screen, click the Power icon, hold **Shift**, and click **Restart**.    
       The PC will reboot into the Advanced Startup menu.  
       Navigate to _Troubleshoot > Advanced Options > Command Prompt_.  
  * **Option 2 – Using Installation Media**:  
       If the above option isn’t available, use a Windows 10/11 installation USB (or DVD).  
       Boot from the media, choose your language if prompted, then click “**Repair your computer**” on the install screen.  
       Navigate to _Troubleshoot > Advanced Options > Command Prompt_.  

  1. Once you have a Command Prompt open (via either method above), use it to **back up the Ease of Access utility and replace it with Command Prompt** (this is a known workaround to gain access at the login screen):  
```C:\> copy C:\Windows\System32\utilman.exe C:\Windows\System32\utilman.exe.bak```  
```C:\> copy C:\Windows\System32\cmd.exe C:\Windows\System32\utilman.exe```  
These commands back up the Ease of Access application (Utilman) and replace it with a copy of cmd.exe. Approve overwriting if prompted.  

  3. Type ```exit``` to close the Command Prompt, then restart the computer normally and wait for the Windows login screen to appear. Do not boot from USB this time.

  4. At the login screen, click the **Ease of Access** icon (the accessibility button on the bottom-right). Instead of the Ease of Access menu, a Command Prompt should open with System privileges.

  5. In this Command Prompt, reset the user’s password by typing:  
  ```C:\> net user <username> <newpassword>```  
replacing ```<username>``` with the account name and ```<newpassword>``` with the new password you want to set. Hit Enter – you should see a confirmation that the command completed successfully.

  6. Close the Command Prompt window, then log in to Windows with the new password.

  7. **Important**: You must now restore the original Ease of Access utility to remove the security loophole:
   * Reboot using the installation media or Advanced Startup to get back to a Command Prompt (same as steps above).
   * Run the following command to restore the original utilman.exe:  
   ```C:\> copy C:\Windows\System32\utilman.exe.bak C:\Windows\System32\utilman.exe```  
   Confirm the overwrite. Once done, type ```exit``` and reboot normally. The Ease of Access button will revert to its standard functionality.  
   * **Alternative Tools**: There are third-party bootable utilities (e.g., _Offline NT Password & Registry Editor (chntpw)_ or _Hiren’s BootCD PE)_ that can reset Windows passwords by editing the user database. Use these with caution and in accordance with your organization’s policies. The manual method above achieves the same result without third-party software.

### 6. **Verification and Follow-up**:
- After a password reset (any method), verify the user can log in and access their resources. If it’s a domain or Microsoft account, ensure the new credentials sync across services (email, OneDrive, etc.).
- Remind the user of good password practices: choose a strong unique password and (if applicable) not to reuse their old password. If a temporary password was used, ensure they’ve changed it to a new private password.
- Update the help desk ticket or documentation: note that the password was reset, the method used, and that the user’s identity was confirmed (for auditing purposes).

## ****Notes****
- **Data Encryption Warning**: If the user utilized EFS (Encrypted File System) on a local account, resetting the password without the original one could permanently lock them out of those encrypted files. Always ask if they have encrypted files or used BitLocker with a PIN before resetting, and have recovery keys available if so.
- **Policy Compliance**: Always follow the organization’s security guidelines. For example, some companies require manager approval or a verification step (like the user answering security questions) before IT can reset a password.
- **Preventive Measures**: Encourage users to set up account recovery options. For local accounts on personal PCs, create a password hint or reset disk. For Microsoft accounts, keep recovery info up to date. In corporate environments, consider self-service password reset tools to reduce help desk involvement for simple resets.
- **When to Reimage**: If multiple password reset attempts fail or the system appears compromised, it might be safer to reimage the PC (with management approval) and restore the user’s data from backup. This is a last resort if you suspect system integrity issues.
