Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 16 Mar 2020 22:07:04 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 0/3] Request direct mapping for modem firmware subdevice
In-Reply-To: <20200316155028.GB18704@infradead.org>
References: <20200309182255.20142-1-sibis@codeaurora.org>
 <20200316155028.GB18704@infradead.org>
Message-ID: <8cfddb6cbc424b131c9ab823c0c0f3f1@codeaurora.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org, ohad@wizery.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, agross@kernel.org, linux-arm-msm-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Christoph,
Thanks for taking time to review
the series.

On 2020-03-16 21:20, Christoph Hellwig wrote:
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
> Please fix your device tree so that the device isn't bound to an
> IOMMU.

the bindings proposed in the series
would add a sub-device with an iommu
property.

modem_pil: remoteproc@xxxxx {
...
    modem-firmware {
         iommus = <&apps_smmu 0x460 0x1>;
    };
...
};

Remoteproc device will not have a iommu
property but modem-firmware sub-device
will.

With ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT y,
we would want to configure the SID either
in direct mapping or bypass (either will
do since protection is achieved through
other means)

https://lore.kernel.org/lkml/497e40b8-300f-1b83-4312-93a58c459d1d@arm.com/

Currently the restructuring is trending
towards whats discussed in the ^^ thread.
i.e either direct mapping/bypass will be
done in the SoC specific corner of the
SMMU driver.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
