LINK_TARGET = knit

OBJS = \
       knit.o

REBUILDABLES = $(OBJS) $(LINK_TARGET)

all: $(LINK_TARGET)
	@echo made

$(LINK_TARGET): $(OBJS)
	gcc -o $@ $(OBJS) -lm

%.o : %.c
	gcc -o $@ -c $<


clean:
	rm -f $(REBUILDABLES)
