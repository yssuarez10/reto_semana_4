defmodule RetoTriki do
  def iniciar do
    jugador1_pid = spawn(fn -> jugador1() end)
    jugador2_pid = spawn(fn -> jugador2() end)
    spawn(fn -> marcador() end)
  end

  defp marcador do
    IO.write("JUGADOR1: Digita una opción entre X y O: ")
    jugador_1 = IO.gets("") |> String.trim()
    IO.write("JUGADOR2: Digita una opción entre X y O: ")
    jugador_2 = IO.gets("") |> String.trim()
    send(jugador1_pid, {:marcador, jugador_1})
    send(jugador2_pid, {:marcador, jugador_2})
    :timer.sleep(1000)
    send()
  end

  defp jugador1 do
    receive do
    {:marcador, option} -> IO.puts("La opción elegida por el jugador fue: #{option}")
      jugador1
    end
  end

  defp jugador2 do
    receive do
      {:marcador, option} -> IO.puts("La opción elegida por el jugador fue: #{option}")
       jugador2
    end
  end
end