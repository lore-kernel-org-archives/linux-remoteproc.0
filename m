Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 16 Nov 2017 21:58:32 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 4/5] remoteproc: qcom: Introduce sysmon
Message-ID: <20171117055832.GR28761@minitux>
References: <20171115201012.25892-1-bjorn.andersson@linaro.org>
 <20171115201012.25892-5-bjorn.andersson@linaro.org>
 <0ab5497e-94b4-6450-d680-14f002188714@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ab5497e-94b4-6450-d680-14f002188714@codeaurora.org>
To: Chris Lew <clew@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-remoteproc@vger.kernel.org, runminw@codeaurora.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 16 Nov 12:05 PST 2017, Chris Lew wrote:
> > +	req.event = SSCTL_SSR_EVENT_BEFORE_SHUTDOWN;
> 
> Are there plans to add the other SSR events to sysmon notifiers? I think the
> SSCTL service expects to receive events about remote procs starting as well.
> 

We could easily add support here to send out the AFTER_BOOTUP
notification, beyond that we would need to extend the subdev notifiers
as well.

But the downstream code paths does confuse me, can you confirm that
these messages are actually sent to the remote ssctl services?

Regards,
Bjorn
