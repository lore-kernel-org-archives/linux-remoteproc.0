Return-Path: <tony@atomide.com>
Date: Fri, 6 Jan 2017 08:38:39 -0800
From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v3] soc: ti: wkup_m3_ipc: Drop wait from
 wkup_m3_rproc_boot_thread
Message-ID: <20170106163839.GF2630@atomide.com>
References: <1483653615-24378-1-git-send-email-spjoshi@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1483653615-24378-1-git-send-email-spjoshi@codeaurora.org>
To: Sarangdhar Joshi <spjoshi@codeaurora.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Santosh Shilimkar <ssantosh@kernel.org>, Trilok Soni <tsoni@codeaurora.org>, linux-arm-msm@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

* Sarangdhar Joshi <spjoshi@codeaurora.org> [170105 14:01]:
> The function wkup_m3_rproc_boot_thread waits for asynchronous
> firmware loading to parse the resource table before calling
> rproc_boot(). However, as the resource table parsing has been
> moved to rproc_boot(), there's no need to wait for the
> asynchronous firmware loading completion.  So, drop this.

Applying into omap-for-v4.11/drivers thanks.

Tony
