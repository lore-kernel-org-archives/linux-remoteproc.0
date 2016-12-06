Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 6 Dec 2016 09:40:25 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus: fix channel creation
Message-ID: <20161206174025.GE30492@tuxbot>
References: <1480096493-7142-1-git-send-email-loic.pallardy@st.com>
 <20161202231944.GF9322@tuxbot>
 <2d614108-75ff-f6e8-8776-c6b2f6bbc629@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d614108-75ff-f6e8-8776-c6b2f6bbc629@st.com>
To: loic pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, kernel@stlinux.com
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 05 Dec 00:32 PST 2016, loic pallardy wrote:

> 
> 
> On 12/03/2016 12:19 AM, Bjorn Andersson wrote:
> >On Fri 25 Nov 09:54 PST 2016, Loic Pallardy wrote:
> >
> >>Since virtio backend creation, it is no more possible for a firmware to
> >>register twice a service (on different endpoints). rpmsg_register_device
> >>function is failing when calling device_add for the second time as second
> >>device has the same name as first one already register.
> >>It is because name is based only on service name.
> >>
> >
> >Afaict rpmsg_create_channel() first looks for any existing devices with
> >the same src, dst and name and if such device is found we fail early and
> >this logic is found before all those changes as well.
> >
> >>This patch adds destination endpoint to service name to create an
> >>unique device name.
> >
> >As the code didn't look to support multiple services with the same name
> >I have not considered this scenario. Can you describe your use case for
> >this?
> >
> Services are generic and could be instancied several times.
> For exemple we have some communication coprocessor (modem like) for which we
> are using 2 socket channels between coprocessor and user space stack.
> Today each rpmsg client driver is identified by a unique service name.
> "rpmsg-proto" for socket channel for example.
> User space application can open a specified socket providing endpoint number
> or request for a socket creation thanks to bind.
> 

Why do you have two rpmsg-proto instances?

> Ditto with tty, with one tty for command and one tty for debug (reuse of
> external coprocessor SW)
> 

I don't think I've seen this driver yet, will do some searching.
May I ask why you're not using the virtio serial stuff directly?

> Also I have similar issue with some I2C or SPI over rpmsg driver which allow
> host to access coprocessor peripherals (mostly in development or debug
> mode).
> 

So you have a i2c/spi bridge in the firmware and custom i2c/spi adapter
drivers sitting ontop of rpmsg? That does sound useful for debugging
purposes.

But I do wonder if such a mechanism should be on virtio level rather
than wrapped in rpmsg - as it's a analog to the other cases of hardware
access provided there.

> I think use cases are multiple and rpmsg should not limit the number of
> identical services.
> 

I can see the benefit of having multiple instances of rpmsg devices tied
to individual endpoints, I do that in the Qualcomm platform, based on DT
matching (channel names are unique there though). So I'm definitely not
against this.

I can however not see how this have ever worked, as the code since being
introduced in mainline has failed before reaching your change upon
duplicates. So I'm still puzzled to where the regression is.

And as I said, we use the "id" when creating the device to match with
drivers, so I don't see how probing would work with it introduced.

Regards,
Bjorn
