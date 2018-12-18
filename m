Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
MIME-Version: 1.0
References: <20181217100724.4593-1-sibis@codeaurora.org> <20181217100724.4593-3-sibis@codeaurora.org>
In-Reply-To: <20181217100724.4593-3-sibis@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Dec 2018 16:00:58 -0800
Message-ID: <CAD=FV=XNZ5CzKXHogKEGTHgPVg_nbXxVEJR0e9F9usEY3YKEiQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: remoteproc: qcom: Fixup regulator dependencies
Content-Type: text/plain; charset="UTF-8"
To: sibis@codeaurora.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Mon, Dec 17, 2018 at 2:08 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Fixup regulator supply dependencies for Q6V5 MSS on MSM996 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> index 780adc043b37..98894e6ad456 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
> @@ -76,7 +76,9 @@ on the Qualcomm Hexagon core.
>         Usage: required
>         Value type: <phandle>
>         Definition: reference to the regulators to be held on behalf of the
> -                   booting of the Hexagon core
> +                   booting of the Hexagon core on MSM8916 SoCs
> +                   reference to the pll-supply regulator to be held on behalf
> +                   of the booting of the Hexagon core on MSM8996 SoCs

The prose gets in the way and doesn't add anything.  I also don't
understand what you're saying for msm8996.  You're saying that
"pll-supply" is required there but none of the others?  That doesn't
seem to be true in the code I have in front of me, but maybe I'm
missing some patch.  For me, I'd write:

For the compatible strings below the following supplies are required:
  "qcom,q6v5-pil"
  "qcom,msm8916-mss-pil",
  "qcom,msm8974-mss-pil"
- cx-supply:
- mss-supply:
- mx-supply:
- pll-supply:
Usage: required
Value type: <phandle>
Definition: reference to the regulators to be held on behalf of the
    booting of the Hexagon core


...and if msm8996 actually needs "pll-supply", you could add in...

For the compatible strings below the following supplies are required:
  "qcom,msm8996-mss-pil"
- pll-supply:
Usage: required
Value type: <phandle>
Definition: reference to the regulators to be held on behalf of the
    booting of the Hexagon core
