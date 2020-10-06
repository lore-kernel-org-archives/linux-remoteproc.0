Return-Path: <SRS0=oRpn=DN=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7145C41604
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Oct 2020 21:46:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55A322083B
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Oct 2020 21:46:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="hg9PMRw8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgJFVqn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Oct 2020 17:46:43 -0400
Received: from mail-mw2nam10on2089.outbound.protection.outlook.com ([40.107.94.89]:7230
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725947AbgJFVqm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Oct 2020 17:46:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5jAnb5YbiRPAsbD0IdxXNeAulfKex1EDQMeqNFb/4U9UgwKr8j7DzO33MeJR+C2l3KR8c1S+GRvcqSlTlD5Rf3M7W0BcJAJKxzZf7+N93yscfQ1cMnxxNy4KlcFDxshm7idFYsngW8ZVE9obqU2Iwt5dXL0b3+6t0Im6i4x/seLk/KnDltedttNLQF2kO8o35RYZFxkoLoms6Bsw0Ss9Eyv5rQV5ukzXBt64Hmz/vbrAmkyZ6lzQBzxszsSnzfDVA0WlrZewBFurcDJfZo6GzOO6a3J+3Nih6ThhdEYMN815iFT540JXMCCLbHZXgHHwJMoraUZQEnLLhWrmSTzqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdAD1nTQ87pa/VZRZFD0KrbHwszvwHDq8yWpbcgBG6o=;
 b=UhcdFf79gf9OydRnOdSNdBfsAFhc1gc7p2vnIbGNCk/uEZb6wI9aZ+QDfP3VigCQzs8/inzBwFLsbxJfPadJTAsr2vCUzZgA+Kb9cmgeT7B2x9lixXua43hLf9x5D5+luuQBN+i1ewZVaUjNSldEYDKw3H7+q58PzYEye6+zUnYUz6ZsYDDloCwNn/p9tCjpSQZ5ak41sNBPsTTNz6ADEgklGYAs1JSVeUAF7g9hIsE6hl19OmPB4TCVRGUJqQh7ZizKeUka6n1CurNcLVkBsAeatB3VwfmRjhDEsAnvnSmbZoJI44va/FixeTCq6TrZPmQpuF5az1Ur/FbPIuMzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TdAD1nTQ87pa/VZRZFD0KrbHwszvwHDq8yWpbcgBG6o=;
 b=hg9PMRw8onkUk64OGmfQEcaLm8K0FVk6HrXpAOdHW6OE5qnKtaYDzIDws7ZTkO/Up8+l00O5LyKloB90DArfuCK7q1S39gRrU/M25w6sEOpYCTauCFBGZiHNKHW2s/5cVppDWo7UVTF6Pd+pZRb2r0npc4aP9c9QceOLtJ3+cto=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by BYAPR02MB4151.namprd02.prod.outlook.com (2603:10b6:a02:f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.38; Tue, 6 Oct
 2020 21:46:39 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::113d:722:5f93:d29e%6]) with mapi id 15.20.3433.044; Tue, 6 Oct 2020
 21:46:38 +0000
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
Subject: RE: RE: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Topic: RE: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Index: AQHWmzGLZdXOwIwjxE6bV2X+UlYToKmJZsqAgAGMKFCAACbWgIAAAZmg
Date:   Tue, 6 Oct 2020 21:46:38 +0000
Message-ID: <BYAPR02MB4407B356B56B9A1D561950B7B50D0@BYAPR02MB4407.namprd02.prod.outlook.com>
References: <20201005160614.3749-1-ben.levinsky@xilinx.com>
 <20201005160614.3749-6-ben.levinsky@xilinx.com>
 <20201005193449.GA701433@xaphan>
 <BYAPR02MB4407B7F06962DB30ED90761FB50D0@BYAPR02MB4407.namprd02.prod.outlook.com>
 <20201006213143.GD701433@xaphan>
In-Reply-To: <20201006213143.GD701433@xaphan>
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
x-ms-office365-filtering-correlation-id: 4681fa18-883b-4e78-caa3-08d86a414e25
x-ms-traffictypediagnostic: BYAPR02MB4151:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4151C3620BA2F15343B7A5EFB50D0@BYAPR02MB4151.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AgwpODvDvDUW7ttFn0ow1MvmzuFozn5GymhcmLXNpOrzeI/c+CdXwEc5f5xSe/hkpodi1ZfRaF6Udd8yT1yULRqor7hUdsyOBm1dG9eEo5P77Ykvep79j9EdyJx69WKVnpEgTKcWWzm4JTKAWlhcTBPi2cOQOH5+ZQE/o7deH66vfPlNFPIvVwIjPpIJwFM33QUQAqa7KvtARf3r4XiS2KCNz42+Q86WsoJx0pZxcv05Zww0JY3lEe8UXjQQNUNuspOmZ+jm31tTfu+7HsK3I1RqEE4e1TlEw2UAOrg+sid6nZ10iQ9Rfi0rpuZrdP44
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(366004)(136003)(346002)(376002)(316002)(4326008)(66446008)(86362001)(76116006)(71200400001)(54906003)(478600001)(6506007)(53546011)(26005)(83380400001)(7696005)(186003)(2906002)(66556008)(66476007)(52536014)(64756008)(8676002)(9686003)(55016002)(66946007)(5660300002)(6916009)(33656002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: mNFO8cP7N2NIC9e1Hm/ba3HSxBoxzOWwR9rIa7M2GpBt13x1exp72KK9UfxVxj0VAacUgXEOI8KiqfXoDGlUMZybFpB4vNyNN5nHubN/ZP6a1sHWjktUGeJ0/f1RiYNy2llqRcZUL0Sxs1cAXdYxETiOHnM83spdsZhmVvP0zq4SfbTTwkPix/JTaEsTc1ixSJnMaQQgDtyFzHQi0yIfeTZln70u/F7FplL+d9Nw/pgslzOlDpPCHYdyexLepXU/IIQItLzESIhNVYAPJ1s4TW5TZVtfhQ2J6cqO+ZRbnkkIQBEZZSHtYUtTP7rtC0LBkZT4hkapeQ6cv6CL9f1iNgWw+62wQohMBz0BN7sKtHTSpA6YjvXeE/vtDFUNhkeg9MSghs2xrTNtKRHw0KaBRdcyxuiETTaLp76NSIE53zzsNy4elO6x/JRogjinDBhbNnbGe4mZwRluMdI5tTt0AAgnqDNfStBaV6QCpGXmvoux3t7xhVhQ8I7DSOaTdoEwJRqHeyeWvL2m2dRS7ng4GZl1XiD3N9hcDzV83QuwGTWpCe13dEwTxS7O2ypB82zBNrGtf4N2tJLp/5Lck8BPuQg1EmDby2i6B3PeG1HOWF/cWGq6YVRwqPW/7n+6oNgWecilRkxk3oAoV7Lk4sJ9UQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4681fa18-883b-4e78-caa3-08d86a414e25
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2020 21:46:38.8243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kA0TSkQRCLOZVLG9eUatAW8J3hm5mLvXEerwQfcqYk1CqBapdmLvD9NWaAslOLZWVUKn8uAYCcQzEIJ9hnir/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4151
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



> -----Original Message-----
> From: Michael Auchter <michael.auchter@ni.com>
> Sent: Tuesday, October 6, 2020 2:32 PM
> To: Ben Levinsky <BLEVINSK@xilinx.com>
> Cc: Ed T. Mooring <emooring@xilinx.com>; sunnyliangjy@gmail.com;
> punit1.agrawal@toshiba.co.jp; Stefano Stabellini <stefanos@xilinx.com>;
> Michal Simek <michals@xilinx.com>; devicetree@vger.kernel.org;
> mathieu.poirier@linaro.org; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; robh+dt@kernel.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: RE: [PATCH v18 5/5] remoteproc: Add initial zynqmp R5
> remoteproc driver
>=20
> On Tue, Oct 06, 2020 at 07:15:49PM +0000, Ben Levinsky wrote:
> >
> > Hi Michael,
> >
> > Thanks for the review
> >
>=20
> < ... snip ... >
>=20
> > > > +	z_rproc =3D rproc->priv;
> > > > +	z_rproc->dev.release =3D zynqmp_r5_release;
> > >
> > > This is the only field of z_rproc->dev that's actually initialized, a=
nd
> > > this device is not registered with the core at all, so zynqmp_r5_rele=
ase
> > > will never be called.
> > >
> > > Since it doesn't look like there's a need to create this additional
> > > device, I'd suggest:
> > > 	- Dropping the struct device from struct zynqmp_r5_rproc
> > > 	- Performing the necessary cleanup in the driver remove
> > > 	  callback instead of trying to tie it to device release
> >
> > For the most part I agree. I believe the device is still needed for
> > the mailbox client setup.
> >
> > As the call to mbox_request_channel_byname() requires its own device
> > that has the corresponding child node with the corresponding
> > mbox-related properties.
> >
> > With that in mind, is it still ok to keep the device node?
>=20
> Ah, I see. Thanks for the clarification!
>=20
> Instead of manually dealing with the device node creation for the
> individual processors, perhaps it makes more sense to use
> devm_of_platform_populate() to create them. This is also consistent with
> the way the TI K3 R5F remoteproc driver does things.
>=20
> Cheers,
>  Michael

I've been working on this today for a way around it and found one that I th=
ink works with your initial suggestion,
- in z_rproc, change dev from struct device to struct device*
	^ the above is shown the usage thereof below. It is there for the mailbox =
setup.
- in driver probe:
	- add list_head to keep track of each core's z_rproc and for the driver re=
move clean up
	- in each core's probe (zynqmp_r5_probe) dothe following:


       rproc_ptr =3D rproc_alloc(dev, dev_name(dev), &zynqmp_r5_rproc_ops,
                                                  NULL, sizeof(struct zynqm=
p_r5_rproc));
        if (!rproc_ptr)
                return -ENOMEM;
        z_rproc =3D rproc_ptr->priv;
        z_rproc->dt_node =3D node;
        z_rproc->rproc =3D rproc_ptr;
        z_rproc->dev =3D &rproc_ptr->dev;
        z_rproc->dev->of_node =3D node;=20
where node is the specific R5 core's of_node/ Device tree node.
=09
the above preserves most of the mailbox setup code.


With this, I have already successfully done the following in a v19 patch
- move all the previous driver release code to remove
- able to probe, start/stop r5, driver remove repeatedly

Also, this mimics the TI R5 driver code as each core's rproc has a list_hea=
d and they have a structure for the cluster which among other things mainta=
ins a linked list of the cores' specific rproc information.

Thanks
Ben
