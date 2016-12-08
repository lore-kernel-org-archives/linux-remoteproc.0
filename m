Return-Path: <jasowang@redhat.com>
Subject: Re: [RFC LINUX PATCH 0/2] Virtio ring works with DMA coherent memory
References: <1481048488-1026-1-git-send-email-jliang@xilinx.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <67f94c52-853d-3182-5f39-9affcfe89fd1@redhat.com>
Date: Thu, 8 Dec 2016 11:18:19 +0800
MIME-Version: 1.0
In-Reply-To: <1481048488-1026-1-git-send-email-jliang@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
To: Wendy Liang <wendy.liang@xilinx.com>, ohad@wizery.com, bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org, mst@redhat.com, virtualization@lists.linux-foundation.org
Cc: Wendy Liang <jliang@xilinx.com>
List-ID: <linux-remoteproc@vger.kernel.org>



On 2016年12月07日 02:21, Wendy Liang wrote:
> RPMsg uses dma_alloc_coherent() to allocate memory to shared with the remote.
> In this case, as there is no pages setup in the dma_alloc_coherent(),
> we cannot get the physical address back from the virtual address, and thus,
> we can set the sg_dma_addr to store the DMA address and mark it already DMA
> mapped.
>
> When virtio vring sees the sg_dma_addr is ready set, do not call dma_map_page().
>
> The issue was once discussed here:
> http://virtualization.linux-foundation.narkive.com/CfVP32Vy/rfc-0-4-rpmsg-fix-init-of-dma-able-virtqueues
>
> Edgar E. Iglesias (1):
>    rpmsg: DMA map sgs passed to virtio
>
> Wendy Liang (1):
>    virtio_ring: Do not call dma_map_page if sg is already mapped.
>
>   drivers/rpmsg/virtio_rpmsg_bus.c | 22 +++++++++++++++++++---
>   drivers/virtio/virtio_ring.c     |  6 ++++++
>   2 files changed, 25 insertions(+), 3 deletions(-)
>

Looks good to me.

I think you can send a formal patch (without RFC prefix).

Thanks
