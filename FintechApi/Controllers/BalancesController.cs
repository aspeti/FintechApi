using FintechApi.DAL;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FintechApi.Controllers
{
    /// <summary>
    /// Balances 
    /// </summary>
    [Produces("application/json")]
    [Route("api/[controller]")]
    [ApiController]
    public class BalancesController : ControllerBase
    {
        private readonly DBContext _context;

        /// <summary>
        /// Balances Controller
        /// </summary>
        /// <param name="context"></param>
        public BalancesController(DBContext context)
        {
            _context = context;
        }

        /// <summary>
        /// Get all balances assignet to managers
        /// </summary>
        /// <returns></returns>
        ///   /// <response code="500">Error retrieving data from the database</response>
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> GetBalancesAssigned()
        {
            try
            {
                var result = await _context.ManagerBalances
                            .FromSqlRaw("EXEC AssignBalancesToManagers")
                            .ToListAsync();

                return Ok(result);

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}
