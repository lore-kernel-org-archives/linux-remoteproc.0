Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:50522 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727661AbfDJJUl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Apr 2019 05:20:41 -0400
Subject: Re: Do we always need to reserve an iova before iommu_map?
References: <20190409224718.GA3281@Asurada-Nvidia.nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3916e00d-d3a9-11be-4107-73429f6dd8bf@arm.com>
Date: Wed, 10 Apr 2019 10:20:38 +0100
MIME-Version: 1.0
In-Reply-To: <20190409224718.GA3281@Asurada-Nvidia.nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: Nicolin Chen <nicoleotsuka@gmail.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 09/04/2019 23:47, Nicolin Chen wrote:
> Hi all,
> 
> According to the routine of iommu_dma_alloc(), it allocates an iova
> then does iommu_map() to map the iova to a physical address of new
> allocated pages. However, in remoteproc_core.c, I see its code try
> to iommu_map() without having an alloc_iova() or alloc_iova_fast().
> 
> Is it safe to do so? If an iova range is not allocated but mapped,
> would a later iommu_dma_alloc() happen to hit this iova range when
> doing its alloc_iova() and then fail to map?
> 
> And I am not very familiar with remoteproc code, so if I am missing
> something, please kindly educate me.

AFAICS that area of the remoteproc code is using its own IOMMU domain, 
so it's free to manage that domain's address space however it wants - 
the generic IOVA allocator is a good option for the DMA API where the 
only constraint is that the address we get fits within a mask, but 
drivers with more specific requirements may well be better off using 
other allocation methods. See also various DRM drivers 
(Tegra/Rockchip/etc.) that do similar, using a drm_mm to manage the 
address space.

Robin.
