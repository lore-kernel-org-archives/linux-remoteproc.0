Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Fri, 10 Jun 2016 13:03:01 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-binding: remoteproc: Introduce Hexagon loader
 binding
Message-ID: <20160610180301.GA31816@rob-hp-laptop>
References: <1465537980-13347-1-git-send-email-bjorn.andersson@linaro.org>
 <1465537980-13347-2-git-send-email-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465537980-13347-2-git-send-email-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, Pawel Moll <pawel.moll@arm.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Jun 09, 2016 at 10:53:00PM -0700, Bjorn Andersson wrote:
> This document defines the binding for a component that loads firmware
> and control the life cycle of a self-authenticating Qualcomm Hexagon
> core.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/remoteproc/qcom,q6v5.txt   | 138 +++++++++++++++++++++
>  1 file changed, 138 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt

I hope we're getting near the end of complex QCom bindings. This one 
seems pretty straight forward though.

Acked-by: Rob Herring <robh@kernel.org>
