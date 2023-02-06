* Question 1:

Answer: 447,770

`python etl_web_to_gcs_me.py`

* Question 2:

Answer `0 5 1 * *`

```bash
prefect deployment build ./etl_web_to_gcs_me.py:etl_web_to_gcs -n "Scheduled Flow" --cron "0 5 1 * *" -a
prefect deployment apply etl_web_to_gcs-deployment.yaml
```

* Question 3:

Answer: `14,851,920`

```
prefect deployment build ./etl_gcs_to_bq_me_q3.py:q3_parent_flow -n "q3-deployment"
prefect deployment apply q3_parent_flow-deployment.yaml
prefect deployment run q3-parent-flow/q3-deployment -p "months=[2,3]" -p "color="yellow"" -p "year=2019"
```
* Question 4

Answer: `88605`

* Question 5

Answer: `514392`

* Question 6

Answer: `8`
