Date: Fri, 4 Oct 2019 21:12:11 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: debug: Remove unneeded NULL check
Message-ID: <20191005041208.GE5189@tuxbook-pro>
References: <1569293934-31451-1-git-send-email-dingxiang@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569293934-31451-1-git-send-email-dingxiang@cmss.chinamobile.com>
To: Ding Xiang <dingxiang@cmss.chinamobile.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 23 Sep 19:58 PDT 2019, Ding Xiang wrote:

> debugfs_remove_recursive will do NULL check, so remove
> the redundant null check
> 

Nice, applied.

Regards,
Bjorn

> Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index 8cd4a0a..dd93cf0 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -333,9 +333,6 @@ struct dentry *rproc_create_trace_file(const char *name, struct rproc *rproc,
>  
>  void rproc_delete_debug_dir(struct rproc *rproc)
>  {
> -	if (!rproc->dbg_dir)
> -		return;
> -
>  	debugfs_remove_recursive(rproc->dbg_dir);
>  }
>  
> -- 
> 1.9.1
> 
> 
> 
