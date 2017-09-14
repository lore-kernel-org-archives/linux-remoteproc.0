Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 14 Sep 2017 09:57:51 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: select QCOM_SMP2P for all qcom pils
Message-ID: <20170914165751.GN2016@tuxbook>
References: <20170913160405.17855-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170913160405.17855-1-srinivas.kandagatla@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 13 Sep 09:04 PDT 2017, srinivas.kandagatla@linaro.org wrote:

> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> All Qualcomm PIL drivers require SMP2P module to get a functional PIL,
> Currently user has to explicitly select SMP2P module, after looking
> at failure logs.
> 
> Fix this by selecting SMP2P as part of dependency of pil kconfig itself.
> 

The Kconfig should describe dependencies needed by the code, not by the
system.

I agree with you that this leads to wasted time trying figure out if
we're missing drivers/modules in the kernel, but I think that needs to
be solved in a more generic way.

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/remoteproc/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 8891a8e50f12..052c9e20abb6 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -87,6 +87,7 @@ config QCOM_ADSP_PIL
>  	select QCOM_MDT_LOADER
>  	select QCOM_RPROC_COMMON
>  	select QCOM_SCM
> +	select QCOM_SMP2P

NB. QCOM_SMP2P is a user-selectable config option, so you are not
allowed to "select" it, only "depends on" it.

Regards,
Bjorn
