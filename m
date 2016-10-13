Return-Path: <maitysanchayan@gmail.com>
Return-Path: <maitysanchayan@gmail.com>
Date: Thu, 13 Oct 2016 09:19:09 +0530
From: maitysanchayan@gmail.com
Subject: Re: Query on vring allocation in internal SRAM with remoteproc
Message-ID: <20161013034909.GA5332@Sanchayan-Arch.localdomain>
References: <20161006073023.GA1560@Sanchayan-Arch.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20161006073023.GA1560@Sanchayan-Arch.localdomain>
To: linux-remoteproc@vger.kernel.org
Cc: sanchayan.maity@toradex.com, stefan.agner@toradex.com, bjorn.andersson@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello,

Ping?

On 16-10-06 13:00:23, maitysanchayan@gmail.com wrote:
> Hello,
> 
> I have been working on use of remoteproc and rmpsg for bootup and communication
> between A5 and M4 core on NXP Vybrid[1]. Currently we are using a hacked up rpmsg[2]
> implementation for Vybrid based on NXP's implementation in downstream kernel for iMX7.
> We also use remoteproc but currently only for booting the M4 core and would like to
> completely leverage remoteproc for booting and rpmsg communication instead of hacked
> up way, so we can also upstream this.
> 
> For Vybrid, currently the internal On-chip RAM is being used for the vrings. Initially
> I tried with remoteproc, but Linux remoteproc allocates vrings in it's memory space
> with a call to dma_alloc_coherent. This does not work for Vybrid's case as even using
> RSC_VDEV, rproc_handle_vdev dynamically allocates using DMA API and completely ignores
> requested hardcoded addresses. On M4 side, we use FreeRTOS and openamp which has
> support for rpmsg and remoteproc.
> 
> The comment with rproc_handle_vdev mentions to use RSC_DEVMEM to map the required da
> to physical address. Reading the comments along with fw_rsc_devmem and above, I am
> not clear on what the firmware resource table should be. If I want the known internal
> OCRAM addresses to be used, shall I specify da and pa same in firmware resource table
> while using RSC_DEVMEM? Am not exactly clear on how the vrings will be allocated and
> handled in this case. It seems to have calls to iommu while we have no iommu.
> 
> There seems to have been patches for exactly this usecase of internal memories [3]
> using ioremap_nocache, but that seems to have never made it through?
> 
> Thanks & Regards,
> Sanchayan.
> 
> [1]. http://www.nxp.com/products/microcontrollers-and-processors/arm-processors/vfxxx-controller/f-series/arm-cortex-a5-plus-cortex-m4-mpus-1.5-mb-sram-lcd-security-ethernet-l2-switch:VF6xx
> [2]. https://lkml.org/lkml/2016/1/6/182
> [3]. http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/270534.html
