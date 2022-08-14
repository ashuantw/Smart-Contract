const AdvancedStorage = artifacts.require('AdvancedStorage');

contract('AdvancedStorage', () =>{
    let advancedStorage = null;
    before(async () => {
        advancedStorage = await AdvancedStorage.deployed();
    });
    it('should add an element to ids array', async () => {
        await advancedStorage.add(111);
        const result = await advancedStorage.ids(0);
        assert.equal(result.toNumber(), 111);
    });
    it('should get an element of the ids array', async () => {
        await advancedStorage.add(222);
        const result = await advancedStorage.ids(1);
        assert.equal(result.toNumber(), 222);
    });
    it('should get the ids array', async () => {
        const allIds = await advancedStorage.getAll();
        const ids = allIds.map(id => id.toNumber());
        assert.deepEqual(ids, [111,222]);
    });
    it('should get the length of ids array', async () => {
        const length = await advancedStorage.length();
        assert.equal(length, 2);
    });
});