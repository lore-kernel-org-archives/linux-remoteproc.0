Return-Path: <michele.rodolfi@t3lab.it>
MIME-Version: 1.0
In-Reply-To: <20161019185145.GK7509@tuxbot>
References: <CAHXzriGGGVdgVEXTae5df3AUdAa+4zzwPV8iEfSAO4XhFR9TLw@mail.gmail.com>
 <20161019185145.GK7509@tuxbot>
From: Michele Rodolfi <michele.rodolfi@t3lab.it>
Date: Thu, 24 Nov 2016 12:48:23 +0100
Message-ID: <CAHXzriHCbjVLBuoVKnm96vaJDzCjmoPoLvvGcvf2pw4dUqU4gA@mail.gmail.com>
Subject: Re: rpmsg: socket ipc based on rpmsg
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Matteo Sartori <matteo.sartori@t3lab.it>, Claudio Salati <claudio.salati@t3lab.it>, linux-remoteproc@vger.kernel.org, Alessio Paccoia <alessio.paccoia@t3lab.it>, marek.novak@nxp.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,
I'm sorry for the late reply, but I have been focused on different
tasks for a while.

2016-10-19 20:51 GMT+02:00 Bjorn Andersson <bjorn.andersson@linaro.org>:
> On Mon 10 Oct 03:30 PDT 2016, Michele Rodolfi wrote:
>
>> Hi Bjorn, hi all
>
> Hi Michele
>
>> I just want to clarify that the patch I sent, which implements a
>> socket interface, was not meant to export the bus interface to the
>> user level, but rather adds a new transport protocol level allowing
>> user threads residing in different cores and different OSs to
>> communicate using socket as in a classic network scenario.
>
> Thanks for clarifying. This is what your patch implemented, I just
> assumed it was related to the ongoing discussions on how to expose
> channels to user space, sorry about that.
>
>> This transport protocol, we can call it RPMSG_DGRAM_PROTO, uses rpmsg
>> as data-link layer and uses its own mux/demux system based on port
>> numbers as in UDP. These port numbers are not the rpmsg endpoints.
>> RPMSG_DGRAM_PROTO indeed relies on one single rpmsg endpoint and the
>> user threads don't need to know it.
>
> Ok
>
>> The driver initiates the socket interface upon the creation of a rpmsg
>> channel named "rpmsg-proto" (this is how the code works now, but maybe
>> "rpmsg-dgram-proto" is a better choice), therefore the protocol is
>> bound to the local endpoint of that channel.
>
> Initiating this on basis of a specific rpmsg channel coming and going is
> good. It's important to handle the case with multiple remoteprocs
> exposing the same interface - which I believe you handled in your patch.
>
>> Basically I want to enable threads to perform IPC using socket over
>> rpmsg in a Network On Chip scenario.
>
> Can you elaborate on the benefits in introducing this mechanism in your
> case?

The reason we want to have an IPC with a socket API between the Linux
processor and the remotes are the following:

1. There may be multiple, mutually independent dialogues between the
SW on Linux and the SW on each of the remotes (e.g. functional,
diagnostic, image transfer).

2. We do not want to have any a priori constraint on the dialogues
that can be established between the SW on Linux and the SW on a
remote.

3. We want the user space to be able to create its own communication endpoi=
nts.

4. We want to support multiple communication styles between the SW on
Linux and the SW on the remotes (in particular SOCK_DGRAM and
SOCK_SEQPACKET semantics). Different communications should not
interfere with each other.

5. We want to use the socket API because this API is the most widely
used, both on Linux and on RTOSs (where it is generally available).

Why don=E2=80=99t we lay the socket API directly on the rpmsg bus as TI doe=
s?

1. Because rpmsg channels are defined in kernel space and at bus
initialization time, while we want communication endpoints to be under
control of the user space (which can create them when it wants and use
them according to the disciplines it wants).

2. Because there is no flow control on individual channels (in fact TI
does not actually implement SOCK_SEQPACKET).

3. Because blocking a vring if there is no space where we can buffer a
message received on a channel would cause a disastrous interaction
between channels.

4. Because without a channel based flow control we cannot implement
the SOCK_SEQPACKET semantic. Therefore, we need a transport protocol
to support it, where flow control is related to user level
communication streams.

Example use case: an M4 acquires images from an image sensor and
passes them on, perhaps after some pre-processing, to Linux user
space. Linux user space entrusts image processing to DSPs
Multiple communication flows are involved:

1. A reliable communication flow for the configuration and the
monitoring of the functional behavior of the M4 (sensor parameters,
image buffers, performance counters).

2. A best effort communication flow from M4 to Linux, where images are
passed by reference to the Linux user space. Individual images may be
lost as long as an acceptable throughput is supported. The result of
additional computations performed by the M4 may be part of the message
conveying the address in shared memory of the image buffer.

3. A best effort communication flow between M4 and Linux for
diagnostics and housekeeping of the computational platform.

4. A reliable communication flow allows the Linux user space to
delegate to DSPs image processing activities on images which the
system has already taken charge of.

5. A best effort communication flow between DSPs and Linux for
diagnostics and housekeeping of the computational platform.


>
>> Of course I needed to figure out how to statically address the remote
>> processors and I did it using aliases in the device tree.
>
> As far as I understand, the aliases approach is not going to be accepted
> by the DeviceTree maintainers.

Ok, is there any standard/accepted approach that I missed?

>
>> I think there may be use cases that can exploit this approach.
>> What do you think?
>>
>
> You have such a mechanism implemented in the Qualcomm platform
> (net/qrtr), where packets are routed to ports on the various
> co-processors in the system. The underlaying mechanism there is a
> point-to-point non-muxing channel, so an additional layer is needed to
> reduce the resource usage from using native channels directly.

As far as I can understand, the qualcomm IPC router net module relies
on qualcomm shared memory communication. We want to use rpmsg since
it's not binded to a specific architecture and it's supported by
OpenAMP.

>
> Regards,
> Bjorn

Thank you,
Michele
