LINK_TARGET = tracker

OBJS = \
       dates.o\
       tracker.o

REBUILDABLES = $(OBJS) $(LINK_TARGET)

all: $(LINK_TARGET)
	@echo done with setup!

$(LINK_TARGET): $(OBJS)
	gcc -o $@ $(OBJS)


%.o : %.c
	gcc -o $@ -c $<

dates.c : dates.h




clean:
	rm -f $(REBUILDABLES)
