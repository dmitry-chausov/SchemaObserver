public with sharing class SObjectDropdownController {
    @AuraEnabled(cacheable=true)
    public static List<DropdownOption> getSObjectList() {
        List<DropdownOption> dropdownOptionList =new List<DropdownOption>();
        Map<String, SObjectType> sObjects = Schema.getGlobalDescribe();
        for (String apiName : sObjects.keySet()) {
            dropdownOptionList.add(new DropdownOption(apiName, sObjects.get(apiName).getDescribe().getLabel()));
        }
        dropdownOptionList.sort();
        return dropdownOptionList;
    }
    public class DropdownOption implements Comparable {
        @AuraEnabled
        public String label;
        @AuraEnabled
        public String value;

        public DropdownOption(String value, String label) {
            this.label = label;
            this.value = value;
        }
        public Integer compareTo(Object compareTo) {
            DropdownOption compareToOpt = (DropdownOption)compareTo;
            if (label == compareToOpt.label) return 0;
            if (label > compareToOpt.label) return 1;
            return -1;
        }
    }
}