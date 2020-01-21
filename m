Return-Path: <evgreen@chromium.org>
Return-Path: <evgreen@chromium.org>
MIME-Version: 1.0
References: <20200117135130.3605-1-sibis@codeaurora.org> <20200117135130.3605-3-sibis@codeaurora.org>
In-Reply-To: <20200117135130.3605-3-sibis@codeaurora.org>
From: Evan Green <evgreen@chromium.org>
Date: Tue, 21 Jan 2020 11:22:30 -0800
Message-ID: <CAE=gft4Erwjgvj18DuiJaTEUz=1DwzSBtiCTU0QuoGO1+kzsNg@mail.gmail.com>
Subject: Re: [PATCH 2/4] remoteproc: qcom: q6v5-mss: Improve readability
 across clk handling
Content-Type: text/plain; charset="UTF-8"
To: Sibi Sankar <sibis@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Ohad Ben Cohen <ohad@wizery.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-remoteproc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Jan 17, 2020 at 5:51 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Define CLKEN and CLKOFF for improving readability of Q6SS clock
> handling.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

It took me awhile to wrap my head around how this new define,
Q6SS_CBCR_TIMEOUT_US, sometimes replaces HALT_CHECK_MAX_LOOPS and
sometimes replaces SLEEP_CHECK_MAX_LOOPS. I guess they're conceptually
different but set to the same value for now? And you've fixed up a
place where the wrong one was used? If you thought the distinction was
meaningless I'd also be fine merging these two defines into one.
Either way, assuming the above is intentional, this looks ok to me.
Thanks for renaming that define.

Reviewed-by: Evan Green <evgreen@chromium.org>
