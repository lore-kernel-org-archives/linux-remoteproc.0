Return-Path: <sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 18 Dec 2018 12:05:08 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: sdm845: Add Q6V5 MSS node
In-Reply-To: <CAD=FV=X9KmE60vdkGahRGoEahr6Gufi1Qg0Qa+v6wQtdDVFvcQ@mail.gmail.com>
References: <20181217100724.4593-1-sibis@codeaurora.org>
 <20181217100724.4593-5-sibis@codeaurora.org>
 <CAD=FV=X9KmE60vdkGahRGoEahr6Gufi1Qg0Qa+v6wQtdDVFvcQ@mail.gmail.com>
Message-ID: <2530f7f6019ba1ec950b4b27acba6993@codeaurora.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, tsoni@codeaurora.org, clew@codeaurora.org, akdwived@codeaurora.org, Mark Rutland <mark.rutland@arm.com>, linux-remoteproc@vger.kernel.org, Evan Green <evgreen@chromium.org>, Brian Norris <briannorris@chromium.org>, linux-soc-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Doug,
Thanks for the review :)

On 2018-12-18 05:32, Doug Anderson wrote:
> Hi,
> 
> On Mon, Dec 17, 2018 at 2:08 AM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> This patch adds Q6V5 MSS remoteproc node for SDM845 SoCs.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>> 
>> v2:
>>   * Fixed style changes
>>   * Added missing clocks in the dt-bindings
>>   * Split mss remoteproc node into a number of patches
> 
> I know there was some off-list suggestion to split this into a number
> of patches, but to actually make that useful to anyone we'd actually
> need to _also_ post up patches to make the driver probe / work without
> these power domains.  ...and as per other discussions it's kinda
> "lucky" that it happens to work without them and Bjorn wasn't
> supportive of making this optional.
> 
> So I'd actually fold patch 6 into patch 5 and focus on getting the
> "aoss_qmp_pd" landed sooner rather than later.
> 

I'll fold them in v3

> 
> Keeping the "shutdown-ack" as a separate patch makes sense though
> since the bindings currently list that as "optional" and I guess
> things work OK w/out it.
> 
> 
> Once patch #6 is folded into patch #5 feel free to add my Reviewed-by 
> tag.

okay

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
