const Helloworld = artifacts.require('Helloworld');

contract('Helloworld', () => {
    it('Should return helloworld', async () => {
        const helloworld = await Helloworld.deployed();
        const result = await helloworld.hello();
        assert.equal(result, 'Hello world');
    });
    
});