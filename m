Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 1 Sep 2016 12:01:45 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: Remoteproc Virtio-Net Support
Message-ID: <20160901190145.GU15161@tuxbot>
References: <CAB4L-ggBETvyPShvBWsAW91TNAEHyzsDO2xcrgcCuo5nPRfCmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB4L-ggBETvyPShvBWsAW91TNAEHyzsDO2xcrgcCuo5nPRfCmw@mail.gmail.com>
To: Andreas Werner <hs@andy89.org>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Thu 01 Sep 09:16 PDT 2016, Andreas Werner wrote:

> Hello Guys,
> We want develop a Time Sensitive Networking (TSN) Application on imx6sx.
> Base Idea: The Cortex - M4 do all TSN Network Comunikation and provide
> multiply virtual TSN Endpoint for the different Time Channels to Linux
> Kernel over VirtIO.

That sounds cool, I like the idea of exposing this using virtio.

> I seen the current Mainline Version of Remoteproc dose support only
> one Vdev and 2 Vrings.

I've looked at that restriction a few times and I believe this is an
artificial limit, but I do not have the history behind it.

> We need multiply VirtIO Net devices with multiply vrings. Is there
> some patches for Remoteproc to support the VirtioNet Dev with multiply
> vdevs and vrings?

I have not seen any such patches, nor heard of people trying to use
remoteproc like you suggest; but I like it!


Please do write up a patch making the vring array of rproc_vdev
dynamically sized (1) and drop the restriction check and we will review
that.

(1) Preferably using a zero-length array at the end of the rproc_vdev
struct.

Regards,
Bjorn
