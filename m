Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF3BC433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 08:54:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1582F611C0
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 08:54:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhKJI46 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Nov 2021 03:56:58 -0500
Received: from mail-eopbgr70042.outbound.protection.outlook.com ([40.107.7.42]:52806
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229831AbhKJI45 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Nov 2021 03:56:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8QPQpQSdhG+3BNTgPxAjiRvHTFGNMkOSNj6fw/jYY1wQKscQa7Z0ZdEYXCQRoeQXvgs0ojYHfZSvc80ifIO1CNSYMA0wWLDFkjjfzHWG3J08WUoBKMnUrEsqk/aDakg+7jm83rpYKBDWU93Yk/IDPvulaf+wVEDUiezZPjZmltMh0C/BxYYeg0yTUeM1w8+mv3KjBg5RibXa03FYTWrCpCjdeH1Y9ohS9epjjip+C8fvyHQWdaTi06HNjqNHgjPjDpP5ZARcE8Zzx0bxmDfdURlUUR/2RL9ufdeZwdw67Znp9LqalHQsMahWkXdz/uId/x50gdwRL6J0RUKHt5TuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPJGlVpRTlQIc4bAx8wb1jvxVDTiIkItfkJZW6a3+44=;
 b=oeH/Zo6NS5HUslEnjfWwRnNJ/+6xAvQsRRciJTLBls8UxfmyCv3nPVoH5Qal6JUXCpKqDTo441JijHxaTYK1P1BNuNbjcdX074ybV4/mXCIGayKOqBqib0Zb3JhjUzW2rHqOlcTqx2MJcqqTOq1IHKGVuEIgwZfn/H3etowQssQorhuzZwupUbOL2Tk5afSrocYSs/ahe+kk8qYaWvEHXG4GH6bh71TukIJ+1SiF0Ll4fKZswKediJMHWCHMo2DSSo9cV7UaGb1qrj4+nGLv+i6Q7f9jXQUReEStrRmpLN2Hs1YeCPxNGJGDeHKMRsZlXHgcyHqdUb3EYLUDtlMNfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPJGlVpRTlQIc4bAx8wb1jvxVDTiIkItfkJZW6a3+44=;
 b=A1GEBBkSCp2bS0LKH3h/aJF4mVszJ4HKYDwvMoAbfsgjeg5oGuTdKTy/WEXAzNUACmXCO0Mca4ruWJBQ0Nr9pMq+pq7XL4PbONFmC7NX8c+2Pd4Ulkgpa6wOjo0AJ7a4vbrHZ0ezdNSJ1F+m3luS+bBXzoIgbLcj1aXEbxMxIII=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB9332.eurprd04.prod.outlook.com (2603:10a6:10:36c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15; Wed, 10 Nov
 2021 08:54:08 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 08:54:08 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Hongxing Zhu <hongxing.zhu@nxp.com>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] remoteproc: imx_rproc: Fix a resource leak in the remove
 function
Thread-Topic: [PATCH] remoteproc: imx_rproc: Fix a resource leak in the remove
 function
Thread-Index: AQHXwllGUAnFZVoMdkqW8DriEOlDKqv8nCWw
Date:   Wed, 10 Nov 2021 08:54:07 +0000
Message-ID: <DU0PR04MB94173DCAA87A0B24E1C7073388939@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <d28ca94a4031bd7297d47c2164e18885a5a6ec19.1634366546.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <d28ca94a4031bd7297d47c2164e18885a5a6ec19.1634366546.git.christophe.jaillet@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d357e0b-31e2-4a1b-e69d-08d9a427a816
x-ms-traffictypediagnostic: DB9PR04MB9332:
x-microsoft-antispam-prvs: <DB9PR04MB93322D0CCFE135A90DF22B1588939@DB9PR04MB9332.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I3Fxnq0cnbf+pPZrPIdF3GnzioLD4LMVRZE+pp8m7sWEBH5plGVPtQvfd8cJlSwtAHodQ/PeH+zdgSu8ClRbNpj6r3YHwXB57LkMiAW9XVoFiiwyJh2V4cJPXWyMMghokXJRX10xVJOiN3hqJEvkjqi9ah32baUmZb3Wq9BmwQvS6nGPY0rNjwCzREVn6OHWvFUAS9xF4bmKqntAj2cseWorYTTB1rOukY+8He6dYNei0GPv5a+XRI8tbijQHQI/skfjmZHCBfHpdFPPIvyDAFb+Y0YYyhkce+w7dRhhdfPz9TpkXoDhGNfxbfcZdZkVhIapB5cBWB4vP4KFWiYjfdl8tMF1MfiCkt1hUwtfLRuAR6vbUHbWGu4z3uUokEDPbPD1lp4HtkxjlOn2q3hzHAm6GyWyPi2DdVWTdZUc+pq+Z5T6SyHasH8TdeHYTyto9JjBkqekZ2Bq/Z5r2jdY9sTYyRFvQ1bKBEVmaLrdRnTezZu/FXXM1Pjb2nFiqr8Zv4H/7dTMHsILaDRG/YgC7eKQ/l70jl+RtohmdoLJeO98gMlUF3vEwao3cBlE1lK7IzeK/AsuTYzaeWxHBtMQZbxJ2v04uXshAZ7RHhGPguCYiETJ2rpH75mYsJpVX1ZWu7ulLlyoADYmWuY2DLcG+LRMPhuhdkpDFiUaANLMBDL5m0Tc6ywFJgy92joQekr5/u+nm88li8rJUZjPkEVK+7t2tCL1N0X/a1wy8i9Zrdw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(33656002)(7696005)(4326008)(6506007)(71200400001)(44832011)(54906003)(6636002)(83380400001)(921005)(55016002)(66946007)(2906002)(86362001)(66446008)(5660300002)(508600001)(7416002)(38070700005)(8936002)(38100700002)(66476007)(316002)(66556008)(122000001)(9686003)(64756008)(26005)(8676002)(110136005)(186003)(76116006)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JwKq05RSndWRDBSsR5u34sLzz456gBbDfkNgfQB/xCaMRyW09HE4mMHuV4uP?=
 =?us-ascii?Q?AtflUb/10JgV299DaCZFRQTsZL57mErCGqm9Y5MPdCrV+j9GMX+1RmTQJDJR?=
 =?us-ascii?Q?CoXrjh8nrVsXzY+MdNY0C4zrfWRQdJRAg4yd5T4GZet5fBxF93yVgo1yq51d?=
 =?us-ascii?Q?O6tKMF9baTdU4hEMQs/802CAs+tLZyK5WInPk8Avr21ZNxmUKqF+zMVtVQVQ?=
 =?us-ascii?Q?mtYJnmSV/Fng1jB/aepECiH1QlCcl581uBCTU4m3dnHc+E7t/q70HIIIexOo?=
 =?us-ascii?Q?dMXdclpN90NnFiZAXsz0h4y6YxP2QEli96v4PW6HZ4dqpDUBQPtKr29PcGpP?=
 =?us-ascii?Q?OJbERzeDhVVIrC+NvPGIEdcOTstbbMhlLm54H8GJzwlpuxH9dJEuj7w54MfV?=
 =?us-ascii?Q?Qu5YlouvB8IHTOEs0XdPdi0HZUiMnB4jfSvWsa/1L7k22UKLb2U2UsB+7KI5?=
 =?us-ascii?Q?XjZBPaxgN7Z6P64uJ+KaUYRSNwx6weFBnPEyPIRjjI54N8J2+ZixeFEGIq11?=
 =?us-ascii?Q?bS+Ki82nUjzPHtoqVrQaEdyJmJNLfhrTdoxPQijbDNg+CKLvKXkvjgrt3Bvj?=
 =?us-ascii?Q?jehTEstLZTm56zZnDjQmRHkzdQSpUuWZfmFvO35hyonQCPVcf6fmeo9nLe1Z?=
 =?us-ascii?Q?4YCHJhQbV0igT7kK2mLnkcaFGadF0/iX4dTS1I4pti93sNL7xWnA/o3Sla6a?=
 =?us-ascii?Q?8iTR/B0DlFNl70R/cfudM5tx5nj4c99HvI6fIx1jlmZmd/8e9bfnLVQLV9nj?=
 =?us-ascii?Q?BC8l9qK3iHndfSMi7Qq0z3o4vJtWmA7r5JGz83Nd4PFFMPUDqtar2o0qdMYJ?=
 =?us-ascii?Q?2F/9C23tprdhIup1D5I/i5cPH99T6Q3t07QtjzU003xm4DTO5dv+WhJnRNT8?=
 =?us-ascii?Q?2CNWIp4tleTlhfwonk3ZecD8aA2I1cKeDDAR3eBfcTWXEisA4wroFjegl2EW?=
 =?us-ascii?Q?sKGTpzKzAhuiLwtm2/E+IbkyvVrFflVXhgF/mUcb0ULOp1C/Sug4N+5ltbB7?=
 =?us-ascii?Q?6xhpVEqbEKb3XL0g2CyygzJrL5+kHWZxSibaUuXIdowxmaVPaBcjgUCvCTbJ?=
 =?us-ascii?Q?KyDUrJ0/R2T9WUgIfUZa1lce2wU6UhZsPFNV2Hm58aozsWyB/tOoGG73BBk8?=
 =?us-ascii?Q?t77elgn7lXbpce/Y9Tf5kCx5d0Acqv9UVz1LJ7+0sCqeqULjkYZBHWERUVNK?=
 =?us-ascii?Q?mJwjBYK91eq9PQB57nbS3aEXTBPOVauhQpbTGHYaS8aOLryiqIQmfL09vQ8A?=
 =?us-ascii?Q?zXlTfbPxoDI+4hOIQWRVqxQU+I9bRfQccT0Q8v5MKM2HkMw8M4gwEC7Z4M1V?=
 =?us-ascii?Q?bXSxHL6QbyjnznDe1YJUAcD4zDaQyHQ9IcwHY59AmgTED9lq3j5uv6avIsTy?=
 =?us-ascii?Q?cU/MvcIOdHU3Bqd7jU/2lOOWMNWAx66gWdk0ftHLzT/cV/jU2ZVdM82TgmeV?=
 =?us-ascii?Q?KJTfEZCZxm3XC0VxFLoQNVQHeokTeiDlvx3oGMBRaVtf7l0q27aRBW1+6tQN?=
 =?us-ascii?Q?U0wXMCABuqQgsi2ByiMzsfwyNMHbQMZcfSHdQ0RJSYsN+WLWSTxg5VYv1xTs?=
 =?us-ascii?Q?s0jjOESejdJ1nyAYcaoAPKXSiXwb/gFaCykc0ru/QfKYCDb2HJbntoi8qADR?=
 =?us-ascii?Q?sBLkFSoOINJ5ErlIBG7M9oU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d357e0b-31e2-4a1b-e69d-08d9a427a816
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 08:54:07.9771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6UTEEzzPCYnFvy7orr7PHjRIFMdjtumUuzwKcP5NL3FHHzXoVeqXWSBLtjLXwNH+/TyDnU3pYcg2+G5zIkNbLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9332
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH] remoteproc: imx_rproc: Fix a resource leak in the remove
> function
>=20
> 'priv->workqueue' is destroyed in the error handling path of the probe bu=
t not
> in the remove function.
>=20
> Add the missing call to release some resources.
>=20
> Fixes: 2df7062002d0 ("remoteproc: imx_proc: enable virtio/mailbox")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-and-Tested-by: Peng Fan <peng.fan@nxp.com>

> ---
> This patch is speculative. I'm not sure if the added function call is at =
the right
> place in the remove function.
> Review with care.
> ---
>  drivers/remoteproc/imx_rproc.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/remoteproc/imx_rproc.c
> b/drivers/remoteproc/imx_rproc.c index ff8170dbbc3c..0a45bc0d3f73
> 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -804,6 +804,7 @@ static int imx_rproc_remove(struct platform_device
> *pdev)
>  	clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
>  	imx_rproc_free_mbox(rproc);
> +	destroy_workqueue(priv->workqueue);
>  	rproc_free(rproc);
>=20
>  	return 0;
> --
> 2.30.2

