Return-Path: <michele.rodolfi@t3lab.it>
MIME-Version: 1.0
From: Michele Rodolfi <michele.rodolfi@t3lab.it>
Date: Mon, 10 Oct 2016 12:30:24 +0200
Message-ID: <CAHXzriGGGVdgVEXTae5df3AUdAa+4zzwPV8iEfSAO4XhFR9TLw@mail.gmail.com>
Subject: rpmsg: socket ipc based on rpmsg
Content-Type: text/plain; charset=UTF-8
To: bjorn.andersson@linaro.org, Matteo Sartori <matteo.sartori@t3lab.it>, Claudio Salati <claudio.salati@t3lab.it>, linux-remoteproc@vger.kernel.org, Alessio Paccoia <alessio.paccoia@t3lab.it>, marek.novak@nxp.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn, hi all
I just want to clarify that the patch I sent, which implements a
socket interface, was not meant to export the bus interface to the
user level, but rather adds a new transport protocol level allowing
user threads residing in different cores and different OSs to
communicate using socket as in a classic network scenario.
This transport protocol, we can call it RPMSG_DGRAM_PROTO, uses rpmsg
as data-link layer and uses its own mux/demux system based on port
numbers as in UDP. These port numbers are not the rpmsg endpoints.
RPMSG_DGRAM_PROTO indeed relies on one single rpmsg endpoint and the
user threads don't need to know it.
The driver initiates the socket interface upon the creation of a rpmsg
channel named "rpmsg-proto" (this is how the code works now, but maybe
"rpmsg-dgram-proto" is a better choice), therefore the protocol is
bound to the local endpoint of that channel.
Basically I want to enable threads to perform IPC using socket over
rpmsg in a Network On Chip scenario.
Of course I needed to figure out how to statically address the remote
processors and I did it using aliases in the device tree.
I think there may be use cases that can exploit this approach.
What do you think?

Regards,
Michele
