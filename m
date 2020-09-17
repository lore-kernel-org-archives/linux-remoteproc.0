Return-Path: <SRS0=Or6o=C2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC77C43463
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 22:50:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC3452087D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 22:50:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="bK3Kj01u"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgIQWuq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:50:46 -0400
Received: from mail-dm6nam11on2042.outbound.protection.outlook.com ([40.107.223.42]:7777
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725858AbgIQWuq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 18:50:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kckCpwHplbEGAt+SO4yjH14TffKFCfZxjDr9Q0m9X7bLCjm+NENDvplaVFQwWzesGKF6+WIR/0w+9gMes+QHLe99PFM5kfgcpF7qnCB2mx7scDKeDkoWdNg7EJjXGhqsAFThqorBhVP88KtOcgQyCD8p1HTafSi/OAJ0qHiuR/3pGsUQSf61s6JeaKK1UgY719E8+y2wZWyvOPT/R1zbY83XFCXX+1Yp3k4RSGuW6A5EQltBIpY22lUZ/CYM6I36pccaB+/LKCDGl9NWZTrTjwwQJkxpEsCmrWU0bHmTaYZMeGQhvtyBYO2jgn+OBvWy4JgKeBD63oLu7MOa2euO/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sOKZHLHkK1mgGZP/iObMu7uDeEW+RWFtoZsLP9+QoQ=;
 b=AAEn7AkCMVjE5JB2kY+ifcF4ve0yrF9Two0TV02Co4qxGaHOyw8x4uRYzj+emd6WF/IJR3ekOlSUUwBncDAey6Q0J0H69sgngjrxClFAhuJxQ05aP13ALvczgvwPy9IQg9NWr61ZchsbnZN8q5noio0h3HQ0kMRXEy6xnAG+cNZMV7ikrzlKbMyZ/cAZjAjL87vtyqMbjB2GJzEPN2jnToCF27dnlbNPBKuePn+x8CQVNLRbWvIvJ6Ut8G+KFTmnxpsYe7m4U7PSmHsNQAfM7ywbDKaitg8x/9dWdH4RR6tI48JUI8mxJ5BdZSuyr8gngU4tG3C4nrDfG4ECF49xzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sOKZHLHkK1mgGZP/iObMu7uDeEW+RWFtoZsLP9+QoQ=;
 b=bK3Kj01u2eMpooHCjq924bETDkdFOKUaT56iVa23i49ocwVt+iboJkrPkYKB89VlKGxPurdmB/mR94mfpoAGIS5IlzLMT40vzo0Bai2bCB1bqQPygKi15sZ7pgQ/Qm17HvVdvr5OgOV4CD3QbeG/EXic7gHbFEVEQWtr0c7gUCA=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by BYAPR02MB5127.namprd02.prod.outlook.com (2603:10b6:a03:6c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 17 Sep
 2020 22:50:42 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::b0f6:b3a:6543:26f5]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::b0f6:b3a:6543:26f5%5]) with mapi id 15.20.3391.011; Thu, 17 Sep 2020
 22:50:42 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     Michael Auchter <michael.auchter@ni.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Topic: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Index: AQHWjSzx2v36zrUuJk25DA+tFuTaOqltZJcAgAAAbzCAAAnbcA==
Date:   Thu, 17 Sep 2020 22:50:42 +0000
Message-ID: <BYAPR02MB4407A552ECBA907DFC3CEC91B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
References: <20200917194341.16272-1-ben.levinsky@xilinx.com>
 <20200917194341.16272-6-ben.levinsky@xilinx.com>
 <20200917221120.GA15530@xaphan>
 <BYAPR02MB44073E7A3BEA401FF4684E95B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB44073E7A3BEA401FF4684E95B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [24.5.142.107]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3440f0b9-3af2-4945-7718-08d85b5c1b31
x-ms-traffictypediagnostic: BYAPR02MB5127:
x-microsoft-antispam-prvs: <BYAPR02MB5127859F8CBC7907DDD1D57AB53E0@BYAPR02MB5127.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gS3/TwZ1wrOUJ1XkfjoQgzRWbO7kvVssWAgrv6tEHK96ee+PGXEy1cx6qQ+1Jtu53Xcu/jf2ZRWMrGK/UFUfM4FXx73BqjM2PSvKh+FUgoFoD/+1OJyqVmImurfTk0tB6Y3yoYYMBpIy0TZUYx73DyflvLGtx66CSZojDXfid+QqAgLyYZFAwvRRbpetQeTaTDuly6duEW+SBONuWLqVwf/uGzFVXl0UWpuI8aq4Bx9YOcwP3K1FA+WgSzaiocl6HD5ULsic5h0wPP9RuBeyWfqujlS8ZytD1mFNbLRqhSU5feGhyf2I2nfGkrx1iz4auRpBdRk1TPPoqga9brZ5sR9VXny3otI5Bj/axJRnwjlGkcBgm7o3hrlJK4Vytb2H
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(346002)(366004)(39860400002)(136003)(4326008)(54906003)(83380400001)(8676002)(52536014)(8936002)(33656002)(66946007)(71200400001)(5660300002)(76116006)(66556008)(64756008)(66446008)(66476007)(186003)(2940100002)(86362001)(2906002)(7696005)(9686003)(55016002)(316002)(6506007)(53546011)(478600001)(26005)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: g2an5XUhrZMQ4QzDzdkHtDwpLADXtd2OVw6sQXAD7qKaE6eIzqUdT/86LvX57v6YvU+i6cR67H2JxJNWMzPDp4n1dIiRZSRvqnXhz6WQ4UWeMiatmH0wLaSHpgQBll7DYyPPwmo+zm0OSX+Eu7LrU+8VSodA/hFIfi3ghp/vIaGG1jPtL6VKUiVV7MkpJtpTVBUzunav0WS/YvgxHjawlhnkhDaG5VfqdNlc+zUtM8IJDadwXtNf3Oad3IpsmwpL2sKNUqnZYx//gIjPSwM/Z3XKwk62Gd2+T8yQ8Ktjo5MUgJv2nnwDnFvYqB3JYxwSKdDDk6vk11HdtwUB0FhqGfGmte6hUJMXjzOu92eytkGfuyfeitmeSD1/HemS045Gj6CeZFT4oeMwjPhQvsx5eefHBpdCdocpV1N9U7cT/s1JWCa4P1uqIM5iYiT1XWWaBQw+0LWsOf0wm+jOfKLl72jzGfZfDF16D274KpGkyy835DV9fw/NzRIQIq7ul9blKmEEkWv9OogyEs3LgSh01alGB2qdeDaAJ07c6JJnuZdC5qiEa3sw4niHu1QEZmLp/+Z4UGomgF9UrHiEBrivSbP2MzytEeQDDZ3ug8b+iacOlksKQQ2TqnrnsTX8cIb3AErVu/l3t86fEKirIXUdHg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3440f0b9-3af2-4945-7718-08d85b5c1b31
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 22:50:42.3041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zO6pj6LHN8Tj7+/keujHQwh5l2EzEuYZrkiR0Q/Dn3Tz1Ywr2MpF3maWApQyZe0a+Vnuu4VPcJrNZCGu6MaHSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5127
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> -----Original Message-----
> From: Ben Levinsky <BLEVINSK@xilinx.com>
> Sent: Thursday, September 17, 2020 3:19 PM
> To: Michael Auchter <michael.auchter@ni.com>
> Cc: punit1.agrawal@toshiba.co.jp; Stefano Stabellini <stefanos@xilinx.com=
>;
> Michal Simek <michals@xilinx.com>; devicetree@vger.kernel.org;
> mathieu.poirier@linaro.org; Ed T. Mooring <emooring@xilinx.com>; linux-
> remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Jiaying Liang
> <jliang@xilinx.com>; robh+dt@kernel.org; linux-arm-
> kernel@lists.infradead.org; Jiaying Liang <jliang@xilinx.com>; Michal Sim=
ek
> <michals@xilinx.com>; Ed T. Mooring <emooring@xilinx.com>; Jason Wu
> <j.wu@xilinx.com>
> Subject: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc
> driver
>=20
> Hi Michael,
>=20
> Thanks for the comments,
>=20
> > -----Original Message-----
> > From: Michael Auchter <michael.auchter@ni.com>
> > Sent: Thursday, September 17, 2020 3:11 PM
> > To: Ben Levinsky <BLEVINSK@xilinx.com>
> > Cc: punit1.agrawal@toshiba.co.jp; Stefano Stabellini <stefanos@xilinx.c=
om>;
> > Michal Simek <michals@xilinx.com>; devicetree@vger.kernel.org;
> > mathieu.poirier@linaro.org; Ed T. Mooring <emooring@xilinx.com>; linux-
> > remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Jiaying Liang
> > <jliang@xilinx.com>; robh+dt@kernel.org; linux-arm-
> > kernel@lists.infradead.org; Jiaying Liang <jliang@xilinx.com>; Michal S=
imek
> > <michals@xilinx.com>; Ed T. Mooring <emooring@xilinx.com>; Jason Wu
> > <j.wu@xilinx.com>
> > Subject: Re: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remotepr=
oc
> > driver
> >
> > Hey Ben,
> >
> > Split mode is still not functional in this patch series (as was the cas=
e
> > with the last few revisions).
> >
> > Before sending out the next revision, can you _please_ ensure you're
> > testing all supported configurations?
> >
> [Ben Levinsky]  I will make sure to update in next revision.
>  As per review, I tested on QEMU and hardware firmware loading in split
> mode on R5 0 split, R5 1 split and R5 lockstep and  was  able to successf=
ully
> load, start and establish IPC links
>=20
> That being said, I will update the to reflect the values between the enum=
 for
> rpu operation mode and the documentation in the binding.
>=20
> For testing, I can provide a pointer to a publicly available device tree =
I am
> using if that helps. If not, can you expand on the testing of supported
> configurations?
>=20
In addition to device tree, is there particular linker script you use for y=
our R5 application? For example with OCM? As presently this driver only has=
 DDR and TCM as supported regions to load into=20
And I planned to add OCM support if/when the driver gets in.

Thanks,
Ben
> > On Thu, Sep 17, 2020 at 12:43:41PM -0700, Ben Levinsky wrote:
> > > +/**
> > > + * RPU core configuration
> > > + */
> > > +static enum rpu_oper_mode rpu_mode;
> > > +
> >
> > <.. snip ..>
> >
> > > +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> > > +{
> > > +	int ret, i =3D 0;
> > > +	u32 lockstep_mode;
> > > +	struct device *dev =3D &pdev->dev;
> > > +	struct device_node *nc;
> > > +
> > > +	ret =3D of_property_read_u32(dev->of_node,
> > > +				   "lockstep-mode",
> > > +				   &lockstep_mode);
> > > +	if (ret < 0) {
> > > +		return ret;
> > > +	} else if (lockstep_mode !=3D PM_RPU_MODE_LOCKSTEP &&
> > > +	    lockstep_mode !=3D PM_RPU_MODE_SPLIT) {
> > > +		dev_err(dev,
> > > +			"Invalid lockstep-mode %x in %pOF\n",
> > > +			lockstep_mode, dev->of_node);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	rpu_mode =3D lockstep_mode;
> > > +
> > > +	dev_dbg(dev, "RPU configuration: %s\n",
> > > +		lockstep_mode ? "lockstep" : "split");
> >
> > The binding documents lockstep-mode as:
> >
> > > +  lockstep-mode:
> > > +    description:
> > > +      R5 core configuration (split is 0 or lock-step and 1)
> > > +    maxItems: 1
> >
> will update this as you note so that lockstep and split mode are accurate=
ly
> reflected.
>=20
> > (Which needs to be reworded, but it looks like the intent was "split is
> > 0 and lock-step is 1")
> >
> > However, rpu_oper_mode is defined as:
> >
> > > +enum rpu_oper_mode {
> > > +       PM_RPU_MODE_LOCKSTEP =3D 0,
> > > +       PM_RPU_MODE_SPLIT =3D 1,
> > > +};
> >
> > so the assignment "rpu_mode =3D lockstep_mode" is incorrect.
> >
> once the binding is updated, why would this still be incorrect? Assuming =
the
> documentation is updated, the above line would be ok, right?
>=20
> Thank you for the review
> Ben
>=20
> > - Michael
