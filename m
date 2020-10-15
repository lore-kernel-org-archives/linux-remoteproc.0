Return-Path: <SRS0=Nf08=DW=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A2FC433DF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 18:31:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D139E2076D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Oct 2020 18:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="o0c2Mvxb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728884AbgJOSb0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Oct 2020 14:31:26 -0400
Received: from mail-bn8nam12on2046.outbound.protection.outlook.com ([40.107.237.46]:46351
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728820AbgJOSbZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Oct 2020 14:31:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xfx84NtruvB24oZId+tAn98MDCd2hMQFZMU5aXCDAtmFOHmTwkRg+/90Djg4E2RM+/YdDX742TWMzN1LjvNWbGjVGrSp+NQkxuC+Y8OMQqG8eg2OoLnzSd6ZOaMbHJgShG3uYg5y63e1N+PnKTzXAgyfGpndyANb67dk11ZLuCeh2RyMtVUCoXthuCKNbzgtJYPRv8FvTJfFE7VzSxvFQMOPxD3LFlAcVPfQVSXLt5mIl6cdQUCKjVoWYdgmvcOR7rTcNMO6mZuZi0fDr/ncNPGJ9PflODgx0Z1UkJqVaHVkAhFcy17aneeEZvbu+FEWsw/zfwIyH0KOY/hRZ6ICYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6JGVnlDhpWUuddY/MgZ0kLygQiHA/ZjLmKOOngw3D8=;
 b=Vg+1nAcPkZQIRyQbqiYnvT1jJYgg4l8tH+s7J93IFOHUl9V2PEHl1/buoiZdqiKwB8y/ldt78QpLbmJYYOOYawvQA2YOcByuhAFFd8+1UJMWG6ahnw5adJmsoRDG9masfqOifoOmkFXrzkZAbbcr+1CPCCszNSS+8UI+sMKM/4VV/3fvCrmWD4GWo0eRb7VfhCQPFziIu5L3Ch8YsD3pR5wuF6v7who6EL0LLLjSALvS1ddp1dEVq2m/ljo6bAMSJJAC5KRiibeE7FZhaaD/CLeY8CeRroXjiLWeU+dtt4NL+jcX09mNOyB5Q53Xut6SmS2TtrV7HE+vDrSj0ecjmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6JGVnlDhpWUuddY/MgZ0kLygQiHA/ZjLmKOOngw3D8=;
 b=o0c2Mvxb+/3UxXQwMChmZ3zZxTyw7FPcOeeVBuBuGDXGZRbbP+eZA+5QS8FBdmg9mnfwt2cb1zgqK3Y25t2kpOuklODv9YdtcxV7mN9wqhw8ogCW3V+r1sHa+lt99ErxdAWQHTER2QY5nUjAPtc3YbrN8YBx33GmCsDJ4ZkLlD4=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by BY5PR02MB6420.namprd02.prod.outlook.com (2603:10b6:a03:1b2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Thu, 15 Oct
 2020 18:31:21 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e%6]) with mapi id 15.20.3477.021; Thu, 15 Oct 2020
 18:31:21 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "Ed T. Mooring" <emooring@xilinx.com>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "michael.auchter@ni.com" <michael.auchter@ni.com>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: RE: RE: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5
 remoteproc driver
Thread-Topic: RE: RE: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5
 remoteproc driver
Thread-Index: AQHWmzGLZdXOwIwjxE6bV2X+UlYToKmJZsqAgAGMKFCAACbWgIAAAZmggAAMCYCADeKZ4A==
Date:   Thu, 15 Oct 2020 18:31:20 +0000
Message-ID: <BYAPR02MB44072A6C1ACAA0C459390895B5020@BYAPR02MB4407.namprd02.prod.outlook.com>
References: <20201005160614.3749-1-ben.levinsky@xilinx.com>
 <20201005160614.3749-6-ben.levinsky@xilinx.com>
 <20201005193449.GA701433@xaphan>
 <BYAPR02MB4407B7F06962DB30ED90761FB50D0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <20201006213143.GD701433@xaphan>
 <BYAPR02MB4407B356B56B9A1D561950B7B50D0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <20201006222031.GA809209@xaphan>
In-Reply-To: <20201006222031.GA809209@xaphan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: de157a34-4a40-47ae-c7fb-08d871388393
x-ms-traffictypediagnostic: BY5PR02MB6420:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB64208AB10B762EC4E731C60FB5020@BY5PR02MB6420.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I1TWjhW+62in+FO6J9xp5GyHCOnmG/Zt8CogH3q5N7IZeY9nwTKKBiJEhQeLpmlTYzLAWRSVObBgKydbp9oaVKmYFW8u1WqeLB2XxShfw0gKyrO87YmODAu256EZUUKrtbwx1mGFSCcLRZlaxeq+Xc7+x77jRIRwDKV7FDddagyyA72GMiiE/0wE3iBiG9g7Ss3sDbedo+FhAKbCXqFHnBgf+YAh1+i6qExZkJntUifw+G3wJ/MD0V39wuGnwPh8GXyeUJyQ2fSe/6mEwDHeuss+3YeChvr0EUnysBweNZI4/XMbgQl2PER/5f4/c7GbWraq4UgDLD6otguZfOJlKg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(39860400002)(366004)(376002)(396003)(4326008)(9686003)(478600001)(2906002)(7696005)(86362001)(8676002)(186003)(26005)(54906003)(53546011)(6506007)(76116006)(8936002)(64756008)(316002)(66476007)(66556008)(66946007)(66446008)(83380400001)(52536014)(5660300002)(33656002)(55016002)(71200400001)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: JEMWLCRRr3jpinI463v41MfWMQEC2cJKRL+wKuRL9u7eUOIqde5lSSGNW1FoxgKexlsZep2+3g5uZeFgxW1uu1q0JcAUKMLiHJzCP93Fataqzx8ef/qnGPtwfA5eeWM3Q7yPS0gjCDXwCFE3Lcx4REqptAkS29anbDYPZdSCalSkIdLgVPx277I1L4s3Xma/bGK90YYmtQVfUJbP8rahUygbVcGlqbW1OWOqorZkZV8NFseGqQOtJWqQ01ZLkPIy3TqmUoup2TwNdjJUQXxxwliRhNw7a0zabd/WWG2pk3PSDwrRst6U6cIEovftZXzmGWlgBM9XvT0UcS2JLLxxhlCYyFgFeEK02QukR+FWn+WOqLc/bRU2rg0wr6BhtgWX9PEJHvRQHorZnvfu5bLH8jJ/mLX9Gv+3Gi3jRXFQNuIM7ySPDRv+RL+lfxonEQaB16j+EPDQJi9FSapEQ/BwtjC/OGmZNHrYVPJWnGDgLn38TWDRsHwPClqJeJV+DZQO4HYI7OWT6RWEtj0ypo/41ZEn4s+J+YdV7MA8VckGEPSuQ8GyMDlhrLCpgGOR0UCrDCZc1OEehqTGH62JpXUMGKoEUOpFBjWKNZrxuyFE83g2+ut2cSsiW21v78zhWA+kbI1hfUCcAXRDUBVMfM1vsA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de157a34-4a40-47ae-c7fb-08d871388393
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 18:31:21.0044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9M+XqgW7tPzgBGMxzFhG5jG/fZDIWaQbo+Zg+DTVnEhpQW5JuV6Zf3pb0AKfxwEU2t14z5Ndl2RJ5+qYYKy9MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6420
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi All,

> -----Original Message-----
> From: Michael Auchter <michael.auchter@ni.com>
> Sent: Tuesday, October 6, 2020 3:21 PM
> To: Ben Levinsky <BLEVINSK@xilinx.com>
> Cc: Ed T. Mooring <emooring@xilinx.com>; Stefano Stabellini
> <stefanos@xilinx.com>; Michal Simek <michals@xilinx.com>;
> devicetree@vger.kernel.org; mathieu.poirier@linaro.org; linux-
> remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org;
> robh+dt@kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: RE: RE: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5
> remoteproc driver
>=20
> On Tue, Oct 06, 2020 at 09:46:38PM +0000, Ben Levinsky wrote:
> >
> >
> > > -----Original Message-----
> > > From: Michael Auchter <michael.auchter@ni.com>
> > > Sent: Tuesday, October 6, 2020 2:32 PM
> > > To: Ben Levinsky <BLEVINSK@xilinx.com>
> > > Cc: Ed T. Mooring <emooring@xilinx.com>; sunnyliangjy@gmail.com;
> > > punit1.agrawal@toshiba.co.jp; Stefano Stabellini <stefanos@xilinx.com=
>;
> > > Michal Simek <michals@xilinx.com>; devicetree@vger.kernel.org;
> > > mathieu.poirier@linaro.org; linux-remoteproc@vger.kernel.org; linux-
> > > kernel@vger.kernel.org; robh+dt@kernel.org; linux-arm-
> > > kernel@lists.infradead.org
> > > Subject: Re: RE: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5
> > > remoteproc driver
> > >
> > > On Tue, Oct 06, 2020 at 07:15:49PM +0000, Ben Levinsky wrote:
> > > >
> > > > Hi Michael,
> > > >
> > > > Thanks for the review
> > > >
> > >
> > > < ... snip ... >
> > >
> > > > > > +	z_rproc =3D rproc->priv;
> > > > > > +	z_rproc->dev.release =3D zynqmp_r5_release;
> > > > >
> > > > > This is the only field of z_rproc->dev that's actually initialize=
d, and
> > > > > this device is not registered with the core at all, so zynqmp_r5_=
release
> > > > > will never be called.
> > > > >
> > > > > Since it doesn't look like there's a need to create this addition=
al
> > > > > device, I'd suggest:
> > > > > 	- Dropping the struct device from struct zynqmp_r5_rproc
> > > > > 	- Performing the necessary cleanup in the driver remove
> > > > > 	  callback instead of trying to tie it to device release
> > > >
> > > > For the most part I agree. I believe the device is still needed for
> > > > the mailbox client setup.
> > > >
> > > > As the call to mbox_request_channel_byname() requires its own devic=
e
> > > > that has the corresponding child node with the corresponding
> > > > mbox-related properties.
> > > >
> > > > With that in mind, is it still ok to keep the device node?
> > >
> > > Ah, I see. Thanks for the clarification!
> > >
> > > Instead of manually dealing with the device node creation for the
> > > individual processors, perhaps it makes more sense to use
> > > devm_of_platform_populate() to create them. This is also consistent w=
ith
> > > the way the TI K3 R5F remoteproc driver does things.
> > >
> > > Cheers,
> > >  Michael
> >
> > I've been working on this today for a way around it and found one that =
I
> think works with your initial suggestion,
> > - in z_rproc, change dev from struct device to struct device*
> > 	^ the above is shown the usage thereof below. It is there for the
> mailbox setup.
> > - in driver probe:
> > 	- add list_head to keep track of each core's z_rproc and for the drive=
r
> remove clean up
> > 	- in each core's probe (zynqmp_r5_probe) dothe following:
> >
> >
> >        rproc_ptr =3D rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_o=
ps,
> >                                                   NULL, sizeof(struct z=
ynqmp_r5_rproc));
> >         if (!rproc_ptr)
> >                 return -ENOMEM;
> >         z_rproc =3D rproc_ptr->priv;
> >         z_rproc->dt_node =3D node;
> >         z_rproc->rproc =3D rproc_ptr;
> >         z_rproc->dev =3D &rproc_ptr->dev;
> >         z_rproc->dev->of_node =3D node;
> > where node is the specific R5 core's of_node/ Device tree node.
> >
> > the above preserves most of the mailbox setup code.
>=20
> I see how this works, but it feels a bit weird to me to be overriding
> the remoteproc dev's of_node ptr. Personally I find the
> devm_of_platform_populate() approach a bit less confusing.
>=20
> But, it's also not my call to make ;). Perhaps a remoteproc maintainer
> can chime in here.
>=20
> >

Ping for comments here.

I looked at the TI R5 remoteproc driver and from what I can see, it seems t=
he crux of the line:=20
z_rproc->dev->of_node =3D node;=20
is as follows:

the TI driver only has 1 R5-related remoteproc node. But in this it has inf=
ormation for both cores so
the rproc_alloc's device that is passed in is sufficient for subsequent mai=
lbox calls. This is because the device
here also has a device_node that has the mbox information.

The Xilinx driver differs in that while there is a cluster device tree node=
 that has the remoteproc-related
Information, it ALSO has child R5 cores that have their own TCM bank and mb=
ox information.=20

As a result of this difference the use of devm_of_populate would not remove=
 the use of the line of code in question because the mailbox setup calls la=
ter on still require the device field to have a corresponding device tree n=
ode that
Has the mailbox information.

If it is desired to see the use of devm_of_populate and more close alignmen=
t to the TI driver that has been merged then the Xilinx R5 driver bindings =
can instead have the TCM bank info, memory-regions, meta-memory-regions int=
o R5 core-specific lists which resembles how the TI R5 driver has R5 core-s=
pecific properties. At this point just trying to suss out some direction in=
 this patch series.

Your feedback and review is much appreciated,
Ben


> >
> > With this, I have already successfully done the following in a v19 patc=
h
> > - move all the previous driver release code to remove
> > - able to probe, start/stop r5, driver remove repeatedly
> >
> > Also, this mimics the TI R5 driver code as each core's rproc has a list=
_head
> and they have a structure for the cluster which among other things mainta=
ins
> a linked list of the cores' specific rproc information.
> >
> > Thanks
> > Ben
