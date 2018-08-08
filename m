Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 8 Aug 2018 13:02:02 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: q6v5: Add support to vote for rpmh power
 domains
Message-ID: <20180808200202.GS30024@minitux>
References: <20180629102035.2757-1-rnayak@codeaurora.org>
 <20180806164848.GA21235@tuxbook-pro>
 <025ed13c-0b6c-4401-276e-ce2a1cccc67a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <025ed13c-0b6c-4401-276e-ce2a1cccc67a@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: viresh.kumar@linaro.org, sibis@codeaurora.org, ulf.hansson@linaro.org, linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 08 Aug 09:20 PDT 2018, Rajendra Nayak wrote:
> On 8/6/2018 10:18 PM, Bjorn Andersson wrote:
> > On Fri 29 Jun 03:20 PDT 2018, Rajendra Nayak wrote:
[..]
> > > +static int q6v5_powerdomain_enable(struct device *dev, struct device **devs,
> > > +				   int count)
> > > +{
> > > +	int i;
> > > +
> > > +	if (!count)
> > > +		return 0;
> > > +
> > > +	if (count > 1)
> > > +		for (i = 0; i < count; i++)
> > > +			dev_pm_genpd_set_performance_state(devs[i], INT_MAX);
> > > +	else
> > > +		dev_pm_genpd_set_performance_state(dev, INT_MAX);
> > 
> > I would prefer if we could just set the performance state during
> > initialization, but I see that we only aggregate the state during
> > dev_pm_genpd_set_performance_state().
> > 
> > As such you need to also reduce the votes in the disable path; or we
> > will just max out any shared corners from the first time we boot this
> > remoteproc.
> 
> Right, I need to drop the votes along with doing a runtime suspend of the
> device.
> 
> > 
> > 
> > For this to work I believe _genpd_power_o{n,ff}() would need to
> > aggregate the performance state of all enabled consumers, something that
> > would make the interface more convenient to use.
> 
> This isn't done today. There was some discussion in another thread on *if*
> we should do this and what could be the implications [1]
> 

Thanks for the pointer, so let's start by explicitly setting the
performance state during both enable and disable and then we can discuss
adding this logic to the core separately.

[..]
> > > +	pm_runtime_enable(dev);
> > 
> > Don't you need a call to something like pm_suspend_ignore_children()
> > here as well, to prevent a pm_runtime_get_sync() in a child device to
> > power on our rails at runtime?
> 
> Are there any child nodes of remoteproc which do runtime control of
> resources via runtime pm?
> 

Srinivas does that in the audio drivers.

Regards,
Bjorn
