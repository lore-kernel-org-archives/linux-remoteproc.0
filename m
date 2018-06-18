Return-Path: <andy.gross@linaro.org>
Return-Path: <andy.gross@linaro.org>
Date: Mon, 18 Jun 2018 17:22:12 -0500
From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 1/4] remoteproc: qcom: mdt_loader: Make the firmware
 authentication optional
Message-ID: <20180618222212.GA4689@hector.attlocal.net>
References: <20180604203038.14080-1-bjorn.andersson@linaro.org>
 <20180604203038.14080-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180604203038.14080-2-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Sricharan R <sricharan@codeaurora.org>, Sibi Sankar <sibis@codeaurora.org>, Rohit kumar <rohitkr@codeaurora.org>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Jun 04, 2018 at 01:30:35PM -0700, Bjorn Andersson wrote:
> From: Sricharan R <sricharan@codeaurora.org>
> 
> qcom_mdt_load function loads the mdt type firmware and
> initialises the secure memory as well. Make the initialisation only
> when requested by the caller, so that the function can be used
> by self-authenticating remoteproc as well.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

looks fine to me

Acked-by: Andy Gross <andy.gross@linaro.org>
