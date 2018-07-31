Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 30 Jul 2018 21:21:40 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: fix Q6V5_WCSS dependencies
Message-ID: <20180731042140.GD5090@builder>
References: <20180718111730.3531477-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180718111730.3531477-1-arnd@arndb.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Sricharan R <sricharan@codeaurora.org>, Rohit kumar <rohitkr@codeaurora.org>, Sarangdhar Joshi <spjoshi@codeaurora.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 18 Jul 04:16 PDT 2018, Arnd Bergmann wrote:

> A new driver got added that depends on QCOM_SMD and fails to link
> as built-in with CONFIG_QCOM_SMD=m:
> 
> drivers/remoteproc/qcom_common.o: In function `smd_subdev_stop':
> qcom_common.c:(.text+0x674): undefined reference to `qcom_smd_unregister_edge'
> drivers/remoteproc/qcom_common.o: In function `smd_subdev_start':
> qcom_common.c:(.text+0x700): undefined reference to `qcom_smd_register_edge'
> 
> We've fixed the same thing several times before, so use the same
> dependency here.
> 

I have a change where I remove this inherited dependency, so I asked
Sricharan to only depend on the ones he actually uses - but I forgot
that I haven't pushed this.

Sorry about screwing this up again. Thanks for catching it!

Regards,
Bjorn

> Fixes: 3a3d4163e0bf ("remoteproc: qcom: Introduce Hexagon V5 based WCSS driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/remoteproc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 0dde3753c3a5..052d4dd347f9 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -127,6 +127,7 @@ config QCOM_Q6V5_WCSS
>  	tristate "Qualcomm Hexagon based WCSS Peripheral Image Loader"
>  	depends on OF && ARCH_QCOM
>  	depends on QCOM_SMEM
> +	depends on RPMSG_QCOM_SMD || (COMPILE_TEST && RPMSG_QCOM_SMD=n)
>  	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select MFD_SYSCON
> -- 
> 2.9.0
> 
