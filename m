Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH v2 1/1] remoteproc: correct rproc_free_vring() to avoid
 invalid kernel paging
References: <1530863212-16584-1-git-send-email-loic.pallardy@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <ee64ddf7-e9c6-0b77-8a4e-44f77d264fe0@ti.com>
Date: Wed, 25 Jul 2018 17:08:56 -0500
MIME-Version: 1.0
In-Reply-To: <1530863212-16584-1-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic Pallardy <loic.pallardy@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,

On 07/06/2018 02:46 AM, Loic Pallardy wrote:
> If rproc_start() failed, rproc_resource_cleanup() is called to clean
> debugfs entries, then associated iommu mappings, carveouts and vdev.
> Issue occurs when rproc_free_vring() is trying to reset vring resource
> table entry.
> At this time, table_ptr is pointing on loaded resource table and carveouts
> already released, so access to loaded resource table is generating a kernel
> paging error:

Are you using a device specific CMA pool or carveout, and if so, where
the pool is? If not, where is the default CMA pool? I am trying to
reproduce the issue on my platform with the start failure as you
suggested, but haven't seen it so far. That said, I have seen the exact
same crash when using HighMEM CMA pools on my downstream kernel when
stopping the processor, and the root cause is essentially the same as
what you summarized here. The issue was present with LowMem pools as
well, but got masked because of the kernel linear mapping.

> 
> [   12.696535] Unable to handle kernel paging request at virtual address f0f357cc
> [   12.696540] pgd = (ptrval)
> [   12.696542] [f0f357cc] *pgd=6d2d0811, *pte=00000000, *ppte=00000000
> [   12.696558] Internal error: Oops: 807 [#1] SMP ARM
> [   12.696563] Modules linked in: rpmsg_core v4l2_mem2mem videobuf2_dma_contig sti_drm v4l2_common vida
> [   12.696598] CPU: 1 PID: 48 Comm: kworker/1:1 Tainted: G        W         4.18.0-rc2-00018-g3170fdd-8
> [   12.696602] Hardware name: STi SoC with Flattened Device Tree
> [   12.696625] Workqueue: events request_firmware_work_func
> [   12.696659] PC is at rproc_free_vring+0x84/0xbc [remoteproc]
> [   12.696667] LR is at rproc_free_vring+0x70/0xbc [remoteproc]
> 
> This patch proposes to simply remove reset of resource table vring entries,
> as firmware and resource table are reloaded at each rproc boot.
> rproc_trigger_recovery() not impacted as resources not touched during recovery
> procedure.

And error recovery doesn't work for me after the rproc_start, stop got
introduced.

regards
Suman

> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
> Changes from V1: typo fixes in commit message
> 
>  drivers/remoteproc/remoteproc_core.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index a9609d9..9a8b47c 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -289,16 +289,10 @@ void rproc_free_vring(struct rproc_vring *rvring)
>  {
>  	int size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
>  	struct rproc *rproc = rvring->rvdev->rproc;
> -	int idx = rvring->rvdev->vring - rvring;
> -	struct fw_rsc_vdev *rsc;
>  
>  	dma_free_coherent(rproc->dev.parent, size, rvring->va, rvring->dma);
>  	idr_remove(&rproc->notifyids, rvring->notifyid);
>  
> -	/* reset resource entry info */
> -	rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
> -	rsc->vring[idx].da = 0;
> -	rsc->vring[idx].notifyid = -1;
>  }
>  
>  static int rproc_vdev_do_probe(struct rproc_subdev *subdev)
> 
