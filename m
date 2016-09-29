Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 29 Sep 2016 10:35:25 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: rpmsg: exposing the bus to userspace
Message-ID: <20160929173525.GE7509@tuxbot>
References: <CAHvXT5pppxuWmZCrb9xSBWTx0kb3GcHT2YQJM6y8kHNB_QsAkg@mail.gmail.com>
 <20160810200352.GS26240@tuxbot>
 <CAHvXT5oAdtNzX04EPJK6DAGXr9=zY2pqibnNLxKEkr_de=bkjw@mail.gmail.com>
 <20160921040853.GA7509@tuxbot>
 <VI1PR0401MB24160EC781800AFDB78A9DDEF0F60@VI1PR0401MB2416.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR0401MB24160EC781800AFDB78A9DDEF0F60@VI1PR0401MB2416.eurprd04.prod.outlook.com>
To: Marek Novak <marek.novak@nxp.com>
Cc: Matteo Sartori <matteo.sartori@t3lab.it>, "takahiro.akashi@linaro.org" <takahiro.akashi@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Alessio Paccoia <alessio.paccoia@t3lab.it>, Michele Rodolfi <michele.rodolfi@t3lab.it>, Claudio Salati <claudio.salati@t3lab.it>, Michal Princ <michal.princ@nxp.com>, Petr Lukas <petr.lukas@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 20 Sep 21:43 PDT 2016, Marek Novak wrote:

> Hello Bjorn and the community,
> 

Hi Marek

> Bjorn mentioned a sysfs-based exporting mechanism.
> I have written a kernel module, which allows exporting RPMsg endpoints
> to the user space.  If you want, please look at the code here:
> https://github.com/EmbeddedRPC/erpc-imx-demos/blob/master/MPU/setup_yocto/rpmsg_sysfs_interface.patch
> 

This is in line with my ideas, allowing user space to open arbitrary
channels.

I think we can afford replacing the originating rpmsg device with a
special rpmsg_device created straight from the individual backends - so
that we don't have to rely on a specific channel to be exposed to
"enable" this feature.

> I am preparing an example/demonstration repository on Github showing its use-case here:
> https://github.com/EmbeddedRPC/erpc-imx-demos
> 

Thanks,
Bjorn

> 
> Regards,
> Marek NOVAK
> NXP Semiconductors
> Brno University of Technology
> 
> -----Original Message-----
> From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-owner@vger.kernel.org] On Behalf Of Bjorn Andersson
> Sent: Wednesday, September 21, 2016 6:09 AM
> To: Matteo Sartori <matteo.sartori@t3lab.it>
> Cc: takahiro.akashi@linaro.org; linux-remoteproc@vger.kernel.org; Alessio Paccoia <alessio.paccoia@t3lab.it>; Michele Rodolfi <michele.rodolfi@t3lab.it>; Claudio Salati <claudio.salati@t3lab.it>
> Subject: Re: rpmsg: exposing the bus to userspace
> 
> On Thu 25 Aug 03:31 PDT 2016, Matteo Sartori wrote:
> 
> > Hi Bjorn,
> > apologies for the latency.
> > 
> 
> Dito.
> 
> > On 2016-08-10 22:03 GMT+02:00, Bjorn Andersson wrote:
> > > Going with the AF_RPMSG approach seems (at first) to map quite 
> > > nicely with the src/dst port model. It would e.g. allow us to use 
> > > recvfrom() to implement services for multiple clients.
> > >
> > > But the src/dst are only unique for each given virtproc, so we need 
> > > to make up a mechanism for selecting among a set of rpmsg instances 
> > > if more than one remote exists. Further more I believe that the 
> > > AF_RPMSG concept would have to be integrated into the core of rpmsg 
> > > and we would have two different concepts intermixed in the 
> > > implementation; the in-kernel model with life cycle management and 
> > > the user-space variant - and we need to figure out how to make these not step on each others toes.
> > 
> > Can you please elaborate a little more on the intermixed implementations?
> 
> After studying rpmsg_proto in detail I take this comment back. After my first read-through I interpreted the code as you expose the entire address space to via the socket interface.
> 
> After reading the implementation more thoroughly I now see that the rpmsg_proto implementation only exposes specific channels (i.e. the ones named "rpmsg-proto") to userspace.
> 
> > For what I understand it is necessary to introduce the AF_RPSMG 
> > concept inside the rpmsg core because e.g. after a bind() syscall on a 
> > given port (local rpmsg address) it is important to create a new 
> > endpoint, and to register a new callback with.
> 
> This can be done with rpmsg_create_ept()
> 
> > But, I don't see why there should be a user-space variant of the 
> > AF_RPMSG concept.
> > 
> > 
> > > So I'm preferring a model where we can have a rpmsg-client that can 
> > > be attached to an endpoint and expose this explicitly to userspace.
> > 
> > Do you refer to the possibility that a userspace process can create 
> > and attach to a new endpoint?
> 
> Yes
> 
> On the Qualcomm platforms we have a varying number of channels per remoteproc that we would like to be able to access from user space.
> 
> The alternative to allowing user space to request channels to be exported would be to list them in devicetree - but this is not a property of the hardware.
> 
> > From my experience, the only method supporting this kind of userspace- 
> > kernelspace interaction is that of sockets, where the bind() syscall 
> > semantic can be translated into the creation of new rpmsg endpoint 
> > which subsequent recvfrom()s can perform the desired behaviour on, 
> > that is receiving traffic from a given port while knowing the source address of each data unit.
> > 
> > Do you have other userspace/kernelspace interaction models to be 
> > considered ? Maybe, I am not aware of other possibilities.
> > 
> 
> There are two that comes to mind, either using a character device per rpmsg instance that provides an ioctl interface for exporting/unexporting endpoints or through some sysfs interface.
> 
> Per the design of rpmsg_proto we want to be able to specify both src and dst address, and from Qualcomm SMD we want to be able to control this with channel names. So I think the ioctl based approach would be easier.
> 
> > 
> > > In the Qualcomm case mentioned above, you only have defined 
> > > point-to-point channels, so spawning a char device for each one is 
> > > rather natural. But the N:1 case (a generic service in the virtio 
> > > rpmsg
> > > case) requires a recvfrom()/sendto() like interface.
> > 
> > I agree, the problem of using char devices is that they model only the 
> > situation where there is a rpmsg channel underneath, that is a 
> > communication link already installed between two ends.
> > 
> 
> So does rpmsg_proto, it only exposes communication channels after the rpmsg core has probed upon finding a "rpmsg-proto" channel.
> 
> > In my point of view the rpmsg channel abstraction matches quite well 
> > with char devices but there are problems with the particular mechanism 
> > rpmsg uses to match devices with drivers.
> > For instance, the char driver I have tested these days spawns a new 
> > /dev/rpmsgX every time the rpmsg bus sees a channel id matching the 
> > one specified by the driver. If there are two rprocs that create a new 
> > channel with the same name (eg "rpmsg-char-dev-channel") and the 
> > driver matches such channel name, then two new char devices will be 
> > created,
> > /dev/rpmsg0 and /dev/rpmsg1. How do I know which char device is the 
> > target I want to communcate with? There is no control over the minor 
> > number assignment and it depends on the order of probe() calls the 
> > rpmsg bus performs.
> > 
> 
> We can use udev rules to rename the rpmsg devices based on the channel names, but currently we don't have a convenient name for the parent - so we probably need to look into that some more.
> 
> So I think this is okay, from the kernels pov.
> 
> > The first solution that comes to my mind is to use the information 
> > that rpmsg and remoteproc subsystems expose to sysfs. This way a user 
> > space program can understand the correspondence between char devices 
> > and actual rpmsg channels and rprocs.
> > For this solution the code from texas is already working, given the 
> > fact it is up to the userspace program to retrieve additional informations.
> > 
> 
> I think this is a good way forward, perhaps we need to provide additional attributes so that it's possible to build a user friendly dev name.
> 
> > Instead, if we desire more control inside the kernel we should 
> > consider a different creation strategy, such as a /dev/rpmsgXY scheme.
> > The X standing for the rproc index and the Y standing for a particular 
> > digit representing different channels. For instance, if we have two 
> > remotes each with a single channel in the system we could name the 
> > char devices as /dev/rpmsg00 and /dev/rpmsg10.
> > 
> 
> I would prefer that we find a solution to exposing the parent name in a way that it's possible to write a udev rule to get /dev/rpmsg/<parent-label>/<channel-name>
> 
> Perhaps if we just add support for an optional "label" property for controlling the remoteproc's dev->name we would have what we need there
> - and solve the annoyance of the probe order dependant naming of the remoteprocs.
> 
> > 
> > To sum up, I would say the char approach is more suitable for static 
> > configurations and is oriented to represent a rpmsg channel while the 
> > socket approach is more dynamic, given the fact it permits generic 
> > services to be deployed and it is a little bit detached from the rpmsg 
> > channel concept.
> 
> I was expecting to find a socket based implementation that allows for unbound services to be implemented in userspace, but was happy to see that neither of the TI solutions I looked at supported this today.
> 
> Further more, the Qualcomm SMD implementation doesn't support offchannel communication, so this simplification suits that as well.
> 
> 
> Not supporting this simplifies the problem and we should be able to implement this without tangling it into the rpmsg implementation too much.
> 
> > In my opinion, we should consider both since socket can give more 
> > powerful communication paradigms while char devices represent a 
> > point-to-point link and are more straightforward to use.
> > 
> 
> I agree with the view that sockets would give a more powerful model, but unless we _really_ need that I would prefer if we don't go there.
> Most use-cases I've seen does not require support for implementing unbound services and the ability to do so in-kernel is still there.
> 
> 
> 
> So my suggestion is that we upon probing a rpmsg device create a rpmsg_ctrl%d character device, which has an ioctl interface for exporting and unexporting endpoints. We can be a little bit optimistic and have the export create a rpmsg%d device, with the associated rpmsg_channel_info.
> 
> Then upon getting the open() callback we issue rpmsg_create_ept() and
> release() calls rpmsg_destroy_ept().
> 
> For rpmsg backends that support advertising channel state this would mean that once the char dev is open we have an open rpmsg channel.
> 
> 
> To be able to use the rpmsg_create_ept() interface we need to have a rpmsg_device handle for the backend-specific rpmsg instance, so I think the first step needs to be initiated by each rpmsg backend by creating a "dummy" rpmsg_device and triggering the registration above.
> 
> Regards,
> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in the body of a message to majordomo@vger.kernel.org More majordomo info at  http://vger.kernel.org/majordomo-info.html
