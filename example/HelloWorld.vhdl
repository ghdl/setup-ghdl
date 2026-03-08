entity HelloWorld is
end entity;

architecture test of HelloWorld is
begin
  process
  begin
		wait for 10 ns;
		report "Hello World" severity note;
		std.env.finish;
		wait;
  end process;
end architecture;
