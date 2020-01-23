Return-Path: <evgreen@chromium.org>
Return-Path: <evgreen@chromium.org>
MIME-Version: 1.0
References: <20200123131236.1078-1-sibis@codeaurora.org> <20200123131236.1078-2-sibis@codeaurora.org>
In-Reply-To: <20200123131236.1078-2-sibis@codeaurora.org>
From: Evan Green <evgreen@chromium.org>
Date: Thu, 23 Jan 2020 14:53:41 -0800
Message-ID: <CAE=gft7sztBTs4mhF2X0eKnjJNBBRxXP5VOr4rsAw=SOYDi4jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] remoteproc: qcom: q6v5-mss: Use regmap_read_poll_timeout
Content-Type: text/plain; charset="UTF-8"
To: Sibi Sankar <sibis@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, Ohad Ben Cohen <ohad@wizery.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-remoteproc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Andy Gross <agross@kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu, Jan 23, 2020 at 5:13 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Replace the loop for HALT_ACK detection with regmap_read_poll_timeout.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Evan Green <evgreen@chromium.org>
