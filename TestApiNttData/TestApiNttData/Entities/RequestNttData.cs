using Microsoft.AspNetCore.Http.HttpResults;

namespace TestApiNttData.Entities;

public class RequestNttData
{
	public string message { get; set; }	= string.Empty;
	public string to { get; set; } = string.Empty;
	public string from { get; set; } = string.Empty;
	public int timeToLifeSec {  get; set; }
}
