from prefect.deployments import Deployment
from prefect.filesystems import GitHub
from etl_web_to_gcs_me_q4 import etl_parent_flow_q4

github_block = GitHub.load("gh-zoomcamp")

github_dep = Deployment.build_from_flow(
    flow=etl_parent_flow_q4,
    name='github-flow',
)

if __name__  == "__main__":
    github_dep.apply()
    