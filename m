Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from zimbra2.kalray.eu ([92.103.151.219]:35212 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbfCDIIl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Mar 2019 03:08:41 -0500
Date: Mon, 4 Mar 2019 09:08:38 +0100 (CET)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
Message-ID: <1561292132.14100765.1551686918876.JavaMail.zimbra@kalray.eu>
In-Reply-To: <52399a4d0bec489ba4b928b5c3fd4791@SFHDAG7NODE2.st.com>
References: <238022034.10402985.1551339811648.JavaMail.zimbra@kalray.eu> <52399a4d0bec489ba4b928b5c3fd4791@SFHDAG7NODE2.st.com>
Subject: Re: dynamic vring allocation and 64 bits resources/loader
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-remoteproc-owner@vger.kernel.org
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: linux-remoteproc <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Lo=C3=AFc, thanks for your answer,

----- Mail original -----
> De: "Loic PALLARDY" <loic.pallardy@st.com>
> =C3=80: "Cl=C3=A9ment Leger" <cleger@kalray.eu>, "linux-remoteproc" <linu=
x-remoteproc@vger.kernel.org>
> Envoy=C3=A9: Dimanche 3 Mars 2019 21:22:16
> Objet: RE: dynamic vring allocation and 64 bits resources/loader

> Hi Cl=C3=A9ment,
>=20
>> -----Original Message-----
>> From: linux-remoteproc-owner@vger.kernel.org <linux-remoteproc-
>> owner@vger.kernel.org> On Behalf Of Cl=C3=A9ment Leger
>> Sent: jeudi 28 f=C3=A9vrier 2019 08:44
>> To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
>> Subject: dynamic vring allocation and 64 bits resources/loader
>>=20
>> Hi,
>>=20
>> I am currently implementing remote proc for our processor and after some
>> tests,
>> I have the following questions.
>>=20
>> 1) When allocating vring dynamically (da =3D=3D (-1)), the remoteproc co=
re
>> allocates
>> carveouts for each of these vrings:
>>=20
>> [ 34.410000] remoteproc remoteproc0: rsc: type 3
>> [ 34.420000] remoteproc remoteproc0: vdev rsc: id 7, dfeatures 0x0, cfg =
len 0,
>> 2 vrings
>> [ 34.430000] remoteproc remoteproc0: vdev rsc: vring0: da 0xffffffff, qs=
z 256,
>> align 4096
>> [ 34.430000] remoteproc remoteproc0: vdev rsc: vring1: da 0xffffffff, qs=
z 256,
>> align 4096
>> [ 34.450000] remoteproc remoteproc0: carveout va (____ptrval____), dma
>> 0x000000011ec88000, len 0x3000
>> [ 34.460000] remoteproc remoteproc0: carveout va (____ptrval____), dma
>> 0x000000011ec8c000, len 0x3000
>> [ 34.460000] remoteproc remoteproc0: da =3D 0x0 len =3D 0x10440 va =3D
>> 0x(____ptrval____)
>> [ 34.490000] remoteproc remoteproc0: da =3D 0x10440 len =3D 0x10 va =3D
>> 0x(____ptrval____)
>> [ 34.500000] remoteproc remoteproc0: da =3D 0x10450 len =3D 0xc4f0 va =
=3D
>> 0x(____ptrval____)
>> [ 34.520000] remoteproc remoteproc0: da =3D 0xa46000 len =3D 0x2b4 va =
=3D
>> 0x(____ptrval____)
>> [ 34.530000] remoteproc remoteproc0: da =3D 0xe3e8 len =3D 0x58 va =3D
>> 0x(____ptrval____)
>> [ 34.550000] remoteproc remoteproc0: registered virtio0 (type 7)
>> [ 34.560000] remoteproc remoteproc0: remote processor cluster1 is now up
>> Hello world from cluster1
>> VRING0 da: 0xffffffff, pa: 0, notify_id: 0
>> VRING1 da: 0xffffffff, pa: 0, notify_id: 1
>>=20
>> Rsc table contains the following:
>>=20
>> /* Virtio device entry */
>> {
>> RSC_VDEV, VIRTIO_ID_RPMSG, 0, 0, 0, 0, 0,
>> NUM_VRINGS, {0, 0},
>> },
>> /* Vring rsc entry - part of vdev_rsc entry */
>> {
>> (-1), VRING_ALIGN, VRING_SIZE, 0, 0
>> },
>> {
>> (-1), VRING_ALIGN, VRING_SIZE, 0, 0
>> },
>>=20
>> I was expecting remoteproc core to update vring pa but the
>> rproc_alloc_registered_carveouts function only update resources for
>> carveouts.
>=20
> Only da is used by coprocessor, pa is only for the host. That's why pa is=
 not
> updated.
> Just take care that da may be updated after coprocessor boot. You need to=
 wait
> for first mailbox kick or vdev status in resource table before accessing =
vring
> information.

Ok, I was expecting the address to be directly updated.

This lead me to another question regarding the kicking mecanism.
Our interrupts are triggered using mailboxes. Since mailboxes are dynamical=
ly
allocated, to avoid hardcoding it in the firmware, I would like to be able =
to
send the mailbox address in some resources.
This lead me to vendor resources. I have seen that they are declared in Ope=
nAMP
and that the rproc backends can handle them. However, this is not implement=
ed in
the kernel. I added the same mecanism in remoteproc-core to allow rproc bac=
kends
to handle such resources.
Are these patches of any interest ?

>=20
>> Is this the expected behaviour or am I missing something ? I tried addin=
g two
>> carveouts named after the vdev%dvring%d scheme and the carveout
>> resources are
>> indeed correctly updated (but vring are still not updated). BTW, I'm wor=
king
>> on a v5.0-rc5 kernel if its of any interest.
>>=20
>> 2) Regarding resource structs (rsc_*). They are all defined using u32 ty=
pes
>> (da, etc for instance). I saw it was planned to support 64 bits resource=
s in
>> some mail from 2018. However, this does not seems supported yet. Are
>> there
>> any new plans to support it ?
>=20
> Still planned, need first to introduce resource table versioning
>=20
>>=20
>> 3) Same question regarding an elf64 loader.
>=20
> Needed indeed...

Would you mind if I contribute one ?

> Regards,
> Loic
>>=20
>> Regards,
>>=20
>> Cl=C3=A9ment
