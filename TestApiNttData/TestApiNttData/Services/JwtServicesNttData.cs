using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using TestApiNttData.Entities;

namespace TestApiNttData.Services;

public class JwtServicesNttData
{
	private readonly string _keySecretNttData;

	public JwtServicesNttData(IConfiguration confJwtNttData)
	{
		_keySecretNttData = confJwtNttData["JwtApiNttData:SecretKeyApi"];
	}

	public string TokenGenerate(RequestNttData requestNtt)
	{
		var tokenApi = new JwtSecurityTokenHandler();
		var key = Encoding.UTF8.GetBytes(_keySecretNttData);

		var responseTokenDescrip = new SecurityTokenDescriptor
		{
			Subject = new ClaimsIdentity(new[]
			{
				new Claim("message", requestNtt.message),
				new Claim("to", requestNtt.to),
				new Claim("from", requestNtt.from),
				new Claim("timeToLifeSec", requestNtt.timeToLifeSec.ToString()),
				new Claim("transactionId", Guid.NewGuid().ToString())
			}),
			Expires = DateTime.UtcNow.AddMinutes(10),
			SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
		};

		var token = tokenApi.CreateToken(responseTokenDescrip);
		return tokenApi.WriteToken(token);
	}
}
