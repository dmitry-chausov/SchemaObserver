/**
 * Created by dchav on 16.04.2021.
 */
@isTest
private with sharing class SObjectGeneralInformationControllerTest {
    private final static String ACCOUNT_OBJECT_NAME = 'Account';
    @isTest static void getSObjectListTest() {
        //I didn't cover the case with custom objects because my project doesn't contains that
        System.assertEquals(SObjectGeneralInformationController.getSObjectDescription(ACCOUNT_OBJECT_NAME).apiName, ACCOUNT_OBJECT_NAME);
    }
}