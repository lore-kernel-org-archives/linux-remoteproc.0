Return-Path: <agross@kernel.org>
Date: Mon, 1 Jul 2019 14:38:42 -0500
From: Andy Gross <agross@kernel.org>
Subject: Re: [PATCH 1/2] soc: qcom: mdt_loader: Support loading non-split
 images
Message-ID: <20190701193842.GA21238@hector.attlocal.net>
References: <20190622012146.19719-1-bjorn.andersson@linaro.org>
 <20190622012146.19719-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190622012146.19719-2-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, Jun 21, 2019 at 06:21:45PM -0700, Bjorn Andersson wrote:
> In some software releases the firmware images are not split up with each
> loadable segment in it's own file. Check the size of the loaded firmware
> to see if it still contains each segment to be loaded, before falling
> back to the split-out segments.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

This looks fine to me.

Acked-by: Andy Gross <agross@kernel.org>
