Return-Path: <andy.gross@linaro.org>
Return-Path: <andy.gross@linaro.org>
Date: Thu, 1 Sep 2016 15:46:58 -0500
From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 3/4] dt-binding: remoteproc: venus rproc dt binding
 document
Message-ID: <20160901204658.GF24683@hector.attlocal.net>
References: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
 <1471622000-1906-4-git-send-email-stanimir.varbanov@linaro.org>
 <20160823173259.GA13327@rob-hp-laptop>
 <fbf25a9e-348b-9047-37ef-1b96808dea31@mm-sol.com>
 <20160825000521.GH15161@tuxbot>
 <3429173a-d55a-51e1-0973-7e5bd31be297@linaro.org>
 <20160826222345.GK15161@tuxbot>
 <5afd7f2f-ec1b-d2ce-b833-81df010e24de@linaro.org>
 <20160830171742.GN15161@tuxbot>
 <b7314a89-2215-4961-6e8a-be5ef536624a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7314a89-2215-4961-6e8a-be5ef536624a@linaro.org>
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>, Stephen Boyd <sboyd@codeaurora.org>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Sep 01, 2016 at 05:58:17PM +0300, Stanimir Varbanov wrote:
> Hi,
> 
> Cc: Marek
> 
> On 08/30/2016 08:17 PM, Bjorn Andersson wrote:
> > On Mon 29 Aug 04:48 PDT 2016, Stanimir Varbanov wrote:
> > 
> > [..]
> >>> Trying to wrap my head around how the iommu part works here. The
> >>> downstream code seems to indicate that this is a "generic" secure iommu
> >>> interface - used by venus, camera and kgsl; likely for dealing with DRM
> >>> protected buffers.
> >>
> >> The secure iommu interface is for content protected buffers. But these
> >> secure iommu contexts aren't used by msm DRM nor Venus in mainline. In
> >> Venus case I use non-secure iommu context for data buffers.
> >>
> > 
> > We must consider the case when DRM, VFE and Venus handles protected
> > buffers.
> 
> That would be interesting topic.
> 
> > 
> >>>
> >>> As such the iommu tables are not part of the venus rproc; I believe they
> >>> should either be tied into the msm-iommu driver or perhaps exposed as
> >>> its own iommu(?).
> >>
> >> The page tables are in msm-iommu driver.
> >>
> > 
> > So, just to verify your answer, the msm-iommu driver will handle both
> > protected and unprotected?
> 
> yes, at least for Venus case, the secured buffers are tied to different
> iommu contexts (and stream IDs). But this needs to be verified more
> carefully.
> 
> > 
> >>>
> >>>
> >>> But I presume from your inclusion that you've concluded that the venus
> >>> firmware we have refuses to execute without these tables at least
> >>> initialized, is this correct?
> >>
> >> Yes, the SMC call for PAS memory-setup will fail if this page table is
> >> not initialized.
> >>
> > 
> > If the msm-iommu driver will handle the protected buffers (or if there
> > will be a separate iommu driver for protected buffers) it should issue
> > these calls, to not be dependant on the rproc-venus driver.
> 
> For msm8916 we don't have iommu driver in mainline, I don't know what is
> the status with msm8996.

The iommu v2 transparently handles this and removes the requirement for the
specific SCM page tbl init calls.  However, the memory still has to be
configured to be accessible from the remote processor.

<snip>


Andy
