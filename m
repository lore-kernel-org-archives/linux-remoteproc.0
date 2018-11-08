Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 7 Nov 2018 22:13:55 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: debug: remove strlen call in rproc_trace_read
Message-ID: <20181108061355.GX12063@builder>
References: <1541603184-26652-1-git-send-email-xiaoxiang@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541603184-26652-1-git-send-email-xiaoxiang@xiaomi.com>
To: Suman Anna <s-anna@ti.com>, Xiang Xiao <xiaoxiang781216@gmail.com>
Cc: linux-remoteproc@vger.kernel.org, Xiang Xiao <xiaoxiang@xiaomi.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 07 Nov 07:06 PST 2018, Xiang Xiao wrote:

> because the trace buffer may contain the binary data
> 

I think this patch is good.

@Suman, as I know you're using this and would now read past the first \0
in the buffer, do you have any objections to it?

Regards,
Bjorn

> Signed-off-by: Xiang Xiao <xiaoxiang@xiaomi.com>
> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index e90135c..0808466 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -48,9 +48,8 @@ static ssize_t rproc_trace_read(struct file *filp, char __user *userbuf,
>  				size_t count, loff_t *ppos)
>  {
>  	struct rproc_mem_entry *trace = filp->private_data;
> -	int len = strnlen(trace->va, trace->len);
>  
> -	return simple_read_from_buffer(userbuf, count, ppos, trace->va, len);
> +	return simple_read_from_buffer(userbuf, count, ppos, trace->va, trace->len);
>  }
>  
>  static const struct file_operations trace_rproc_ops = {
> -- 
> 2.7.4
> 
