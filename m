Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 6 Jun 2019 08:43:32 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: debug: fix va dump format in carveout list
Message-ID: <20190606154332.GB23094@builder>
References: <1559835519-8165-1-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559835519-8165-1-git-send-email-arnaud.pouliquen@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 06 Jun 08:38 PDT 2019, Arnaud Pouliquen wrote:

> Standardize dump presentation for va, dma and da dumps by adding
> "0x" prefix for virtual address.
> 
> Fixes: 276ec9934231("remoteproc: replace "%p" with "%pK"")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Applied

Thanks,
Bjorn

> ---
>  drivers/remoteproc/remoteproc_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> index 6da934b8dc4b..91d3a75f0b41 100644
> --- a/drivers/remoteproc/remoteproc_debugfs.c
> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> @@ -298,7 +298,7 @@ static int rproc_carveouts_show(struct seq_file *seq, void *p)
>  	list_for_each_entry(carveout, &rproc->carveouts, node) {
>  		seq_puts(seq, "Carveout memory entry:\n");
>  		seq_printf(seq, "\tName: %s\n", carveout->name);
> -		seq_printf(seq, "\tVirtual address: %pK\n", carveout->va);
> +		seq_printf(seq, "\tVirtual address: 0x%pK\n", carveout->va);
>  		seq_printf(seq, "\tDMA address: %pad\n", &carveout->dma);
>  		seq_printf(seq, "\tDevice address: 0x%x\n", carveout->da);
>  		seq_printf(seq, "\tLength: 0x%x Bytes\n\n", carveout->len);
> -- 
> 2.7.4
> 
