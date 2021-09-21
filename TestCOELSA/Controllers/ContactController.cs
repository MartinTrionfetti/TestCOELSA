using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TestCOELSA.Services;

namespace TestCOELSA.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ContactController : ControllerBase
    {
       
        private readonly ILogger<ContactController> _logger;
        private readonly DbServices dbServices;

        public ContactController(ILogger<ContactController> logger, DbServices dbServices)
        {
            _logger = logger;
            this.dbServices = dbServices;
        }

        [HttpGet]
        public ActionResult<List<Contact>> GetAll([FromQuery] GetAllDto getAllDto)
        {
            try
            {
                return dbServices.getContacts(getAllDto.PageIndex, getAllDto.PageSize);
            }
            catch (Exception ex)
            {
                this._logger.LogError(ex.ToString());
                return StatusCode(500);
            }
        }

        [HttpPut]
        public ActionResult<Contact> Create([FromBody] Contact contact)
        {
            try
            {
                return dbServices.create(contact);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
                return StatusCode(500);
            }
            return new Contact();
        }

        [HttpPost("{id}")]
        public ActionResult<Contact> Update([FromBody] Contact contact, [FromRoute] int id)
        {
            try
            {
                return dbServices.update(contact, id);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
                return StatusCode(500);
            }
        }

        [HttpDelete("{id}")]
        public ActionResult Create( [FromRoute] int id)
        {
            try
            {
                dbServices.delete(id);
                return Ok();
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
                return StatusCode(500);
            }
        }
    }

    public class GetAllDto
    {
        public int PageIndex { get; set; }
        public int PageSize { get; set; } = 2;
    }
}
