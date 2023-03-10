# Deploy infrastructure with terraform
**🚨🚨🚨IMPORTANT: After running the provisioning with terraform, the notebook will be in `ACTIVE` state, consuming computing resources (=costing money 🤑🤑🤑)! Make sure to stop it in the UI after initial provisioning!🚨🚨🚨**
1. Make sure the principal you are running terraform commands with has Owner or Editor rights on the project
1. RECOMMENDED: Mirror the docker image `europe-west1-docker.pkg.dev/sd-automatic1111/notebook-image/automatic1111-webui:latest` to your own artifact registry.
    1. Pull the image to a machine `docker pull europe-west1-docker.pkg.dev/sd-automatic1111/notebook-image/automatic1111-webui:latest`
    1. Push to your Artifact Registry instance ``docker pull $YOUR_ARTIFACT_REGISTRY_URI/automatic1111-webui:latest`
    1. replace the value for `notebook_image_repository` in `terraform/terraform.tfvars` with your container uri.
1. Replace values in `terraform/terraform.tfvars` with your values. `organisation_id`, `project_id` and `notebook_users` need to be updated.
1. Open a terminal and navigate to the root of the repository.
1. Switch to the terraform folder: `cd terraform`
1. Initialize terraform modules: `terraform init`
1. Deploy infrastructure: `terraform apply` (you might have to run this more than once if `terraform` fails due to org policy changes taking some time to distribute)

**🚨🚨🚨IMPORTANT: After running the provisioning with terraform, the notebook will be in `ACTIVE` state, consuming computing resources (=costing money 🤑🤑🤑)! Make sure to STOP it in the UI after initial provisioning!🚨🚨🚨**

# Starting the notebook
**🚨🚨🚨IMPORTANT: After you're done with your work, the notebook will be in `ACTIVE` state, consuming computing resources (=costing money 🤑🤑🤑)! Make sure to STOP it in the UI after initial provisioning!🚨🚨🚨**
1. In your browser navigate to the Vertex Workbench UI `https://console.cloud.google.com/vertex-ai/workbench/user-managed`
1. If the notebook is `Stopped`, select it and click the `Start` button. *Note: Starting the notebook might take a few minutes.*
1. Once the notebook has completed the `Provisioning` state, open it with the `Open Jupyter Notebook` button, which should open another browser tab
1. Click the `Terminal` button, input the following command and press enter: `/home/start.sh`
1. The terminal will ask you for a `username` and a `password` to use - make sure to remember these!
1. The script will check whether all necessary prerequisites are available and then start the web UI. *Note: on the first run this might take a few minutes* 
1. Copy the URL to access the WebUI from the terminal output. It should look similar to the ouput below: \
*Running on public URL:* `https://871a2f8c-94f1-424c.gradio.live`
1. Enter the URL in a web browser and input the `username` and `password` you've set before. 

**Congratulations! You now have access to [AUTOMATIC1111's web ui for Stable Diffusion](https://github.com/AUTOMATIC1111/stable-diffusion-webui) (including extensions) which allows for some pretty sophisticated stuff.**
🤯 *Check out tutorials on ControlNets, OpenPose, Textual Inversion on youtube to have your mind blown by the possibilities* 🤯

**🚨🚨🚨IMPORTANT: After you're done with your work, the notebook will be in `ACTIVE` state, consuming computing resources (=costing money 🤑🤑🤑)! Make sure to STOP it in the UI after initial provisioning!🚨🚨🚨**