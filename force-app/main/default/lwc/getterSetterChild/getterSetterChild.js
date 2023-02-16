/**
 * @description       : 
 * @author            : Somnath Sharma
 * @group             : 
 * @last modified on  : 17-02-2023
 * @last modified by  : Somnath Sharma
**/
import { LightningElement, api } from 'lwc';

export default class GetterSetterChild extends LightningElement {
    heroData;
    filteredHeroes;


    @api
    get parentData() {
        return this.heroData;
    }
    //what is this value it is nothing but the data passed from parent
    set parentData(value) {
        this.heroData = value;
        this.filterHeroes();
    }
    filterHeroes() {
        this.filteredHeroes = this.heroData.filter((item) => item.ranking <= 3);
    }

}