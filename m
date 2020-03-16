Date: Mon, 16 Mar 2020 16:01:35 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2] remoteproc: clean up notification config
Message-ID: <20200316230132.GC1135@builder>
References: <20200316225121.29905-1-elder@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316225121.29905-1-elder@linaro.org>
To: Alex Elder <elder@linaro.org>
Cc: "David S . Miller" <davem@davemloft.net>, Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 16 Mar 15:51 PDT 2020, Alex Elder wrote:

> Rearrange the config files for remoteproc and IPA to fix their
> interdependencies.
> 
> First, have CONFIG_QCOM_Q6V5_MSS select QCOM_Q6V5_IPA_NOTIFY so the
> notification code is built regardless of whether IPA needs it.
> 
> Next, represent QCOM_IPA as being dependent on QCOM_Q6V5_MSS rather
> than setting its value to match QCOM_Q6V5_COMMON (which is selected
> by QCOM_Q6V5_MSS).
> 
> Drop all dependencies from QCOM_Q6V5_IPA_NOTIFY.  The notification
> code will be built whenever QCOM_Q6V5_MSS is set, and it has no other
> dependencies.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> v2: - Fix subject line
>     - Incorporate a change I thought I had already squashed
> 
> Dave,
>     I noticed some problems with the interaction between the IPA and
>     remoteproc configs, and after some discussion with Bjorn we came
>     up with this, which simplifies things a bit.  Both Kconfig files
>     are in net-next now, so I'm sending this to you.
> 
>     Two other things:
>     - I will *not* be implementing the COMPILE_TEST suggestion until
>       after the next merge window.
>     - I learned of another issue that arises when ARM64 is built
>       with PAGE_SIZE > 4096.  I intend to fix that in the next day
>       or so.
> 
>       					-Alex
> 
>  drivers/net/ipa/Kconfig    | 2 +-
>  drivers/remoteproc/Kconfig | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ipa/Kconfig b/drivers/net/ipa/Kconfig
> index b8cb7cadbf75..9f0d2a93379c 100644
> --- a/drivers/net/ipa/Kconfig
> +++ b/drivers/net/ipa/Kconfig
> @@ -1,9 +1,9 @@
>  config QCOM_IPA
>  	tristate "Qualcomm IPA support"
>  	depends on ARCH_QCOM && 64BIT && NET
> +	depends on QCOM_Q6V5_MSS
>  	select QCOM_QMI_HELPERS
>  	select QCOM_MDT_LOADER
> -	default QCOM_Q6V5_COMMON
>  	help
>  	  Choose Y or M here to include support for the Qualcomm
>  	  IP Accelerator (IPA), a hardware block present in some
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 56084635dd63..ffdb5bc25d6d 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -128,6 +128,7 @@ config QCOM_Q6V5_MSS
>  	select MFD_SYSCON
>  	select QCOM_MDT_LOADER
>  	select QCOM_Q6V5_COMMON
> +	select QCOM_Q6V5_IPA_NOTIFY
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
>  	help
> @@ -169,9 +170,6 @@ config QCOM_Q6V5_WCSS
>  
>  config QCOM_Q6V5_IPA_NOTIFY
>  	tristate
> -	depends on QCOM_IPA
> -	depends on QCOM_Q6V5_MSS
> -	default QCOM_IPA
>  
>  config QCOM_SYSMON
>  	tristate "Qualcomm sysmon driver"
> -- 
> 2.20.1
> 
