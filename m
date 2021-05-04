Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81273C433B4
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 17:33:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F47F613BE
	for <linux-remoteproc@archiver.kernel.org>; Tue,  4 May 2021 17:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhEDReH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 4 May 2021 13:34:07 -0400
Received: from mib.mailinblack.com ([137.74.84.110]:42888 "EHLO
        mib.mailinblack.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbhEDReH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 4 May 2021 13:34:07 -0400
X-Greylist: delayed 422 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 May 2021 13:34:07 EDT
Received: from localhost (localhost [127.0.0.1])
        by mib.mailinblack.com (Postfix) with ESMTP id 44AD51AE333
        for <linux-remoteproc@vger.kernel.org>; Tue,  4 May 2021 17:26:09 +0000 (UTC)
Received: from mib.mailinblack.com (localhost [127.0.0.1])
        by mib.mailinblack.com
        with SMTP (Mib Daemon ) id KOAAZFN3;
        Tue, 04 May 2021 17:26:09 +0000 (UTC)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
        by mib.mailinblack.com (Postfix) with ESMTPS id 1887A1AE331;
        Tue,  4 May 2021 17:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id F0DF727E0921;
        Tue,  4 May 2021 19:26:08 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id fFKjj0pzEBbY; Tue,  4 May 2021 19:26:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 67AE927E0923;
        Tue,  4 May 2021 19:26:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 67AE927E0923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalrayinc.com;
        s=4F334102-7B72-11EB-A74E-42D0B9747555; t=1620149168;
        bh=hHlAMEm6K9ZM6IiqHOz1/lL5BjEyxQ8RbSVD4+2Gdmc=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=cxVRiV97xqOSyryjzfgZZVRUra4r6Y3SBo0eC8q5cUXezPDtFjFfSllh9zD0tdEux
         b70pblrbhPZ6ti3354CFPrWfxMgfjP2BG9lWBTMKNePz4RILfonCfhv/Y6qcYycWnL
         IQ2hmJLZUcHlfKIzNekaIRjZy3TogvGv0tpVBNumjsINpKAtIUcK90Xf/oUuQvmHpJ
         sk8r66/qlOQsI5+U6B1bPfv7Vo0r2J87J65V9uFR1Ic0Ri/odLkkgga01DfTUjQ6wG
         yEnM4D5vdcRVfVoOZp1VlzFkC5jDh+AIGeLl0ZmRZ6Ir3Qh7H4aduj92Nc3ud20Jme
         NlpBG3Vy8iyzA==
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id sp9Mx3XwP89h; Tue,  4 May 2021 19:26:08 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 4E3F027E0921;
        Tue,  4 May 2021 19:26:08 +0200 (CEST)
Date:   Tue, 4 May 2021 19:26:07 +0200 (CEST)
From:   Julien Hascoet <jhascoet@kalrayinc.com>
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc:     Yann Sionneau <ysionneau@kalray.eu>,
        linux-remoteproc@vger.kernel.org,
        Pierre-Yves Kerbrat <pkerbrat@kalrayinc.com>,
        Vincent Chardon <vchardon@kalrayinc.com>
Message-ID: <1000492090.19560989.1620149167907.JavaMail.zimbra@kalray.eu>
In-Reply-To: <d6827a71-81ea-579f-dc89-68ca9055dac1@foss.st.com>
References: <b086d39f-ee2e-39b5-c4b1-bf9fbbd6a83b@kalray.eu> <d6827a71-81ea-579f-dc89-68ca9055dac1@foss.st.com>
Subject: Re: race condition issue at remote proc startup
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [192.168.40.202]
X-Mailer: Zimbra 9.0.0_GA_3990 (ZimbraWebClient - FF72 (Linux)/9.0.0_GA_3990)
Thread-Topic: race condition issue at remote proc startup
Thread-Index: Lbse143YJoyR9IliFbZRLsqXL7nXFw==
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello, thanks for the quick answer,

> Is the remote side waiting for the vdev status[1] update before accessing=
 the vrings?
> [1] https://elixir.bootlin.com/linux/latest/source/include/linux/remotepr=
oc.h#L307

We are using the openamp project that does it for us: https://github.com/Op=
enAMP/open-amp/blob/master/lib/remoteproc/remoteproc.c#L925

I also checked the defines and they seem aligned on both sides:
linux: include/uapi/linux/virtio_config.h:#define VIRTIO_CONFIG_S_DRIVER_OK=
    4
openamp: lib/include/openamp/virtio.h:#define VIRTIO_CONFIG_STATUS_DRIVER_O=
K 0x04

Thanks !

----- Original Message -----
From: "Arnaud POULIQUEN" <arnaud.pouliquen@foss.st.com>
To: "Yann Sionneau" <ysionneau@kalray.eu>, linux-remoteproc@vger.kernel.org
Cc: "Pierre-Yves Kerbrat" <pkerbrat@kalrayinc.com>, "Vincent Chardon" <vcha=
rdon@kalrayinc.com>, "jhascoet" <jhascoet@kalrayinc.com>
Sent: Tuesday, May 4, 2021 6:43:47 PM
Subject: Re: race condition issue at remote proc startup

Hello Yann

On 5/4/21 11:45 AM, Yann Sionneau wrote:
> Hello,
>=20
> We (at Kalray) have some difficulties during initialization of a remotepr=
oc
> device, and there seem to have no clean way (at least not one we know of)=
 out of
> this problem.
>=20
> We need vring defined in the resource table to be completely initialized =
before
> the remoteproc device is started. By completely initialized I mean that t=
he
> vring device address defined in resource table shall be changed from 0xff=
..ff to
> a proper address. Currently the remote device is started before the
> initialization has completed, which creates a race condition between Linu=
x and
> the remoteproc device. (We have a particular architecture in which the pr=
ocessor
> running Linux is the same as the embedded processor, this is why this pro=
blem
> happens in our case but probably not when the processor running Linux is =
much
> faster than the embedded processor).

Is the remote side waiting for the vdev status[1] update before accessing t=
he
vrings?

[1] https://elixir.bootlin.com/linux/latest/source/include/linux/remoteproc=
.h#L307


>=20
> Our best attempt up to now is to configure the virtio ring sooner i.e dur=
ing
> subdevice preparation instead of subdevice start.
> i.e. in rproc_handle_vdev change code from
> =C2=A0=C2=A0=C2=A0 rvdev->subdev.start =3D rproc_vdev_do_start;
> to
> =C2=A0=C2=A0=C2=A0 /* da field in vring must be initialized before poweri=
ng up
> =C2=A0=C2=A0=C2=A0 =C2=A0* the remoterproc, or else race condition may oc=
cur.
> =C2=A0=C2=A0=C2=A0 =C2=A0* Indeed the remoteproc may read it before it ha=
s been initialized.
> =C2=A0=C2=A0=C2=A0 =C2=A0*/
> =C2=A0=C2=A0=C2=A0 rvdev->subdev.prepare =3D rproc_vdev_do_start;
>=20
> This works but it has undesired side effects. In particular some notifica=
tions
> are sent (the remote proc kick function is being called), but since the r=
emote
> CPU has not been started yet we are not able to handle them, thus we simp=
ly
> ignore them if the state of the remote proc is not RUNNING.
> At least this seems to solve our problem, but this is a particularly unpl=
easant
> way of solving the problem, in particular it might impact the existing
> remoteproc devices. Do you have any suggestion on some cleaner to way to =
solve
> this problem?
>=20
> FYI, here is our arch specific remote proc implementation:
> https://github.com/kalray/linux_coolidge/blob/coolidge/drivers/remoteproc=
/kvx_remoteproc.c
>=20
>=20
> PS: there seem to be a similar problem when the remote device is being st=
opped.
> The vring buffer are destroyed and only after is the remote proc device s=
topped.
> There is once again a race condition as the remote proc device might try =
to
> access the vring after their destruction by the host. Proposed change is =
as follow:
> In rproc_handle_vdev change code from
> =C2=A0=C2=A0=C2=A0 rvdev->subdev.stop =3D rproc_vdev_do_stop;
> to
> =C2=A0=C2=A0=C2=A0 rvdev->subdev.unprepare =3D rproc_vdev_do_stop;

Should also be handled with the vdev status.

>=20
> Note this change has much less impact on existing remote proc and is symm=
etric
> to the previous change thus it might make it sound more logical
>=20
> PS2: I guess that this issue never showed up before because most other us=
e cases
> are using fixed addresses in the resource tables and not dynamically allo=
cated
> ones at runtime.

We use dynamic vring address allocation without any issue on STM323MP1 plat=
form,
with the coprocessor started before the main processor running Linux.

Regards,
Arnaud

>=20
> Regards,
>

