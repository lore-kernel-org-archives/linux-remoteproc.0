Return-Path: <dianders@chromium.org>
Return-Path: <dianders@chromium.org>
MIME-Version: 1.0
References: <20181217100724.4593-1-sibis@codeaurora.org> <20181217100724.4593-5-sibis@codeaurora.org>
In-Reply-To: <20181217100724.4593-5-sibis@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 17 Dec 2018 16:02:20 -0800
Message-ID: <CAD=FV=X9KmE60vdkGahRGoEahr6Gufi1Qg0Qa+v6wQtdDVFvcQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sdm845: Add Q6V5 MSS node
Content-Type: text/plain; charset="UTF-8"
To: sibis@codeaurora.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,

On Mon, Dec 17, 2018 at 2:08 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> This patch adds Q6V5 MSS remoteproc node for SDM845 SoCs.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>
> v2:
>   * Fixed style changes
>   * Added missing clocks in the dt-bindings
>   * Split mss remoteproc node into a number of patches

I know there was some off-list suggestion to split this into a number
of patches, but to actually make that useful to anyone we'd actually
need to _also_ post up patches to make the driver probe / work without
these power domains.  ...and as per other discussions it's kinda
"lucky" that it happens to work without them and Bjorn wasn't
supportive of making this optional.

So I'd actually fold patch 6 into patch 5 and focus on getting the
"aoss_qmp_pd" landed sooner rather than later.


Keeping the "shutdown-ack" as a separate patch makes sense though
since the bindings currently list that as "optional" and I guess
things work OK w/out it.


Once patch #6 is folded into patch #5 feel free to add my Reviewed-by tag.
