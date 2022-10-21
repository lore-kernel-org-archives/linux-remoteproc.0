Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D30C433FE
	for <linux-remoteproc@archiver.kernel.org>; Fri, 21 Oct 2022 04:17:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiJUERP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 21 Oct 2022 00:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiJUEQu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 Oct 2022 00:16:50 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9321057FF
        for <linux-remoteproc@vger.kernel.org>; Thu, 20 Oct 2022 21:16:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8RxTMwg6ljmBxOq7vWACeFIAbLFRC5ySQiapqiAd91+PC62o4Q5oXYqihVATxqoBI1dMZLSJevDscnaf8hI6OakBU9Q96M1LIzyTjb1Zh4Qs7R7oceZQc3GbpMO6r1aIktJuPGnBmzNegHytlL6bU0xQEiwBB3/LpE3MpeYyHf4AI4MkS4H1D3kv2g4BQoGSvI5rI3NTCaFkcWJo9ezYSGqyilzJpssAvJaw/gLTZjbV2WVXPgbN2+T8FHoMKeKZZyJzJcBN2hxiLjXVtKmzS0fbdPkxpxO/w6+zw4Nqfu0hYMRPeBLzyPC43Ysx3mUm5m7r5vjG+vj6kjwEqCh7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVuXvlcr90gtXZntjTsIKicUJAVTcsP9yM3mDJZc1ws=;
 b=LUfxZrvmZH3XOAFnFMBNdOPIVQmtVL1iM4n7maTqPz6EUfshM6hYL/wiW563CxhJiVgmMARecMrJf6fZFkXXG3c3dWwBatOcpiayDjwI3AexX/cEJyGON7o9iBJkXd+RCmT15FW8nSK4nDjJG5uGUBDMZAd5v2sPl72urqPZoZGR26/IZsmOJj310k/gsqmjezxN4SSj1dYQa7DzKPMH5PeihtFTVyTQaYT662W7HdcEV/+acBbj9SkZuGnjrKiiQu2mnLCONYh++4Q1WUbuvczuXiW3yX6qRO4TzLFp/+FxdVqRj+bsjiOi7SrBUsCb4c7Mdxdq0I+STSvhtq6J3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVuXvlcr90gtXZntjTsIKicUJAVTcsP9yM3mDJZc1ws=;
 b=oC5finvwPPzA1c7uaXZtGHD8lrwv4winCv6aoTxHvHd7NiRBgkimCuy+JJYHJyySj9LoBnfZAAlCvFvTaa2+iYrncw0cj/e4GyphrWik90fXzfHmyU5DtSUeOy5g1A9HENkJp/Ilb5W+t+Cb1r36puFJTxFA8jI9Uk7EBPUPSEY=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8460.eurprd04.prod.outlook.com (2603:10a6:102:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 04:16:16 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a5ff:3d28:4bbc:e1ed]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::a5ff:3d28:4bbc:e1ed%6]) with mapi id 15.20.5723.032; Fri, 21 Oct 2022
 04:16:16 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     linux-remoteproc <linux-remoteproc@vger.kernel.org>
Subject: RE: [INFO] Remoteproc/RPMSG patchset review order for October 19th
 2022
Thread-Topic: [INFO] Remoteproc/RPMSG patchset review order for October 19th
 2022
Thread-Index: AQHY4+BjvTyoZ/8RPEqEzfezvXJ7Ja4Wp/cggADHIICAANBGgA==
Date:   Fri, 21 Oct 2022 04:16:16 +0000
Message-ID: <DU0PR04MB9417394A8135DF779668E5AC882D9@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <CANLsYkzjTnXxqqFxZp2ya7tRj0JWyifHHJvprTLysQWU-V1ksw@mail.gmail.com>
 <DU0PR04MB941792CF75BBE8A0C6E1D3D0882A9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <20221020154839.GA330801@p14s>
In-Reply-To: <20221020154839.GA330801@p14s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PAXPR04MB8460:EE_
x-ms-office365-filtering-correlation-id: d49672ce-005f-4695-dc3b-08dab31affcf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yAgDu+Sm9/+eOKvM+1DTfMDY1U905LInLkK8Wxv8cQTjLZ+gywbMOJd08RqkOI+n+NeZAJ9u2wMJHDQpGNaXwhLoorCrZvrFfWBeLEC79LEZQT6KpxQmQwrF5WEmswijwIgVvfMpz12Edi0XD8vZTv0OEMIwLTGNufy+VPY7aDjrjxlsiUlzy7wmOe1MEiSfA7Cf+TQBnptjXBfcLRewiZSSyUdkE3Ke4yrgT6nLQncKnMvYNd7eZdZaNuhU+LAm2lytc0+xp2fmYEgP32sOaPO+BapMqq20BAXV6RAry8AH8FvF6yAbUxogu9sicyo632wcRdzcLt8DwONUh+wKXFI/PNdjkiMkb1h3ia0JAVvJXJ+1AHWw0vRvb7gCRB6JtRMTV2r1CfoBZT4peUqP+HLUIbuPAJWecMAF4Cjbevid3NeOyqwPfvtLSpw+F98SnAQBigxYI1iU/EBamDoTVqkcKSq605NZ9Ke4v7CZ+RlV8duppJMCtMJxR45pXwJJZJ8gCTfwhLJeTJ9ns4GE/2UBQDDdKWtnhxCE9JmfEK7IVn7pFwYqAEn6mAMoljYcjuSoQgrrzxhWKhFhp+9qrmdsR6eXqQmnHxPmIt6mGNaSkRt/Qei6j7qyyTrnpsKrRmVSHE0f1Xkozl1P291Zbg8mgybfBVec6UqbL4GRh9Uhuz+siAYKb8A1jrRU2Jdw9WExbF6NezUao4hVw7qYlA0+CHhuQmPGt68H6m0hGRE0cFMZBz8EzFt9Z9LayRKDgFow+wnJGhVlhcluWlSFfbuHk7S/m2qYks0N9D5n0cs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199015)(86362001)(966005)(33656002)(122000001)(38070700005)(38100700002)(2906002)(83380400001)(5660300002)(55016003)(44832011)(7696005)(9686003)(186003)(66574015)(6506007)(26005)(316002)(52536014)(478600001)(45080400002)(76116006)(6916009)(71200400001)(64756008)(8936002)(8676002)(66946007)(41300700001)(66446008)(4326008)(66556008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?49WqHrF+sdZFvSh8rf0rnfISjhXXF3KYKKBxrFILWHVKgGqMe4IyQXgcde2N?=
 =?us-ascii?Q?AzeotTtLW4mmsqaCnvUbdYFViXWi2TTst5ds8uhCWkc8cJjJuLjcwJf1yUiN?=
 =?us-ascii?Q?N77UP0x8qr8V/0sgcWbdIepA7dkR0OzUmqp3SAZiWyD23WnNL24gzj7dzole?=
 =?us-ascii?Q?MlKOVglB7IzxyeVBUEwrWjQkX34oqw0oDsaZ08tQysjPH1CJ9e0PuZQgTLVx?=
 =?us-ascii?Q?vB63DBxGDM1sFltp+2XLfEl2g5onQijU+CBa+dBLYZqqtSF4melFwtCJ9rtm?=
 =?us-ascii?Q?WPyy4M5sh9Z+R8CgPF+acd5cx3kp+t2iIehKeM7ZquacUekFzxCEpnRY43Qk?=
 =?us-ascii?Q?QjxTeWprUfQ2G+i0zR1J8X884Vm1PcT8/z1bRHKgFl3wP3pj/XpIrFbccm3d?=
 =?us-ascii?Q?wnDSW+wXuc3luKaNbWpB4Ak/Y5FDwF6Z9w7IlD9xsqxO8C4RpUPLYo+k4Ahl?=
 =?us-ascii?Q?aaCI21tup8OynMdXFVp4cHaHS5pwvoYJdGcOmk508YQeyH80nTQ+gkSw1Ocf?=
 =?us-ascii?Q?CAI3Cv4jBJDYsOtg/fjOa89Cn/ZkQoSw0gwZ0a0oFHf8yamuumClg7jPWTmM?=
 =?us-ascii?Q?bMj6Nkk3SXCn2lgvoZ3gQGkq0jWBvxpa/Z8X2qmDyGCwT6hwQJeojZlai9/B?=
 =?us-ascii?Q?v/UzWuzotZ3vsnrItfKTffMQ8vr121GF4Tmbl/XzZCNxNIYot8WC9oqjdKgi?=
 =?us-ascii?Q?jWVBfv/Uci3L+oIU2pU1OkmaS3ANwo2J0ru8zf/R/y8LuUGoXKoT7bWquWbI?=
 =?us-ascii?Q?OJ/3rrJlIMMXp+HtWiG1g/cTRoQp791haPj8rrcvrY/1MNMV7U9Ym/jLwXsL?=
 =?us-ascii?Q?CYZU2Tygnu+tMzKn06J/jXnQ8MEnihZod6Gdq3PSoj8IiuDL3VaLsRu2R3iX?=
 =?us-ascii?Q?kV8w69/2wT8aAib822PITvThctaM9gZt3ejIo+uYe4JAT5G69D+7O+N3kD+V?=
 =?us-ascii?Q?GYVjpMJVfGL2m46AY5dbMCxrg1egC3/ZEfJ/TwvvirRLOJhQkojr7GNtcX61?=
 =?us-ascii?Q?iaJi8Euz5WbN26jK7rW5nI9SgC03ie1j3J1pj15bvNMxXfMTPgjPD8044cTL?=
 =?us-ascii?Q?BpvLoC8Z+/w8qB6p9k/gILCF48RryLCdIZAdut87sxcRpaT4eIoT9yKr4/z4?=
 =?us-ascii?Q?WPyMjeCC7V6yxTB1/2JtgyfPC64qZZYkrO4FUfKvLpU48otu8UiTCaQ3miZq?=
 =?us-ascii?Q?lDR9gEaB6DOMa8WAuvMXOFLx26OEdd/T5TtNhBexlIgR1JubjtCrExdNn7dt?=
 =?us-ascii?Q?G07G4dj4iSg/UBqX0eCcfhFdcvma8i/p1P/4PGJkupcayBWpnR4suhzT63Z/?=
 =?us-ascii?Q?kjdEeHNqUA4h6MFY4Oe+6m8FiinT8WvGXBWPV/I3zBnbwUvvIEoXPXlylkam?=
 =?us-ascii?Q?PFNc1QgwXV+6eCk9voydnGdXkwSOK2sdY7ydaIjcsDzb2ghH/kU/Fasq8310?=
 =?us-ascii?Q?JCG6ITXm1teScKt/+dg0NkABfPhS0LJhf8nQvEhOQZOXqec2GKcjpYwB/7wH?=
 =?us-ascii?Q?9TYhrZf2xF1rJpD/Id+i/ZQwy3vg+XoAFPGHROKLR9x0nMp3UpPdN+5y+jZP?=
 =?us-ascii?Q?hCn+9HcJDJ3wEW/JwYM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d49672ce-005f-4695-dc3b-08dab31affcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2022 04:16:16.8211
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lMsEZJmnvXP3DCFDtCHlACVqHz49/hT+j+HA32u/BxIk2nahcKRjY5C8KD+76eW9SmIWgKBK7qAcoBtEgp5cXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8460
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: Re: [INFO] Remoteproc/RPMSG patchset review order for October
> 19th 2022
>=20
> On Thu, Oct 20, 2022 at 03:59:33AM +0000, Peng Fan wrote:
> > Hi Mathieu,
> >
> > > Subject: [INFO] Remoteproc/RPMSG patchset review order for October
> > > 19th
> > > 2022
> >
> > I not see i.MX8QM/QXP in your queue.
>=20
> I am done reviewing this revision.
>=20
> > Do you need me send V8 for the i.MX8QM/QXP support with only
> > addressing the comment in patch 2/7?
> >
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore
> > .kernel.org%2Fall%2F20221014031037.1070424-1-
> peng.fan%40oss.nxp.com%2F
> >
> &amp;data=3D05%7C01%7Cpeng.fan%40nxp.com%7Cfc2c61b6c6f8486a0aaa0
> 8dab2b29
> >
> 1a6%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6380187772620
> 34593%7C
> >
> Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB
> TiI6Ik1h
> >
> aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DLHwFW7HeGZ68i
> 8qRJ8cKGFgA8
> > WzUXPXMbSRSrsTo9o0%3D&amp;reserved=3D0
> > Or I wait your comments on patch 6/7 and 7/7, then send V8?
> >
>=20
> I have clearly indicated the improvement I want so see in 6/7.

Just send out V8 which addresses Krzysztof's comment to patch 2/7 and=20
adds comments in imx_rproc_xtr_mbox_init per your comment to patch 6/7.

Thanks,
Peng.

>=20
> > Thanks,
> > Peng.
> > >
> > > [PATCH v5 0/3] Add support for WASP SoC on AVM router boards
> [PATCH
> > > v3 00/11] Add support for MT8195 SCP 2nd core [PATCH v10 0/6] Add
> > > Xilinx RPU subsystem support [PATCH v6 0/6] Introduce PRU remoteproc
> > > consumer API [PATCH V3 0/3] rpmsg signaling/flowcontrol patches
