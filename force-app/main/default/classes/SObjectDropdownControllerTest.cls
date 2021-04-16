@isTest
private with sharing class SObjectDropdownControllerTest {
    @isTest static void getSObjectListTest() {
        System.assert(SObjectDropdownController.getSObjectList().size() > 0);
    }
}