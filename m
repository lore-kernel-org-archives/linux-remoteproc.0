Return-Path: <loic.pallardy@st.com>
From: Loic PALLARDY <loic.pallardy@st.com>
Subject: RE: Ongoing remoteproc discussions
Date: Wed, 3 Aug 2016 14:52:39 +0000
Message-ID: <D0C04901035AEF47BB4C8387F4AA41F53B5A92@SAFEX1NODE23.st.com>
References: <20160718231011.GK13516@tuxbot>
In-Reply-To: <20160718231011.GK13516@tuxbot>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Sarangdhar Joshi <spjoshi@codeaurora.org>, Eric FINCO <eric.finco@st.com>, Russell Wayman <russell.wayman@linaro.org>, "Matthew Locke  <matthew.locke@linaro.org>, Kumar Gala" <kumar.gala@linaro.org>, "Bill Fletcher  <bill.fletcher@linaro.org>, Puja Gupta" <pujag@codeaurora.org>, Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

Please find below some comments/questions.

Regards,
Loic

> -----Original Message-----
> From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> Sent: Tuesday, July 19, 2016 1:10 AM
> To: linux-remoteproc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org; Lee Jones <lee.jones@linaro.org>;
> Sarangdhar Joshi <spjoshi@codeaurora.org>; Loic PALLARDY
> <loic.pallardy@st.com>; Eric FINCO <eric.finco@st.com>; Russell Wayman
> <russell.wayman@linaro.org>; Matthew Locke <matthew.locke@linaro.org>;
> Kumar Gala <kumar.gala@linaro.org>; Bill Fletcher <bill.fletcher@linaro.o=
rg>;
> Puja Gupta <pujag@codeaurora.org>; Ohad Ben-Cohen
> <ohad@wizery.com>; Suman Anna <s-anna@ti.com>
> Subject: Ongoing remoteproc discussions
>=20
> During discussions with various people interested in moving their
> remoteproc-related out-of-tree patches towards mainline I have come
> across a set of topics common among various teams. The purpose of this
> email is to share some insight into these discussions and the current ide=
as for
> moving forward.
>=20
> =3D=3D Auto-boot or always-on:
> There are cases where we want to achieve the current auto-boot mechanism
> without rpmsg and there are cases where we don't want to auto-boot a
> remoteproc just because its resource table contains rpmsg entries. So we
> need to decouple this logic from the vdev. I suggest that:
>=20
> * We introduce a property in the rproc struct where drivers can toggle
>   if they want always-on or not. We default this to true, as an estimate
>   of backwards compatibility.
>=20
> * We move the allocation of vrings to be done at the time of the other
>   allocations and follow that with the registration of virtio devices,
>   before actually booting the rproc. And we tear down the virtio devices
>   as part of shutdown.
>=20
> * We remove the rproc_boot()/shutdown() calls from the
>   remoteproc_virtio.c and based on rproc->always_on we call these in the
>   async firmware loader callback, in rproc_trigger_recovery() and
>   rproc_del().
>=20
>=20
> A side effect of this is that the async firmware loading only purpose is =
to
> trigger the boot as the firmware becomes available (something we need to
> tweak further). I therefor see no reason to mandate the firmware is
> unchanged between boots, which simplifies the posed rproc_set_firmware()
> function - as long as it's done on a remoteproc that's not always_on.
>=20
[LPA] As already mentioned in patch review, I would prefer auto-boot name r=
ather than always-on for this feature.
What about coprocessor already loaded and started at boot stage? It may be =
the case of coprocessor used by bootloader and can't reset without breaking=
 use case or coprocessor with security constraints.
In that case, remoteproc should allocate rproc resource at linux level and =
sync on current rproc state.
>=20
> =3D=3D Amended resources:
> We need a way for the driver to amend resource definitions of the firmwar=
e
> with e.g. physical addresses and size constraints from devicetree, so I
> suggest that:
>=20
> * We split the resource table parsing and allocation of resources in two
>   steps; where the parse step updates the lists of resources and then at
>   the time of boot we run through these and allocate the actual
>   resources.
>=20
> * We expose an API to the drivers so that they can register resources,
>   as if they came from the table parser. We match each resource against
>   previously registered resources based on name and merge or reject the
>   updates. E.g. we merge a reference to the resource table offset and we
>   reject incompatible size changes.
>=20
>=20
> =3D=3D Resource-less firmware:
> To be able to use remoteproc with firmware either without a resource tabl=
e
> or resource data in other forms we today provide a resource table stub in
> each driver, instead we could refactor the resource table parsing code.
>=20
> * We replace the find_rsc_table operation in rproc_fw_ops with a parse
>   operation, that uses the newly created API (above) to register the
>   resources with the core; largely decoupling the resource table format
>   from the remoteproc core.
>=20
> * We make the parse() function in rproc_fw_ops optional, allowing
>   remoteproc drivers to specify that there's no resource parsing to be
>   done (they can still provide resources programmatically between
>   rproc_alloc() and rproc_add()).
>=20
> This setup allows custom resource building functions to be implemented,
> one such example is the Qualcomm firmware files where most resource data
> is a combination of static information (DT) and data from the ELF header.
[LPA] Do you have a list of resources you would like to support here?
In ST we plan to have DT for rproc resource description (PIO, peripheral bu=
s...). Today coprocessor resources are managed dynamically using resource m=
anager developed by TI on omap.
But this solution is consuming time and code size.
We would like to implement rproc resource allocation at rproc_boot time, pa=
rsing associated DT section and getting the different requested resources..=
.
Is it aligned with your view?

>=20
>=20
> =3D=3D Resource-less firmware with installed resource table:
> The now available list of resources that have been registered with the co=
re
> can serve as input for a function that generates a resource table for the
> remote.  This gives us a mechanism for providing a remoteproc with
> information about resources in cases where the firmware lacks a resource
> table.
>=20
> * We replace the rproc_find_loaded_rsc_table() with an new fw_op that is
>   tasked with installing the resource table and update rproc->table_ptr.
>   This op is made optional, for the remoteprocs with no installed
>   resource table.
>=20
> * We provide a helper function in the core that can be used in the
>   fw_op, that builds a resource table in memory and copy this into the
>   appropriate address of the remote, and  update rproc->table_ptr to
>   this.
>=20
> The install function will be tasked with making sure table_ptr is valid a=
nd we
> make sure that error paths out of there and upon shutdown the core will
> make table_ptr reference the core's version - which might be NULL if no
> resource table exist.
>=20
>=20
> =3D=3D Supporting rpmsg alternatives:
> For systems with other communication mechanisms than rpmsg we still want
> to be able to instantiate and tear down devices representing these
> communication channels, in a way that follows the life cycle of the
> remoteproc. To do this I suggest that:
>=20
> * Like other resources we split virtio device handling in the remoteproc
>   core into adding rproc_vdevs to rproc->rvdevs and actually calling
>   rproc_add_virtio_dev().
>=20
> * We generalise the rproc->rvdev somewhat, to be a list of "subdevices"
>   that are registered with the remoteproc; each providing callbacks for
>   registering and unregistering themselves as we bring the remoteproc up
>   and down.
>=20
> I made a quick hack of this with the Qualcomm SMD code and it turned out
> pretty good, but I believe it's too ugly to post until we get the cleanup=
s from
> above tasks sorted out.
>=20
>=20
> =3D=3D Ramdump:
> Being able to acquire core dumps from a miss-behaving remoteproc is an
> important feature in product development. I believe this snapshot should =
be
> taken between the shutdown of the remote and freeing of resources. As
> such I think it would be appropriate to:
>=20
> * Split the inner working of rproc_shutdown() into the two steps of
>   shutting down the remote and cleaning up its resources. Giving us a
>   window of opportunity for snapshotting any resources.
>=20
> In the generic case we will have to repopulate the resources with data fr=
om
> the firmware file (in case of corruptions), but we're expecting to load t=
he
> same firmware again and as such I see no meaning in releasing and
> reacquiring carveouts etc. As such if we split the inner working of
> rproc_boot() into resource allocation, virtio device allocation and booti=
ng we
> can make rproc_trigger_recovery() do:
>=20
>     * Shutdown the remoteproc
[LPA] just a technical remark, shutting down the remoteproc may switch off =
some power domain and disable access to remoteproc memories or registers.
An intermediate state is need to allow snapshot generation.

>     * Shutdown virtio devices
>     * Take snapshot
>     * Register virtio devices
>     * Start the remoteproc
>=20
> (The order of the top two is opposite of todays implementation, but
> probably more appropriate for the case of getting an accurate snapshot of
> the device).
>=20
> We need to discuss the requirements for the format of what comes out of
> this.  I've seen raw memory dumps of a fixed memory segments and I've
> seen ELF generators with segments matching those of the loaded ELF in the
> past.
[LPA] +1 for ELF format
>=20
>=20
> =3D=3D Firmware from late mounted file systems (needs discussion):
> Typical for most remoteproc systems seems to be that the firmware files
> tend to be way to large for being stored in a initramfs. The two availabl=
e
> mechanisms for dealing with this is to build remoteproc drivers as module=
s
> and relying on CONFIG_FW_LOADER_USER_HELPER_FALLBACK;
> the latter is being frowned upon by everyone but works fairly well for ou=
r
> purpose.
>=20
> Forcing systems to compile remoteproc drivers as modules to achieve the
> delayed firmware load is not acceptable in my view.
>=20
> So we need to come up with some mechanism for triggering auto-booting
> when firmware files are stored in a lately mounted file system.
>=20
>=20
>=20
> Interwoven in these discussions are of course topics related to rpmsg and=
 I
> will try to get back to these as things materialize.
>=20
> Regards,
> Bjorn
