#include <stdio.h>
#include <stdlib.h>

int main()
{
	FILE *in;
	int cases, n, sum = 0, tmp;
	
	in = fopen("in", "r");
	if (in == NULL)
	{
		fprintf(stderr, "Could not open file...\n");
		exit(1);
	}

	fscanf(in, "%d", &cases);

	for (int i = 0; i < cases; i++)
	{
		fscanf(in, "%d", &n);
		
		tmp = n;
		printf("%d -> ", tmp);

		while (1)
		{
			tmp = (tmp / 3) - 2;
			if (tmp <= 0) break;

			printf("%d ", tmp);
			sum += tmp;
		}
		printf("\n");
	}

	printf("%d\n", sum);
	fclose(in);
	return 0;
}
