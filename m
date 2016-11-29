Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Tue, 29 Nov 2016 09:20:51 +0000
From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/1] remoteproc: core: probe subdevices before booting
 coprocessor
Message-ID: <20161129092051.GE2683@dell>
References: <1480096150-5795-1-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1480096150-5795-1-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: bjorn.andersson@linaro.org, ohad@wizery.com, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 25 Nov 2016, Loic Pallardy wrote:

> With subdevice support introduction, coprocessor boot sequence has
> changed. Related coprocessor subdevices are now starting after firmware
> and resource table loading and coprocessor boot.
> 
> But some subdevices can resources to allocate before coprocessor start,
> like rpmsg buffers allocation for example.
> 
> This patch probes subdevices just before loading resource table,
> to keep backward compatibility with existing firmwares.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Isn't this a fix?

If so, please use Fixes: tag.  This will ensure Bjorn looks at it
quickly and that it's applied to his -next branch.

We really do not want v4.9 to be an unusable kernel version for us.

> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index f0f6ec1..15e9331 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -913,6 +913,14 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  		goto clean_up_resources;
>  	}
>  
> +	/* probe any subdevices for the remote processor */
> +	ret = rproc_probe_subdevices(rproc);
> +	if (ret) {
> +		dev_err(dev, "failed to probe subdevices for %s: %d\n",
> +			rproc->name, ret);
> +		goto clean_up_resources;
> +	}
> +
>  	/*
>  	 * The starting device has been given the rproc->table_ptr as the
>  	 * resource table. The address of the vring along with the other
> @@ -932,14 +940,6 @@ static int rproc_fw_boot(struct rproc *rproc, const struct firmware *fw)
>  		goto clean_up_resources;
>  	}
>  
> -	/* probe any subdevices for the remote processor */
> -	ret = rproc_probe_subdevices(rproc);
> -	if (ret) {
> -		dev_err(dev, "failed to probe subdevices for %s: %d\n",
> -			rproc->name, ret);
> -		goto stop_rproc;
> -	}
> -
>  	rproc->state = RPROC_RUNNING;
>  
>  	dev_info(dev, "remote processor %s is now up\n", rproc->name);

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
