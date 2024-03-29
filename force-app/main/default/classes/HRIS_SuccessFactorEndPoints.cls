/**
 * @description       : 
 * @author            : Somnath Sharma
 * @group             : 
 * @last modified on  : 15-02-2022
 * @last modified by  : Somnath Sharma
**/
public with sharing class HRIS_SuccessFactorEndPoints {

    public static Final String accessTokenUrl = 'https://api2preview.sapsf.eu/oauth/token';
    public static Final Integer OK = 200;
    public static Final String CONTENTTYPE='application/x-www-form-urlencoded';
    public static Final String company_id='DOVERDEV';
    public static Final String grant_type='urn:ietf:params:oauth:grant-type:saml2-bearer';
    public static Final String client_id = 'Y2M4ODliMzI4NWRmMjZjMDA4OWRjOTIzMjZjYQ';
    public static Final String user_id='SFAPIUSER_CPI';
    public static Final String HRIS_SuccessFactorBaseUrl='https://api2preview.sapsf.eu/odata/v2/TodoEntryV2?$format=json& $select=';
    public static Final String HRIS_FIELDS='todoEntryId,categoryId,categoryLabel,completedDateTime,createdDate,dueDate,formDataId,lastModifiedDateTime,linkUrl,mobileLinkUrl,status,subjectId,todoEntryName,userId,userNav';
    public static Final String HRIS_SuccessFactor_EXPANDCLAUSE='&$expand=userNav,wfRequestNav/wfRequestUINav&$filter=';
    public static Final String HRIS_SuccessFactor_WHERECLAUSE='(status eq 2 and userId eq \'11027504\')';
    public static Final String HRIS_SuccessFactorTokenGenerationEndPoint='https://api2preview.sapsf.eu/oauth/token';
    public static Final String HRIS_SuccessFactorAssertionGenerationEndPoint='https://api10preview.sapsf.com/oauth/idp';
    public static Final String PRIVATE_KEY_LWCORG='TUlJRXZnSUJBREFOQmdrcWhraUc5dzBCQVFFRkFBU0NCS2d3Z2dTa0FnRUFBb0lCQVFES2UvNStBcWw4ZThGLzFsMHV1Vi8rRzhsZnAxcWVTN3FxSzJOdHFsYWdFOXE5WnZxUytHRUpodTdVYnpBWjQ0M0lFOEJIMXVQTWFiWXg3bVJGK3gwK1VKMWtWVThaMEJVazhLTkozQzl4cmYvS1FrbEdnOUQvUlhUTTJnazJkZ3psMXhNQTJ1UjRlTVJ1b0dyUnZFODl0ZDBCSVRuNmN4c3JSUlpHcEh3V0ZxUG1hTjZGWVN4aUpnZ0U5MEIrWGZrZUsxekZwVXByNmFiSndWb3JqR1p6cTluUWRoTk1FNjNZWGR0c3hzeGs1RU1WRzZYbXNCai84bVNnTUlKa3BBRnhUTzZTSFNXNzg1cFk3N0VpV05YTjZodzJPeEVQYXpEVHV5Wklra2toUElTNHFFNWFndXB2T1BGOTJYT3l6OE94OCtNMnp2S0puWXFnY0NXYU0vQjdBZ01CQUFFQ2dnRUFKQmIvb0RRWFEySEhkbUtkenpNcFFlQnYvd1dVS0R5MU01bHlLbHkrL2Q4c0VMQW5IMFQzL3J1M0c5UUpqY082Ukp3SW5JVlhxdHA0cCtPbXFiWjlXdHNCZ3AyVjhMTGU0ZXVtSHdjSXljbEtteUUvY0RzVWFEdFgreDh0bnpCaFVpSUllQkdMd1ZFOUtiNmI2M0FWNjVqYm9GVHN3WS84bXJUQXFLeXVsVHo0T3hIMjJZVDJFUXlnU1lSaXJQaGVKRzdVVzMwdm10dFIydjZ3ejAzZW1zYWw2TXVma1dmajlRUWNJZVc5T1YvbG9XdG1LOE1VOVA0SWdDdkpMbGtGZVZTa2NaZlQrNlI0REdCMmtlcWhiMk9zVVpFYlg1U1ErOG1DalN6Y2pHeGdvaXoxMksrdEM4aUJLMHJ3WExaR292UUc2UUhlSW4zbEtxenp4UzUvWVFLQmdRRDhDQVNwbVh4UE5oNjl5WWs2YTdHVEFnRld0NWozYXNDWk5jUktiTTZPM0pzZmZlb0J2eThwOEdLZ3ErOWowa1A3V2F1N3dsU3BDMlRDbXJxbk9UcmI0N29IRDFjN2Z1bkdqTTVGbHUyeWQ1YkhLSXlDYXNjZXZlWSswYlpZY1VRankyemkrQ1ZqQk9UMDlNR3V4VnVmbGZQR21LV3VDNFhTUHBpcVZGUG04UUtCZ1FETnJENVdkdEsvb1F0YjVLdjUwR3V0dkZPUEZwVmN6TTRLNENKcEdMRUxsUnY2UTI5MTFrZHZrZnRWK1FQSkhDVmFoM094Y1NVaXhBZ1duQTkxQ2RUQ0FNNGw1bndSVGVHLzk0Tk1QWVpmTUc0MUkzcVlpTGlveFgrN1BxMzNkQUtHUW1Kb1RVVlJWck9FNFFSbk0yVTFhdjRxRFRFeXNGMzlmaGE0bk5xR0t3S0JnQjVVbkxNSWJLUmZ2LzFaRnJHNEtpdWw3eUZQZ1JJdGY3WXdlVW4zcERnZkptLzR5RU9qalhwL21tNzVvaHFpUUZvc1pYVjRJcFloYitQWG1TVHN4eitWUFZzQ0pwNWJYS2p2WXhlTzNWWS8vQjVGcS9zNS9IS2ZxZWpmZGhGWXVEbVNqcTBWN2ZIbnNlSWszblk0L0JqTmhBUGZkUGpvSEJlOFBzVW8xdHdSQW9HQkFMSW9Eb09WUCs4UWtDZFVpSWZIdTA1dVFLOUVyN01JRVQ2b2NnWTVoanJ6T1ozcVJpVjdyTHQvWjRoTVFMUTNOa0FaN3VSNGp1TnpqVklRY3U4OXlkY1hIWHNGRU5sb2JqRjhOSGFaSU1sWnlVMHNZMmkzbmNWTDl0MzZhSFZlUDBXUFFYRDU1aDZVRE1NQXEzQzl1MkN2UW1Tb3NzSW10ZlA4QWJCKzVtZXJBb0dCQU5rd1o0cTlwcFliZS9lOFUvTFM2eUg0VDVqWVJBVGlrenEwdFdEQzk5enovczVFUFJkSHhwOFMxUWxPd3JNR1RxbzRGbm9FNHp5eTFpcHJaNWdnck1uNnZsSlJ0dnphS1NLRkkyM2dyZEJKeTFDVVFtazBPWkg3MkRYQ0hjQlYzS1MxWURveVk3WlEwU0ZsRTFnREo1MzQ4SnY0eTB1dkgrK2h3MVJsMTdVZiMjI0RPVkVSREVW';
}