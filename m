Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 5 Apr 2018 22:54:40 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: fix null pointer dereference on glink only
 platforms
Message-ID: <20180406055440.GB17344@builder>
References: <20180403181515.12322-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180403181515.12322-1-sibis@codeaurora.org>
To: Sibi Sankar <sibis@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 03 Apr 11:15 PDT 2018, Sibi Sankar wrote:

> Currently calling list_del on smd subdev remove path results in
> null pointer dereference on glink only platforms. Fix this by
> adding safety checks in glink/smd subdev remove paths.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Thanks Sibi.

Regards,
Bjorn
