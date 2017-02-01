Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 1 Feb 2017 01:22:15 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: fix initializers for qcom_mss_reg_res
 array
Message-ID: <20170201092215.GF31134@builder>
References: <20170201165723.2615554-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170201165723.2615554-1-arnd@arndb.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, Wei Yongjun <weiyj.lk@gmail.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 01 Feb 08:56 PST 2017, Arnd Bergmann wrote:

> The recently added initialization is rather unusual because it uses a constructor for
> a variable-length array to assign a constant structure to a member that uses a fixed-length
> array. This confuses clang and breaks the build.
> 
> drivers/remoteproc/qcom_q6v5_pil.c:1024:18: error: incompatible pointer types initializing 'const char *' with an expression of type
> :%s      'struct qcom_mss_reg_res [4]' [-Werror,-Wincompatible-pointer-types]
>         .proxy_supply = (struct qcom_mss_reg_res[]) {
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/remoteproc/qcom_q6v5_pil.c:1024:18: warning: suggest braces around initialization of subobject [-Wmissing-braces]
>         .proxy_supply = (struct qcom_mss_reg_res[]) {
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> We can either turn this constructor into a regular initializer by removing
> the 'struct qcom_mss_reg_res[])', or we can make the array variable length.
> 
> The latter approach is used for the arrays of strings in the same structure,
> so let's use that here too.
> 
> Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy and active regulators.")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looked at it, but figured it wasn't worth an extra respin...

Applied.

Thanks,
Bjorn

> ---
>  drivers/remoteproc/qcom_q6v5_pil.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index 9a5149573298..8d60ad2a2851 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -107,8 +107,8 @@ struct qcom_mss_reg_res {
>  
>  struct rproc_hexagon_res {
>  	const char *hexagon_mba_image;
> -	struct qcom_mss_reg_res proxy_supply[4];
> -	struct qcom_mss_reg_res active_supply[2];
> +	struct qcom_mss_reg_res *proxy_supply;
> +	struct qcom_mss_reg_res *active_supply;
>  	char **proxy_clk_names;
>  	char **active_clk_names;
>  };
> -- 
> 2.9.0
> 
