Return-Path: <aneela@codeaurora.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Access APCS through mailbox framework
References: <20171116070842.6362-1-bjorn.andersson@linaro.org>
From: Arun Kumar Neelakantam <aneela@codeaurora.org>
Message-ID: <b9d3c1b6-e53a-12ce-f163-9dbfda7d7309@codeaurora.org>
Date: Thu, 16 Nov 2017 17:39:41 +0530
MIME-Version: 1.0
In-Reply-To: <20171116070842.6362-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>



On 11/16/2017 12:38 PM, Bjorn Andersson wrote:
> Attempt to acquire the APCS IPC through the mailbox framework and fall
> back to the old syscon based approach, to allow us to move away from
> using the syscon.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Arun Kumar Neelakantam <aneela@codeaurora.org>

> ---
>   drivers/rpmsg/qcom_smd.c | 62 +++++++++++++++++++++++++++++++++---------------
>   1 file changed, 43 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index b01774e9fac0..ef2a526ebc8f 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -14,6 +14,7 @@
>   
>   #include <linux/interrupt.h>
>   #include <linux/io.h>
> +#include <linux/mailbox_client.h>
>   #include <linux/mfd/syscon.h>
>   #include <linux/module.h>
>   #include <linux/of_irq.h>
> @@ -107,6 +108,8 @@ static const struct {
>    * @ipc_regmap:		regmap handle holding the outgoing ipc register
>    * @ipc_offset:		offset within @ipc_regmap of the register for ipc
>    * @ipc_bit:		bit in the register at @ipc_offset of @ipc_regmap
> + * @mbox_client:	mailbox client handle
> + * @mbox_chan:		apcs ipc mailbox channel handle
>    * @channels:		list of all channels detected on this edge
>    * @channels_lock:	guard for modifications of @channels
>    * @allocated:		array of bitmaps representing already allocated channels
> @@ -129,6 +132,9 @@ struct qcom_smd_edge {
>   	int ipc_offset;
>   	int ipc_bit;
>   
> +	struct mbox_client mbox_client;
> +	struct mbox_chan *mbox_chan;
> +
>   	struct list_head channels;
>   	spinlock_t channels_lock;
>   
> @@ -365,7 +371,12 @@ static void qcom_smd_signal_channel(struct qcom_smd_channel *channel)
>   {
>   	struct qcom_smd_edge *edge = channel->edge;
>   
> -	regmap_write(edge->ipc_regmap, edge->ipc_offset, BIT(edge->ipc_bit));
> +	if (edge->mbox_chan) {
> +		mbox_send_message(edge->mbox_chan, NULL);
> +		mbox_client_txdone(edge->mbox_chan, 0);
> +	} else {
> +		regmap_write(edge->ipc_regmap, edge->ipc_offset, BIT(edge->ipc_bit));
> +	}
>   }
>   
>   /*
> @@ -1268,27 +1279,37 @@ static int qcom_smd_parse_edge(struct device *dev,
>   	key = "qcom,remote-pid";
>   	of_property_read_u32(node, key, &edge->remote_pid);
>   
> -	syscon_np = of_parse_phandle(node, "qcom,ipc", 0);
> -	if (!syscon_np) {
> -		dev_err(dev, "no qcom,ipc node\n");
> -		return -ENODEV;
> -	}
> +	edge->mbox_client.dev = dev;
> +	edge->mbox_client.knows_txdone = true;
> +	edge->mbox_chan = mbox_request_channel(&edge->mbox_client, 0);
> +	if (IS_ERR(edge->mbox_chan)) {
> +		if (PTR_ERR(edge->mbox_chan) != -ENODEV)
> +			return PTR_ERR(edge->mbox_chan);
>   
> -	edge->ipc_regmap = syscon_node_to_regmap(syscon_np);
> -	if (IS_ERR(edge->ipc_regmap))
> -		return PTR_ERR(edge->ipc_regmap);
> +		edge->mbox_chan = NULL;
>   
> -	key = "qcom,ipc";
> -	ret = of_property_read_u32_index(node, key, 1, &edge->ipc_offset);
> -	if (ret < 0) {
> -		dev_err(dev, "no offset in %s\n", key);
> -		return -EINVAL;
> -	}
> +		syscon_np = of_parse_phandle(node, "qcom,ipc", 0);
> +		if (!syscon_np) {
> +			dev_err(dev, "no qcom,ipc node\n");
> +			return -ENODEV;
> +		}
>   
> -	ret = of_property_read_u32_index(node, key, 2, &edge->ipc_bit);
> -	if (ret < 0) {
> -		dev_err(dev, "no bit in %s\n", key);
> -		return -EINVAL;
> +		edge->ipc_regmap = syscon_node_to_regmap(syscon_np);
> +		if (IS_ERR(edge->ipc_regmap))
> +			return PTR_ERR(edge->ipc_regmap);
> +
> +		key = "qcom,ipc";
> +		ret = of_property_read_u32_index(node, key, 1, &edge->ipc_offset);
> +		if (ret < 0) {
> +			dev_err(dev, "no offset in %s\n", key);
> +			return -EINVAL;
> +		}
> +
> +		ret = of_property_read_u32_index(node, key, 2, &edge->ipc_bit);
> +		if (ret < 0) {
> +			dev_err(dev, "no bit in %s\n", key);
> +			return -EINVAL;
> +		}
>   	}
>   
>   	ret = of_property_read_string(node, "label", &edge->name);
> @@ -1394,6 +1415,8 @@ struct qcom_smd_edge *qcom_smd_register_edge(struct device *parent,
>   	return edge;
>   
>   unregister_dev:
> +	if (!IS_ERR_OR_NULL(edge->mbox_chan))
> +		mbox_free_channel(edge->mbox_chan);
>   	put_device(&edge->dev);
>   	return ERR_PTR(ret);
>   }
> @@ -1422,6 +1445,7 @@ int qcom_smd_unregister_edge(struct qcom_smd_edge *edge)
>   	if (ret)
>   		dev_warn(&edge->dev, "can't remove smd device: %d\n", ret);
>   
> +	mbox_free_channel(edge->mbox_chan);
>   	device_unregister(&edge->dev);
>   
>   	return 0;
