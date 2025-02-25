using Microsoft.AspNetCore.Mvc;
using TestApiNttData.Entities;
using TestApiNttData.Services;

namespace TestApiNttData.Controllers
{
	[ApiController]
	[Route("DevOps")]
	public class ApiTestNttData : ControllerBase
	{
		private readonly ILogger<ApiTestNttData> _logger;
		private readonly JwtServicesNttData _jwtServicesNtt;

		public ApiTestNttData(ILogger<ApiTestNttData> logger, JwtServicesNttData jwtServicesNtt)
		{
			_logger = logger;
			_jwtServicesNtt = jwtServicesNtt;
		}

		[HttpPost(Name = "DevOps")]
		[ProducesResponseType(StatusCodes.Status200OK)]
		[ProducesResponseType(StatusCodes.Status204NoContent)]
		[ProducesResponseType(StatusCodes.Status400BadRequest)]
		[ProducesResponseType(StatusCodes.Status500InternalServerError)]
		public async Task<ActionResult<ResponseNttData>> postDevopsNttData(
			[FromBody] RequestNttData queryNttData)
		{			
			
			try
			{
				if(queryNttData == null)
				{
					return BadRequest("Request Invalid.");
				}

				//Genera JWT para el servicio especificado
				string tokenJwtApiNttData = _jwtServicesNtt.TokenGenerate(queryNttData);

				var responseNttData = new ResponseNttData
				{
					message = $"Hello {queryNttData.to} your message will be sent"					
				};

				return Ok(responseNttData);
			}
			catch(Exception ex)
			{
				return StatusCode(StatusCodes.Status400BadRequest, "ERROR Dangers of services");
			}
		}

		//No acepta estos metodos y lanza un error        
		[HttpGet, HttpPut, HttpDelete, HttpPatch, HttpOptions, HttpHead]
		public IActionResult MethodsNotPermited()
		{
			return StatusCode(StatusCodes.Status405MethodNotAllowed, "ERROR");
		}

	}
}