Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from zimbra2.kalray.eu ([92.103.151.219]:35714 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731755AbfB1Hnd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Feb 2019 02:43:33 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 0D8DC27E02CF
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Feb 2019 08:43:32 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id fdgSinUAgtT4 for <linux-remoteproc@vger.kernel.org>;
        Thu, 28 Feb 2019 08:43:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id B497A27E03A3
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Feb 2019 08:43:31 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 0y6riaphLwNb for <linux-remoteproc@vger.kernel.org>;
        Thu, 28 Feb 2019 08:43:31 +0100 (CET)
Received: from zimbra2.kalray.eu (zimbra2.kalray.eu [192.168.40.202])
        by zimbra2.kalray.eu (Postfix) with ESMTP id A429D27E02CF
        for <linux-remoteproc@vger.kernel.org>; Thu, 28 Feb 2019 08:43:31 +0100 (CET)
Date: Thu, 28 Feb 2019 08:43:31 +0100 (CET)
From: =?utf-8?Q?Cl=C3=A9ment?= Leger <cleger@kalray.eu>
Message-ID: <238022034.10402985.1551339811648.JavaMail.zimbra@kalray.eu>
Subject: dynamic vring allocation and 64 bits resources/loader
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc <linux-remoteproc@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Hi,=20

I am currently implementing remote proc for our processor and after some te=
sts,=20
I have the following questions.=20

1) When allocating vring dynamically (da =3D=3D (-1)), the remoteproc core =
allocates=20
carveouts for each of these vrings:=20

[ 34.410000] remoteproc remoteproc0: rsc: type 3=20
[ 34.420000] remoteproc remoteproc0: vdev rsc: id 7, dfeatures 0x0, cfg len=
 0, 2 vrings=20
[ 34.430000] remoteproc remoteproc0: vdev rsc: vring0: da 0xffffffff, qsz 2=
56, align 4096=20
[ 34.430000] remoteproc remoteproc0: vdev rsc: vring1: da 0xffffffff, qsz 2=
56, align 4096=20
[ 34.450000] remoteproc remoteproc0: carveout va (____ptrval____), dma 0x00=
0000011ec88000, len 0x3000=20
[ 34.460000] remoteproc remoteproc0: carveout va (____ptrval____), dma 0x00=
0000011ec8c000, len 0x3000=20
[ 34.460000] remoteproc remoteproc0: da =3D 0x0 len =3D 0x10440 va =3D 0x(_=
___ptrval____)=20
[ 34.490000] remoteproc remoteproc0: da =3D 0x10440 len =3D 0x10 va =3D 0x(=
____ptrval____)=20
[ 34.500000] remoteproc remoteproc0: da =3D 0x10450 len =3D 0xc4f0 va =3D 0=
x(____ptrval____)=20
[ 34.520000] remoteproc remoteproc0: da =3D 0xa46000 len =3D 0x2b4 va =3D 0=
x(____ptrval____)=20
[ 34.530000] remoteproc remoteproc0: da =3D 0xe3e8 len =3D 0x58 va =3D 0x(_=
___ptrval____)=20
[ 34.550000] remoteproc remoteproc0: registered virtio0 (type 7)=20
[ 34.560000] remoteproc remoteproc0: remote processor cluster1 is now up=20
Hello world from cluster1=20
VRING0 da: 0xffffffff, pa: 0, notify_id: 0=20
VRING1 da: 0xffffffff, pa: 0, notify_id: 1=20

Rsc table contains the following:=20

/* Virtio device entry */=20
{=20
RSC_VDEV, VIRTIO_ID_RPMSG, 0, 0, 0, 0, 0,=20
NUM_VRINGS, {0, 0},=20
},=20
/* Vring rsc entry - part of vdev_rsc entry */=20
{=20
(-1), VRING_ALIGN, VRING_SIZE, 0, 0=20
},=20
{=20
(-1), VRING_ALIGN, VRING_SIZE, 0, 0=20
},=20

I was expecting remoteproc core to update vring pa but the=20
rproc_alloc_registered_carveouts function only update resources for carveou=
ts.=20
Is this the expected behaviour or am I missing something ? I tried adding t=
wo=20
carveouts named after the vdev%dvring%d scheme and the carveout resources a=
re=20
indeed correctly updated (but vring are still not updated). BTW, I'm workin=
g=20
on a v5.0-rc5 kernel if its of any interest.=20

2) Regarding resource structs (rsc_*). They are all defined using u32 types=
=20
(da, etc for instance). I saw it was planned to support 64 bits resources i=
n=20
some mail from 2018. However, this does not seems supported yet. Are there=
=20
any new plans to support it ?=20

3) Same question regarding an elf64 loader.=20

Regards,=20

Cl=C3=A9ment=20
