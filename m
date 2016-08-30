Return-Path: <andy.gross@linaro.org>
Return-Path: <andy.gross@linaro.org>
Date: Tue, 30 Aug 2016 16:15:32 -0500
From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 2/4] firmware: qcom: scm: add iommu scm calls for pg table
Message-ID: <20160830211532.GE24683@hector.attlocal.net>
References: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
 <1471622000-1906-3-git-send-email-stanimir.varbanov@linaro.org>
 <14e4872a-7775-4221-140a-e08d28ae9098@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14e4872a-7775-4221-140a-e08d28ae9098@codeaurora.org>
To: "Gupta, Puja" <pujag@codeaurora.org>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Clark <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Aug 24, 2016 at 11:35:29AM -0700, Gupta, Puja wrote:
> On 8/19/2016 8:53 AM, Stanimir Varbanov wrote:
> >Those two scm calls are used to get the size of secure iommu
> >page table and to pass physical memory address for this page
> >table. The calls are used by remoteproc venus driver to load
> >the firmware.
> Do we really need these additional scm calls for venus? why can't we just
> reuse existing __qcom_scm_pas_mem_setup() call?

Keep in mind this is with the smmu-v1 on 8916.  It seems like the downstream
kernel has to do extra stuff when dealing with the older smmu.  The newer
platforms handle this quasi-transparently.

Regards,

Andy
