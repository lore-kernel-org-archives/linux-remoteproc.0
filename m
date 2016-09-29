Return-Path: <marek.novak@nxp.com>
From: Marek Novak <marek.novak@nxp.com>
Subject: Re: rpmsg: exposing the bus to userspace
Date: Thu, 29 Sep 2016 18:36:43 +0000
Message-ID: <8467aa00-96ba-4a7c-b44b-218188f30867@nxp.com>
References: <CAHvXT5pppxuWmZCrb9xSBWTx0kb3GcHT2YQJM6y8kHNB_QsAkg@mail.gmail.com>
 <20160810200352.GS26240@tuxbot>
 <CAHvXT5oAdtNzX04EPJK6DAGXr9=zY2pqibnNLxKEkr_de=bkjw@mail.gmail.com>
 <20160921040853.GA7509@tuxbot>
 <VI1PR0401MB24160EC781800AFDB78A9DDEF0F60@VI1PR0401MB2416.eurprd04.prod.outlook.com>,<20160929173525.GE7509@tuxbot>
In-Reply-To: <20160929173525.GE7509@tuxbot>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8467aa0096ba4a7cb44b218188f30867nxpcom_"
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Matteo Sartori <matteo.sartori@t3lab.it>, "takahiro.akashi@linaro.org" <takahiro.akashi@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, Alessio Paccoia <alessio.paccoia@t3lab.it>, Michele Rodolfi <michele.rodolfi@t3lab.it>, Claudio Salati <claudio.salati@t3lab.it>, Michal Princ <michal.princ@nxp.com>, Petr Lukas <petr.lukas@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

--_000_8467aa0096ba4a7cb44b218188f30867nxpcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Bjorn and the community,

I also support the idea of making the export of RPMsg endpoints to the user=
-space part of the virtio_rpmsg_bus kernel module.

As you suggest, it would allow to skip the channel concept, which is not re=
ally necessary for the communication. (RPMsg-Lite implementation is an evid=
ence of this idea)

Thanks & Regards,
Marek

________________________________
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Sent: Sep 29, 2016 7:35 PM
To: Marek Novak
Cc: Matteo Sartori; takahiro.akashi@linaro.org; linux-remoteproc@vger.kerne=
l.org; Alessio Paccoia; Michele Rodolfi; Claudio Salati; Michal Princ; Petr=
 Lukas
Subject: Re: rpmsg: exposing the bus to userspace

On Tue 20 Sep 21:43 PDT 2016, Marek Novak wrote:

> Hello Bjorn and the community,
>

Hi Marek

> Bjorn mentioned a sysfs-based exporting mechanism.
> I have written a kernel module, which allows exporting RPMsg endpoints
> to the user space.  If you want, please look at the code here:
> https://github.com/EmbeddedRPC/erpc-imx-demos/blob/master/MPU/setup_yocto=
/rpmsg_sysfs_interface.patch
>

This is in line with my ideas, allowing user space to open arbitrary
channels.

I think we can afford replacing the originating rpmsg device with a
special rpmsg_device created straight from the individual backends - so
that we don't have to rely on a specific channel to be exposed to
"enable" this feature.

> I am preparing an example/demonstration repository on Github showing its =
use-case here:
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
> From: linux-remoteproc-owner@vger.kernel.org [mailto:linux-remoteproc-own=
er@vger.kernel.org] On Behalf Of Bjorn Andersson
> Sent: Wednesday, September 21, 2016 6:09 AM
> To: Matteo Sartori <matteo.sartori@t3lab.it>
> Cc: takahiro.akashi@linaro.org; linux-remoteproc@vger.kernel.org; Alessio=
 Paccoia <alessio.paccoia@t3lab.it>; Michele Rodolfi <michele.rodolfi@t3lab=
.it>; Claudio Salati <claudio.salati@t3lab.it>
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
> > > the user-space variant - and we need to figure out how to make these =
not step on each others toes.
> >
> > Can you please elaborate a little more on the intermixed implementation=
s?
>
> After studying rpmsg_proto in detail I take this comment back. After my f=
irst read-through I interpreted the code as you expose the entire address s=
pace to via the socket interface.
>
> After reading the implementation more thoroughly I now see that the rpmsg=
_proto implementation only exposes specific channels (i.e. the ones named "=
rpmsg-proto") to userspace.
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
> On the Qualcomm platforms we have a varying number of channels per remote=
proc that we would like to be able to access from user space.
>
> The alternative to allowing user space to request channels to be exported=
 would be to list them in devicetree - but this is not a property of the ha=
rdware.
>
> > From my experience, the only method supporting this kind of userspace-
> > kernelspace interaction is that of sockets, where the bind() syscall
> > semantic can be translated into the creation of new rpmsg endpoint
> > which subsequent recvfrom()s can perform the desired behaviour on,
> > that is receiving traffic from a given port while knowing the source ad=
dress of each data unit.
> >
> > Do you have other userspace/kernelspace interaction models to be
> > considered ? Maybe, I am not aware of other possibilities.
> >
>
> There are two that comes to mind, either using a character device per rpm=
sg instance that provides an ioctl interface for exporting/unexporting endp=
oints or through some sysfs interface.
>
> Per the design of rpmsg_proto we want to be able to specify both src and =
dst address, and from Qualcomm SMD we want to be able to control this with =
channel names. So I think the ioctl based approach would be easier.
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
> So does rpmsg_proto, it only exposes communication channels after the rpm=
sg core has probed upon finding a "rpmsg-proto" channel.
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
> We can use udev rules to rename the rpmsg devices based on the channel na=
mes, but currently we don't have a convenient name for the parent - so we p=
robably need to look into that some more.
>
> So I think this is okay, from the kernels pov.
>
> > The first solution that comes to my mind is to use the information
> > that rpmsg and remoteproc subsystems expose to sysfs. This way a user
> > space program can understand the correspondence between char devices
> > and actual rpmsg channels and rprocs.
> > For this solution the code from texas is already working, given the
> > fact it is up to the userspace program to retrieve additional informati=
ons.
> >
>
> I think this is a good way forward, perhaps we need to provide additional=
 attributes so that it's possible to build a user friendly dev name.
>
> > Instead, if we desire more control inside the kernel we should
> > consider a different creation strategy, such as a /dev/rpmsgXY scheme.
> > The X standing for the rproc index and the Y standing for a particular
> > digit representing different channels. For instance, if we have two
> > remotes each with a single channel in the system we could name the
> > char devices as /dev/rpmsg00 and /dev/rpmsg10.
> >
>
> I would prefer that we find a solution to exposing the parent name in a w=
ay that it's possible to write a udev rule to get /dev/rpmsg/<parent-label>=
/<channel-name>
>
> Perhaps if we just add support for an optional "label" property for contr=
olling the remoteproc's dev->name we would have what we need there
> - and solve the annoyance of the probe order dependant naming of the remo=
teprocs.
>
> >
> > To sum up, I would say the char approach is more suitable for static
> > configurations and is oriented to represent a rpmsg channel while the
> > socket approach is more dynamic, given the fact it permits generic
> > services to be deployed and it is a little bit detached from the rpmsg
> > channel concept.
>
> I was expecting to find a socket based implementation that allows for unb=
ound services to be implemented in userspace, but was happy to see that nei=
ther of the TI solutions I looked at supported this today.
>
> Further more, the Qualcomm SMD implementation doesn't support offchannel =
communication, so this simplification suits that as well.
>
>
> Not supporting this simplifies the problem and we should be able to imple=
ment this without tangling it into the rpmsg implementation too much.
>
> > In my opinion, we should consider both since socket can give more
> > powerful communication paradigms while char devices represent a
> > point-to-point link and are more straightforward to use.
> >
>
> I agree with the view that sockets would give a more powerful model, but =
unless we _really_ need that I would prefer if we don't go there.
> Most use-cases I've seen does not require support for implementing unboun=
d services and the ability to do so in-kernel is still there.
>
>
>
> So my suggestion is that we upon probing a rpmsg device create a rpmsg_ct=
rl%d character device, which has an ioctl interface for exporting and unexp=
orting endpoints. We can be a little bit optimistic and have the export cre=
ate a rpmsg%d device, with the associated rpmsg_channel_info.
>
> Then upon getting the open() callback we issue rpmsg_create_ept() and
> release() calls rpmsg_destroy_ept().
>
> For rpmsg backends that support advertising channel state this would mean=
 that once the char dev is open we have an open rpmsg channel.
>
>
> To be able to use the rpmsg_create_ept() interface we need to have a rpms=
g_device handle for the backend-specific rpmsg instance, so I think the fir=
st step needs to be initiated by each rpmsg backend by creating a "dummy" r=
pmsg_device and triggering the registration above.
>
> Regards,
> Bjorn
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remotepro=
c" in the body of a message to majordomo@vger.kernel.org More majordomo inf=
o at  http://vger.kernel.org/majordomo-info.html

--_000_8467aa0096ba4a7cb44b218188f30867nxpcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<style type=3D"text/css">
<!--
p
	{font-family:Calibri,Arial,Helvetica,sans-serif;
	font-size:12.0pt;
	color:#1F497D}
-->
</style>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12.=
0pt; color:#1F497D">
<p dir=3D"ltr">Hello Bjorn and the community,</p>
<p dir=3D"ltr">I also support the idea of making the export of RPMsg endpoi=
nts to the user-space part of the virtio_rpmsg_bus kernel module.</p>
<p dir=3D"ltr">As you suggest, it would allow to skip the channel concept, =
which is not really necessary for the communication. (RPMsg-Lite implementa=
tion is an evidence of this idea)</p>
<p dir=3D"ltr">Thanks &amp; Regards,<br>
Marek</p>
</div>
<div id=3D"x_quoted_header" style=3D"clear:both">
<hr style=3D"border:none; height:1px; color:#E1E1E1; background-color:#E1E1=
E1">
<div style=3D"border:none; padding:3.0pt 0cm 0cm 0cm"><span style=3D"font-s=
ize:11.0pt; font-family:'Calibri','sans-serif'"><b>From:</b> Bjorn Andersso=
n &lt;bjorn.andersson@linaro.org&gt;<br>
<b>Sent:</b> Sep 29, 2016 7:35 PM<br>
<b>To:</b> Marek Novak<br>
<b>Cc:</b> Matteo Sartori; takahiro.akashi@linaro.org; linux-remoteproc@vge=
r.kernel.org; Alessio Paccoia; Michele Rodolfi; Claudio Salati; Michal Prin=
c; Petr Lukas<br>
<b>Subject:</b> Re: rpmsg: exposing the bus to userspace<br>
</span></div>
</div>
<br type=3D"attribution">
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On Tue 20 Sep 21:43 PDT 2016, Marek Novak wrote:<b=
r>
<br>
&gt; Hello Bjorn and the community,<br>
&gt; <br>
<br>
Hi Marek<br>
<br>
&gt; Bjorn mentioned a sysfs-based exporting mechanism.<br>
&gt; I have written a kernel module, which allows exporting RPMsg endpoints=
<br>
&gt; to the user space.&nbsp; If you want, please look at the code here:<br=
>
&gt; <a href=3D"https://github.com/EmbeddedRPC/erpc-imx-demos/blob/master/M=
PU/setup_yocto/rpmsg_sysfs_interface.patch">
https://github.com/EmbeddedRPC/erpc-imx-demos/blob/master/MPU/setup_yocto/r=
pmsg_sysfs_interface.patch</a><br>
&gt; <br>
<br>
This is in line with my ideas, allowing user space to open arbitrary<br>
channels.<br>
<br>
I think we can afford replacing the originating rpmsg device with a<br>
special rpmsg_device created straight from the individual backends - so<br>
that we don't have to rely on a specific channel to be exposed to<br>
&quot;enable&quot; this feature.<br>
<br>
&gt; I am preparing an example/demonstration repository on Github showing i=
ts use-case here:<br>
&gt; <a href=3D"https://github.com/EmbeddedRPC/erpc-imx-demos">https://gith=
ub.com/EmbeddedRPC/erpc-imx-demos</a><br>
&gt; <br>
<br>
Thanks,<br>
Bjorn<br>
<br>
&gt; <br>
&gt; Regards,<br>
&gt; Marek NOVAK<br>
&gt; NXP Semiconductors<br>
&gt; Brno University of Technology<br>
&gt; <br>
&gt; -----Original Message-----<br>
&gt; From: linux-remoteproc-owner@vger.kernel.org [<a href=3D"mailto:linux-=
remoteproc-owner@vger.kernel.org">mailto:linux-remoteproc-owner@vger.kernel=
.org</a>] On Behalf Of Bjorn Andersson<br>
&gt; Sent: Wednesday, September 21, 2016 6:09 AM<br>
&gt; To: Matteo Sartori &lt;matteo.sartori@t3lab.it&gt;<br>
&gt; Cc: takahiro.akashi@linaro.org; linux-remoteproc@vger.kernel.org; Ales=
sio Paccoia &lt;alessio.paccoia@t3lab.it&gt;; Michele Rodolfi &lt;michele.r=
odolfi@t3lab.it&gt;; Claudio Salati &lt;claudio.salati@t3lab.it&gt;<br>
&gt; Subject: Re: rpmsg: exposing the bus to userspace<br>
&gt; <br>
&gt; On Thu 25 Aug 03:31 PDT 2016, Matteo Sartori wrote:<br>
&gt; <br>
&gt; &gt; Hi Bjorn,<br>
&gt; &gt; apologies for the latency.<br>
&gt; &gt; <br>
&gt; <br>
&gt; Dito.<br>
&gt; <br>
&gt; &gt; On 2016-08-10 22:03 GMT&#43;02:00, Bjorn Andersson wrote:<br>
&gt; &gt; &gt; Going with the AF_RPMSG approach seems (at first) to map qui=
te <br>
&gt; &gt; &gt; nicely with the src/dst port model. It would e.g. allow us t=
o use <br>
&gt; &gt; &gt; recvfrom() to implement services for multiple clients.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; But the src/dst are only unique for each given virtproc, so =
we need <br>
&gt; &gt; &gt; to make up a mechanism for selecting among a set of rpmsg in=
stances <br>
&gt; &gt; &gt; if more than one remote exists. Further more I believe that =
the <br>
&gt; &gt; &gt; AF_RPMSG concept would have to be integrated into the core o=
f rpmsg <br>
&gt; &gt; &gt; and we would have two different concepts intermixed in the <=
br>
&gt; &gt; &gt; implementation; the in-kernel model with life cycle manageme=
nt and <br>
&gt; &gt; &gt; the user-space variant - and we need to figure out how to ma=
ke these not step on each others toes.<br>
&gt; &gt; <br>
&gt; &gt; Can you please elaborate a little more on the intermixed implemen=
tations?<br>
&gt; <br>
&gt; After studying rpmsg_proto in detail I take this comment back. After m=
y first read-through I interpreted the code as you expose the entire addres=
s space to via the socket interface.<br>
&gt; <br>
&gt; After reading the implementation more thoroughly I now see that the rp=
msg_proto implementation only exposes specific channels (i.e. the ones name=
d &quot;rpmsg-proto&quot;) to userspace.<br>
&gt; <br>
&gt; &gt; For what I understand it is necessary to introduce the AF_RPSMG <=
br>
&gt; &gt; concept inside the rpmsg core because e.g. after a bind() syscall=
 on a <br>
&gt; &gt; given port (local rpmsg address) it is important to create a new =
<br>
&gt; &gt; endpoint, and to register a new callback with.<br>
&gt; <br>
&gt; This can be done with rpmsg_create_ept()<br>
&gt; <br>
&gt; &gt; But, I don't see why there should be a user-space variant of the =
<br>
&gt; &gt; AF_RPMSG concept.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt; So I'm preferring a model where we can have a rpmsg-client t=
hat can <br>
&gt; &gt; &gt; be attached to an endpoint and expose this explicitly to use=
rspace.<br>
&gt; &gt; <br>
&gt; &gt; Do you refer to the possibility that a userspace process can crea=
te <br>
&gt; &gt; and attach to a new endpoint?<br>
&gt; <br>
&gt; Yes<br>
&gt; <br>
&gt; On the Qualcomm platforms we have a varying number of channels per rem=
oteproc that we would like to be able to access from user space.<br>
&gt; <br>
&gt; The alternative to allowing user space to request channels to be expor=
ted would be to list them in devicetree - but this is not a property of the=
 hardware.<br>
&gt; <br>
&gt; &gt; From my experience, the only method supporting this kind of users=
pace- <br>
&gt; &gt; kernelspace interaction is that of sockets, where the bind() sysc=
all <br>
&gt; &gt; semantic can be translated into the creation of new rpmsg endpoin=
t <br>
&gt; &gt; which subsequent recvfrom()s can perform the desired behaviour on=
, <br>
&gt; &gt; that is receiving traffic from a given port while knowing the sou=
rce address of each data unit.<br>
&gt; &gt; <br>
&gt; &gt; Do you have other userspace/kernelspace interaction models to be =
<br>
&gt; &gt; considered ? Maybe, I am not aware of other possibilities.<br>
&gt; &gt; <br>
&gt; <br>
&gt; There are two that comes to mind, either using a character device per =
rpmsg instance that provides an ioctl interface for exporting/unexporting e=
ndpoints or through some sysfs interface.<br>
&gt; <br>
&gt; Per the design of rpmsg_proto we want to be able to specify both src a=
nd dst address, and from Qualcomm SMD we want to be able to control this wi=
th channel names. So I think the ioctl based approach would be easier.<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; &gt; In the Qualcomm case mentioned above, you only have defined =
<br>
&gt; &gt; &gt; point-to-point channels, so spawning a char device for each =
one is <br>
&gt; &gt; &gt; rather natural. But the N:1 case (a generic service in the v=
irtio <br>
&gt; &gt; &gt; rpmsg<br>
&gt; &gt; &gt; case) requires a recvfrom()/sendto() like interface.<br>
&gt; &gt; <br>
&gt; &gt; I agree, the problem of using char devices is that they model onl=
y the <br>
&gt; &gt; situation where there is a rpmsg channel underneath, that is a <b=
r>
&gt; &gt; communication link already installed between two ends.<br>
&gt; &gt; <br>
&gt; <br>
&gt; So does rpmsg_proto, it only exposes communication channels after the =
rpmsg core has probed upon finding a &quot;rpmsg-proto&quot; channel.<br>
&gt; <br>
&gt; &gt; In my point of view the rpmsg channel abstraction matches quite w=
ell <br>
&gt; &gt; with char devices but there are problems with the particular mech=
anism <br>
&gt; &gt; rpmsg uses to match devices with drivers.<br>
&gt; &gt; For instance, the char driver I have tested these days spawns a n=
ew <br>
&gt; &gt; /dev/rpmsgX every time the rpmsg bus sees a channel id matching t=
he <br>
&gt; &gt; one specified by the driver. If there are two rprocs that create =
a new <br>
&gt; &gt; channel with the same name (eg &quot;rpmsg-char-dev-channel&quot;=
) and the <br>
&gt; &gt; driver matches such channel name, then two new char devices will =
be <br>
&gt; &gt; created,<br>
&gt; &gt; /dev/rpmsg0 and /dev/rpmsg1. How do I know which char device is t=
he <br>
&gt; &gt; target I want to communcate with? There is no control over the mi=
nor <br>
&gt; &gt; number assignment and it depends on the order of probe() calls th=
e <br>
&gt; &gt; rpmsg bus performs.<br>
&gt; &gt; <br>
&gt; <br>
&gt; We can use udev rules to rename the rpmsg devices based on the channel=
 names, but currently we don't have a convenient name for the parent - so w=
e probably need to look into that some more.<br>
&gt; <br>
&gt; So I think this is okay, from the kernels pov.<br>
&gt; <br>
&gt; &gt; The first solution that comes to my mind is to use the informatio=
n <br>
&gt; &gt; that rpmsg and remoteproc subsystems expose to sysfs. This way a =
user <br>
&gt; &gt; space program can understand the correspondence between char devi=
ces <br>
&gt; &gt; and actual rpmsg channels and rprocs.<br>
&gt; &gt; For this solution the code from texas is already working, given t=
he <br>
&gt; &gt; fact it is up to the userspace program to retrieve additional inf=
ormations.<br>
&gt; &gt; <br>
&gt; <br>
&gt; I think this is a good way forward, perhaps we need to provide additio=
nal attributes so that it's possible to build a user friendly dev name.<br>
&gt; <br>
&gt; &gt; Instead, if we desire more control inside the kernel we should <b=
r>
&gt; &gt; consider a different creation strategy, such as a /dev/rpmsgXY sc=
heme.<br>
&gt; &gt; The X standing for the rproc index and the Y standing for a parti=
cular <br>
&gt; &gt; digit representing different channels. For instance, if we have t=
wo <br>
&gt; &gt; remotes each with a single channel in the system we could name th=
e <br>
&gt; &gt; char devices as /dev/rpmsg00 and /dev/rpmsg10.<br>
&gt; &gt; <br>
&gt; <br>
&gt; I would prefer that we find a solution to exposing the parent name in =
a way that it's possible to write a udev rule to get /dev/rpmsg/&lt;parent-=
label&gt;/&lt;channel-name&gt;<br>
&gt; <br>
&gt; Perhaps if we just add support for an optional &quot;label&quot; prope=
rty for controlling the remoteproc's dev-&gt;name we would have what we nee=
d there<br>
&gt; - and solve the annoyance of the probe order dependant naming of the r=
emoteprocs.<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; To sum up, I would say the char approach is more suitable for sta=
tic <br>
&gt; &gt; configurations and is oriented to represent a rpmsg channel while=
 the <br>
&gt; &gt; socket approach is more dynamic, given the fact it permits generi=
c <br>
&gt; &gt; services to be deployed and it is a little bit detached from the =
rpmsg <br>
&gt; &gt; channel concept.<br>
&gt; <br>
&gt; I was expecting to find a socket based implementation that allows for =
unbound services to be implemented in userspace, but was happy to see that =
neither of the TI solutions I looked at supported this today.<br>
&gt; <br>
&gt; Further more, the Qualcomm SMD implementation doesn't support offchann=
el communication, so this simplification suits that as well.<br>
&gt; <br>
&gt; <br>
&gt; Not supporting this simplifies the problem and we should be able to im=
plement this without tangling it into the rpmsg implementation too much.<br=
>
&gt; <br>
&gt; &gt; In my opinion, we should consider both since socket can give more=
 <br>
&gt; &gt; powerful communication paradigms while char devices represent a <=
br>
&gt; &gt; point-to-point link and are more straightforward to use.<br>
&gt; &gt; <br>
&gt; <br>
&gt; I agree with the view that sockets would give a more powerful model, b=
ut unless we _really_ need that I would prefer if we don't go there.<br>
&gt; Most use-cases I've seen does not require support for implementing unb=
ound services and the ability to do so in-kernel is still there.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; So my suggestion is that we upon probing a rpmsg device create a rpmsg=
_ctrl%d character device, which has an ioctl interface for exporting and un=
exporting endpoints. We can be a little bit optimistic and have the export =
create a rpmsg%d device, with the associated
 rpmsg_channel_info.<br>
&gt; <br>
&gt; Then upon getting the open() callback we issue rpmsg_create_ept() and<=
br>
&gt; release() calls rpmsg_destroy_ept().<br>
&gt; <br>
&gt; For rpmsg backends that support advertising channel state this would m=
ean that once the char dev is open we have an open rpmsg channel.<br>
&gt; <br>
&gt; <br>
&gt; To be able to use the rpmsg_create_ept() interface we need to have a r=
pmsg_device handle for the backend-specific rpmsg instance, so I think the =
first step needs to be initiated by each rpmsg backend by creating a &quot;=
dummy&quot; rpmsg_device and triggering the registration
 above.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Bjorn<br>
&gt; --<br>
&gt; To unsubscribe from this list: send the line &quot;unsubscribe linux-r=
emoteproc&quot; in the body of a message to majordomo@vger.kernel.org More =
majordomo info at&nbsp;
<a href=3D"http://vger.kernel.org/majordomo-info.html">http://vger.kernel.o=
rg/majordomo-info.html</a><br>
</div>
</span></font>
</body>
</html>

--_000_8467aa0096ba4a7cb44b218188f30867nxpcom_--
