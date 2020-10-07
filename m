Return-Path: <SRS0=blvA=DO=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595BCC4363D
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Oct 2020 14:31:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7526206A1
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Oct 2020 14:31:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="PsshQQs6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgJGObX (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Oct 2020 10:31:23 -0400
Received: from mail-eopbgr760080.outbound.protection.outlook.com ([40.107.76.80]:62628
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728623AbgJGObX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Oct 2020 10:31:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l3aD0s5m2H/Miw1sHQCgQSqv2/nq77TF91lhPKcmQjI+xzzkK2nJDvGkqugjzVACrx17tIljHA/TE1FAPsxYjkW4WZ43X6Evq+k7cABHbv1P1ZNIfZ2nb6FFMV1TngucTjp+RQCJCYA39Dz8K7FnWAUkkQGiSsw88VznJ5bpxoRep/PapZH7y8581a0xOiND9B9dwWjoLGLq8b2Z6qffxf76fh7Sog5MC8rGrqpmp2LvPFalM1qjUNHJq2WTm4rnwQ4JhXTfns+Mk2uCN53mNntyqQ7nsiFM9oMWZAbeIR9werphaBeMQLFDlN8NaYZSGVXFiSWcaVjBwdUMOb9rnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUD/Ljq/uahmzlJgbnUAbDbam1CjxHjrAcGWwt2tasg=;
 b=E/qfWdqkInMh9AxP+O8qb7S4vwR20ibhfNCEHy/opcz9sLsEaMVfoOJzFhmIq32BRXR4Va5W9ejN8xAuHw7ctNqmp4+owQGNZSU9SWnFizfLzhXmRwEgxggXf2qD4tUe4FYKNTiHKA+o7UnX03SDCFAMkVJKeSgPkGAMHCbQyRSqUVyd8XsmZGTZvtQt0bSwXx4FwoT0V4RM9kUDexE9RxlNnfXr0EeYsSrUjZXSGGI1rneLvarIRxgzinTBCzzEAWd0wj5mdpkYn+G/VcgrTEBu6iifpRIsNS9mJ2/KEH2gbIx9SnOil3qikVFTTYOS/18p4eDa2ssifP3kzwS+3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUD/Ljq/uahmzlJgbnUAbDbam1CjxHjrAcGWwt2tasg=;
 b=PsshQQs6n4reo1BfxmSElUIuXKi63ypJ7eRMC8LIPPby+6R+uBvShYApZhziWesUm10ciWKiZY2H/AhqRcUsxR5TGMDpa/KiB+BzzP3u6gLOdfrS0cKXmQLyj/U11s6xpk3lxx7fKCC0l9mFa8ek6TjKLykgYzxVYmJDUizI6ns=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by BYAPR02MB5720.namprd02.prod.outlook.com (2603:10b6:a03:118::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.39; Wed, 7 Oct
 2020 14:31:16 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e%6]) with mapi id 15.20.3433.044; Wed, 7 Oct 2020
 14:31:16 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     Michael Auchter <michael.auchter@ni.com>
CC:     "Ed T. Mooring" <emooring@xilinx.com>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: RE: RE: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5
 remoteproc driver
Thread-Topic: RE: RE: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5
 remoteproc driver
Thread-Index: AQHWmzGLZdXOwIwjxE6bV2X+UlYToKmJZsqAgAGMKFCAACbWgIAAAZmggAAMCYCAAQr1UA==
Date:   Wed, 7 Oct 2020 14:31:15 +0000
Message-ID: <BYAPR02MB44071E3F9D431CBC72920E4AB50A0@BYAPR02MB4407.namprd02.prod.outlook.com>
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
authentication-results: ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2646ac6e-22c9-4af6-a255-08d86acda667
x-ms-traffictypediagnostic: BYAPR02MB5720:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5720691FE587D4A6833824DBB50A0@BYAPR02MB5720.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qbunmd6mIJZgHoGXjl5n0zaOsHwPfmFH9uUEwsxU2p1XZ0urh9jpLSaYko9K6dXooTpAOYKMb/+MeKprPjktxeW8lo59RUiDCu6/m0KqVQXFvWcaa2fgTYX4HyU8Eaktf3lvb3TqMlf21738JCTCUqghp+MZXo1UvNZ8yoTun7kGm8v0MKKaN93oDpvAjHflIJz2nWiEsn6kYa3skez7aGi9GHQRNWOu03tGTgCdvae1WPslGL+mcDCVgvdnZvXsPwZb7B8DH6yRXc06j002RVZPReelEL982SzvKOaSkaulWcuKCgHHp3Eo/DqY4/cL8p7RYxPkehsvBZQtSG8Q78Ti1kWQyHaCeSSA2Qbn/CPCWg6gemxxTt8z4F62yqXEGk+upWTY3ZXPXOS4bHm8mA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(39850400004)(136003)(396003)(83080400001)(83380400001)(8936002)(53546011)(478600001)(26005)(54906003)(52536014)(33656002)(316002)(966005)(5660300002)(186003)(6506007)(7696005)(6916009)(4326008)(66446008)(9686003)(86362001)(71200400001)(66556008)(8676002)(2906002)(66476007)(64756008)(66946007)(55016002)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: kNYZuMu8TKKiFdHzlafd4EzrgrlM3OO+1zbeb85tpmidCnZOtsnlzHYoHYaqeCatsEqEBw/Cprgo5MOZ8FkXyJCJMKQESq2wJS0WsZ86C3nqPzjzQ/DSaKJD9Npw4buVVHudDwuVcy/tInprOtPaCymYsCxzgbMCyQDJqtrp+6QatqftPI7meAR0uMQwug7SkhTvknxqTdh7CleL/thWds+GrEZ2Zqe9/rjiaIjXG0OvQbzmQkJZBTbsiYI8Nzc+ShTYg94upK4FdddFpQlHSn58P1fNWto0IVxjH9BUykqaREaqqoXUZM9rhOfS31HNTHECsQcNM0dv7BXAhDGBhjUbaQlVTgnXePMqYOaQ+i3SKT4htfXWHz0fqk+fwcEFPAz8J0hbHW+9TXB0gGvp/bWcFc2BR3TW32yjQGCexNkuCqAfOOP/uf9psThtHdoDIeZt1Q1BOJk1RyF40f3qQQFx5oIn5WK4hRNtDLe2whqz/U1LXso05GV5RCnwv8/jRlXnYFmHUzes0eoJ9VJHW//hRCHMjm8lfjhXetiNzporWvXkJMHbAM8hWBNVDDJ1wpFAf5beHAMLWQ4PArsw2s4zSyKRZ8b/TPN+f6I2AnzcSLfdO6UV+gLBttwXdmr7Hq+tWA+KiJCe6ehSg2KzPg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2646ac6e-22c9-4af6-a255-08d86acda667
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 14:31:15.5650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dk63FH4KdGRP3+csdQ0/M2GN7eYqrS3iaaURr769/LZ/Y5IDnBCBXgPY4UedsxFzSLcNavTzhjymC7e8bKr8Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5720
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



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
Fair enough. The way I see this, there is still a need for a struct device*=
 in the zynqmp R5 rproc structure.

If we look at the TI K3 R5 remoteproc patch, https://patchwork.kernel.org/p=
atch/11763795/ ,
there is a call to devm_of_platform_populate in k3_r5_probe similar to your=
 suggestion. I can look to emulate it similarly in the Xilinx remoteproc dr=
iver.

Even still there is a usage of the struct device * in the TI K3 R5 remotepr=
oc structure for the same reason of setting up mailbox for each core as det=
ailed below (can be found in the same link I posted):


** here is where the device* is stored at probe
- k3_r5_probe calls k3_r5_cluster_rproc_init=20

static int k3_r5_cluster_rproc_init(struct platform_device *pdev) {
    struct k3_r5_rproc *kproc;
    struct device *cdev;
    ......<snip>...
	core1 =3D list_last_entry(&cluster->cores, struct k3_r5_core, elem);
	list_for_each_entry(core, &cluster->cores, elem) {
		cdev =3D core->dev;
                           ......<snip>...
                           kproc->dev =3D cdev;
...
}


and then back in the mailbox initialization:
static int k3_r5_rproc_start(struct rproc *rproc) {
    ...
    struct k3_r5_rproc *kproc =3D rproc->priv;
    struct device *dev =3D kproc->dev;
    ...
    client->dev =3D dev; <--- this is needed when requesting the mailbox
This needs to be device with the corresponding of_node that has the mbox-re=
lated properties in it




This is the example I based my usage of the struct device* field in the Soc=
 Specific remoteproc structure off of.
Given that I can still proceed and update with the other suggestions?

Thanks
Ben

> >
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
