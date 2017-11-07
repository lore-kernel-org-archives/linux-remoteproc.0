Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 6 Nov 2017 22:42:36 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: qcom: use %pap format string for phys_addr_t
Message-ID: <20171107064236.GB22677@builder>
References: <20171106133736.584646-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171106133736.584646-1-arnd@arndb.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 06 Nov 05:37 PST 2017, Arnd Bergmann wrote:

> We cannot cast a phys_addr_t variable to a pointer on 32-bit architectures
> with CONFIG_PHYS_ADDR_T_64BIT set:
> 
> In file included from include/linux/kernel.h:14:0,
>                  from include/linux/clk.h:16,
>                  from drivers/remoteproc/qcom_q6v5_pil.c:18:
> drivers/remoteproc/qcom_q6v5_pil.c: In function 'q6v5_xfer_mem_ownership':
> drivers/remoteproc/qcom_q6v5_pil.c:337:10: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>           (void *)addr, (void *)(addr + size),
>           ^
> 
> The correct way to print the contents is to use the %pap format
> string, passing the phys address by reference.
> 
> Fixes: 6c5a9dc2481b ("remoteproc: qcom: Make secure world call for mem ownership switch")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks Arnd! As the majority of the call sites had their own error
printing I filled in the last ones and dropped this pr_err instead.

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_q6v5_pil.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pil.c b/drivers/remoteproc/qcom_q6v5_pil.c
> index 5460f61ee21c..4576f88499cb 100644
> --- a/drivers/remoteproc/qcom_q6v5_pil.c
> +++ b/drivers/remoteproc/qcom_q6v5_pil.c
> @@ -333,9 +333,9 @@ static int q6v5_xfer_mem_ownership(struct q6v5 *qproc, int *current_perm,
>  	ret = qcom_scm_assign_mem(addr, ALIGN(size, SZ_4K),
>  				  current_perm, &next, 1);
>  	if (ret < 0) {
> -		pr_err("Failed to assign memory access in range %p to %p to %s ret = %d\n",
> -		       (void *)addr, (void *)(addr + size),
> -		       remote_owner ? "mss" : "hlos", ret);
> +		phys_addr_t end = addr + size;
> +		pr_err("Failed to assign memory access in range %pap to %pap to %s ret = %d\n",
> +		       &addr, &end, remote_owner ? "mss" : "hlos", ret);
>  		return ret;
>  	}
>  
> -- 
> 2.9.0
> 
