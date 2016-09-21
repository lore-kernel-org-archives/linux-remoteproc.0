Return-Path: <marek.novak@nxp.com>
From: Marek Novak <marek.novak@nxp.com>
Subject: RE: rpmsg: exposing the bus to userspace
Date: Wed, 21 Sep 2016 04:43:11 +0000
Message-ID: <VI1PR0401MB24160EC781800AFDB78A9DDEF0F60@VI1PR0401MB2416.eurprd04.prod.outlook.com>
References: <CAHvXT5pppxuWmZCrb9xSBWTx0kb3GcHT2YQJM6y8kHNB_QsAkg@mail.gmail.com>
 <20160810200352.GS26240@tuxbot>
 <CAHvXT5oAdtNzX04EPJK6DAGXr9=zY2pqibnNLxKEkr_de=bkjw@mail.gmail.com>
 <20160921040853.GA7509@tuxbot>
In-Reply-To: <20160921040853.GA7509@tuxbot>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Matteo Sartori <matteo.sartori@t3lab.it>
Cc: "takahiro.akashi@linaro.org" <takahiro.akashi@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Alessio Paccoia <alessio.paccoia@t3lab.it>, Michele Rodolfi <michele.rodolfi@t3lab.it>, Claudio Salati <claudio.salati@t3lab.it>, Michal
List-ID: <linux-remoteproc@vger.kernel.org>

Hello Bjorn and the community,

Bjorn mentioned a sysfs-based exporting mechanism.
I have written a kernel module, which allows exporting RPMsg endpoints to t=
he user space.
If you want, please look at the code here: https://github.com/EmbeddedRPC/e=
rpc-imx-demos/blob/master/MPU/setup_yocto/rpmsg_sysfs_interface.patch

I am preparing an example/demonstration repository on Github showing its us=
e-case here:
https://github.com/EmbeddedRPC/erpc-imx-demos


Regards,
Marek NOVAK
NXP Semiconductors
Brno University of Technology

-----Original Message-----
From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-owner=
@vger.kernel.org] On Behalf Of Bjorn Andersson
Sent: Wednesday, September 21, 2016 6:09 AM
To: Matteo Sartori <matteo.sartori@t3lab.it>
Cc: takahiro.akashi@linaro.org; linux-remoteproc@vger.kernel.org; Alessio P=
accoia <alessio.paccoia@t3lab.it>; Michele Rodolfi <michele.rodolfi@t3lab.i=
t>; Claudio Salati <claudio.salati@t3lab.it>
Subject: Re: rpmsg: exposing the bus to userspace

On Thu 25 Aug 03:31 PDT 2016, Matteo Sartori wrote:

> Hi Bjorn,
> apologies for the latency.
>=20

Dito.

> On 2016-08-10 22:03 GMT+02:00, Bjorn Andersson wrote:
> > Going with the AF_RPMSG approach seems (at first) to map quite=20
> > nicely with the src/dst port model. It would e.g. allow us to use=20
> > recvfrom() to implement services for multiple clients.
> >
> > But the src/dst are only unique for each given virtproc, so we need=20
> > to make up a mechanism for selecting among a set of rpmsg instances=20
> > if more than one remote exists. Further more I believe that the=20
> > AF_RPMSG concept would have to be integrated into the core of rpmsg=20
> > and we would have two different concepts intermixed in the=20
> > implementation; the in-kernel model with life cycle management and=20
> > the user-space variant - and we need to figure out how to make these no=
t step on each others toes.
>=20
> Can you please elaborate a little more on the intermixed implementations?

After studying rpmsg_proto in detail I take this comment back. After my fir=
st read-through I interpreted the code as you expose the entire address spa=
ce to via the socket interface.

After reading the implementation more thoroughly I now see that the rpmsg_p=
roto implementation only exposes specific channels (i.e. the ones named "rp=
msg-proto") to userspace.

> For what I understand it is necessary to introduce the AF_RPSMG=20
> concept inside the rpmsg core because e.g. after a bind() syscall on a=20
> given port (local rpmsg address) it is important to create a new=20
> endpoint, and to register a new callback with.

This can be done with rpmsg_create_ept()

> But, I don't see why there should be a user-space variant of the=20
> AF_RPMSG concept.
>=20
>=20
> > So I'm preferring a model where we can have a rpmsg-client that can=20
> > be attached to an endpoint and expose this explicitly to userspace.
>=20
> Do you refer to the possibility that a userspace process can create=20
> and attach to a new endpoint?

Yes

On the Qualcomm platforms we have a varying number of channels per remotepr=
oc that we would like to be able to access from user space.

The alternative to allowing user space to request channels to be exported w=
ould be to list them in devicetree - but this is not a property of the hard=
ware.

> From my experience, the only method supporting this kind of userspace-=20
> kernelspace interaction is that of sockets, where the bind() syscall=20
> semantic can be translated into the creation of new rpmsg endpoint=20
> which subsequent recvfrom()s can perform the desired behaviour on,=20
> that is receiving traffic from a given port while knowing the source addr=
ess of each data unit.
>=20
> Do you have other userspace/kernelspace interaction models to be=20
> considered ? Maybe, I am not aware of other possibilities.
>=20

There are two that comes to mind, either using a character device per rpmsg=
 instance that provides an ioctl interface for exporting/unexporting endpoi=
nts or through some sysfs interface.

Per the design of rpmsg_proto we want to be able to specify both src and ds=
t address, and from Qualcomm SMD we want to be able to control this with ch=
annel names. So I think the ioctl based approach would be easier.

>=20
> > In the Qualcomm case mentioned above, you only have defined=20
> > point-to-point channels, so spawning a char device for each one is=20
> > rather natural. But the N:1 case (a generic service in the virtio=20
> > rpmsg
> > case) requires a recvfrom()/sendto() like interface.
>=20
> I agree, the problem of using char devices is that they model only the=20
> situation where there is a rpmsg channel underneath, that is a=20
> communication link already installed between two ends.
>=20

So does rpmsg_proto, it only exposes communication channels after the rpmsg=
 core has probed upon finding a "rpmsg-proto" channel.

> In my point of view the rpmsg channel abstraction matches quite well=20
> with char devices but there are problems with the particular mechanism=20
> rpmsg uses to match devices with drivers.
> For instance, the char driver I have tested these days spawns a new=20
> /dev/rpmsgX every time the rpmsg bus sees a channel id matching the=20
> one specified by the driver. If there are two rprocs that create a new=20
> channel with the same name (eg "rpmsg-char-dev-channel") and the=20
> driver matches such channel name, then two new char devices will be=20
> created,
> /dev/rpmsg0 and /dev/rpmsg1. How do I know which char device is the=20
> target I want to communcate with? There is no control over the minor=20
> number assignment and it depends on the order of probe() calls the=20
> rpmsg bus performs.
>=20

We can use udev rules to rename the rpmsg devices based on the channel name=
s, but currently we don't have a convenient name for the parent - so we pro=
bably need to look into that some more.

So I think this is okay, from the kernels pov.

> The first solution that comes to my mind is to use the information=20
> that rpmsg and remoteproc subsystems expose to sysfs. This way a user=20
> space program can understand the correspondence between char devices=20
> and actual rpmsg channels and rprocs.
> For this solution the code from texas is already working, given the=20
> fact it is up to the userspace program to retrieve additional information=
s.
>=20

I think this is a good way forward, perhaps we need to provide additional a=
ttributes so that it's possible to build a user friendly dev name.

> Instead, if we desire more control inside the kernel we should=20
> consider a different creation strategy, such as a /dev/rpmsgXY scheme.
> The X standing for the rproc index and the Y standing for a particular=20
> digit representing different channels. For instance, if we have two=20
> remotes each with a single channel in the system we could name the=20
> char devices as /dev/rpmsg00 and /dev/rpmsg10.
>=20

I would prefer that we find a solution to exposing the parent name in a way=
 that it's possible to write a udev rule to get /dev/rpmsg/<parent-label>/<=
channel-name>

Perhaps if we just add support for an optional "label" property for control=
ling the remoteproc's dev->name we would have what we need there
- and solve the annoyance of the probe order dependant naming of the remote=
procs.

>=20
> To sum up, I would say the char approach is more suitable for static=20
> configurations and is oriented to represent a rpmsg channel while the=20
> socket approach is more dynamic, given the fact it permits generic=20
> services to be deployed and it is a little bit detached from the rpmsg=20
> channel concept.

I was expecting to find a socket based implementation that allows for unbou=
nd services to be implemented in userspace, but was happy to see that neith=
er of the TI solutions I looked at supported this today.

Further more, the Qualcomm SMD implementation doesn't support offchannel co=
mmunication, so this simplification suits that as well.


Not supporting this simplifies the problem and we should be able to impleme=
nt this without tangling it into the rpmsg implementation too much.

> In my opinion, we should consider both since socket can give more=20
> powerful communication paradigms while char devices represent a=20
> point-to-point link and are more straightforward to use.
>=20

I agree with the view that sockets would give a more powerful model, but un=
less we _really_ need that I would prefer if we don't go there.
Most use-cases I've seen does not require support for implementing unbound =
services and the ability to do so in-kernel is still there.



So my suggestion is that we upon probing a rpmsg device create a rpmsg_ctrl=
%d character device, which has an ioctl interface for exporting and unexpor=
ting endpoints. We can be a little bit optimistic and have the export creat=
e a rpmsg%d device, with the associated rpmsg_channel_info.

Then upon getting the open() callback we issue rpmsg_create_ept() and
release() calls rpmsg_destroy_ept().

For rpmsg backends that support advertising channel state this would mean t=
hat once the char dev is open we have an open rpmsg channel.


To be able to use the rpmsg_create_ept() interface we need to have a rpmsg_=
device handle for the backend-specific rpmsg instance, so I think the first=
 step needs to be initiated by each rpmsg backend by creating a "dummy" rpm=
sg_device and triggering the registration above.

Regards,
Bjorn
--
To unsubscribe from this list: send the line "unsubscribe linux-remoteproc"=
 in the body of a message to majordomo@vger.kernel.org More majordomo info =
at  http://vger.kernel.org/majordomo-info.html
