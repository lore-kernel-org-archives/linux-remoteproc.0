Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 9 Aug 2016 10:36:53 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 3/9] remoteproc: core: Remove pointless OOM print
Message-ID: <20160809173653.GD26240@tuxbot>
References: <20160804092153.23032-1-lee.jones@linaro.org>
 <20160804092153.23032-4-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160804092153.23032-4-lee.jones@linaro.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, ohad@wizery.com, linux-remoteproc@vger.kernel.org, loic.pallardy@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 04 Aug 02:21 PDT 2016, Lee Jones wrote:

> These types of error prints are superfluous.  The system will
> pick up on OOM issues and let the user know.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Although, I think we should drop the "mapping" object. We have all the
information in the carveout object to reverse the mapping at cleanup.

Regards,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 5654a81..4914482 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -619,7 +619,6 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  	if (rproc->domain) {
>  		mapping = kzalloc(sizeof(*mapping), GFP_KERNEL);
>  		if (!mapping) {
> -			dev_err(dev, "kzalloc mapping failed\n");
>  			ret = -ENOMEM;
>  			goto dma_free;
>  		}
> -- 
> 2.9.0
> 
