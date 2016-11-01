Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 31 Oct 2016 17:37:34 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH -next] remoteproc: st: Fix error return code in
 st_rproc_probe()
Message-ID: <20161101003734.GA14397@tuxbot>
References: <1476721415-20224-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476721415-20224-1-git-send-email-weiyj.lk@gmail.com>
To: Wei Yongjun <weiyj.lk@gmail.com>
Cc: Patrice Chotard <patrice.chotard@st.com>, Ohad Ben-Cohen <ohad@wizery.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org, kernel@stlinux.com, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 17 Oct 09:23 PDT 2016, Wei Yongjun wrote:

> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> Fix to return a negative error code from the st_rproc_state() error
> handling case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, with added "Fixes". Thanks!

Regards,
Bjorn

> ---
>  drivers/remoteproc/st_remoteproc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index ae8963f..da4e152 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -245,8 +245,10 @@ static int st_rproc_probe(struct platform_device *pdev)
>  		goto free_rproc;
>  
>  	enabled = st_rproc_state(pdev);
> -	if (enabled < 0)
> +	if (enabled < 0) {
> +		ret = enabled;
>  		goto free_rproc;
> +	}
>  
>  	if (enabled) {
>  		atomic_inc(&rproc->power);
> 
