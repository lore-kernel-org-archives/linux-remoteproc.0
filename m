Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 5 Oct 2016 13:58:03 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: rpmsg: exposing the bus to userspace
Message-ID: <20161005205803.GM7509@tuxbot>
References: <CAHvXT5pppxuWmZCrb9xSBWTx0kb3GcHT2YQJM6y8kHNB_QsAkg@mail.gmail.com>
 <20160810200352.GS26240@tuxbot>
 <CAHvXT5oAdtNzX04EPJK6DAGXr9=zY2pqibnNLxKEkr_de=bkjw@mail.gmail.com>
 <20160921040853.GA7509@tuxbot>
 <VI1PR0401MB24160EC781800AFDB78A9DDEF0F60@VI1PR0401MB2416.eurprd04.prod.outlook.com>
 <20160929173525.GE7509@tuxbot>
 <8467aa00-96ba-4a7c-b44b-218188f30867@nxp.com>
 <20160929200736.GH7509@tuxbot>
 <DB6PR0402MB2870E6581B0EFDBE84BA0A31F0C50@DB6PR0402MB2870.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB6PR0402MB2870E6581B0EFDBE84BA0A31F0C50@DB6PR0402MB2870.eurprd04.prod.outlook.com>
To: Marek Novak <marek.novak@nxp.com>
Cc: Matteo Sartori <matteo.sartori@t3lab.it>, "takahiro.akashi@linaro.org" <takahiro.akashi@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Alessio Paccoia <alessio.paccoia@t3lab.it>, Michele Rodolfi <michele.rodolfi@t3lab.it>, Claudio Salati <claudio.salati@t3lab.it>, Michal Princ <michal.princ@nxp.com>, Petr Lukas <petr.lukas@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 04 Oct 01:05 PDT 2016, Marek Novak wrote:

[..]
> On Thu 29 Sep 11:36 PDT 2016, Marek Novak wrote:
> 
> >    Hello Bjorn and the community,
> > 
> 
> Please don't top-post.
> 
> >    I also support the idea of making the export of RPMsg endpoints to the
> >    user-space part of the virtio_rpmsg_bus kernel module.
> > 
> >    As you suggest, it would allow to skip the channel concept, which is not
> >    really necessary for the communication. (RPMsg-Lite implementation is an
> >    evidence of this idea)
> > 
> 
> Correct, we need the endpoints for each pipe exposed.
> 
> The purpose of the rpmsg device is to capture the life cycle of the primary endpoint, in this case we want the control mechanism to follow the life cycle of the virtio-rpmsg device.
> 
> Regards,
> Bjorn
[..]
> Hi Bjorn,
> 
> Sorry for the top posting...
> 
> You said that the RPMsg device should follow the life cycle of the
> actual remote processor.
> I can imagine it is possible (on nowadays used like that) to detect
> the boot-up of the remote processor thanks to the name service message
> being received.
> But what if the remote core resets from some reason? The RPMsg device
> would still be there and in current implementation we cannot detect
> the remote core going down.
> To detect it, it would require some platform-specific mechanism based
> either on polling some register or something interrupt-based. The only
> generic solution is now to try to send a message and if no answer is
> received. We can assume the second core is down.  But personally, I
> don't support this solution.

The virtio RPMSG device is registered and unregistered based on the
underlaying provider, in the case of the parent being remoteproc this is
done when we boot or shut down the remoteproc.

So tapping into rpmsg_probe() and rpmsg_remove() would give you exactly
this behavior.

> 
> I was thinking again about making the sysfs exporting mechanism part
> of the virtio_rpmsg_bus kernel module.
> Aren't there any other technique than sysfs to export endpoints?

As I've looked at this some more and discussed it with others I think it
makes more sense to expose a control-device per virtio rpmsg instance
and then use a ioctl based interface for creating the per endpoint
interfaces.

> Also, if we agree, sysfs is the most standard way to achieve this,
> exporting an endpoint as a character device might not be the only
> possibility. I have noticed somebody exporting endpoints as sockets:
> https://git.ti.com/rpmsg/rpmsg/blobs/ace6f9cfeea0ac958b6b0a53059fd0a72635e695/net/rpmsg/rpmsg_proto.c

I've seen this too. The benefit of using the socket API is that it
becomes more natural to support the recvfrom() and sendto() interfaces,
to be able to implement unbound services in user space.

This does however require us to invent additional mechanisms for
deterministic addressing, as the remoteproc ids are not static and rpmsg
ports/addresses are not unique in the system.

Without this the socket API is just another choice of how to transfer
chunks of data to and from the kernel.

> 
> I can imagine for some purposes it is better to export it as character
> device with either streaming or message-based receiving policy as I
> did it in here:
> https://github.com/EmbeddedRPC/erpc-imx-demos/blob/master/MPU/setup_yocto/rpmsg_sysfs_interface.patch
> 

A clear benefit of using a character based approach is that it would
allow udev to control permissions on a per-endpoint basis, without any
additional logic.

> But somebody might prefer the socket way.

Of course, there's always going to be people who wants the bread sliced
the other way :)

> Maybe we should provide some technique to specify the way user wants
> to export it. Either as a character device with different receiving
> policies or as a socket. But this would require to take multiple
> implementations and put them somehow together. I would prefer making
> this maybe a separate kernel module, since the code of the base kernel
> module would grow considerably...

In my view the char device has some merits that makes it my preferred
solution and I think we should make sure mainline has a single
implementation - I don't want to maintain two "identical" solutions.

> 
> What do you think?
> 

I think we should go for a chardev based approach integrated with the
rpmsg framework allowing user space to create and expose endpoints.

But please do bring any practical issues with such an approach to the
table, so we make sure that we get a good solution integrated.

Regards,
Bjorn
