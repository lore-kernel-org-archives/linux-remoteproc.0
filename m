Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 22 Jan 2020 12:08:13 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 2/4] remoteproc: qcom: q6v5-mss: Improve readability
 across clk handling
In-Reply-To: <CAE=gft4Erwjgvj18DuiJaTEUz=1DwzSBtiCTU0QuoGO1+kzsNg@mail.gmail.com>
References: <20200117135130.3605-1-sibis@codeaurora.org>
 <20200117135130.3605-3-sibis@codeaurora.org>
 <CAE=gft4Erwjgvj18DuiJaTEUz=1DwzSBtiCTU0QuoGO1+kzsNg@mail.gmail.com>
Message-ID: <4663ec41c6e8dec0a2504aa1ddcf838d@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Evan Green <evgreen@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Ohad Ben Cohen <ohad@wizery.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-remoteproc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>, linux-remoteproc-owner@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hey Evan,

Thanks for the review!

On 2020-01-22 00:52, Evan Green wrote:
> On Fri, Jan 17, 2020 at 5:51 AM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> Define CLKEN and CLKOFF for improving readability of Q6SS clock
>> handling.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> 
> It took me awhile to wrap my head around how this new define,
> Q6SS_CBCR_TIMEOUT_US, sometimes replaces HALT_CHECK_MAX_LOOPS and
> sometimes replaces SLEEP_CHECK_MAX_LOOPS. I guess they're conceptually
> different but set to the same value for now? And you've fixed up a
> place where the wrong one was used? If you thought the distinction was
> meaningless I'd also be fine merging these two defines into one.

They really aren't that different
both are Clks with the same timeout
the previous naming was just plain
bad.

SLEEP_CHECK_MAX_LOOPS was used
probably because it was referring
to QDSP6SS_SLEEP CBCRs timeout.
HALT_CHECK_MAX_LOOOPS seems to
taken directly from CAF code. So
we should be fine with merging
the two defines into one.

> Either way, assuming the above is intentional, this looks ok to me.
> Thanks for renaming that define.
> 
> Reviewed-by: Evan Green <evgreen@chromium.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
