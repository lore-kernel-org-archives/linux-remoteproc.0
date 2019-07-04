Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 4 Jul 2019 11:22:05 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: q6v5-mss: Fix build error without
 QCOM_MDT_LOADER
Message-ID: <20190704182205.GH1263@builder>
References: <20190704064649.51748-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704064649.51748-1-yuehaibing@huawei.com>
To: YueHaibing <yuehaibing@huawei.com>
Cc: ohad@wizery.com, jeffrey.l.hugo@gmail.com, agross@kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 03 Jul 23:46 PDT 2019, YueHaibing wrote:

> If QCOM_Q6V5_MSS is set but QCOM_MDT_LOADER is not,
> building will fails:
> 
> drivers/remoteproc/qcom_q6v5_mss.o: In function `q6v5_start':
> qcom_q6v5_mss.c:(.text+0x3260): undefined reference to `qcom_mdt_read_metadata'
> 
> Add QCOM_MDT_LOADER dependency for QCOM_Q6V5_MSS.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: f04b91383456 ("remoteproc: qcom: q6v5-mss: Support loading non-split images")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thanks for catching this, Applied.

Regards,
Bjorn

> ---
>  drivers/remoteproc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 9b0f0cb..28ed306 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -116,6 +116,7 @@ config QCOM_Q6V5_MSS
>  	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
>  	depends on QCOM_SYSMON || QCOM_SYSMON=n
>  	select MFD_SYSCON
> +	select QCOM_MDT_LOADER
>  	select QCOM_Q6V5_COMMON
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
> -- 
> 2.7.4
> 
> 
