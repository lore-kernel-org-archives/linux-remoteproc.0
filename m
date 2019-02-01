Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
MIME-Version: 1.0
References: <20190131003933.11436-1-bjorn.andersson@linaro.org> <20190131003933.11436-4-bjorn.andersson@linaro.org>
In-Reply-To: <20190131003933.11436-4-bjorn.andersson@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Feb 2019 15:54:50 -0800
Message-ID: <CAD=FV=V068E_d-RyJdCTm4ycj+oSfe7zC8goGKhKbyELaN63GQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] arm64: dts: sdm845: Introduce ADSP and CDSP PAS nodes
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Wed, Jan 30, 2019 at 4:40 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index d19486ba1e5e..07d9cd6fba7d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -325,6 +325,64 @@
>                 };
>         };
>
> +       adsp_pas: remoteproc-adsp {
> +               compatible = "qcom,sdm845-adsp-pas";

After discussion with you offline I now understand why this is using
"-pas" and not "-pil".

...and I understand that on my particular board (which should use
"-pil") we'll juse leave this as status = "disabled".

It would be good if something in this series updated the bindings to
make it clearer since I can't find anything in these two files:

Documentation/devicetree/bindings/remoteproc/qcom,adsp-pil.txt
Documentation/devicetree/bindings/remoteproc/qcom,adsp.txt

...explain when the "-pil" is used and when the "-pas" is used.


-Doug
