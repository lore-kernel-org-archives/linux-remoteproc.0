Return-Path: <ore@pengutronix.de>
Date: Fri, 22 Jun 2018 08:24:26 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v1 1/2] imx-rproc: dt: provide new remote-nodes option
Message-ID: <20180622062426.qvom7ebkk4zq6skq@pengutronix.de>
References: <20180615115731.18424-1-o.rempel@pengutronix.de>
 <6888c986-1e6b-81dd-fb3a-e27218b1785a@st.com>
 <20180615163733.4bmpuag5dbzdqw2n@pengutronix.de>
 <e3401c25-986e-96b8-e782-a5c57122d0a7@st.com>
 <f7143423-a085-57e1-dc95-fef665cb5f82@pengutronix.de>
 <70d58e1e-c1fe-0629-5060-03c25f5e7c1f@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vg7r75j2sqh5ijoa"
Content-Disposition: inline
In-Reply-To: <70d58e1e-c1fe-0629-5060-03c25f5e7c1f@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "A.s. Dong" <aisheng.dong@nxp.com>, kernel@pengutronix.de, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>, Fabien DESSENNE <fabien.dessenne@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>


--vg7r75j2sqh5ijoa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2018 at 03:58:53PM +0200, Arnaud Pouliquen wrote:
>=20
>=20
> On 06/18/2018 02:37 PM, Oleksij Rempel wrote:
> > Hi Arnaud,
> >=20
> > On 18.06.2018 11:32, Arnaud Pouliquen wrote:
> >> Hi Oleksij,
> >>
> >> On 06/15/2018 06:37 PM, Oleksij Rempel wrote:
> >>> Hi Arnaud,
> >>>
> >>> On Fri, Jun 15, 2018 at 03:21:19PM +0200, Arnaud Pouliquen wrote:
> >>>> Hi Oleksij,
> >>>>
> >>>> Nice to see that we have the same needs.
> >>>> We push several month ago an RFC based on something similar but i ho=
pe
> >>>> more generic...
> >>>> could you have a look?
> >>>>
> >>>> https://www.spinics.net/lists/linux-remoteproc/msg01823.html
> >>>
> >>> I took a look at dt binding.
> >>> It would be really better to not redefine device nodes again.
> >>> DT is providing HW description and if it is still the same IP core
> >>> then most probably it is still the same from all CPUs. Most probably
> >>> there is different interrupt controller and memory offset, but all ot=
her
> >>> parts should be the same.
> >>> In long term it would be great to reduce duplicated information which=
 is
> >>> needed to added system developer.
> >> This is a valid point. We are also thinking about this. But just
> >> disabling a peripheral that is used seems also not logic from our point
> >> of view.
> >=20
> > Right now I don't see any thing bad on disabling it. For master CPU it
> > is indeed disabled and should not be accesable. What is your
> > argumentation about this?
> Perhaps It's more of a philosophical point of view than anything else...
> But doing some action based on a disabled device looks from my POV a
> nonsense. It look like a hack to disable the device instead of changing
> the compatible (change compatible to rproc-srm-dev could be used for
> this...).

Having one HW specific bindings vs application specific has at least one
important advantage:
- the hw will not change, but application will do.
So it is easier to approve/mainline one HW binding and
let SW decide how exactly it should be used.
About status usage, I'm not 100% sure.
I have seen products where different IP blocks was connected to the same
pins and enabled/routed to this pins sequentially within system start.
I have no idea how to reflect this within DT.
In case of remote proc, we change <cpu>-<ip-block>-<pins> relation.
I already can image customers who will require to control some thing
by master system until slave system will be started.
In this case, manually rewritten DT, which is reflecting some time point of=
 system
configuration is not really productive.

> For instance we can consider the pinctrl management. (Please tell me if
> i'm wrong) if you disable your device the pinctrl will not configure
> your pins. So you will need to force the pins management for a disabled
> device...

yes, good point. I need to think about this.

> >=20
> >> Furthermore how to you manage followings use cases:
> >> - peripheral clock is not the same for master and remote processor
> >> =3D> you potentially need to redefine the clocks
> >=20
> > IMO, not devicetree specific discussion
> Could you clarify what you means by " not devicetree specific
> discussion"? do you mean that you can directly update the device using
> overlay?

If some reusable ip block is controlled by some clock controller. It
will depend on this controller even after the ip block was exported to
separate CPU. On other hand the same ip block will depend on different
interrupt controller on other CPU.

> >=20
> >> - clock, regulator or pin are not managed by the Linux if peripheral is
> >> assigned to the remote processor, but controlled by the remote process=
or
> >> directly (isolation, protection on shared resource access...).
> >> =3D> In this case we must not handle the resource in Linux.
> >=20
> > IMO, not devicetree specific discussion
> >=20
> >> - Need a specific management of a peripheral, due to secure, isolation,
> >> or any other reason related to the platform.
> >> =3D> specific driver that can be bind as srm child (platform srm_dev).
> >=20
> > IMO, not devicetree specific discussion
> >=20
> >> To sum-up. We name shared (or system) resources every resources that
> >> have to be shared between the master and the remote processor. The list
> >> of these resources depends on the platform (and on peripheral of a
> >> platform). That's why we decide to redefine the node.
> >=20
> > sorry, i can't follow here. I don't claim to replace your solution,
> > especially if you have working code I would be happy to take it over AS=
AP.
>=20
> And i did not understand this:) just try to explain our design.
> On our platform we need to configure at least clock regulator and GPIO,
> to ensure coherence but also avoid concurrent access to some shared
> registers.
> Seems that on your platform you only need to handle the clock.
>=20
> FYI you can find here some slides presented in OPENAMP weekly meeting
> and shared with Bjorn. Document has just to be considered as a work base
>  associated with the RFC. No decision done today...
>=20
> http://openamp.github.io/docs/mca/remoteproc-resource-manager-overview.pdf

I can agree with all topics within this overview.

I would like to add some challenges I faced within my project and seem
to be not reflected by this overview:
- both, the slave and master system on my project is linux. Same kernel
  source build for different ARCH: Cortext A7 and Cortex M4 (nommu).
- to make all parts work properly I need to keep in sync:
  - DTs for both systems.
  - linkage offset for Cortex M4 with rproc specific ELF header and both
    DT configurations.
  - clock configurations. Even if we will be able to manage all clocks
    dynamically by resource manager we need some agreement for initial
    clock configuration. At least for uart and system clock.

Already on this development stage, so many manually configured sync
points have been endless source of different errors.
This is why I would be really happy not to create new nodes special for
resource manager and autoMagically generate DT for the slave system,
just on fly.

=46rom this POV, it is more practical to reference phandle which should be
exported, instead of redefining it.

> >=20
> >> In fact the good solution could be in the middle of this both design
> >> solutions. Means choice between redefining the node properties or just
> >> provide an handle to the soc one. For this we are thinking about a
> >> phandle to the soc node.
> >> something like ("parent-device" naming is just for the example)
> >> 	m4_uart1 {
> >> 		assigned-clock-rates =3D <240000000>;
> >> 		parent-device =3D { &uart1};
> >> 	};
> >>
> >> Another advantage of a phandle would be to be able to check that the
> >> device is disabled on Linux side and could offer the possibility to
> >> switch the peripheral between master and slave during the runtime.
> >=20
> > Is it a workaround for a system without devicetree overlay?
> Here i'm speaking about possibility to dynamically switch a peripheral
> during the run time (for instance for low power purpose). If do not
> consider the config fs overlay but only uboot overlay, the resource
> manager could be also used to switch the peripheral responsibility from
> one core to the other.
>=20
> > I don't see why we should provide extra container for not really extra
> > information. Or do I miss something?
> First of all seems i missed your "remote-nodes" property...no need to
> use the "parent-device".
>  =09
> This is an open point, do we need extra information or not?
>=20
> phandle should work for a simple device without child. Now if you have
> childs, this can became tricky to parse the node in a generic way...
>=20
> And the 3 points above need also to be considered, at least until you
> clarify your POV.
>=20
> Then we would like also to consider possibility to associate a specific
> driver to handle a remote device. As example we have a platform on which
> the remote processor is started before the Linux. It handles an I2C
> waiting Linux boot and then free it for Linux usage. So we implemented a
> specific driver that enable the soc device to probe the associated linux
> driver.
> That's why we offer possibility to define platform rproc_srm_dev...

We was thinking about similar scenario. In this case the bootloader (in
my case barebox) will do same initialization as it is one by linux
rproc.
Since linux rproc seems to be responable for bootstrap the slave system,
do it make sense to affiliate SRM with rproc?

> Now everything is open and i also agree with you that it could be nice
> to be able to provide also a phandle in simple usecase instead of
> redefining the properties.
> Then base on your example changing the compatible to the srm_dev instead
> of disabling the device would be cleaner.
>=20
> >=20
> >> To finish, an additional information: We are implementing on top of SRM
> >> a dynamic part based on rpmsg that allows to reconfigure the shared
> >> resource to allows for instance to:
> >> - change the clock rate
> >> - change pin states
> >> - change regulator constraints
> >> According to first discussion with Bjorn, we need to share this part
> >> also to present the global picture ,we would like to propose.
> >=20
> > Ok, so it looks like we are working on same thing. And you probably
> > already have most of the code to make this work. Did you made Linux
> > implementation only for Master or both (Master and Slave) parts?
> we have something almost ready for the dynamic part on Linux (acting as
> resource manager server). For Linux slave a new framework should answer:
> the SCMI.
>=20
> Now i don't know how you will want to go further on this topic, if you
> are interested in...
> Are you are interested in proposing some adaptation on top of the srm
> patchset, to add phandle?
> On our side we should be able to send a V2 including the dynamic part.
> This could be a good entry point for maintainer feedback...

So far, I implemented only imx-rproc and imx-mailbox. If your SRM is
cleanly separated, then I should be able to replace my node claiming
patch by SRM. Correct? If so, lets us try it :)

And depending on the results, we will be able to see how to proceed on
this topic.

--=20
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

--vg7r75j2sqh5ijoa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEpENFL0P3hvQ7p0DDdQOiSHVI77QFAlsslhYACgkQdQOiSHVI
77QPPQf5AXH6wCV9dWJiM8MdNjA/2xT/oS2tWM539VUARu3M6s03b7woA36x9vxC
8A+7EjIwUKJ/CmgrVWV2x3eivlRRPoXOa6VeRff22x7An2O2uJvGUMKSNUk2SFsc
wAMEOHLZvhBiGvJGx6hGnHfgMxqxSWcBmX97AdGjcZkGP9+Da6/hxztx6oAf02SB
Hxy9WCWa0fSNvee7Ja3B3mYgLWqmym/gBJVA2yXd5NWafJQ4uOhn+/2g/Dkj/cjR
qNJcqfuz7Z9qjMg4HmjCNHRStJvXV5v2TopQUDxDKtjFAnVRfTandblWHkoRbL6P
8BZMqP1jaJ/occsdgRs7b6ftF5e0hA==
=5PVf
-----END PGP SIGNATURE-----

--vg7r75j2sqh5ijoa--
