Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
MIME-Version: 1.0
References: <20190114192201.23779-1-sibis@codeaurora.org>
In-Reply-To: <20190114192201.23779-1-sibis@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Jan 2019 15:05:51 -0800
Message-ID: <CAD=FV=V2XoaDVy9hnh-S=jbzU-Di0KoD7gM2CxpZm3646k9ZjA@mail.gmail.com>
Subject: Re: [PATCH v6] arm64: dts: qcom: sdm845: Add Q6V5 MSS node
Content-Type: text/plain; charset="UTF-8"
To: Sibi Sankar <sibis@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>, sricharan@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Mon, Jan 14, 2019 at 11:22 AM Sibi Sankar <sibis@codeaurora.org> wrote:
> +               mss_pil: remoteproc@4080000 {
> +                       compatible = "qcom,sdm845-mss-pil";
> +                       reg = <0x04080000 0x408>, <0x04180000 0x48>;

This will now need to be adjusted to:

reg = <0 0x04080000 0 0x408>, <0 0x04180000 0 0x48>;

This fixes things up to deal with the patch ("arm64: dts: qcom:
sdm845: Increase address and size cells for soc"), AKA:
- https://patchwork.kernel.org/patch/10767511/
- https://lkml.kernel.org/r/20190117042940.25487-2-bjorn.andersson@linaro.org


-Doug
