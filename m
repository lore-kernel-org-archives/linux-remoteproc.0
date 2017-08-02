Return-Path: <andy.gross@linaro.org>
Return-Path: <andy.gross@linaro.org>
Date: Wed, 2 Aug 2017 00:58:54 -0500
From: Andy Gross <andy.gross@linaro.org>
Subject: Re: [PATCH 2/2] soc: qcom: GLINK SSR notifier
Message-ID: <20170802055854.GC8602@hector.attlocal.net>
References: <20170725055644.20947-1-bjorn.andersson@linaro.org>
 <20170725055644.20947-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170725055644.20947-3-bjorn.andersson@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: David Brown <david.brown@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Jul 24, 2017 at 10:56:44PM -0700, Bjorn Andersson wrote:
> This driver register as a subsystem restart notifier and will send out
> notifications to remote processors that has opened the "glink_ssr" GLINK
> channel.
> 
> This mechanism is used to signal any GLINK participants that a 3rd party
> is gone and that the communication state has to be reset; i.e. that read
> and write pointers of the GLINK FIFOs are stale.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Looks pretty straightforward.

Acked-by: Andy Gross <andy.gross@linaro.org>
