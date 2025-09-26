import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import SLA_DUE_DATE_FIELD from '@salesforce/schema/Case.SLA_Due_Date__c';

export default class SlaStatusIndicator extends LightningElement {
    @api recordId;
    slaDueDate;
    statusStyle = 'color: black;'; // Default color

    @wire(getRecord, { recordId: '$recordId', fields: [SLA_DUE_DATE_FIELD] })
    wiredCase({ error, data }) {
        if (data) {
            this.slaDueDate = getFieldValue(data, SLA_DUE_DATE_FIELD);
            this.checkSlaStatus();
        } else if (error) {
            console.error('Error fetching case data: ', error);
        }
    }

    checkSlaStatus() {
        if (!this.slaDueDate) {
            this.statusStyle = 'color: gray;';
            return;
        }
        const now = new Date();
        const due = new Date(this.slaDueDate);
        const timeRemaining = due.getTime() - now.getTime();

        if (timeRemaining < 0) {
            this.statusStyle = 'color: red;';
        } else if (timeRemaining < (24 * 60 * 60 * 1000)) {
            this.statusStyle = 'color: orange;';
        } else {
            this.statusStyle = 'color: green;';
        }
    }
}