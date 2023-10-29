while wait(1) do
	pcall(function()
		local ws = WebSocket.connect("ws://localhost:33882/")
		ws:Send("auth:" .. game.Players.LocalPlayer.Name)
		ws.OnMessage:Connect(function(msg)
			local func, err = loadstring(msg)
			if err then
				ws:Send("compile_err:" .. err)
				return
			end
			func()
		end)
		ws.OnClose:Wait()
	end)
end
