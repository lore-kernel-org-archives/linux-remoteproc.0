Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7C8C433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 08:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0ABF46113E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 10 Nov 2021 08:45:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhKJIsT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 10 Nov 2021 03:48:19 -0500
Received: from mail-eopbgr70051.outbound.protection.outlook.com ([40.107.7.51]:11626
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230381AbhKJIsS (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 10 Nov 2021 03:48:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CYjzyflATzzEWplr9UnLfUQaF5ZeE79UADhWC7c/KfatvFaxuQ8cIHRYY8rVQLXjk4xeNp9KozTgo2HxcV0U4npjHKjMrZVZWMrgL6fx8oqIwlAxHRJtxsN6Twjv+GpKGljKvlztzw94SJUF1BotAg6JuAMPO6Eugq+eBsnPu/2xELPKcxkWhKuNThhw90uAI20z9UWk/O8mMnZuJuOsoxRZY0eS2J840jbp2rsoecrZrd4h0z7EQc1laKsIW9C8oDPYl2k7DOzTmTJYnvH9kaUOefHZYpYt8pUbJNBru9NVUdQmuWPJNH/oZUbMTn3S1oGYtpcYHKNTHyArfZDQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mf0ILvvc/n9EBJcH/CRmpZDoopIkyfteWPLeMbCp+pE=;
 b=h+U5oDeS1xAovH29VT2hHB2Zql0XlYGzLkimYUnEg6wX9el7SDdsMAVRmU+MKQjhMJa1KYyLyJdWIfPrdgeo+8qgHA33OUd9Ib9h2fvxhKnexqqxd9jiWAIYD6jy5ehVy+BDyhV156Wyh58muScELUVoPq4+iMk5oCAVIu+BGA2en+XNepJBZjahrmxguq+ylQRtd5pM9KuJKsfwNXlSJ2jTUnQIqkDBJInJy1F2mIcfWR/c8o/f2jqRUKVT4+Yk10wHndUlWUJSnHxXXk2WafwR4tyWC8LzlYD+91LWrrWJCzQQlD66qs284dBsn4zIPyd/YLZHw+rS2xewdoldug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mf0ILvvc/n9EBJcH/CRmpZDoopIkyfteWPLeMbCp+pE=;
 b=CaD9E8c5c6XQvk5rSStffw+LFoFIFOBRRUgPIwkcEstIGya4ZzKcGB+AYNGibixwUHYTdV85GdaXjCXrvG4A5jGPHX0cPRkCo/EBTg+RgUu7Re6JLZFqGSLL9kj+7+oR7SRXulPBkSk7FiHw0t2pyijB1He2t5JKVgbP7QbiX2E=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by DB9PR04MB9233.eurprd04.prod.outlook.com (2603:10a6:10:373::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.14; Wed, 10 Nov
 2021 08:45:28 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::82e:6ad2:dd1d:df43%9]) with mapi id 15.20.4669.016; Wed, 10 Nov 2021
 08:45:28 +0000
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
Thread-Index: AQHXwllGUAnFZVoMdkqW8DriEOlDKqv8maNw
Date:   Wed, 10 Nov 2021 08:45:28 +0000
Message-ID: <DU0PR04MB94175710BE0DD8D08725B62888939@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <d28ca94a4031bd7297d47c2164e18885a5a6ec19.1634366546.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <d28ca94a4031bd7297d47c2164e18885a5a6ec19.1634366546.git.christophe.jaillet@wanadoo.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bb11b5f-763d-4854-886c-08d9a4267263
x-ms-traffictypediagnostic: DB9PR04MB9233:
x-microsoft-antispam-prvs: <DB9PR04MB92338EF3CD82C53F3159EC7E88939@DB9PR04MB9233.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9v1ZPUuMu917tWMT3OSF+sw9qxpbqXKBPIfEoQRP4yJq5yFhVF1ViK8Tu/2rpmeoGrLpUszlWFi6JaRGaqE/QNJpJsAgbXvvf4Bc12mx7drIRRWyKzXaz039MHxZYiAnC7Vg3YyHR8BDVcmLS7e1+e0mcY/jk5oMBV8l8wQsVtYE4V0jV1eIBEedU6flH8T6C8qsCZeVGAVarhLtbKJ5zdkKMAW3f4pnHlEtvi7kgUO6aIR99dUhX1ByrQDRoPxladUPbbXMsG3QULlZ3xJasujMJToO101y++6m0L86kXblOd9gjP7HFEcaFmP+F+sxNXnfiqcP905h9W4FXh8fKUcDaO6+wCvkKjZhdVoelUDzp+muW/Vh2yZhGl9BMCCsunPEpM3M+1YFE9MU5NqHI9rP16srVbLt0JrExyH+YL5StdDXlnFBCgeWfuuw/Lt1SoRnJHQ59l3YTY1eyDj/XACN8WAbj/25UMkDOYBQAcjnuv9WbRZlvzmqQLhsr3fDpJMinbwYxFRafCo3by88L54u+51GM+J2tHhgs4wlgTNVcNn/khh1A/iZwfHuo+2wV+6gbNiZKsNXkmulXpwxtbypaY7ZAkyfRpNPvBRd/60GH7rnTkorE7uU7i7ZLOorVKem/chgAzRRdhKK9eP/EK+Cl20eHmhOwNdNruMuPj9CsZawPD53P8aghbzh92zgXm97h4fBky6E4sOyI0tNwaNyKQWyI2X7rXKQ5gJefwg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(508600001)(38100700002)(54906003)(38070700005)(44832011)(33656002)(66446008)(186003)(921005)(9686003)(55016002)(66946007)(83380400001)(64756008)(110136005)(4326008)(5660300002)(7416002)(26005)(52536014)(7696005)(8676002)(316002)(6506007)(8936002)(66476007)(2906002)(66556008)(6636002)(86362001)(76116006)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ddHlcxvdTtYLrVp0bMuhhQFE6dmgpZGUGlrapeY++bR5SIaZ8lCBOL+wi/E0?=
 =?us-ascii?Q?qGUk4GCioYiSQpFhE0JSIlz/dnMnsBlgLoudUf9zfNHIOv4m3uB5/BC1Qkda?=
 =?us-ascii?Q?PBGYm83hp7pDVrF4K2zSRgC3LCMRccFkrnQvz8H2kPTV3QfoNuhBV1RNNM8T?=
 =?us-ascii?Q?fy7h/eI6jWfR6rBGRIZLdSJTG8+Q7MklNLAILR+GcNLGRv5Y5MxMLju0Q9PG?=
 =?us-ascii?Q?mRad+3s2xLBEVz1v8btwvv4Ymf/PEnDdBe58XL2bixR5+EKzKuMP1Lg1/VAk?=
 =?us-ascii?Q?LwVQ8UUzeskfy7fEX+d6Hp93PFVcw0lR0rzio2bDLhCYjWVPYNMCJY0sxHPV?=
 =?us-ascii?Q?PGyQP6Iu/S73Wi1gVbVeXMH7GNgegSjLny5sGtZDzip4BSGbput4Wy4ReslG?=
 =?us-ascii?Q?iJOlGbWxTHsRwtwDe7wyhe7HOP0MiK0cngz7D57F9osllB3ZoFUH3a7FSDL7?=
 =?us-ascii?Q?T8JPw2qACuA9aJ2dPPsHYFSsf/SuigZ9GXXxqR7+CXnSUcd7NIVpUy0zHAG+?=
 =?us-ascii?Q?SBBfo1zVrPiJRo3qtIG4uN4W5hp9qX1wX9DPDBgyVABEDh4LsBofb0YHPaEj?=
 =?us-ascii?Q?TeMKY16l4FaalIjKwjICJw6v1JL1Z7mqYdrdh+Q2/D/IhQB6OL3VxtLQE3Km?=
 =?us-ascii?Q?qtr3kXf3ZBHp7GaQogU/MfnOXrWybuHF1ASLGhHl1VY3XL81WTE+tohPXLJy?=
 =?us-ascii?Q?nbrKA55w9xPR3t9qeEfFeF9XlPYNPVgBP8cMfrSGtar99IzWUcQgSMN9R7k/?=
 =?us-ascii?Q?WQpVRrJDxBXtgV/uX8+tINSuiGpqw47LwDdEF3LEuCCFrqbZ8C8gkQwemk2m?=
 =?us-ascii?Q?17Gg6hLjBHNEdw64LS+VCJ9wkIxK5qf41aOyqIbIszhi6gaL4dp2DEhmVVMa?=
 =?us-ascii?Q?si71D7Oximv2GsELpwrKaNighjM2lAyB+YB7m9YjHFvSkpob7EH1CgWiJYD7?=
 =?us-ascii?Q?3EAWwRKAgUw+LAQGhchXskDcV9Cv5gjbxNpRW883u5e8RSJSSo8Tu59Ty7rW?=
 =?us-ascii?Q?TdPRwI0NZGLnslw9SsF5h01xmDWoNg7/8rYr92G/SZoQTa3ngBHfNDR5GPqZ?=
 =?us-ascii?Q?mCocOs39yoKPfSZdG5a6h6ZwRARd95v+nR4w4GiLTXCdMVQe/9QeV0rnw3IR?=
 =?us-ascii?Q?wzw0o9nZNMO0N/e7TdrxRsjFTFmK8ZbuY4iAr9VGhxHc/2f2q/96Is59JXAZ?=
 =?us-ascii?Q?Lok2o9LtfK59C03fhcWtcmPaQYspyCv2mD9qbZdoXS6JJjgTktAtY0k/XkgZ?=
 =?us-ascii?Q?BmA+ODp9v3VBouyX7jNBOo0MbegayWEBLsD/m6TEKX0zqwCC8IIjFZpBGF2y?=
 =?us-ascii?Q?a2qpwnCLcXtwqhuZfL96w+NEc8QrjnHa2ZxAMSVy3E8fGW7mNTVeenkPkjwW?=
 =?us-ascii?Q?yA6y+I61Evy3qlE3eGDvp7+SbOP+3QggVh4jlcdF4EnR3IPj+TcjeVYV0SvN?=
 =?us-ascii?Q?k4KXGlajzMjGrQSA609XoLOA5NHf6ecH8xirBXUwxbIpADYB8N5eQjVtsZPE?=
 =?us-ascii?Q?dEbd+dT/ov+h3elhWbCHpmauMsxM+FmpwpZO/aA+4ZJuhHwQW8Bqz+5zW5dh?=
 =?us-ascii?Q?ZP0oKk1SRAkBKjbUYOJ8700xDzLP3Q/KtmZJ4sddBn/KD6MUSDQouRIbJ6Wd?=
 =?us-ascii?Q?NosISz5QPHIbrSLgjTqnoOY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb11b5f-763d-4854-886c-08d9a4267263
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2021 08:45:28.3368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 667km8hn6NUG7IgN93xvGLLi62FeWxVlQOYBt5jDPinfvKLNLYPfliyc9yFW+Ff8Ar6oz186tf6KfSxHwBHigg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9233
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


Tested-by: Peng Fan <peng.fan@nxp.com>

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

