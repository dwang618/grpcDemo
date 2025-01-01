gRPC_chat and gRPC_server are independent components that are configured to run on the same locally hosted server. 
** Run the server first using 'dotnet run' after cd'ing into the grpc_server folder to build the executable **
** Then use 'dotnet run' after cd'ing into the grpc_chat folder to open the endpoint on the client side. Entering your name should log the interaction on the server-side and the client-side. **
** Run a second instance of the client on a separate terminal, and then test communication from two different endpoints. Messages should be visible on both connections and the server should log messages from either endpoint. **

The grpc_chat subdirectory contains a simple interface containing an integrated instance of the client, so the server must first be initialized through terminal before running this flutter application. Use the Dart VM to view the build. **
