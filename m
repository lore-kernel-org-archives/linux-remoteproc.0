Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 25 Jun 2017 14:28:56 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] rpmsg: Release rpmsg devices in backends
Message-ID: <20170625212856.GE26155@builder>
References: <4955fa27-2daf-b80f-c37f-35489c63b599@ginzinger.com>
 <e6bdf431-8950-8543-cec0-bbf9c9a270c2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6bdf431-8950-8543-cec0-bbf9c9a270c2@ti.com>
To: Suman Anna <s-anna@ti.com>
Cc: Henri Roosen <henri.roosen@ginzinger.com>, ohad@wizery.com, linux-remoteproc@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 02 Jun 17:28 PDT 2017, Suman Anna wrote:

> Hi Bjorn,
> 
> On 06/02/2017 05:07 AM, Henri Roosen wrote:
> > My suggestion would be to additionally change/fix
> > rpmsg_register_device() so it will not overwrite the release callback.
[..]
> FWIW, I didn't run into any rpmsg device memory leaks even without this
> patch with booting and shutting down of remoteproc devices. The
> virtio_rpmsg_channel structure inherits the struct rpmsg_device and is
> the one that gets allocated, and the release function plugged in
> rpmsg_release_device is operating on the rpmsg_device pointer, but both
> are actually the same pointer.
> 
> Did you run into any memory leaks that required you to have this patch?
> 

I did not see any memory leaks, because it happens that the pointers are
the same in all current cases.

But the code is wrong and should be fixed, thanks for pointing this out
Henri!

Regards,
Bjorn
