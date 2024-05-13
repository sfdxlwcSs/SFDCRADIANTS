import { LightningElement, track } from 'lwc';
const  APIURL='https://api.datamuse.com/words';

export default class SynonymSearch extends LightningElement {
    @track searchWord = '';
    @track synonyms;
    @track error;

     // Debounce delay in milliseconds
    debounceDelay = 2000;
    // Timeout variable
    timeoutId;

    handleInputChange(event) {
        this.searchWord = event.target.value;
        this.fetchSynonyms(); // Clear the previous timeout
        clearTimeout(this.timeoutId);

        // Get the input value
        this.searchWord = event.target.value;

        // Set a new timeout
        this.timeoutId = setTimeout(() => {
            this.fetchSynonyms();
        }, this.debounceDelay);
    }

    async fetchSynonyms() {
    if (!this.searchWord) {
        this.synonyms = null;
        return;
    }

    try {
        const response = await fetch(APIURL+`?ml=${this.searchWord}`);
        const data = await response.json();
        
        // Sort words by score
        const sortedData = data
            .filter(item => item.word && typeof item.score === 'number')
            .sort((a, b) => b.score - a.score);

        // Limit to the first 5 words
       // this.synonyms = sortedData.slice(0, 5).map(item => ({ word: item.word, score: item.score }));
         this.synonyms = sortedData.slice(0, 5).map(item => {
             return item.word;
         });
        this.error = null;
    } catch (error) {
        console.error('Error fetching synonyms:', error);
        this.error = 'Error fetching synonyms. Please try again later.';
        this.synonyms = null;
    }
}

}