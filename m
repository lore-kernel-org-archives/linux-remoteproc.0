Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2B5C07E95
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Jul 2021 01:01:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D77A6136E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Jul 2021 01:01:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237228AbhGNBEY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Jul 2021 21:04:24 -0400
Received: from mail-am6eur05on2053.outbound.protection.outlook.com ([40.107.22.53]:58208
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237180AbhGNBEX (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Jul 2021 21:04:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knNr5uNFOkFO/AK4O+L6VfCeOyPGtLGzUcr6by4nLuDTzEDkR9f/hbbwDg0eRPXYWvUIOn6boxM4s1i2yN0SMxmgMeVUeGAYFmuIQEVxaa/0HIcP2n+DYC2CKdjLJTWGwuo38qHnKRa79PegPvmf3Csj5u6p9ThsgGle3UxbWIq13Sr+cz4w2gPMDT7ullqhdhx36VQ9pzvYxsQ8hy7Yb/ZTJH+k0SlGyo5sJe8tgRlPaVbIzXhbBCuWGNDffB/CQ6EP5krWKCYjbEaYX6YkXNnl06NYbBR836C5j33X//O+KnKLXcPWAZMiwiScdHYMOo+EbLsE8Iy4zs+lf1+kMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgRHPGEqLIazi0K5ny0GdOkQwE68t7N7cBzrSEbXvI8=;
 b=EuHsmCV9f9iFIbFn45Nkuaxtl0D9huS17B5vPKkOj4sMTOYc7t5lBMdCnVa9btIOWbXvg8gsbazMxYD2Y99re7d3U39PQwsEK846EqJVr6I2uyQMTcZXmCkFRaOp/QCyn1CE3litqoU0Sl8FuNh8M2JekSEuMpUm1+eWB8xY5fFQJRL3IfzTuBdTmZE4oBr88T5Xqi6eNFGWuKlz3thYduJkzwSBsCP9dgn8AJ6jN1kmR+2lWhqX4itRV/qNlgW2ZbhcP7bJ0pp95YEmMXT7RJP1rCiYH3IwuSvMnPH4AAyg2ZfIn1zVACTYFhSGM42juYRoWa8981VAS5+drpbKlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgRHPGEqLIazi0K5ny0GdOkQwE68t7N7cBzrSEbXvI8=;
 b=SvKxzA7kqvnE6Gc1EEDh4nwoPdvWcxgqWka5xYVSUFyJuNCY0spdLhYXT027MAYOTCAnY39jIsLKIkWOVs751+aLdxUhpMUvlmrwxkz09RvZMvJkhGpWJ8S4q0Fb3N9c4KUas/eg7d5MTO0QTdyK9R04QKFFl1SIJdsrRzpP+Xw=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3915.eurprd04.prod.outlook.com (2603:10a6:8:e::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 14 Jul
 2021 01:01:30 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4308.027; Wed, 14 Jul 2021
 01:01:30 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
Subject: RE: [PATCH V2 1/5] remoteproc: fix the wrong default value of
 is_iomem
Thread-Topic: [PATCH V2 1/5] remoteproc: fix the wrong default value of
 is_iomem
Thread-Index: AQHXcxRD6NwTvyegR0WKb459FchqnatBsT+w
Date:   Wed, 14 Jul 2021 01:01:30 +0000
Message-ID: <DB6PR0402MB27602BA2E0E587C9381051CF88139@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210707094033.1959752-1-aisheng.dong@nxp.com>
In-Reply-To: <20210707094033.1959752-1-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4284a2c6-aea0-4e46-5265-08d94662eaa8
x-ms-traffictypediagnostic: DB3PR0402MB3915:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3915A92AB554447F012A0E00C9139@DB3PR0402MB3915.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: K5BIuQbgYzf55u8NcUupPfjrJ3ZxeEobLc1rvOzna5+Jem8cpmsYJUup4gEkYSF4QnH0SPZkITnwkrfz7dqOzAL8pz9t+agJMm94PGKjXmjfAjhkDO9KeUmcC0Of5tzbufHBOTQ19fyy3wv0LhhxQsvNR+bFrNgthaov1yC7ZIYTonnKj4nngoKmz5Wq81u7VlRGIwqk/JjcvwXpNU9ZTQeZWFZaHmEQlhv0RtRvw2pTEMT45ButdbpZxgKO2q9c1mAZzWY/6ylttQN3ecy3kpLzJ2z1bZ4EzczHcOt3xGoe6mjEEoETZNO3RBRQZZoba6Z5n89fRzHGaNLfZ6jAiM5TZFul/v40kbSWUgtNs/NOU9u07HbjrlsQhPfy1uj2K3PbVWsHrR7eiKzq9vlQW7pH0v3GJJVIoR8KouDDAoBWCm9YTFGssyxAMDvpVy2cKsYlDHc0WldvmgD2Ieoxjvm7AUxjpIAWbUct54W7qibzzosauABTRw0La72PQT6XRjlJ30RuTTpno3zs54NbAmAjf0RRTBWZCanmipxzF3r//bosIm/q4VPgDCiUgmbfTqEmvPAPtnBsiF2dn91tg00M39K6IoqM/0y4wl/bqjf+Y3Dru5gccsbqpTmI6btXfq9bF1Vod+M+r1/2qr0u4GLSAIrESERx0uJL2dPXkfLIFp2xpw35lx9xUMgk9zr+RoSy3hTTPKO5Bj103h8Ixw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(346002)(366004)(55016002)(9686003)(26005)(52536014)(54906003)(2906002)(8676002)(83380400001)(33656002)(76116006)(71200400001)(4326008)(86362001)(38100700002)(6506007)(316002)(66946007)(186003)(66556008)(8936002)(5660300002)(7696005)(66476007)(478600001)(64756008)(122000001)(66446008)(110136005)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j0JJljD0dexivzsdJi8iuXidBSNykYDZmKh8IAg9lAmsfPvk6yJVYh/n823r?=
 =?us-ascii?Q?IBYDHrllzGxg/V8/lcvWVxsyStBRtEwjHTT+HnZQTYjgL4jCHO1tGvqoKkyo?=
 =?us-ascii?Q?6y3vxkcVpn8JQFcuaULue6kgC6TbEhZCDT9xtSaCuobR1MXy2AKiI51Msvx0?=
 =?us-ascii?Q?YmqzHkh4yVALyN8Sqvg32DjEt3HVTNOmTUx7+gU6u9TjkhQ5c6Dktdrl74FZ?=
 =?us-ascii?Q?a/pqQPEoTjqp9d7e8p93qQ3GP5qC9hmwwxTlXYykdWQNiv0F1B1Wn/z3tIWJ?=
 =?us-ascii?Q?QMRyE2eV+4FWvbeXfGqGI2Xgw+9YnSIK6igSCOw5jDeW/58dg2vVvE5gYwvR?=
 =?us-ascii?Q?RXYr1J3EkTDwhfMzYFFE54L/ahd1vTVYvLGJlmJdNbcAYcasObtJ2TsmVoIK?=
 =?us-ascii?Q?WvakJOd5ju5SGlqJ368SW90SiF6N5dcy7QG3+xgZ7hSm7qf+hd8uACZ2s3mv?=
 =?us-ascii?Q?FLq+Dh5n93m8OJ2dKRC12zQNxHlfsdAKudbWprygX3Yz2f5kGrxpF0qYfWc5?=
 =?us-ascii?Q?9i4LfYTSz77zAgCsog9wxrX2L+l+mq47QPEtjZ+ru8gAZkrH8dawSRnaSYCU?=
 =?us-ascii?Q?sr51lR8HsySlQ3KkrsbsUtDAa5tx13n/aiTxyU1Mprd8iZeGwTI+8PdAz/h2?=
 =?us-ascii?Q?lJH0u4V8ONASdTStrLwSVuzlDJ3NsWC7ivQw2tKmzIYp1xfgtxo4neET0rbj?=
 =?us-ascii?Q?TeEzh90oRK/h2sunpDkvJLl/syPlIiLOi+L1ijhHFqBWa8EFGRwQTXTQDV7g?=
 =?us-ascii?Q?2v3dPsqVSTyg/Bak92rQZS7imGdXtZIWEtj58HWGKNz54mHKB8IPQL/NAF2h?=
 =?us-ascii?Q?hXY4x+c6jVcZOuBtD/Kci9EO3rkTdKtrOE/scQ2zMxFdOq2wjWlnGHbeYIWZ?=
 =?us-ascii?Q?XvCawuR8JWpFgVqui+1otJzi3GZrmZWWAWVE1ym5yar5/hR+01WdytHYP0Uv?=
 =?us-ascii?Q?KH+IK3PIoCfNYlEZnIYhrLyBD5H4U/1CX7hLUQn1LxDsVhNTDpgSD0cLn7gE?=
 =?us-ascii?Q?xEuKDqP743e8a1jee8z/5vuROW6I0nJSEIqGUjX2VFKKFcBXRus8fGBayP0B?=
 =?us-ascii?Q?EouEFhGzRe2M9HdyQ7XV3lwVyNRSyXPRg01+AEE/Udy+8FTtnYhqvpuC6Li9?=
 =?us-ascii?Q?scYr0jXo/ZJf7Sx4IR4x28FkOgtEXMCkOdSuaW7+TqK0Y3BUmaOK8daDJ5TS?=
 =?us-ascii?Q?JjqHacYFcPUBAsCbgg+Z22FByKoJf/+zBy4Jvz7NpPuEqSwO5dubysiz8r63?=
 =?us-ascii?Q?dWHYXo8Shz51IKvVjFdnHCGqv5iqpMiYLsSWXdhCK9dTfc9p0ACVkv9t9e7n?=
 =?us-ascii?Q?xifzVMisYkdz63H5qwjX8VY5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4284a2c6-aea0-4e46-5265-08d94662eaa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2021 01:01:30.6265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kfyg2I6bfpXBMj196WptVpZpNfSRrn9OO4crNxZbbz2l5cyu7mogzjelapE84C1Nej028q5eC7qAcZchVyTWoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3915
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH V2 1/5] remoteproc: fix the wrong default value of is_iom=
em
>=20
> Currently the is_iomem is a random value in the stack which may be defaul=
t
> to true even on those platforms that not use iomem to store firmware.
>=20
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Fixes: 40df0a91b2a5 ("remoteproc: add is_iomem to da_to_va")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> v1->v2:
>  * update rproc_copy_segment as well
> ---
>  drivers/remoteproc/remoteproc_coredump.c   | 2 +-
>  drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_coredump.c
> b/drivers/remoteproc/remoteproc_coredump.c
> index aee657cc08c6..c892f433a323 100644
> --- a/drivers/remoteproc/remoteproc_coredump.c
> +++ b/drivers/remoteproc/remoteproc_coredump.c
> @@ -152,8 +152,8 @@ static void rproc_copy_segment(struct rproc *rproc,
> void *dest,
>  			       struct rproc_dump_segment *segment,
>  			       size_t offset, size_t size)
>  {
> +	bool is_iomem =3D false;
>  	void *ptr;
> -	bool is_iomem;
>=20
>  	if (segment->dump) {
>  		segment->dump(rproc, segment, dest, offset, size); diff --git
> a/drivers/remoteproc/remoteproc_elf_loader.c
> b/drivers/remoteproc/remoteproc_elf_loader.c
> index e8078efb3dec..3cd1798f17a3 100644
> --- a/drivers/remoteproc/remoteproc_elf_loader.c
> +++ b/drivers/remoteproc/remoteproc_elf_loader.c
> @@ -178,8 +178,8 @@ int rproc_elf_load_segments(struct rproc *rproc,
> const struct firmware *fw)
>  		u64 filesz =3D elf_phdr_get_p_filesz(class, phdr);
>  		u64 offset =3D elf_phdr_get_p_offset(class, phdr);
>  		u32 type =3D elf_phdr_get_p_type(class, phdr);
> +		bool is_iomem =3D false;
>  		void *ptr;
> -		bool is_iomem;
>=20
>  		if (type !=3D PT_LOAD)
>  			continue;
> --

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> 2.25.1

