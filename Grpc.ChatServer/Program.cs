using Grpc.ChatServer.Services;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddGrpc();
builder.Services.AddSingleton<MessageStreamingService>();

// Configure Kestrel to listen on port 7173
builder.WebHost.ConfigureKestrel(options =>
{
    options.ListenLocalhost(7173, listenOptions =>
    {
        listenOptions.UseHttps(); // Enable HTTPS for this endpoint
    });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
app.MapGrpcService<ChatService>();
app.MapGet("/", () => "Communication with gRPC endpoints must be made through a gRPC client. To learn how to create a client, visit: https://go.microsoft.com/fwlink/?linkid=2086909");

app.Run();
