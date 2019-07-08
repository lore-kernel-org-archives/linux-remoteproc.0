Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 8 Jul 2019 07:07:22 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: stm32: fix building without ARM SMCC
Message-ID: <20190708140722.GI1263@builder>
References: <20190708124311.3448056-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708124311.3448056-1-arnd@arndb.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, Ludovic Barre <ludovic.barre@st.com>, Loic Pallardy <loic.pallardy@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 08 Jul 05:42 PDT 2019, Arnd Bergmann wrote:

> When compile testing this driver without SMCC support enabled,
> we get a link error:
> 
> drivers/remoteproc/stm32_rproc.o: In function `stm32_rproc_start':
> stm32_rproc.c:(.text+0x776): undefined reference to `__arm_smccc_smc'
> drivers/remoteproc/stm32_rproc.o: In function `stm32_rproc_stop':
> stm32_rproc.c:(.text+0x92c): undefined reference to `__arm_smccc_smc'
> 
> Make the actual call to arm_smccc_smc conditional on the Kconfig
> symbol controlling its implementation.
> 
> Fixes: 13140de09cc2 ("remoteproc: stm32: add an ST stm32_rproc driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd, applied

Regards,
Bjorn

> ---
>  drivers/remoteproc/stm32_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index e83077b9ebf5..e2da7198b65f 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -344,7 +344,7 @@ static int stm32_rproc_set_hold_boot(struct rproc *rproc, bool hold)
>  
>  	val = hold ? HOLD_BOOT : RELEASE_BOOT;
>  
> -	if (ddata->secured_soc) {
> +	if (IS_ENABLED(CONFIG_HAVE_ARM_SMCCC) && ddata->secured_soc) {
>  		arm_smccc_smc(STM32_SMC_RCC, STM32_SMC_REG_WRITE,
>  			      hold_boot.reg, val, 0, 0, 0, 0, &smc_res);
>  		err = smc_res.a0;
> -- 
> 2.20.0
> 
