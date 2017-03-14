Return-Path: <jdelvare@suse.de>
Date: Tue, 14 Mar 2017 10:05:46 +0100
From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [RESEND PATCH] remoteproc: qcom: fix QCOM_SMD dependencies
Message-ID: <20170314100546.75581adc@endymion>
In-Reply-To: <20170313163635.956380-1-arnd@arndb.de>
References: <20170313163635.956380-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Peter Griffin <peter.griffin@linaro.org>, Vinod Koul <vinod.koul@intel.com>, Loic Pallardy <loic.pallardy@st.com>, Pavel Machek <pavel@ucw.cz>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Arnd,

On Mon, 13 Mar 2017 17:36:25 +0100, Arnd Bergmann wrote:
> qcom_smd_register_edge() is provided by either QCOM_SMD or RPMSG_QCOM_SMD,
> and if both of them are disabled, it does nothing.

Actually the code itself looks wrong to me. There are two sets of stubs
for qcom_smd_register_edge() and qcom_smd_unregister_edge() when the
feature is disabled, one from include/linux/rpmsg/qcom_smd.h and one
from include/linux/soc/qcom/smd.h. They have different definitions, and
different conditions. The former is declared if neither backend is
selected, while the latter is declared if QCOM_SMD isn't selected
(regardless of the value of RPMSG_QCOM_SMD.)

So as it stands, QCOM_SMD=n && RPMSG_QCOM_SMD=m leads to 2
implementations of these functions, inline stubs from
include/linux/soc/qcom/smd.h and actual implementations from
drivers/rpmsg/qcom_smd.c. I know nothing about these drivers but this
looks needlessly complex and error-prone to me. The stubs should be
declared only once and only when no actual implementations are
available. That is, assuming they are really supposed to be the same
and it's not an unfortunate name collision.

> The check for the PIL drivers however only checks for QCOM_SMD, so it breaks
> with QCOM_SMD=n && RPMSG_QCOM_SMD=m:
> 
> drivers/remoteproc/built-in.o: In function `smd_subdev_remove':
> qcom_wcnss_iris.c:(.text+0x231c): undefined reference to `qcom_smd_unregister_edge'
> drivers/remoteproc/built-in.o: In function `smd_subdev_probe':
> qcom_wcnss_iris.c:(.text+0x2344): undefined reference to `qcom_smd_register_edge'
> drivers/remoteproc/built-in.o: In function `smd_subdev_probe':
> qcom_q6v5_pil.c:(.text+0x3538): undefined reference to `qcom_smd_register_edge'
> qcom_q6v5_pil.c:(.text+0x3538): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `qcom_smd_register_edge'
> 
> This clarifies the Kconfig dependency.
> 
> Fixes: 4b48921a8f74 ("remoteproc: qcom: Use common SMD edge handler")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Submitted on Feb 28, still needed in mainline as of v4.11-rc2
> ---
>  drivers/remoteproc/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 65f86bc24c07..1dc43fc5f65f 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -76,7 +76,7 @@ config QCOM_ADSP_PIL
>  	depends on OF && ARCH_QCOM
>  	depends on REMOTEPROC
>  	depends on QCOM_SMEM
> -	depends on QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n)
> +	depends on RPMSG_QCOM_SMD || QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n && RPMSG_QCOM_SMD=n)
>  	select MFD_SYSCON
>  	select QCOM_MDT_LOADER
>  	select QCOM_RPROC_COMMON
> @@ -93,7 +93,7 @@ config QCOM_Q6V5_PIL
>  	depends on OF && ARCH_QCOM
>  	depends on QCOM_SMEM
>  	depends on REMOTEPROC
> -	depends on QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n)
> +	depends on RPMSG_QCOM_SMD || QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n && RPMSG_QCOM_SMD=n)
>  	select MFD_SYSCON
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
> @@ -104,7 +104,7 @@ config QCOM_Q6V5_PIL
>  config QCOM_WCNSS_PIL
>  	tristate "Qualcomm WCNSS Peripheral Image Loader"
>  	depends on OF && ARCH_QCOM
> -	depends on QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n)
> +	depends on RPMSG_QCOM_SMD || QCOM_SMD || (COMPILE_TEST && QCOM_SMD=n && RPMSG_QCOM_SMD=n)
>  	depends on QCOM_SMEM
>  	depends on REMOTEPROC
>  	select QCOM_MDT_LOADER

I don't think the COMPILE_TEST adds any value here. The whole set of
drivers is architecture specific anyway so you won't gain much build
test coverage. It may even prevent a legitimate combination of options
on the intended target, if the feature provided by QCOM_SMD and
RPMSG_QCOM_SMD is optional (if not, I would suggest to drop all the
stubs and simply depend on RPMSG_QCOM_SMD || QCOM_SMD, for the sake of
simplicity.)

Don't get me wrong, I am a big fan of COMPILE_TEST, but only when we
can use it to get build testing coverage for free. If you have to change
the code itself in order to be able to get the extra build testing
coverage, I don't think it is a good idea. The kernel and the Kconfig
dependencies can be complex enough as is.

-- 
Jean Delvare
SUSE L3 Support
