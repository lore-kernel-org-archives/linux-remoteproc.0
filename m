Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 19 Oct 2016 11:51:45 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: rpmsg: socket ipc based on rpmsg
Message-ID: <20161019185145.GK7509@tuxbot>
References: <CAHXzriGGGVdgVEXTae5df3AUdAa+4zzwPV8iEfSAO4XhFR9TLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHXzriGGGVdgVEXTae5df3AUdAa+4zzwPV8iEfSAO4XhFR9TLw@mail.gmail.com>
To: Michele Rodolfi <michele.rodolfi@t3lab.it>
Cc: Matteo Sartori <matteo.sartori@t3lab.it>, Claudio Salati <claudio.salati@t3lab.it>, linux-remoteproc@vger.kernel.org, Alessio Paccoia <alessio.paccoia@t3lab.it>, marek.novak@nxp.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 10 Oct 03:30 PDT 2016, Michele Rodolfi wrote:

> Hi Bjorn, hi all

Hi Michele

> I just want to clarify that the patch I sent, which implements a
> socket interface, was not meant to export the bus interface to the
> user level, but rather adds a new transport protocol level allowing
> user threads residing in different cores and different OSs to
> communicate using socket as in a classic network scenario.

Thanks for clarifying. This is what your patch implemented, I just
assumed it was related to the ongoing discussions on how to expose
channels to user space, sorry about that.

> This transport protocol, we can call it RPMSG_DGRAM_PROTO, uses rpmsg
> as data-link layer and uses its own mux/demux system based on port
> numbers as in UDP. These port numbers are not the rpmsg endpoints.
> RPMSG_DGRAM_PROTO indeed relies on one single rpmsg endpoint and the
> user threads don't need to know it.

Ok

> The driver initiates the socket interface upon the creation of a rpmsg
> channel named "rpmsg-proto" (this is how the code works now, but maybe
> "rpmsg-dgram-proto" is a better choice), therefore the protocol is
> bound to the local endpoint of that channel.

Initiating this on basis of a specific rpmsg channel coming and going is
good. It's important to handle the case with multiple remoteprocs
exposing the same interface - which I believe you handled in your patch.

> Basically I want to enable threads to perform IPC using socket over
> rpmsg in a Network On Chip scenario.

Can you elaborate on the benefits in introducing this mechanism in your
case?

> Of course I needed to figure out how to statically address the remote
> processors and I did it using aliases in the device tree.

As far as I understand, the aliases approach is not going to be accepted
by the DeviceTree maintainers.

> I think there may be use cases that can exploit this approach.
> What do you think?
> 

You have such a mechanism implemented in the Qualcomm platform
(net/qrtr), where packets are routed to ports on the various
co-processors in the system. The underlaying mechanism there is a
point-to-point non-muxing channel, so an additional layer is needed to
reduce the resource usage from using native channels directly.

Regards,
Bjorn
