Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 3 Jan 2019 15:33:54 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/4] remoteproc: qcom: Wait for shutdown-ack/ind on
 sysmon shutdown
Message-ID: <20190103233354.GG31596@builder>
References: <20181224084824.25193-1-sibis@codeaurora.org>
 <20181224084824.25193-3-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181224084824.25193-3-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, ohad@wizery.com, mark.rutland@arm.com, linux-remoteproc@vger.kernel.org, dianders@chromium.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 24 Dec 00:48 PST 2018, Sibi Sankar wrote:

> After sending a sysmon shutdown request to the SSCTL service on the
> subsystem, wait for the service to send shutdown-ack interrupt or
> an indication message to signal the completion of graceful shutdown.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

I prefer something closer to v1, where you kept the handling of the
interrupt within the sysmon driver.

What I didn't like was the fact that you resolved the mss
platform_device to get to the irq, not that you grabbed the irq from the
parent's DT node from within the sysmon device.


You can get the remoteproc's DT node by rproc->dev.parent->of_node and
use of_irq_get_byname() to get an irq number, which you can request in
the sysmon device - which will work regardless of the remoteproc driver
being a platform_driver or something else.

All the logic looks sound, but by shuffling things around we should get
less coupling of the implementation (DT binding looks good).

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_sysmon.c | 40 +++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index c0d6ee8de995..0da83638ca99 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -36,6 +36,7 @@ struct qcom_sysmon {
>  
>  	struct rpmsg_endpoint *ept;
>  	struct completion comp;
> +	struct completion ind_comp;
>  	struct mutex lock;
>  
>  	bool ssr_ack;
> @@ -139,6 +140,7 @@ static int sysmon_callback(struct rpmsg_device *rpdev, void *data, int count,
>  }
>  
>  #define SSCTL_SHUTDOWN_REQ		0x21
> +#define SSCTL_SHUTDOWN_READY_IND	0x21
>  #define SSCTL_SUBSYS_EVENT_REQ		0x23
>  
>  #define SSCTL_MAX_MSG_LEN		7
> @@ -254,6 +256,29 @@ static struct qmi_elem_info ssctl_subsys_event_resp_ei[] = {
>  	{}
>  };
>  
> +static struct qmi_elem_info ssctl_shutdown_ind_ei[] = {
> +	{}
> +};
> +
> +static void sysmon_ind_cb(struct qmi_handle *qmi, struct sockaddr_qrtr *sq,
> +			  struct qmi_txn *txn, const void *data)
> +{
> +	struct qcom_sysmon *sysmon = container_of(qmi, struct qcom_sysmon, qmi);
> +
> +	complete(&sysmon->ind_comp);
> +}
> +
> +static struct qmi_msg_handler qmi_indication_handler[] = {
> +	{
> +		.type = QMI_INDICATION,
> +		.msg_id = SSCTL_SHUTDOWN_READY_IND,
> +		.ei = ssctl_shutdown_ind_ei,
> +		.decoded_size = 0,
> +		.fn = sysmon_ind_cb
> +	},
> +	{}
> +};
> +
>  /**
>   * ssctl_request_shutdown() - request shutdown via SSCTL QMI service
>   * @sysmon:	sysmon context
> @@ -264,6 +289,7 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
>  	struct qmi_txn txn;
>  	int ret;
>  
> +	reinit_completion(&sysmon->ind_comp);
>  	ret = qmi_txn_init(&sysmon->qmi, &txn, ssctl_shutdown_resp_ei, &resp);
>  	if (ret < 0) {
>  		dev_err(sysmon->dev, "failed to allocate QMI txn\n");
> @@ -285,6 +311,16 @@ static void ssctl_request_shutdown(struct qcom_sysmon *sysmon)
>  		dev_err(sysmon->dev, "shutdown request failed\n");
>  	else
>  		dev_dbg(sysmon->dev, "shutdown request completed\n");
> +
> +	if (sysmon->q6v5) {
> +		ret = qcom_q6v5_wait_for_shutdown(sysmon->q6v5, 10 * HZ);
> +		if (ret) {
> +			ret = try_wait_for_completion(&sysmon->ind_comp);
> +			if (!ret)
> +				dev_err(sysmon->dev,
> +					"timeout waiting for shutdown ack\n");
> +		}
> +	}
>  }
>  
>  /**
> @@ -462,9 +498,11 @@ struct qcom_sysmon *qcom_add_sysmon_subdev(struct rproc *rproc,
>  	sysmon->q6v5 = q6v5;
>  
>  	init_completion(&sysmon->comp);
> +	init_completion(&sysmon->ind_comp);
>  	mutex_init(&sysmon->lock);
>  
> -	ret = qmi_handle_init(&sysmon->qmi, SSCTL_MAX_MSG_LEN, &ssctl_ops, NULL);
> +	ret = qmi_handle_init(&sysmon->qmi, SSCTL_MAX_MSG_LEN, &ssctl_ops,
> +			      qmi_indication_handler);
>  	if (ret < 0) {
>  		dev_err(sysmon->dev, "failed to initialize qmi handle\n");
>  		kfree(sysmon);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
