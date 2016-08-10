Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 10 Aug 2016 13:03:52 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: rpmsg: exposing the bus to userspace
Message-ID: <20160810200352.GS26240@tuxbot>
References: <CAHvXT5pppxuWmZCrb9xSBWTx0kb3GcHT2YQJM6y8kHNB_QsAkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHvXT5pppxuWmZCrb9xSBWTx0kb3GcHT2YQJM6y8kHNB_QsAkg@mail.gmail.com>
To: Matteo Sartori <matteo.sartori@t3lab.it>
Cc: takahiro.akashi@linaro.org, linux-remoteproc@vger.kernel.org, Alessio Paccoia <alessio.paccoia@t3lab.it>, Michele Rodolfi <michele.rodolfi@t3lab.it>, Claudio Salati <claudio.salati@t3lab.it>
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 04 Aug 03:33 PDT 2016, Matteo Sartori wrote:

> Hi,
> 

Hi Matteo,

> I have been working on remoteproc/rpmsg and FreeRTOS/OpenAMP for the
> latest three months and recently, with my colleagues, I have started
> reasoning about the best possible way to expose the kernel rpmsg bus
> to applications running in user space. The idea is to end up with a
> clean mechanism for the user-kernel communication, like sockets or
> char devices, in order to build AMP applications on top of it.
> 

Cool, I see this coming up on several fronts.

I'm currently finishing up a patch series where I hope to bring support
for additional backends/wire formats to rpmsg (e.g. Qualcomm SMD). One
of the users of this (the Qualcomm case) is a packet interface for some
userspace parts to communicate with specialized services on the modem
processor.

> In fact, we have been running experiments with some out-of-tree
> drivers implementing exactly such interfaces, namely a driver
> registering a new address family AF_RPMSG for the socket interface,
> from Texas Instruments, and a char device driver representing
> different rpmsg channels with /dev/rpmsgX special files, found inside
> OpenAMP obsolete directory.
> 

Going with the AF_RPMSG approach seems (at first) to map quite nicely
with the src/dst port model. It would e.g. allow us to use recvfrom() to
implement services for multiple clients.

But the src/dst are only unique for each given virtproc, so we need to
make up a mechanism for selecting among a set of rpmsg instances if more
than one remote exists. Further more I believe that the AF_RPMSG concept
would have to be integrated into the core of rpmsg and we would have two
different concepts intermixed in the implementation; the in-kernel model
with life cycle management and the user-space variant - and we need to
figure out how to make these not step on each others toes.


So I'm preferring a model where we can have a rpmsg-client that can be
attached to an endpoint and expose this explicitly to userspace.


In the Qualcomm case mentioned above, you only have defined
point-to-point channels, so spawning a char device for each one is
rather natural. But the N:1 case (a generic service in the virtio rpmsg
case) requires a recvfrom()/sendto() like interface.

So further investigation/discussions on this is needed.

> I am quite new to kernel development and in particular to remoteproc
> subsystem, so I am asking the following questions because maybe I have
> missed some past developments and discussions about this topic. I
> apologize if this is the case.
> 

There have been people looking into this, but I have not yet seen any
output heading towards the mainline kernel.

> - Have you ever considered the inclusion of these out-of-tree modules
> in the mainline?

Yes, enough times so that we will have to address this rather soon.

> - If so, have you planned some work on this, or what are the reasons
> for not including these modules?

Yes. I need to go back and review these implementations to give you a
good answer, it's not a bad idea to base the mainline solution on
existing downstream code - if it's a good fit.

> - Is there already a preferred way for exposing the rpmsg bus for
> generic services to userspace, or is the idea to have a different
> rpmsg driver, therefore a user-kernel communication strategy, for each
> different use case of the bus?
> 

The preferred way, in a lot of cases is to have a specialized kernel
driver dealing with buffer management and communication and using one of
the generic frameworks for exposing this to user space; whenever
possible.

But there are cases (even in production) where this is not feasible, so
we need to address this.

> Anyway, I would be very glad to contribute in the direction of an
> appropriate user-kernel interface for accessing the rpmsg bus, and at
> the moment I have a working test case for the socket driver as well as
> for the char driver. Given the fact I don't see the superiority of one
> approach compared to the other, I would like to propose and discuss
> with you both of them.
> 

Sounds good, thanks for waking the discussion to life again. I added
Akashi-san to the thread as well, as he's was looking at the TI patches
before.

Regards,
Bjorn
