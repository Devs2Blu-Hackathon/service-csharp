var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => Results.Ok("ServiceCsharp is running"));
app.MapGet("/health", () => Results.Ok("OK"));

app.Run();