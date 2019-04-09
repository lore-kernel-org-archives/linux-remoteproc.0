Return-Path: <nicoleotsuka@gmail.com>
Return-Path: <nicoleotsuka@gmail.com>
Date: Tue, 9 Apr 2019 15:47:19 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Do we always need to reserve an iova before iommu_map?
Message-ID: <20190409224718.GA3281@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Joerg Roedel <joro@8bytes.org>
Cc: linux-remoteproc@vger.kernel.org, iommu@lists.linux-foundation.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi all,

According to the routine of iommu_dma_alloc(), it allocates an iova
then does iommu_map() to map the iova to a physical address of new
allocated pages. However, in remoteproc_core.c, I see its code try
to iommu_map() without having an alloc_iova() or alloc_iova_fast().

Is it safe to do so? If an iova range is not allocated but mapped,
would a later iommu_dma_alloc() happen to hit this iova range when
doing its alloc_iova() and then fail to map?

And I am not very familiar with remoteproc code, so if I am missing
something, please kindly educate me.

Thanks
Nicolin
