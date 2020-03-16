Return-Path: <BATV+320f2f8d0c0c12241cee+6049+infradead.org+hch@bombadil.srs.infradead.org>
Date: Mon, 16 Mar 2020 08:50:28 -0700
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH 0/3] Request direct mapping for modem firmware subdevice
Message-ID: <20200316155028.GB18704@infradead.org>
References: <20200309182255.20142-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309182255.20142-1-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org, ohad@wizery.com, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, agross@kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Mar 09, 2020 at 11:52:52PM +0530, Sibi Sankar wrote:
> The Q6 modem sub-system has direct access to DDR through memnoc and
> an indirect access routed through a SMMU which MSS CE (crypto engine
> sub-component of MSS) uses during out of reset sequence. Request direct
> mapping for the modem-firmware subdevice since smmu is not expected
> to provide access control/translation for these SIDs (sandboxing of the
> modem is achieved through XPUs engaged using SMC calls).

Please fix your device tree so that the device isn't bound to an
IOMMU.
