Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9ECC433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Nov 2021 03:34:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A464161502
	for <linux-remoteproc@archiver.kernel.org>; Wed, 17 Nov 2021 03:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbhKQDhE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 16 Nov 2021 22:37:04 -0500
Received: from mail-eopbgr60076.outbound.protection.outlook.com ([40.107.6.76]:7155
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229614AbhKQDhE (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 16 Nov 2021 22:37:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tgmn0LXy9wNJnU5Nbwkb43dH1wzCZT5r2Kddur80IYxT+FyaQFykJTXC98FbBQbp01u0rfUNWgSmaEzqBfpv+I+XZfP9rd/Jp3X5mvUJcrdYjNi1lj061nnM6DL9oUzrjPybJObtllgXgVf8gfExsSOuOtIRkjNSvIBrl9bO9q2GGXfrBoy41LczpbhDGRdG3dkcyqiqJPyVuDrRfgu6gpIlm/E5kev3AoyKPEd17EDyuLAA9lJHqP8f8P8eIBbCEauA4hxdTPXoCfcSw4G173OvNxV6iWuBylO3vAIe3UHEVnwwo1yIluq9L6oXjGHYGuZue70+a70P4LmPZsbb8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wp4SFmMCdJVXlT2JCWRLFGrZbjdmnJT62VaX5E09454=;
 b=D9hVjjXxsob/hk6BrMl8OGAL/nKTKPWY35DmUdAFO9+qV+phHRX5REKcYvfO/4cx+IyYRDlz7coDZ5E5NQ2sRoJP8BIxS1Z5vYYKVeX2X9DZwox83BQD2Nfp8iXG3ZyqvnniHpra1z0H6JxR6ViayHYl6Z08Og1HAqCdxf82DpKcOzzEXQhjCIXRI67mCIiYn7UyFP45B782sE45jhRIQLMFfh3uYLaMQ+Dd6cbTZJZ32wah2dcbx0kXxsBTzxpDy6Qidqf9JYBv9vE1LlSGIdHA1Fr2NuQWtBU8QGtjlgh6oemzggpivndojPalWEYwZv6O9X6118ALzFz3epcVMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wp4SFmMCdJVXlT2JCWRLFGrZbjdmnJT62VaX5E09454=;
 b=qbT0LJLcBsLKoOJxgKp4/PT1O1aysLeKg5SFPLhencPmtI+JP8qz1fEFdYemqrWyLBhfV/2tSKQ7uFenBOcHLF7KOYkAw5CueLVZLFKt56ZMwIDgydSGXvNlV5aLihgUNHAht9GydC1f6U+zY2FvzgPocHpjDetnrS5omasVE7c=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DU2PR04MB8840.eurprd04.prod.outlook.com (2603:10a6:10:2e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 03:34:04 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Wed, 17 Nov 2021
 03:34:04 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC:     "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: RE: [PATCH] remoteproc: coredump: correct argument 2 type for
 memcpy_fromio
Thread-Topic: [PATCH] remoteproc: coredump: correct argument 2 type for
 memcpy_fromio
Thread-Index: AQHX1eIc5u4feduoR0ublmATBsu//6wGiRWAgACSz6A=
Date:   Wed, 17 Nov 2021 03:34:04 +0000
Message-ID: <DU0PR04MB941714C1FDBDB06270D8C8EE889A9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20211110032101.517487-1-peng.fan@oss.nxp.com>
 <20211116184737.GA2324186@p14s>
In-Reply-To: <20211116184737.GA2324186@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d71a0b51-cdc4-4c7e-1e72-08d9a97b1aed
x-ms-traffictypediagnostic: DU2PR04MB8840:
x-microsoft-antispam-prvs: <DU2PR04MB8840409DF0BC76DE82C46209889A9@DU2PR04MB8840.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: llkbRB6K+gWv74JJMyRqmLx2JQBKqp8j6jzkTrE4tz5mplQke33gisLFZNVj/Racrct1AmuxcvP5fL2TQBcKuPXwpCsSUJHb/XzKhsqoufcN/Oi4QsBxiQMLlNHUqy5rn9ctspRIakUk9hM+erJDajgYbCqcjSZ+y90R/fz+jWSg6nBMB3J6nFtrNTM2Bs49wGFvWGf7ORLALpq+w2bB2v3f5ZNdeiEE7lw2N5tJbiW+qrDjL81wk8kCAYG9Roh5tnm3Dz1jlWL4/v+E2kNCtzvWX1UBIsdeGOn14lmpsVijlQdNA+KrezjPcjl/IRGE6mAmfMgClFYPaD+M/l8MKpKNQcK6kLEefhthWHi+8wFfA9yQDuaXavwE7VHeC7bg1wGrPuAzcMfU1mr1uVo6rWtmhm6oM/qBPRtqhWPuzMieoDU+isKn6s1lFrqNGjcSdQNoHRAUQCMxquL2MvdnyL2Sgz+Puw0PUZPM4ZuXupphaT4caXlHWOsXkfzS1qqlTDsxWQrU3mKmGNpcJc3+hauRYjFi35nFT4g1TXMS6MnRWnnDvZAXZWePu2ubMQO9my6nJ7M0A8Mp2FwwDOMWS9J/aiIXN27VHkCBnd30LXqtw9Vk76u+rlhOHx7X/3oPrssQtfNPjmxx0WU7hygvbrNP+5xV76LlEJD8KwxK1q8Ku56mZPx5V4BKpEzlJrZIZthVirN53NcDLYupnH79yQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(5660300002)(54906003)(76116006)(110136005)(508600001)(8676002)(38070700005)(7696005)(64756008)(66446008)(45080400002)(66946007)(66556008)(86362001)(2906002)(26005)(9686003)(186003)(8936002)(6506007)(55016002)(52536014)(7416002)(966005)(71200400001)(122000001)(38100700002)(83380400001)(44832011)(4326008)(33656002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3kmVCfN6Eck6CQI+Rkk2XJftX/gN7bqw10NGKaGcw5ub4mkaIMiWR/+xdd+h?=
 =?us-ascii?Q?Yao/bRHGDPY+s8hZAJMe2rk7XwuVSKTTLfp5TKnBGUN+E3kZ/3c8Je7Ym19n?=
 =?us-ascii?Q?fTsTPrTzsJqdxuqhFpsz85T6JTqWczdLUYSfHAqcznzYNuflaubi3SwKUyX7?=
 =?us-ascii?Q?KGfL6Tjv2u7hu2RCbRFhjXZBWcruMzuX4MG6fOLp04ch6UA08CLLTuBfVjAC?=
 =?us-ascii?Q?HeBdj4LZls+xrUo2SpPNhhHhhxIrP34XT4CyMO3+eOaANAP1VKv3ggfw7tra?=
 =?us-ascii?Q?gzhr30KBOHIuiXC6T10nn3XPwcPNV0mWYqB/JY6d5xcTKpK+NVs/+g1Tb/Fn?=
 =?us-ascii?Q?M1YQo9/KIVwQrFDvA9pu2bJgHVM1cSGxbFjAVZ1PYLy3piHynqu12DWwrGcg?=
 =?us-ascii?Q?LjK1Ek8d4q1sxgzqMcJI01gN1cxYHqumR+EyQDF+DdZJO7veoMWnjgGFJ1O3?=
 =?us-ascii?Q?vuUtrg5GeHctHL/9KwFp/KNAmjrrPqaNFeG6fNdfGixpRmvEVP30JnpIM7YH?=
 =?us-ascii?Q?VV0pDNMhIynpyGVV6AZp++VhkYluckXkmzR+miNiRnxkyj4v/sNyhZh1vcCm?=
 =?us-ascii?Q?A5cRmCmZulVm5eUzaNjRHmkJjFP+iTCweT8dyQRDTQ+/DW/wMv/o8G2SYF0O?=
 =?us-ascii?Q?zZN91Uhvyuw8nRdO7nwf+tYI+ombpP3NKypvEiiL+F8S5rjCS5pIxd2wP95W?=
 =?us-ascii?Q?hkjiLJn1AjTSqIHWENATUYDwSRBgZnnrtJFu4FZIaXmrZ+7mResIOtd/6/Nl?=
 =?us-ascii?Q?xyRwfvw6KgocDUxvBpDMID6Dx+Fj/NmmGEwX00nwzqm6AjK/6YGE28G596F8?=
 =?us-ascii?Q?WwGs2aMdnjWU6DmUVpaV4eTcjyznFLWXIa1iXO0X6YkFAPHKa5vTIR0U7JA7?=
 =?us-ascii?Q?CWnC9qerluyaEyE6USt+YPm+RJN2ylSxR4i1nUMTAYvbEw4spAX9RryMnFou?=
 =?us-ascii?Q?ngsBEKvAXEILjmajziHu3JPvigugbV7wy3gko2eryGcBhwfmmdd3kds1849t?=
 =?us-ascii?Q?stHBHwWO/TAzwZaxy3S2+DLtdsQisyOvtouc5wvKbduvcBv5TPse4EZkA5x8?=
 =?us-ascii?Q?9vPUBak8PDJzyskOFSOeW/J4vGTbOubbsbZWeGynNyTm0Q3IOssio4HvJ7o4?=
 =?us-ascii?Q?iIRTwAwXzBXvcckb+RCWF6uvUIbdQxDs99kecyt2CkmJZtkPuCzmYt9mokTG?=
 =?us-ascii?Q?ookPObnibZ2AgdSyMA32SbW3TzWImbe9WNAhGuKhAcOngKwUFEOXxVHBGw4L?=
 =?us-ascii?Q?c9+CdkSn3ARXPQNqgOReUT8ukLh9FBjYTmocEZjsd6nTgPy1o3usde6NLpsG?=
 =?us-ascii?Q?1pcfHUALZMGQf6Ro9SckGuFXkOXiWiiBMo9dhXCtMRwpqmt0Y0W5DFDJTTCi?=
 =?us-ascii?Q?iOyxyMynC922E8e3vDSW6snsKc/XM9PHLJ8eLd3ocMoDGTkaT8vMz66LJAnP?=
 =?us-ascii?Q?LiGl176v5ZqYdDa0X0+YLtthuZQpA55OOOsUwhITDbMjtvPIvgpVvnN1NwhV?=
 =?us-ascii?Q?C2wviIafOhApDTGgXJVrkU45lDy1/+EWYjFvT0r7F04jW8m1/HHFHK2Tw3sn?=
 =?us-ascii?Q?Vi/+gYyaIXQ5lJyBaZU2BmOI015M4agzJzErnGliWEdwL0Zlu0wFVWNZyq8/?=
 =?us-ascii?Q?lfhmyqIKfFkts8alNAQpuHc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d71a0b51-cdc4-4c7e-1e72-08d9a97b1aed
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 03:34:04.6479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3wpR5Z5j1xx7Er4j8KiGxmoq2jtKfniF36xpqaT2ktuboA5C/oBQAukWSVlgM6jEn0nb802z627zjHgvj5OWNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8840
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,

> Subject: Re: [PATCH] remoteproc: coredump: correct argument 2 type for
> memcpy_fromio
>=20
> Hi Peng,
>=20
> On Wed, Nov 10, 2021 at 11:21:01AM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Address the sparse check warning:
> > >> drivers/remoteproc/remoteproc_coredump.c:169:53:
> > sparse: warning: incorrect type in argument 2 (different address spaces=
)
> > sparse:    expected void const volatile [noderef] __iomem *src
> > sparse:    got void *[assigned] ptr
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/remoteproc/remoteproc_coredump.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/remoteproc/remoteproc_coredump.c
> b/drivers/remoteproc/remoteproc_coredump.c
> > index aee657cc08c6..f39c98aa1b49 100644
> > --- a/drivers/remoteproc/remoteproc_coredump.c
> > +++ b/drivers/remoteproc/remoteproc_coredump.c
> > @@ -166,7 +166,7 @@ static void rproc_copy_segment(struct rproc *rproc,
> void *dest,
> >  			memset(dest, 0xff, size);
> >  		} else {
> >  			if (is_iomem)
> > -				memcpy_fromio(dest, ptr, size);
> > +				memcpy_fromio(dest, (void const __iomem *)ptr, size);
>=20
> Shouldn't this be (const void __iomem *) to respect the signature in [1]?

The sparse shows" sparse:    expected void const volatile [noderef] __iomem=
 *src"
I just send out V2 following your suggestion.

Thanks,
Peng.

>=20
> [1].
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Felixi=
r.b
> ootlin.com%2Flinux%2Flatest%2Fsource%2Finclude%2Fasm-generic%2Flogic_
> io.h%23L71&amp;data=3D04%7C01%7Cpeng.fan%40nxp.com%7C8c6a9d750ea
> 94f5b09c508d9a931938f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7
> C0%7C637726852658866042%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&a
> mp;sdata=3D%2BBIKI5lOdwketjCiNhR3YLyK1xx9o7NhPuuLpjGU7J4%3D&amp;r
> eserved=3D0
>=20
> >  			else
> >  				memcpy(dest, ptr, size);
> >  		}
> > --
> > 2.25.1
> >
