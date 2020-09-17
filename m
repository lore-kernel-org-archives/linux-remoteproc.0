Return-Path: <SRS0=Or6o=C2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B0AC43465
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 22:18:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03AE820874
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 22:18:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="mT+V+pD1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725987AbgIQWSp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:18:45 -0400
Received: from mail-dm6nam10on2042.outbound.protection.outlook.com ([40.107.93.42]:7680
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725858AbgIQWSp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 18:18:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBC3aM3p9d7bFPig7JEwDy45VknGqgQIdM36BgtIDQC3DSlZ9pfr7V53eoa2zHB+P7ZTUKHXUd1GSxVg8Y3c+V1nZqel1BRcPrNKh0ri5xtYbg/4vy1gQjL4u6+SpmCHl8EJWa/78aU2gLXrvj0VX3XYFs2G6pqvOuwV14TdABCH8HEvK2yXc013gCWKIxNR2ojrO9eJ+SHMWrUgS/FjwU49lphkiZ0ey3SmHBT/6nEDRU3f5rOSKApRvdIshmzA/bHLR+azJfo0Ths6j9rHNpguTwE7nTUNMVsss9+ls/O3eMsL6lHOtk591kG5b94zyeuM7eEDzrGxfnQUZerKkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yky8QWWp7nfqWOZYSaPa/RiXeDZ9Ao7IcTYvRPZn2YE=;
 b=Ozj02uUoVVopaEkf1iW5iJtJsIjYkAs2NTsuTO5psMx11ecXamx1uYUDn/rSN57h9+Z9r1alcBa7FfRk3J+rAmYlU7Ks54+l4d49AJLQsQ68guc1ORt2cisBIrXMNRcopYPrIcRxXfgKcqZp8JyTVhlg/P34uEtIPEcdYPD4x6CZENPDyPF3IDVixTjyfVOXgbrJTxO+exd7U9cmAvfaPvS6ue1r+TrpQbuTsixVy4mLmmW8j91kpYxR80eDDlMzPm0d+hhG5Mv/4i7WRbf+XtJSnQx3OsTcb5YG4yeW1zGV0to8qNtIsKRYTZDq0D9x5myYdQrmKY3mGLRFn/IPMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yky8QWWp7nfqWOZYSaPa/RiXeDZ9Ao7IcTYvRPZn2YE=;
 b=mT+V+pD1nT1ranxgCWd1DnDwm+MK4E7P4nxmGAnb+vnrfcs1nLEuU3ZedD6bvZJA9J2ni/4sAP2rzRIemBRRPO2mrLr7GiPi6vzL0djbO0xp/GJdlIbH19Gjb3WWNmyteGaEUb3//6fpvJ6iqO5UWJqXpAVBXHYFBt0y382WWdU=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by BY5PR02MB6961.namprd02.prod.outlook.com (2603:10b6:a03:23b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 17 Sep
 2020 22:18:41 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::b0f6:b3a:6543:26f5]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::b0f6:b3a:6543:26f5%5]) with mapi id 15.20.3391.011; Thu, 17 Sep 2020
 22:18:40 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     Michael Auchter <michael.auchter@ni.com>
CC:     "punit1.agrawal@toshiba.co.jp" <punit1.agrawal@toshiba.co.jp>,
        Stefano Stabellini <stefanos@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "Ed T. Mooring" <emooring@xilinx.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiaying Liang <jliang@xilinx.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Jiaying Liang <jliang@xilinx.com>,
        Michal Simek <michals@xilinx.com>,
        "Ed T. Mooring" <emooring@xilinx.com>, Jason Wu <j.wu@xilinx.com>
Subject: RE: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Topic: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc
 driver
Thread-Index: AQHWjSzx2v36zrUuJk25DA+tFuTaOqltZJcAgAAAbzA=
Date:   Thu, 17 Sep 2020 22:18:39 +0000
Message-ID: <BYAPR02MB44073E7A3BEA401FF4684E95B53E0@BYAPR02MB4407.namprd02.prod.outlook.com>
References: <20200917194341.16272-1-ben.levinsky@xilinx.com>
 <20200917194341.16272-6-ben.levinsky@xilinx.com>
 <20200917221120.GA15530@xaphan>
In-Reply-To: <20200917221120.GA15530@xaphan>
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
x-ms-office365-filtering-correlation-id: 8e67a53f-924f-4740-2e4e-08d85b57a1ad
x-ms-traffictypediagnostic: BY5PR02MB6961:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB6961056CEB70E85871EE8CE2B53E0@BY5PR02MB6961.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jrnYseDDknJUfzzWL0bCZntLNrhTIai/1R2gR4KPj8PEbc6YrnWij/jQZtH9ra0S5n0PdTY3WfyLNUgx4duq3v4lnOlBd4Y/YY/qTFUHdr5RMZrgma4is/iAGZuq1Xb6RU+lvV2p/gDY1E8ykg+OAX1Clfgz3OPOwY+q31rpy9Vtx0zpCkRV9+hyafuC2lTNxKJ0eO35Efp2iol7rPfNoUaxP7EQd/qnkBgFzlxhHGnXCtymqVcpJJIWcEI/yVrP93sk4gTAeZlN0ya+obDlseV+k6aofBewdOsD3xNGULoBXNL52sR+FbotkArEAUbi/FrSVKC4Ptl6dplu01S/Tw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(136003)(366004)(346002)(39860400002)(33656002)(4326008)(66946007)(107886003)(6916009)(478600001)(8936002)(71200400001)(66446008)(64756008)(316002)(66556008)(66476007)(186003)(86362001)(52536014)(5660300002)(8676002)(76116006)(83380400001)(2906002)(54906003)(55016002)(9686003)(26005)(6506007)(7696005)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: hFe+v4/ZUMZnG6GWl3d+iZzicro5+NrXsvu19Q+bK18KMqRIg5kki0KnRVtITCSGwX2GZ0Yz1LK39cMakHkcPppMLc0Irk/TXdbzjCbiHvJgpRdSrcf+9BhF9HlgH2wFcGE56svVgoSNOqFRNGr7XodxbGO5Xk3qUO4DP9tj4nQXI8FH+nFRtheepjtKRDN18gCDx9HKO8YiTqZYcrNf0P7qci417s5ATpcj1ATpP0B78nCAGRe0dO/OF5BJmLq+cchHRMJQzY1BWRf+ki2b/WNCIvJSkt+7yxe2jEz8FF0M+euW1qWv81JfGPQbYBNN1cZv+j2ydWg+M0fMXhHCW8ebnGRm8eC2pkNk70sRBXVJzL70yFoZi6dkwy/MRIhxU0bDD0nEuoxeBpfjb223UaR4XkOUM4Sb0raFX6x2fxAberTUHAikGeo8pYotA+FQdnwJj+FdarFxzLMFmPZpgwfrw18BkRS27K2rPgwv1MLRd96T2Zfkfkw689v5kN90PsbILzhAEqjYxGbRxJzrIsNIlsj6Rdj3dAmw5WMs68bIXvzJHNCRIIVZz/7Hmn8Sp7rMw8y4xOUzoExc/PiT0vFee1sacWLm+sMY7cILso2dqs0BPeWeR3cvS8ycygEiZzBW6hJpW31SGJFrds+VEA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e67a53f-924f-4740-2e4e-08d85b57a1ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 22:18:40.3600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ylBp/00vcBb9n0cdmGAABLmWnugt7g9WlHnhWNIGaWsrjSvNkTJgncdZYBdzi3rbDmTecUNEMDvyWO031tBDmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6961
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Michael,

Thanks for the comments,

> -----Original Message-----
> From: Michael Auchter <michael.auchter@ni.com>
> Sent: Thursday, September 17, 2020 3:11 PM
> To: Ben Levinsky <BLEVINSK@xilinx.com>
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
> Subject: Re: [PATCH v14 5/5] remoteproc: Add initial zynqmp R5 remoteproc
> driver
>=20
> Hey Ben,
>=20
> Split mode is still not functional in this patch series (as was the case
> with the last few revisions).
>=20
> Before sending out the next revision, can you _please_ ensure you're
> testing all supported configurations?
>=20
[Ben Levinsky]  I will make sure to update in next revision.
 As per review, I tested on QEMU and hardware firmware loading in split mod=
e on R5 0 split, R5 1 split and R5 lockstep and  was  able to successfully =
load, start and establish IPC links

That being said, I will update the to reflect the values between the enum f=
or rpu operation mode and the documentation in the binding.

For testing, I can provide a pointer to a publicly available device tree I =
am using if that helps. If not, can you expand on the testing of supported =
configurations?

> On Thu, Sep 17, 2020 at 12:43:41PM -0700, Ben Levinsky wrote:
> > +/**
> > + * RPU core configuration
> > + */
> > +static enum rpu_oper_mode rpu_mode;
> > +
>=20
> <.. snip ..>
>=20
> > +static int zynqmp_r5_remoteproc_probe(struct platform_device *pdev)
> > +{
> > +	int ret, i =3D 0;
> > +	u32 lockstep_mode;
> > +	struct device *dev =3D &pdev->dev;
> > +	struct device_node *nc;
> > +
> > +	ret =3D of_property_read_u32(dev->of_node,
> > +				   "lockstep-mode",
> > +				   &lockstep_mode);
> > +	if (ret < 0) {
> > +		return ret;
> > +	} else if (lockstep_mode !=3D PM_RPU_MODE_LOCKSTEP &&
> > +	    lockstep_mode !=3D PM_RPU_MODE_SPLIT) {
> > +		dev_err(dev,
> > +			"Invalid lockstep-mode %x in %pOF\n",
> > +			lockstep_mode, dev->of_node);
> > +		return -EINVAL;
> > +	}
> > +
> > +	rpu_mode =3D lockstep_mode;
> > +
> > +	dev_dbg(dev, "RPU configuration: %s\n",
> > +		lockstep_mode ? "lockstep" : "split");
>=20
> The binding documents lockstep-mode as:
>=20
> > +  lockstep-mode:
> > +    description:
> > +      R5 core configuration (split is 0 or lock-step and 1)
> > +    maxItems: 1
>=20
will update this as you note so that lockstep and split mode are accurately=
 reflected.=20

> (Which needs to be reworded, but it looks like the intent was "split is
> 0 and lock-step is 1")
>=20
> However, rpu_oper_mode is defined as:
>=20
> > +enum rpu_oper_mode {
> > +       PM_RPU_MODE_LOCKSTEP =3D 0,
> > +       PM_RPU_MODE_SPLIT =3D 1,
> > +};
>=20
> so the assignment "rpu_mode =3D lockstep_mode" is incorrect.
>=20
once the binding is updated, why would this still be incorrect? Assuming th=
e documentation is updated, the above line would be ok, right?

Thank you for the review
Ben

> - Michael
