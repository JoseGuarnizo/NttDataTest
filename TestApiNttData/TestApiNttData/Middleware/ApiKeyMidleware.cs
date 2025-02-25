namespace TestApiNttData.Middleware;

public class ApiKeyMidleware
{
	private readonly RequestDelegate _nextApi;
	private const string KeyHeader = "X-Parse-REST-API-Key";
	private readonly string apiKeyValidate;

	public ApiKeyMidleware(RequestDelegate apiNext, IConfiguration confApi)
	{
		_nextApi = apiNext;
		apiKeyValidate = confApi["ApiKeyNttData"];    
	}

	public async Task InvokeAsync(HttpContext contextApiKey)
	{
		if (!contextApiKey.Request.Headers.TryGetValue(KeyHeader, out var extractedApiKey) || extractedApiKey != apiKeyValidate)
		{
			contextApiKey.Response.StatusCode = StatusCodes.Status401Unauthorized;
			await contextApiKey.Response.WriteAsync("Unauthorized: Api Key Invalid");
			return;
		}

		await _nextApi(contextApiKey);
	}
}
