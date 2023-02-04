select generate_series(
    date_trunc('hour', now()) - '1000 day'::interval,
    date_trunc('hour', now()),
    '1 hour'::interval
  ) as hour
