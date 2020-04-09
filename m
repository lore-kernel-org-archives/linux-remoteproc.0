Return-Path: <mathieu.poirier@linaro.org>
Return-Path: <mathieu.poirier@linaro.org>
Date: Thu, 9 Apr 2020 15:36:33 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH 6/7] remoteproc/k3-r5: Initialize TCM memories for ECC
Message-ID: <20200409213633.GB32029@xps15>
References: <20200324201819.23095-1-s-anna@ti.com>
 <20200324201819.23095-7-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324201819.23095-7-s-anna@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Mar 24, 2020 at 03:18:18PM -0500, Suman Anna wrote:
> The R5F processors on K3 SoCs all have two TCMs (ATCM and BTCM) that
> support 32-bit ECC. The TCMs are typically loaded with some boot-up
> code to initialize the R5 MPUs to further execute code out of DDR.
> The ECC for the TCMs is enabled by default on K3 SoCs due to internal
> default tie-off values, but the TCM memories are not initialized on
> device power up. Any read access without the corresponding TCM memory
> location initialized will generate an ECC error, and any such access
> from a A72 or A53 core will trigger a SError.
> 
> So, zero initialize both the TCM memories before loading any firmware
> onto a R5F in remoteproc mode. Any R5F booted from U-Boot/SPL would
> require a similar initialization in the bootloader. Note that both
> the TCMs are initialized unconditionally as the TCM enable config bits
> only manage the access and visibility from R5. The Core1 TCMs are not
> used and accessible in LockStep mode, so they are only initialized
> in Split-mode.

Everything was going well with this changelog until the last sentence.
Intuitively one is looking for the code that avoids the initialisation for
"Core1" in the patch but it is not there, and rightly so.  In locksetup mode the
second core is not registered with the remoteproc core and as such the
associated TCMs won't be initialised.

Simply put, I would just remove the last sentence as all it does (at least for
me) is add confusion.

With that:

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/remoteproc/ti_k3_r5_remoteproc.c b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> index 655f8f14c37d..8c9b7ae5d8b7 100644
> --- a/drivers/remoteproc/ti_k3_r5_remoteproc.c
> +++ b/drivers/remoteproc/ti_k3_r5_remoteproc.c
> @@ -366,6 +366,17 @@ static int k3_r5_rproc_prepare(struct rproc *rproc)
>  		dev_err(dev, "unable to enable cores for TCM loading, ret = %d\n",
>  			ret);
>  
> +	/*
> +	 * Zero out both TCMs unconditionally (access from v8 Arm core is not
> +	 * affected by ATCM & BTCM enable configuration values) so that ECC
> +	 * can be effective on all TCM addresses.
> +	 */
> +	dev_dbg(dev, "zeroing out ATCM memory\n");
> +	memset(core->mem[0].cpu_addr, 0x00, core->mem[0].size);
> +
> +	dev_dbg(dev, "zeroing out BTCM memory\n");
> +	memset(core->mem[1].cpu_addr, 0x00, core->mem[1].size);
> +
>  	return ret;
>  }
>  
> -- 
> 2.23.0
> 
