Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH 4/4] remoteproc: qcom: add Venus video core firmware
 loader driver
References: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
 <1471622000-1906-5-git-send-email-stanimir.varbanov@linaro.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <06d7cfd2-571d-6f9a-f2c0-bfe66717a141@linaro.org>
Date: Tue, 18 Oct 2016 19:23:53 +0300
MIME-Version: 1.0
In-Reply-To: <1471622000-1906-5-git-send-email-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Rob Clark <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

I want to resubmit this remoteproc driver without secure page table scm
call, do you have something to note/add before that?

On 08/19/2016 06:53 PM, Stanimir Varbanov wrote:
> This driver will load and authenticate the Venus firmware and
> bringing it core out of reset. Those two functionalities are
> via secure monitor calls to trusted environment.
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/remoteproc/Kconfig          |  10 ++
>  drivers/remoteproc/Makefile         |   1 +
>  drivers/remoteproc/qcom_venus_pil.c | 226 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 237 insertions(+)
>  create mode 100644 drivers/remoteproc/qcom_venus_pil.c
> 


-- 
regards,
Stan
