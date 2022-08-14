const SimpleStorage =  artifacts.require('SimpleStorage');

contract('SimpleStorage', () => {
    it('should set the value of data variable', async () => {
        const simpleStorage = await SimpleStorage.deployed();
        await simpleStorage.set('hi');
        const result = await simpleStorage.get();
        assert.equal(result, 'hi');
    });
});