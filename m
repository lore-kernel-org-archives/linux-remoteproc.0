Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 30 Mar 2020 16:11:06 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: remoteproc: qcom: Add iommus property
Message-ID: <20200330221106.GA17769@bogus>
References: <20200317150910.26053-1-sibis@codeaurora.org>
 <20200317150910.26053-2-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317150910.26053-2-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org, robin.murphy@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org, linux-remoteproc@vger.kernel.org, ohad@wizery.com, agross@kernel.org, dianders@chromium.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, 17 Mar 2020 20:39:08 +0530, Sibi Sankar wrote:
> Add iommus property to allow Q6 modem to boot on platforms which do
> not have trustZone.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
