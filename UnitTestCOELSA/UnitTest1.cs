using NUnit.Framework;
using TestCOELSA.Controllers;

namespace UnitTestCOELSA
{
    public class Tests
    {
        private ContactController contactController;

        [SetUp]
        public void Setup()
        {
            contactController = new ContactController(null, new TestCOELSA.Services.DbServices("Server=.\\SQLEXPRESS;Database=Coelsa;Trusted_Connection=True;"));            
        }

        [Test]
        public void getAllPage1()
        {
            var res = contactController.GetAll(new GetAllDto { PageIndex = 0, PageSize = 2 });

            Assert.AreEqual(2, res.Value.Count);
            Assert.AreEqual("Raul", res.Value[0].FirstName);
        }

        [Test]
        public void getAllPage2()
        {
            var res = contactController.GetAll(new GetAllDto { PageIndex = 1, PageSize = 2 });

            Assert.AreEqual(2, res.Value.Count);
            Assert.AreEqual("Pedro", res.Value[0].FirstName);
        }
    }
}