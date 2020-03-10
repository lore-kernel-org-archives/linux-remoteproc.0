Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 10 Mar 2020 19:30:50 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 0/3] Request direct mapping for modem firmware subdevice
In-Reply-To: <20200310112332.GG3794@8bytes.org>
References: <20200309182255.20142-1-sibis@codeaurora.org>
 <20200310112332.GG3794@8bytes.org>
Message-ID: <4ed6ddd667a3e6f670084a443d141474@codeaurora.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, ohad@wizery.com, agross@kernel.org, linux-kernel-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Joerg,
Thanks for taking time to review
the series!

On 2020-03-10 16:53, Joerg Roedel wrote:
> On Mon, Mar 09, 2020 at 11:52:52PM +0530, Sibi Sankar wrote:
>> The Q6 modem sub-system has direct access to DDR through memnoc and
>> an indirect access routed through a SMMU which MSS CE (crypto engine
>> sub-component of MSS) uses during out of reset sequence. Request 
>> direct
>> mapping for the modem-firmware subdevice since smmu is not expected
>> to provide access control/translation for these SIDs (sandboxing of 
>> the
>> modem is achieved through XPUs engaged using SMC calls).
> 
> So the DMA accesses are initiated by the firmware and need to be direct
> mapped? Which memory region do they access?

The accesses are initiated by the firmware
and they access modem reserved regions.
However as explained in ^^ any accesses
outside the region will result in a violation
and is controlled through XPUs (protection units).

With ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT y
the firmware SIDs will explicitly need to
be directly mapped to avoid observing
global faults in the absence of secure
firmware (TrustZone) programming the modem
SIDs as S2CR-Bypass.

> 
> Regards,
> 
> 	Joerg

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
