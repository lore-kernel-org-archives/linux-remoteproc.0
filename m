Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 19 Dec 2017 09:52:02 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 5/6] rpmsg: Introduce rpmsg_get_rproc_name
Message-ID: <20171219175202.GB12655@minitux>
References: <1513634534-22861-1-git-send-email-clew@codeaurora.org>
 <1513634534-22861-6-git-send-email-clew@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1513634534-22861-6-git-send-email-clew@codeaurora.org>
To: Chris Lew <clew@codeaurora.org>
Cc: robh+dt@kernel.org, andy.gross@linaro.org, david.brown@linaro.org, aneela@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 18 Dec 14:02 PST 2017, Chris Lew wrote:

> Add support for client's to query the edge name their channel is
> registered for. This is useful for clients who share the same channel
> identifier across different remote procs.
> 

I presume this will result in a strcmp in some client driver?

When we're registering the rpmsg device, as part of handling of an
arriving "open request", we do look for an of_node with matching
qcom,glink-channels and if one is found we point the dev->of_node of the
new device to this node.

So I would suggest that you, in your client driver, use this to decide
which instance you're on; regardless if you're using compatible based
driver matching.

Does this work for you?

Regards,
Bjorn
