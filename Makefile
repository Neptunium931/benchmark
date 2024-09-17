AS = as
TIME = sudo chrt -f 99 /usr/bin/time --verbose 

benchmark: mov push
	$(TIME) ./mov
	$(TIME) ./push

mov: mov.o
	ld -o $@ $^ -g

push: push.o
	ld -o $@ $^ -g

%.o: %.s
	$(AS) -o $@ $< -g

clean:
	rm -f *.o
	rm -f mov push

.PHONY: clean benchmark
