Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 14/17] remoteproc: Refactor function
 rproc_trigger_recovery()
References: <20200324214603.14979-1-mathieu.poirier@linaro.org>
 <20200324214603.14979-15-mathieu.poirier@linaro.org>
From: Suman Anna <s-anna@ti.com>
Message-ID: <2b052de0-baf3-f474-152b-a71e1284852f@ti.com>
Date: Tue, 31 Mar 2020 16:52:12 -0500
MIME-Version: 1.0
In-Reply-To: <20200324214603.14979-15-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Mathieu Poirier <mathieu.poirier@linaro.org>, bjorn.andersson@linaro.org
Cc: ohad@wizery.com, loic.pallardy@st.com, peng.fan@nxp.com, arnaud.pouliquen@st.com, fabien.dessenne@st.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Mathieu,

On 3/24/20 4:46 PM, Mathieu Poirier wrote:
> Refactor function rproc_trigger_recovery() in order to avoid
> reloading the fw image when synchronising with an MCU rather than
> booting it.
> 
> Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index d3c4d7e6ca25..dbb0a8467205 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1661,7 +1661,7 @@ static void rproc_coredump(struct rproc *rproc)
>   */
>  int rproc_trigger_recovery(struct rproc *rproc)
>  {
> -	const struct firmware *firmware_p;
> +	const struct firmware *firmware_p = NULL;
>  	struct device *dev = &rproc->dev;
>  	int ret;
>  
> @@ -1678,14 +1678,16 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  	/* generate coredump */
>  	rproc_coredump(rproc);
>  
> -	/* load firmware */
> -	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request_firmware failed: %d\n", ret);
> -		goto unlock_mutex;
> +	/* load firmware if need be */
> +	if (!rproc_sync_with_mcu(rproc)) {
> +		ret = request_firmware(&firmware_p, rproc->firmware, dev);
> +		if (ret < 0) {
> +			dev_err(dev, "request_firmware failed: %d\n", ret);
> +			goto unlock_mutex;
> +		}

So, I am trying to understand the need for the flag around
RPROC_SYNC_STATE_CRASHED. Can you explain what all usecases that is
covering?

In anycase, you should probably combine this piece with the flag change
for STATE_CRASHED on the last patch.

regards
Suman

>  	}
>  
> -	/* boot the remote processor up again */
> +	/* boot up or synchronise with the remote processor again */
>  	ret = rproc_start(rproc, firmware_p);
>  
>  	release_firmware(firmware_p);
> 
