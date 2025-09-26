import { LightningElement, track } from 'lwc';
import getHighPriorityCaseCount from '@salesforce/apex/CaseDataService.getHighPriorityCaseCount';

export default class CaseMetrics extends LightningElement {
    @track highPriorityCount = 0;

    getCaseCount() {
        getHighPriorityCaseCount()
            .then(result => {
                this.highPriorityCount = result;
            })
            .catch(error => {
                console.error(error);
            });
    }
}