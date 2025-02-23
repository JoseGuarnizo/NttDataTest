using System.Net;
using TestApiNttData.Middleware;
using TestApiNttData.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//Service JWTNttData
builder.Services.AddSingleton<JwtServicesNttData>();

// Configurar Kestrel para solo HTTP
builder.WebHost.ConfigureKestrel(options =>
{
	options.ListenAnyIP(5000); // Cambia 80 por 5000
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
	app.UseSwagger();
	app.UseSwaggerUI();
}

//Api Key del servicio
app.UseMiddleware<ApiKeyMidleware>();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
