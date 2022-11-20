<aura:application extends="ltng:outApp" access="GLOBAL">
    <!--
ltng:outApp adds SLDS resources to the page to allow our Lightning components to be 
styled with the Salesforce Lightning Design System. If we don’t want SLDS resources added to the page,
 we need to extend from ltng:outAppUnstyled instead._-->
    <aura:dependency resource="calledLWCComponent" />
</aura:application>