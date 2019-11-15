Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Fri, 15 Nov 2019 11:55:49 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v4] remoteproc: stm32: fix probe error case
Message-ID: <20191115185549.GA17332@xps15>
References: <1573812188-19842-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573812188-19842-1-git-send-email-fabien.dessenne@st.com>
To: Fabien Dessenne <fabien.dessenne@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic Pallardy <loic.pallardy@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Fabien,

On Fri, Nov 15, 2019 at 11:03:08AM +0100, Fabien Dessenne wrote:
> If the rproc driver is probed before the mailbox driver and if the rproc
> Device Tree node has some mailbox properties, the rproc driver probe
> shall be deferred instead of being probed without mailbox support.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
> Changes since v3: on error, free mailboxes from stm32_rproc_request_mbox()
> Changes since v2: free other requested mailboxes after one request fails
> Changes since v1: test IS_ERR() before checking PTR_ERR()
> ---
>  drivers/remoteproc/stm32_rproc.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 2cf4b29..bcebb78 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -310,11 +310,12 @@ static const struct stm32_mbox stm32_rproc_mbox[MBOX_NB_MBX] = {
>  	}
>  };
>  
> -static void stm32_rproc_request_mbox(struct rproc *rproc)
> +static int stm32_rproc_request_mbox(struct rproc *rproc)
>  {
>  	struct stm32_rproc *ddata = rproc->priv;
>  	struct device *dev = &rproc->dev;
>  	unsigned int i;
> +	int j;
>  	const unsigned char *name;
>  	struct mbox_client *cl;
>  
> @@ -329,10 +330,20 @@ static void stm32_rproc_request_mbox(struct rproc *rproc)
>  
>  		ddata->mb[i].chan = mbox_request_channel_byname(cl, name);
>  		if (IS_ERR(ddata->mb[i].chan)) {
> +			if (PTR_ERR(ddata->mb[i].chan) == -EPROBE_DEFER)
> +				goto err_probe;
>  			dev_warn(dev, "cannot get %s mbox\n", name);
>  			ddata->mb[i].chan = NULL;
>  		}
>  	}
> +
> +	return 0;
> +
> +err_probe:
> +	for (j = i - 1; j >= 0; j--)
> +		if (ddata->mb[j].chan)
> +			mbox_free_channel(ddata->mb[j].chan);

Do you need to set ddata->mb[i].chan to NULL as it is done in
stm32_rproc_free_mbox?

Also I'm wondering about the error path for this function.  If something goes
wrong in mbox_request_channel_byname() none of the previously allocated channels
are freed and no further actions is taken.  Should we simply abort the probing
of the rproc if any of channels can't be probed?

Regardless of the above and without surprise:

Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org> 

> +	return -EPROBE_DEFER;
>  }
>  
>  static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
> @@ -596,7 +607,9 @@ static int stm32_rproc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto free_rproc;
>  
> -	stm32_rproc_request_mbox(rproc);
> +	ret = stm32_rproc_request_mbox(rproc);
> +	if (ret)
> +		goto free_rproc;
>  
>  	ret = rproc_add(rproc);
>  	if (ret)
> -- 
> 2.7.4
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
