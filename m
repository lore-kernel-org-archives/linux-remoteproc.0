Date: Thu, 9 Apr 2020 18:20:37 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] remoteproc: drop memset when loading elf segments
Message-ID: <20200410012034.GU20625@builder.lan>
References: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586420572-28353-1-git-send-email-peng.fan@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: ohad@wizery.com, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 09 Apr 01:22 PDT 2020, Peng Fan wrote:

> To arm64, "dc      zva, dst" is used in memset.
> Per ARM DDI 0487A.j, chapter C5.3.8 DC ZVA, Data Cache Zero by VA,
> 
> "If the memory region being zeroed is any type of Device memory,
> this instruction can give an alignment fault which is prioritized
> in the same way as other alignment faults that are determined
> by the memory type."
> 
> On i.MX platforms, when elf is loaded to onchip TCM area, the region
> is ioremapped, so "dc zva, dst" will trigger abort.
> 
> Since memset is not strictly required, let's drop it.
> 

This would imply that we trust that the firmware doesn't expect
remoteproc to zero out the memory, which we've always done. So I don't
think we can say that it's not required.

> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/remoteproc_elf_loader.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
> index 16e2c496fd45..cc50fe70d50c 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -238,14 +238,11 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
>  			memcpy(ptr, elf_data + offset, filesz);
>  
>  		/*
> -		 * Zero out remaining memory for this segment.
> +		 * No need zero out remaining memory for this segment.
>  		 *
>  		 * This isn't strictly required since dma_alloc_coherent already
> -		 * did this for us. albeit harmless, we may consider removing
> -		 * this.
> +		 * did this for us.

In the case of recovery this comment is wrong, we do not
dma_alloc_coherent() the carveout during a recovery.

And in your case you ioremapped existing TCM, so it's never true.

>  		 */
> -		if (memsz > filesz)
> -			memset(ptr + filesz, 0, memsz - filesz);

So I think you do want to zero out this region. Question is how we do
it...

Regards,
Bjorn

>  	}
>  
>  	if (ret == 0)
> -- 
> 2.16.4
> 
