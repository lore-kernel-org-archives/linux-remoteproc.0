Return-Path: <vkoul@kernel.org>
Date: Sat, 6 Oct 2018 21:58:18 +0530
From: Vinod <vkoul@kernel.org>
Subject: Re: [PATCH] samples/rpmsg: Introduce a module parameter for message
 count
Message-ID: <20181006162818.GQ2372@vkoul-mobl>
References: <20180911174643.26199-1-s-anna@ti.com>
 <20181006062231.GF12063@builder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181006062231.GF12063@builder>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Suman Anna <s-anna@ti.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 05-10-18, 23:22, Bjorn Andersson wrote:
> On Tue 11 Sep 10:46 PDT 2018, Suman Anna wrote:
> 
> > The current rpmsg_client_sample uses a fixed number of messages to
> > be sent to each instance. This is currently set at 100. Introduce
> > an optional module parameter 'count' so that the number of messages
> > to be exchanged can be made flexible.
> > 
> 
> Rather than sending N messages as fast as possible to any sample channel
> that comes up, how about making the sample create a debugfs entry that
> we can write messages to from user space?

Wouldn't it be better to make it sysfs rather than debugfs knob?

-- 
~Vinod
