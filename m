Return-Path: <robh+dt@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170829231336.24454-2-bjorn.andersson@linaro.org>
References: <20170829231336.24454-1-bjorn.andersson@linaro.org> <20170829231336.24454-2-bjorn.andersson@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 1 Sep 2017 10:36:59 -0500
Message-ID: <CAL_JsqJmmRpAEDqwdgQX2EmB6F8Lzqj3YF+xwMb5xi8EbboB2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: soc: qcom: Extend GLINK to cover SMEM
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" <linux-remoteproc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Aug 29, 2017 at 6:13 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> In addition to using GLINK for communication with the RPM it can be
> used ontop of SMEM for communicating with remoteprocs, extend the
> binding to also describe this case and reference the GLINK binding from
> the affected remoteproc bindings.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt |  7 ++++---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt |  5 +++++
>  Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt  | 13 +++++++------
>  3 files changed, 16 insertions(+), 9 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
