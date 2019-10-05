Date: Fri, 4 Oct 2019 21:04:17 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: remove useless typedef
Message-ID: <20191005040415.GC5189@tuxbook-pro>
References: <20191004174424.21898-1-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004174424.21898-1-cleger@kalray.eu>
To: Clement Leger <cleger@kalray.eu>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 04 Oct 10:44 PDT 2019, Clement Leger wrote:

> rproc_handle_resources_t is not used anymore, remove it.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>

Applied

Thanks,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 48feebd6d0a2..78e00194e72f 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -52,8 +52,6 @@
>  static DEFINE_MUTEX(rproc_list_mutex);
>  static LIST_HEAD(rproc_list);
>  
> -typedef int (*rproc_handle_resources_t)(struct rproc *rproc,
> -				struct resource_table *table, int len);
>  typedef int (*rproc_handle_resource_t)(struct rproc *rproc,
>  				 void *, int offset, int avail);
>  
> -- 
> 2.15.0.276.g89ea799
> 
