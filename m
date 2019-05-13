Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 13 May 2019 10:23:49 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: remoteproc: Rename and amend Hexagon
 v56 binding
Message-ID: <20190513152349.GA23710@bogus>
References: <20190510043421.31393-1-bjorn.andersson@linaro.org>
 <20190510043421.31393-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510043421.31393-2-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu,  9 May 2019 21:34:14 -0700, Bjorn Andersson wrote:
> The SDM845 Audio DSP peripheral image loader binding describes the
> properties needed to load and boot firmware on a Hexagon v56. Rename the
> file and add the Compute DSP (CDSP) found in QCS404 to the binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  ...qcom,adsp-pil.txt => qcom,hexagon-v56.txt} | 35 +++++++++++++------
>  1 file changed, 25 insertions(+), 10 deletions(-)
>  rename Documentation/devicetree/bindings/remoteproc/{qcom,adsp-pil.txt => qcom,hexagon-v56.txt} (74%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
