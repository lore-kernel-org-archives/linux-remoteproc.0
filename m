Return-Path: <joro@8bytes.org>
Date: Tue, 10 Mar 2020 12:23:32 +0100
From: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 0/3] Request direct mapping for modem firmware subdevice
Message-ID: <20200310112332.GG3794@8bytes.org>
References: <20200309182255.20142-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309182255.20142-1-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, ohad@wizery.com, agross@kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Mar 09, 2020 at 11:52:52PM +0530, Sibi Sankar wrote:
> The Q6 modem sub-system has direct access to DDR through memnoc and
> an indirect access routed through a SMMU which MSS CE (crypto engine
> sub-component of MSS) uses during out of reset sequence. Request direct
> mapping for the modem-firmware subdevice since smmu is not expected
> to provide access control/translation for these SIDs (sandboxing of the
> modem is achieved through XPUs engaged using SMC calls).

So the DMA accesses are initiated by the firmware and need to be direct
mapped? Which memory region do they access?

Regards,

	Joerg
