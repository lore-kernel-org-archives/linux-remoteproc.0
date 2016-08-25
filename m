Return-Path: <matteo.sartori@t3lab.it>
MIME-Version: 1.0
In-Reply-To: <20160810200352.GS26240@tuxbot>
References: <CAHvXT5pppxuWmZCrb9xSBWTx0kb3GcHT2YQJM6y8kHNB_QsAkg@mail.gmail.com>
 <20160810200352.GS26240@tuxbot>
From: Matteo Sartori <matteo.sartori@t3lab.it>
Date: Thu, 25 Aug 2016 12:31:16 +0200
Message-ID: <CAHvXT5oAdtNzX04EPJK6DAGXr9=zY2pqibnNLxKEkr_de=bkjw@mail.gmail.com>
Subject: Re: rpmsg: exposing the bus to userspace
Content-Type: text/plain; charset=UTF-8
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: takahiro.akashi@linaro.org, linux-remoteproc@vger.kernel.org, Alessio Paccoia <alessio.paccoia@t3lab.it>, Michele Rodolfi <michele.rodolfi@t3lab.it>, Claudio Salati <claudio.salati@t3lab.it>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,
apologies for the latency.

On 2016-08-10 22:03 GMT+02:00, Bjorn Andersson wrote:
> Going with the AF_RPMSG approach seems (at first) to map quite nicely
> with the src/dst port model. It would e.g. allow us to use recvfrom() to
> implement services for multiple clients.
>
> But the src/dst are only unique for each given virtproc, so we need to
> make up a mechanism for selecting among a set of rpmsg instances if more
> than one remote exists. Further more I believe that the AF_RPMSG concept
> would have to be integrated into the core of rpmsg and we would have two
> different concepts intermixed in the implementation; the in-kernel model
> with life cycle management and the user-space variant - and we need to
> figure out how to make these not step on each others toes.

Can you please elaborate a little more on the intermixed implementations?
For what I understand it is necessary to introduce the AF_RPSMG concept
inside the rpmsg core because e.g. after a bind() syscall on a given port
(local rpmsg address) it is important to create a new endpoint, and to register
a new callback with.
But, I don't see why there should be a user-space variant of the
AF_RPMSG concept.


> So I'm preferring a model where we can have a rpmsg-client that can be
> attached to an endpoint and expose this explicitly to userspace.

Do you refer to the possibility that a userspace process can create
and attach to a new endpoint?
>From my experience, the only method supporting this kind of userspace-
kernelspace interaction is that of sockets, where the bind() syscall semantic
can be translated into the creation of new rpmsg endpoint which subsequent
recvfrom()s can perform the desired behaviour on, that is receiving traffic
from a given port while knowing the source address of each data unit.

Do you have other userspace/kernelspace interaction models to be
considered ? Maybe, I am not aware of other possibilities.


> In the Qualcomm case mentioned above, you only have defined
> point-to-point channels, so spawning a char device for each one is
> rather natural. But the N:1 case (a generic service in the virtio rpmsg
> case) requires a recvfrom()/sendto() like interface.

I agree, the problem of using char devices is that they model only
the situation where there is a rpmsg channel underneath, that is a
communication link already installed between two ends.

In my point of view the rpmsg channel abstraction matches quite well
with char devices but there are problems with the particular mechanism
rpmsg uses to match devices with drivers.
For instance, the char driver I have tested these days spawns a
new /dev/rpmsgX every time the rpmsg bus sees a channel id matching
the one specified by the driver. If there are two rprocs that create a new
channel with the same name (eg "rpmsg-char-dev-channel") and the driver
matches such channel name, then two new char devices will be created,
/dev/rpmsg0 and /dev/rpmsg1. How do I know which char device is the
target I want to communcate with? There is no control over the minor
number assignment and it depends on the order of probe() calls the rpmsg
bus performs.

The first solution that comes to my mind is to use the information
that rpmsg and remoteproc subsystems expose to sysfs. This way
a user space program can understand the correspondence
between char devices and actual rpmsg channels and rprocs.
For this solution the code from texas is already working, given the
fact it is up to the userspace program to retrieve additional informations.

Instead, if we desire more control inside the kernel we should consider
a different creation strategy, such as a /dev/rpmsgXY scheme.
The X standing for the rproc index and the Y standing for a particular
digit representing different channels. For instance, if we have two remotes
each with a single channel in the system we could name the char devices
as /dev/rpmsg00 and /dev/rpmsg10.


To sum up, I would say the char approach is more suitable for static
configurations and is oriented to represent a rpmsg channel while the
socket approach is more dynamic, given the fact it permits generic
services to be deployed and it is a little bit detached from the rpmsg channel
concept. In my opinion, we should consider both since socket can give
more powerful communication paradigms while char devices represent a
point-to-point link and are more straightforward to use.

Best regards,
Matteo
