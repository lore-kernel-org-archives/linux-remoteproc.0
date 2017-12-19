Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 19 Dec 2017 09:52:18 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/6] rpmsg: glink: Store edge name for glink device
Message-ID: <20171219175218.GC12655@minitux>
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
 <1513634534-22861-3-git-send-email-clew@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513634534-22861-3-git-send-email-clew@codeaurora.org>
To: Chris Lew <clew@codeaurora.org>
Cc: robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 18 Dec 14:02 PST 2017, Chris Lew wrote:

> Channels may need to identify the edge their channel was probed for.
> Store the edge name by reading the label property from device tree or
> default to the node name.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>

Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
