Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: srinivas.kandagatla@linaro.org
Subject: [PATCH 0/3] drivers: rpmsg: make rpmsg bus DMA capable
Date: Fri,  2 Mar 2018 14:55:28 +0000
Message-Id: <20180302145531.20463-1-srinivas.kandagatla@linaro.org>
To: will.deacon@arm.com, robin.murphy@arm.com, bjorn.andersson@linaro.org
Cc: joro@8bytes.org, ohad@wizery.com, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

On Qualcomm SoCs, DSP exposes many functionalities like audio,
as these drivers are child of rpmsg bus. Any dma allocations
or iommu operations on these devices would fail as the rpmsg
bus is not marked as dma capable bus.

This patchset makes the rpmsg bus dma capable.

This patchset is tested on DB410c and DB820c boards.

Thanks,
srini

Srinivas Kandagatla (3):
  rpmsg: core: export rpmsg bus type
  rpmsg: core: make rpmsg bus DMA capable
  iommu: armsmmu: set iommu ops for rpmsg bus

 drivers/iommu/arm-smmu.c   | 5 +++++
 drivers/rpmsg/rpmsg_core.c | 4 +++-
 include/linux/rpmsg.h      | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.15.1
