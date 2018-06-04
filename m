Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 3 Jun 2018 17:49:40 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: smd: do not use mananged resources for endpoints
 and channels
Message-ID: <20180604004940.GA3206@builder>
References: <20180601233231.11230-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180601233231.11230-1-srinivas.kandagatla@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, rohkumar@qti.qualcomm.com, stable@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 01 Jun 16:32 PDT 2018, Srinivas Kandagatla wrote:
> @@ -1380,11 +1380,13 @@ static void qcom_smd_edge_release(struct device *dev)
>  {
>  	struct qcom_smd_channel *channel;
>  	struct qcom_smd_edge *edge = to_smd_edge(dev);
> +	struct list_head *this, *tmp;
>  
> -	list_for_each_entry(channel, &edge->channels, list) {
> -		SET_RX_CHANNEL_INFO(channel, state, SMD_CHANNEL_CLOSED);
> -		SET_RX_CHANNEL_INFO(channel, head, 0);
> -		SET_RX_CHANNEL_INFO(channel, tail, 0);
> +	list_for_each_safe(this, tmp, &edge->channels) {
> +		channel = list_entry(this, struct qcom_smd_channel, list);

Is there a reason not to use list_for_each_entry_safe()?

> +		list_del(&channel->list);
> +		kfree(channel->name);
> +		kfree(channel);

Regards,
Bjorn
