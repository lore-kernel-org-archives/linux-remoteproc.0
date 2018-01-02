Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 2 Jan 2018 09:23:37 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH -next] rpmsg: glink: Fix missing mutex_init() in
 qcom_glink_alloc_channel()
Message-ID: <20180102172337.GW17344@builder>
References: <1514893623-70432-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1514893623-70432-1-git-send-email-weiyongjun1@huawei.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 02 Jan 03:47 PST 2018, Wei Yongjun wrote:

> qcom_glink_alloc_channel() allocates the mutex but not initialize it.
> Use mutex_init() on it to initialize it correctly.
> 
> This is detected by Coccinelle semantic patch.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks Wei, applied.

Regards,
Bjorn

> ---
>  drivers/rpmsg/qcom_glink_native.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 40d76d2..e0f31ed 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -221,6 +221,7 @@ static struct glink_channel *qcom_glink_alloc_channel(struct qcom_glink *glink,
>  	/* Setup glink internal glink_channel data */
>  	spin_lock_init(&channel->recv_lock);
>  	spin_lock_init(&channel->intent_lock);
> +	mutex_init(&channel->intent_req_lock);
>  
>  	channel->glink = glink;
>  	channel->name = kstrdup(name, GFP_KERNEL);
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
