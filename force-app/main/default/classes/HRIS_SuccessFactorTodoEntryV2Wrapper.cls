/**
 * @description       : 
 * @author            : Somnath Sharma
 * @group             : 
 * @last modified on  : 16-02-2022
 * @last modified by  : Somnath Sharma
**/
public class HRIS_SuccessFactorTodoEntryV2Wrapper{
	public cls_d d;
	public class cls_d {
		public cls_results[] results;
	}
	public class cls_results {
		public metaData meta;
		public String todoEntryId;	//3148013
		public String lastModifiedDateTime;	///Date(1644511552000+0000)/
		public cls_dueDate dueDate;
		public String todoEntryName;	//Requests Waiting for My Approval
		public String categoryLabel;	//Time Off Requests
		public cls_completedDateTime completedDateTime;
		public cls_mobileLinkUrl mobileLinkUrl;
		public String userId;	//11027504
		public String subjectId;	//257223
		public String createdDate;	///Date(1644511552000+0000)/
		public String linkUrl;
		public String formDataId;
		public String categoryId;	//18
		public Integer status;	//2
		public cls_userNav userNav;
		//public cls_recruitingJobOfferNav recruitingJobOfferNav;
		//public cls_formContentNav formContentNav;
		public cls_wfRequestNav wfRequestNav;
	}
	public class metaData {
		public String uri;	//https://api2preview.sapsf.eu/odata/v2/WfRequestUIData(257223L)
		public String type;	//SFOData.WfRequestUIData
	}
	public class cls_dueDate {
	}
	public class cls_completedDateTime {
	}
	public class cls_mobileLinkUrl {
	}
	/*public class cls_linkUrl {
	}
	public class cls_formDataId {
	}*/
	public class cls_userNav {
		public metaData meta;
		public String userId;	//11027504
		public cls_salaryBudgetFinalSalaryPercentage salaryBudgetFinalSalaryPercentage;
		public cls_dateOfCurrentPosition dateOfCurrentPosition;
		public cls_matrix1Label matrix1Label;
		public cls_salary salary;
		public String objective;	//0.0
		public cls_ssn ssn;
		public String state;	//Illinois
		public cls_issueComments issueComments;
		public String timeZone;	//US/Central
		public String defaultLocale;	//en_US
		public cls_nationality nationality;
		public cls_salaryBudgetLumpsumPercentage salaryBudgetLumpsumPercentage;
		public cls_sysCostOfSource sysCostOfSource;
		public String emplStatus;	//Active
		public cls_ethnicity ethnicity;
		public cls_payGrade payGrade;
		public String nickname;	//Kautilya
		public String email;	//akgowda@dovercorp.com
		public cls_salaryBudgetExtra2Percentage salaryBudgetExtra2Percentage;
		public cls_stockBudgetOther1Amount stockBudgetOther1Amount;
		public cls_talentPool talentPool;
		public cls_raiseProrating raiseProrating;
		public cls_sysStartingSalary sysStartingSalary;
		public cls_finalJobCode finalJobCode;
		public cls_lumpsum2Target lumpsum2Target;
		public cls_stockBudgetOptionAmount stockBudgetOptionAmount;
		public String country;	//United States
		public String lastModifiedDateTime;	///Date(1644526275000+0000)/
		public String jobSubFamily;	//HR Systems
		public cls_stockBudgetStockAmount stockBudgetStockAmount;
		public String sciLastModified;	///Date(1639154236000+0000)/
		public cls_criticalTalentComments criticalTalentComments;
		public String homePhone;	//(1) 630 743-2381
		public boolean veteranSeparated;
		public cls_stockBudgetOther2Amount stockBudgetOther2Amount;
		public String firstName;	//Kautilya
		public cls_stockBudgetUnitAmount stockBudgetUnitAmount;
		public cls_salutation salutation;
		public cls_impactOfLoss impactOfLoss;
		public cls_benchStrength benchStrength;
		public cls_sysSource sysSource;
		public cls_futureLeader futureLeader;
		public String title;	//HRIS Lead
		public cls_meritEffectiveDate meritEffectiveDate;
		public boolean veteranProtected;
		public String company;	//Dover Corporate Office (LE_USA_53-0257888)
		public cls_lumpsumTarget lumpsumTarget;
		public String employeeClass;	//Employee
		public String hireDate;	///Date(1574208000000)/
		public cls_matrix2Label matrix2Label;
		public cls_loginMethod loginMethod;
		public cls_salaryLocal salaryLocal;
		public cls_citizenship citizenship;
		public cls_reasonForLeaving reasonForLeaving;
		public cls_riskOfLoss riskOfLoss;
		public String location;	//Downers Grove 3005 Highland Parkway (LOC_USA_IL009)
		public cls_reloComments reloComments;
		public String jobCustFamily;	//Human Resources (JF_HRM)
		public String username;	//akgowda@dovercorp.com
		public cls_serviceDate serviceDate;
		public cls_reviewFreq reviewFreq;
		public cls_salaryBudgetTotalRaisePercentage salaryBudgetTotalRaisePercentage;
		public String jobCode;	//(HRIS) Administration & Reporting - Specialist Professional (HRM.HRS.P40.07)
		public String lastModifiedWithTZ;	///Date(1644526275000+0000)/
		public String division;	//Dover Corporation (DIV_CORP)
		public String custom02;	//Dover Corporation (OPCO_CORP)
		public cls_meritTarget meritTarget;
		public cls_custom01 custom01;
		public String custom04;	//Dover Corporation (SEG_CORP)
		public String custom03;	//Dover Corporation (SUBD_CORP)
		public cls_custom06 custom06;
		public cls_custom05 custom05;
		public String custom08;	//Online
		public cls_reloWilling reloWilling;
		public String custom07;	//HRIS & Retirement (SUBDEPT_HRIS_RET)
		public cls_stockBudgetOther3Amount stockBudgetOther3Amount;
		public String custom09;	//Compensation (CC_DIV_CORP_6055)
		public String onboardingId;	//f544ade9-442e-47bf-a24f-2a29fb17dd5a
		public cls_fax fax;
		public cls_bonusBudgetAmount bonusBudgetAmount;
		public cls_salaryBudgetPromotionPercentage salaryBudgetPromotionPercentage;
		public String dateOfPosition;	///Date(1574208000000)/
		public cls_finalJobFamily finalJobFamily;
		public Integer teamMembersSize;	//1
		public cls_compensationEligible compensationEligible;
		public cls_lastReviewDate lastReviewDate;
		public cls_compensationStockEligible compensationStockEligible;
		public String businessPhone;	//(1) 817 123-4567
		public String status;	//t
		public String lastName;	//Arige Kollappa Gowda
		public String gender;	// 
		public String city;	//Downers Grove
		public String competency;	//0.0
		public cls_businessSegment businessSegment;
		public cls_compensationSalaryRateUnits compensationSalaryRateUnits;
		public boolean newToPosition;
		public String dateOfBirth;	///Date(-157766400000)/
		public cls_localCurrencyCode localCurrencyCode;
		public cls_jobLevel jobLevel;
		public String custom11;	//Dover Corporate Office (LE_USA_53-0257888)
		public String defaultFullName;	//Kautilya Arige Kollappa Gowda
		public String custom10;	//Individual Contributor - Non-Manager
		public cls_compensationReadOnly compensationReadOnly;
		public cls_custom13 custom13;
		public String custom12;	//2722
		public cls_custom15 custom15;
		public cls_custom14 custom14;
		public boolean veteranDisabled;
		public String totalTeamSize;	//169
		public boolean married;
		public String cellPhone;	//(1) 630 297-1309
		public boolean veteranMedal;
		public cls_compensationSalaryRateType compensationSalaryRateType;
		public String zipCode;	//60515
		public cls_jobTitle jobTitle;
		public boolean minority;
		public cls_suffix suffix;
		public boolean matrixManaged;
		public cls_bonusTarget bonusTarget;
		public String addressLine1;	//3005 Highland Parkway
		public cls_jobFamily jobFamily;
		public cls_jobRole jobRole;
		public String addressLine2;	//195, 200 & 300
		public cls_addressLine3 addressLine3;
		public cls_mi mi;
		public String potential;	//0.0
		public cls_origHireDate origHireDate;
		public cls_level level;
		public cls_salaryBudgetMeritPercentage salaryBudgetMeritPercentage;
		public cls_salaryProrating salaryProrating;
		public cls_concurTrExp concurTrExp;
		public String lastModified;	///Date(1644529875000)/
		public cls_promotionAmount promotionAmount;
		public cls_impactOfLossComments impactOfLossComments;
		public cls_empId empId;
		public cls_compensationSalaryEligible compensationSalaryEligible;
		public String department;	//Human Resources (DEPT_HR)
		public cls_reloLocation reloLocation;
		public cls_companyExitDate companyExitDate;
		public cls_seatingChart seatingChart;
		public cls_finalJobRole finalJobRole;
		public String employeeType;	//Salaried - Not Overtime Eligible
		public String performance;	//0.0
		public cls_compensationBonusEligible compensationBonusEligible;
		public cls_creditCard creditCard;
		public boolean keyPosition;
		public cls_salaryBudgetExtraPercentage salaryBudgetExtraPercentage;
	//	public cls_delegatorOfAutoDelegateConfigNav delegatorOfAutoDelegateConfigNav;
	//	public cls_secondManager secondManager;
	//	public cls_ethnicityNav ethnicityNav;
	//	public cls_incumbentOfPositionNav incumbentOfPositionNav;
	//	public cls_cust_headOfUnitOfcust_BGNav cust_headOfUnitOfcust_BGNav;
	//	public cls_usersSysIdOfEmployeeDataReplicationNotificationNav usersSysIdOfEmployeeDataReplicationNotificationNav;
		// public cls_externalCodeOfcust_PayrollFlagsNav externalCodeOfcust_PayrollFlagsNav;
		// public cls_proxy proxy;
		// public cls_participantUserId1OfOnboardingMeetingEventNav participantUserId1OfOnboardingMeetingEventNav;
		// public cls_targetIdOfTimeManagementAlertNav targetIdOfTimeManagementAlertNav;
		// public cls_matrixReports matrixReports;
		// public cls_userIdOfWorkScheduleNav userIdOfWorkScheduleNav;
		// public cls_userIdOfEmployeeTimeGroupNav userIdOfEmployeeTimeGroupNav;
		// public cls_codeOfRightToReturnNav codeOfRightToReturnNav;
		// public cls_processorIdOfOnboardingCandidateInfoNav processorIdOfOnboardingCandidateInfoNav;
		// public cls_benchStrengthNav benchStrengthNav;
		// public cls_manager manager;
		// public cls_userIdOfOnboardingCandidateInfoNav userIdOfOnboardingCandidateInfoNav;
		// public cls_impactOfLossNav impactOfLossNav;
		// public cls_concurrentUserOfOnboardingCandidateInfoNav concurrentUserOfOnboardingCandidateInfoNav;
		// public cls_userIdOfAccrualCalculationBaseNav userIdOfAccrualCalculationBaseNav;
		// public cls_userIdOfHRISChangeLogDataReplicationNav userIdOfHRISChangeLogDataReplicationNav;
		// public cls_nominationNav nominationNav;
		// public cls_reasonForLeavingNav reasonForLeavingNav;
		// public cls_customManager customManager;
		// public cls_usersSysIdOfEmpCostDistributionNav usersSysIdOfEmpCostDistributionNav;
		// public cls_costCenterManagerOfFOCostCenterNav costCenterManagerOfFOCostCenterNav;
		// public cls_sysSourceNav sysSourceNav;
		// public cls_secondReports secondReports;
		// public cls_workerOfPaymentInformationV3Nav workerOfPaymentInformationV3Nav;
		// public cls_empInfo empInfo;
		// public cls_userIdOfEmployeePayrollRunResultsNav userIdOfEmployeePayrollRunResultsNav;
		// public cls_cust_p9801_USR_FIELD_2_ReportsToOfcust_P9801Nav cust_p9801_USR_FIELD_2_ReportsToOfcust_P9801Nav;
		// public cls_userIdOfTimeAccountNav userIdOfTimeAccountNav;
		// public cls_userIdOfBudgetGroupNav userIdOfBudgetGroupNav;
		// public cls_cust_OpCo_HR_VPOfFOBusinessUnitNav cust_OpCo_HR_VPOfFOBusinessUnitNav;
		// public cls_hrManagerIdOfOnboardingCandidateInfoNav hrManagerIdOfOnboardingCandidateInfoNav;
		// public cls_usersSysIdOfEmployeeDataReplicationElementNav usersSysIdOfEmployeeDataReplicationElementNav;
		// public cls_headOfUnitOfFODivisionNav headOfUnitOfFODivisionNav;
		// public cls_emplStatusNav emplStatusNav;
		// public cls_cust_headOfUnitOfcust_SDNav cust_headOfUnitOfcust_SDNav;
		// public cls_reloWillingNav reloWillingNav;
		// public cls_customReports customReports;
		// public cls_delegateeOfAutoDelegateDetailNav delegateeOfAutoDelegateDetailNav;
		// public cls_externalCodeOfcust_RET_CREDTNav externalCodeOfcust_RET_CREDTNav;
		// public cls_hr hr;
		// public cls_headOfUnitOfFOBusinessUnitNav headOfUnitOfFOBusinessUnitNav;
		// public cls_custom12Nav custom12Nav;
		// public cls_userIdOfTimeAccountSnapshotNav userIdOfTimeAccountSnapshotNav;
		// public cls_userIdOfTemporaryTimeInformationNav userIdOfTemporaryTimeInformationNav;
		// public cls_directReports directReports;
		// public cls_participantUserId2OfOnboardingMeetingEventNav participantUserId2OfOnboardingMeetingEventNav;
		// public cls_externalCodeOfcust_PWD_RESETNav externalCodeOfcust_PWD_RESETNav;
		// public cls_participantUserId3OfOnboardingMeetingEventNav participantUserId3OfOnboardingMeetingEventNav;
		// public cls_personKeyNav personKeyNav;
		// public cls_usersSysIdOfEmployeeDataReplicationConfirmationNav usersSysIdOfEmployeeDataReplicationConfirmationNav;
		// public cls_externalCodeOfcust_DataValidationNav externalCodeOfcust_DataValidationNav;
		// public cls_externalCodeOfcust_CorporateFlagsNav externalCodeOfcust_CorporateFlagsNav;
		// public cls_competencyRatingNav competencyRatingNav;
		// public cls_userPermissionsNav userPermissionsNav;
		// public cls_userIdOfDataReplicationProxyNav userIdOfDataReplicationProxyNav;
		// public cls_matrixManager matrixManager;
		// public cls_salutationNav salutationNav;
		// public cls_userIdOfEmployeeTimeNav userIdOfEmployeeTimeNav;
		// public cls_managerIdOfOnboardingCandidateInfoNav managerIdOfOnboardingCandidateInfoNav;
		// public cls_headOfUnitOfFODepartmentNav headOfUnitOfFODepartmentNav;
		// public cls_participantUserId4OfOnboardingMeetingEventNav participantUserId4OfOnboardingMeetingEventNav;
		// public cls_hrReports hrReports;
		// public cls_riskOfLossNav riskOfLossNav;
		// public cls_participantUserId5OfOnboardingMeetingEventNav participantUserId5OfOnboardingMeetingEventNav;
		// public cls_ownerOfTalentPoolNav ownerOfTalentPoolNav;
	//	public cls_userIdOfPositionRightToReturnNav userIdOfPositionRightToReturnNav;
	//	public cls_cust_coordinatorUserOfcust_RCM_Coordinator_LookupNav cust_coordinatorUserOfcust_RCM_Coordinator_LookupNav;
	//	public cls_externalCodeOfcust_P9801Nav externalCodeOfcust_P9801Nav;
	//	public cls_usersSysIdOfHireDateChangeNav usersSysIdOfHireDateChangeNav;
	//	public cls_externalCodeOfcust_TRE_USERNav externalCodeOfcust_TRE_USERNav;
	}
	public class cls_salaryBudgetFinalSalaryPercentage {
	}
	public class cls_dateOfCurrentPosition {
	}
	public class cls_matrix1Label {
	}
	public class cls_salary {
	}
	public class cls_ssn {
	}
	public class cls_issueComments {
	}
	public class cls_nationality {
	}
	public class cls_salaryBudgetLumpsumPercentage {
	}
	public class cls_sysCostOfSource {
	}
	public class cls_ethnicity {
	}
	public class cls_payGrade {
	}
	public class cls_salaryBudgetExtra2Percentage {
	}
	public class cls_stockBudgetOther1Amount {
	}
	public class cls_talentPool {
	}
	public class cls_raiseProrating {
	}
	public class cls_sysStartingSalary {
	}
	public class cls_finalJobCode {
	}
	public class cls_lumpsum2Target {
	}
	public class cls_stockBudgetOptionAmount {
	}
	public class cls_stockBudgetStockAmount {
	}
	public class cls_criticalTalentComments {
	}
	public class cls_stockBudgetOther2Amount {
	}
	public class cls_stockBudgetUnitAmount {
	}
	public class cls_salutation {
	}
	public class cls_impactOfLoss {
	}
	public class cls_benchStrength {
	}
	public class cls_sysSource {
	}
	public class cls_futureLeader {
	}
	public class cls_meritEffectiveDate {
	}
	public class cls_lumpsumTarget {
	}
	public class cls_matrix2Label {
	}
	public class cls_loginMethod {
	}
	public class cls_salaryLocal {
	}
	public class cls_citizenship {
	}
	public class cls_reasonForLeaving {
	}
	public class cls_riskOfLoss {
	}
	public class cls_reloComments {
	}
	public class cls_serviceDate {
	}
	public class cls_reviewFreq {
	}
	public class cls_salaryBudgetTotalRaisePercentage {
	}
	public class cls_meritTarget {
	}
	public class cls_custom01 {
	}
	public class cls_custom06 {
	}
	public class cls_custom05 {
	}
	public class cls_reloWilling {
	}
	public class cls_stockBudgetOther3Amount {
	}
	public class cls_fax {
	}
	public class cls_bonusBudgetAmount {
	}
	public class cls_salaryBudgetPromotionPercentage {
	}
	public class cls_finalJobFamily {
	}
	public class cls_compensationEligible {
	}
	public class cls_lastReviewDate {
	}
	public class cls_compensationStockEligible {
	}
	public class cls_businessSegment {
	}
	public class cls_compensationSalaryRateUnits {
	}
	public class cls_localCurrencyCode {
	}
	public class cls_jobLevel {
	}
	public class cls_compensationReadOnly {
	}
	public class cls_custom13 {
	}
	public class cls_custom15 {
	}
	public class cls_custom14 {
	}
	public class cls_compensationSalaryRateType {
	}
	public class cls_jobTitle {
	}
	public class cls_suffix {
	}
	public class cls_bonusTarget {
	}
	public class cls_jobFamily {
	}
	public class cls_jobRole {
	}
	public class cls_addressLine3 {
	}
	public class cls_mi {
	}
	public class cls_origHireDate {
	}
	public class cls_level {
	}
	public class cls_salaryBudgetMeritPercentage {
	}
	public class cls_salaryProrating {
	}
	public class cls_concurTrExp {
	}
	public class cls_promotionAmount {
	}
	public class cls_impactOfLossComments {
	}
	public class cls_empId {
	}
	public class cls_compensationSalaryEligible {
	}
	public class cls_reloLocation {
	}
	public class cls_companyExitDate {
	}
	public class cls_seatingChart {
	}
	public class cls_finalJobRole {
	}
	public class cls_compensationBonusEligible {
	}
	public class cls_creditCard {
	}
	public class cls_salaryBudgetExtraPercentage {
	}
	public class cls_delegatorOfAutoDelegateConfigNav {
		public cls_deferred deferred;
	}
	public class cls_deferred {
		public String uri;	//https://api2preview.sapsf.eu/odata/v2/WfRequest(257223L)/wfRequestStepNav
	}
	// class cls_secondManager {
	// 	public cls_deferred deferred;
	// }
	// class cls_ethnicityNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_incumbentOfPositionNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_cust_headOfUnitOfcust_BGNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_usersSysIdOfEmployeeDataReplicationNotificationNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_externalCodeOfcust_PayrollFlagsNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_proxy {
	// 	public cls_deferred deferred;
	// }
	// class cls_participantUserId1OfOnboardingMeetingEventNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_targetIdOfTimeManagementAlertNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_matrixReports {
	// 	public cls_deferred deferred;
	// }
	// class cls_userIdOfWorkScheduleNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_userIdOfEmployeeTimeGroupNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_codeOfRightToReturnNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_processorIdOfOnboardingCandidateInfoNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_benchStrengthNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_manager {
	// 	public cls_deferred deferred;
	// }
	// class cls_userIdOfOnboardingCandidateInfoNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_impactOfLossNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_concurrentUserOfOnboardingCandidateInfoNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_userIdOfAccrualCalculationBaseNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_userIdOfHRISChangeLogDataReplicationNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_nominationNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_reasonForLeavingNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_customManager {
	// 	public cls_deferred deferred;
	// }
	// class cls_usersSysIdOfEmpCostDistributionNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_costCenterManagerOfFOCostCenterNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_sysSourceNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_secondReports {
	// 	public cls_deferred deferred;
	// }
	// class cls_workerOfPaymentInformationV3Nav {
	// 	public cls_deferred deferred;
	// }
	// class cls_empInfo {
	// 	public cls_deferred deferred;
	// }
	// class cls_userIdOfEmployeePayrollRunResultsNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_cust_p9801_USR_FIELD_2_ReportsToOfcust_P9801Nav {
	// 	public cls_deferred deferred;
	// }
	// class cls_userIdOfTimeAccountNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_userIdOfBudgetGroupNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_cust_OpCo_HR_VPOfFOBusinessUnitNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_hrManagerIdOfOnboardingCandidateInfoNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_usersSysIdOfEmployeeDataReplicationElementNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_headOfUnitOfFODivisionNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_emplStatusNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_cust_headOfUnitOfcust_SDNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_reloWillingNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_customReports {
	// 	public cls_deferred deferred;
	// }
	// class cls_delegateeOfAutoDelegateDetailNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_externalCodeOfcust_RET_CREDTNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_hr {
	// 	public cls_deferred deferred;
	// }
	// class cls_headOfUnitOfFOBusinessUnitNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_custom12Nav {
	// 	public cls_deferred deferred;
	// }
	// class cls_userIdOfTimeAccountSnapshotNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_userIdOfTemporaryTimeInformationNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_directReports {
	// 	public cls_deferred deferred;
	// }
	// class cls_participantUserId2OfOnboardingMeetingEventNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_externalCodeOfcust_PWD_RESETNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_participantUserId3OfOnboardingMeetingEventNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_personKeyNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_usersSysIdOfEmployeeDataReplicationConfirmationNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_externalCodeOfcust_DataValidationNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_externalCodeOfcust_CorporateFlagsNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_competencyRatingNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_userPermissionsNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_userIdOfDataReplicationProxyNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_matrixManager {
	// 	public cls_deferred deferred;
	// }
	// class cls_salutationNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_userIdOfEmployeeTimeNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_managerIdOfOnboardingCandidateInfoNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_headOfUnitOfFODepartmentNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_participantUserId4OfOnboardingMeetingEventNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_hrReports {
	// 	public cls_deferred deferred;
	// }
	// class cls_riskOfLossNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_participantUserId5OfOnboardingMeetingEventNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_ownerOfTalentPoolNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_userIdOfPositionRightToReturnNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_cust_coordinatorUserOfcust_RCM_Coordinator_LookupNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_externalCodeOfcust_P9801Nav {
	// 	public cls_deferred deferred;
	// }
	// class cls_usersSysIdOfHireDateChangeNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_externalCodeOfcust_TRE_USERNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_recruitingJobOfferNav {
	// 	public cls_deferred deferred;
	// }
	// class cls_formContentNav {
	// 	public cls_deferred deferred;
	// }
	public class cls_wfRequestNav {
		public metaData meta;
		public String wfRequestId;	//257223
		public String lastModifiedDateTime;	///Date(1644511551000+0000)/
		public String lastModifiedBy;	//10043804
		public String module;	//GENERIC_OBJECT
		public String reminderSentDate;	///Date(1644634930000)/
		public Integer totalSteps;	//1
		public String createdDateTime;	///Date(1644511551000+0000)/
		public String createdOn;	///Date(1644515151000)/
		public String url;	//https://hcm2preview.sapsf.eu/sf/hrisworkflowapprovelink?workflowRequestId=V4-Aa9EJK25vREKarwAGe8DHJVdnljgvwqosZqDvEJmR5_sFQ&prevPage=HOME&company=DOVERDEV&username=SFAPIUSER_CPI
		public String lastModifiedOn;	///Date(1644515151000)/
		public cls_parentWfRequestId parentWfRequestId;
		public String createdBy;	//10043804
		public Integer currentStepNum;	//1
		public String status;	//PENDING
		public cls_wfRequestUINav wfRequestUINav;
		// public cls_parentWfRequestNav parentWfRequestNav;
		// public cls_workflowAllowedActionListNav workflowAllowedActionListNav;
		// public cls_empWfRequestNav empWfRequestNav;
		// public cls_wfRequestParticipatorNav wfRequestParticipatorNav;
		// public cls_wfRequestCommentsNav wfRequestCommentsNav;
		// public cls_wfRequestStepNav wfRequestStepNav;
	}
	
	public class cls_wfRequestUINav {
		public metaData meta;
		public String wfRequestId;	//257223
		public String businessUnit;	//Dover Corporation(OPCO_CORP)
		public boolean isEffectiveDateType;
		public boolean isObjectBase;
		public cls_assigneeUserId assigneeUserId;
		public String operateUserName;	//SueLyne H Hok
		public cls_assigneeUserName assigneeUserName;
		public String jobTitle;	//Digital Marketing Strategy - Manager(COM.DIG.M30.07)
		public String legalEntity;	//Dover India Pvt.,Ltd.(LE_IND_AAACI3920N)
		public String objectType;	//Employee Time
		public String division;	//DIV Test(DIV_DFR_TEST_IT)
		public cls_receivedOn receivedOn;
		public String department;	//ESS- Application Operations(SUBDEPT_DIIC_ESS-AppOps)
		public String costCenter;	//CC_DIIC_ESS-IT-AppOps-PMO(CC_DIIC_ESS-IT-AppOps-PMO)
		public String deeplink;	//https://hcm2preview.sapsf.eu/sf/hrisworkflowapprovelink?workflowRequestId=V4-Lcnqu2w0ZTEf7RYxdCwupnU11MQ4CKT3Yfm3wCPJ1IrNdw&prevPage=HOME&company=DOVERDEV&username=SFAPIUSER_CPI
		public String todoSubjectLine;	//LOA Long Term Disability Paid (02/06/2022 - 02/10/2022): Dave T Donaldson 
		public String operateType;	//Initiated
		public String subjectUserId;	//11000009
		public String changedData;	//[{"label":"Period","newValue":"02/06/2022 - 02/10/2022","oldValue":""},{"label":"Time Type","newValue":"LOA Long Term Disability Paid","oldValue":""},{"label":"Approval Status","newValue":"Pending","oldValue":""}]
		public String eventReason;	//Employee Time
		public String actionType;	//Create
		public boolean isAssigned;
		public String operateUserId;	//10043804
		public String objectName;	//
		public String location;	//Bangalore Bagmane Laurel, Block-C,Level 02,
		public String actions;	//[{"action":"approve"}]
		public String operateDate;	//February 10, 2022
		public String effectiveDate;
		public String subjectUserName;	//Dave T Donaldson
	}
	public class cls_assigneeUserId {
	}
	public class cls_assigneeUserName {
	}
	public class cls_receivedOn {
	}
	public class cls_parentWfRequestId {
	}
	/*public class cls_effectiveDate {
	}*/
	// public class cls_parentWfRequestNav {
	// 	public cls_deferred deferred;
	// }
	// public class cls_workflowAllowedActionListNav {
	// 	public cls_deferred deferred;
	// }
	// public class cls_empWfRequestNav {
	// 	public cls_deferred deferred;
	// }
	// public class cls_wfRequestParticipatorNav {
	// 	public cls_deferred deferred;
	// }
	// public class cls_wfRequestCommentsNav {
	// 	public cls_deferred deferred;
	// }
	// public class cls_wfRequestStepNav {
	// 	public cls_deferred deferred;
	// }
	
}