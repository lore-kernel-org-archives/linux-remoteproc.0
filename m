Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C28C07E96
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 02:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4146761C9C
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 02:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhGGCYC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 22:24:02 -0400
Received: from mail-eopbgr130053.outbound.protection.outlook.com ([40.107.13.53]:53481
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229873AbhGGCYB (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 22:24:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGjrtsvyI0BXkLl2jf6ES3JhmebhiaK3Sq/0rh6aMcGbNC58+ri+4WbOllHzPb8Z7WZ+XFZNE/pQg6XpJPI0vIinJq+dnqTo+Vh+C9hA8XUCEtuKWtVedblc0unyY9D7HTMutBsTMFMG2zFm23Ddbc5+hkRX4x58ZFQC//XhqwBp4B7UxsK4X3y8FijK2PtF5G/qRnWEDTvsFNRiCxmJqnXHzUmYdddI2D8wrRgX8F0l8sTnVG7Hc29UnadN6BJasycO/J8IbJnUEm1uWwu5SW92qxrIZRKYha1dFgooMoCSBddHUCwENuw1vbngj7f0/nseAW7Dm9JXHFxPqc1KQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33wZfe+lpNNr8nJBt56gcT5g0nS6yt+bhK1OZNgTpsM=;
 b=bjv46D882U71YAoAFMruY50ulSFTg8XjHue7YbNe3nhmcC5o7uqjNPdybacstL26Iq2wSJg4jvOWRzuK7lV+UYpGzeTjr9ZJekj/xRopEvLeSCCOl7AVfgnol9rWbPs7mMlYijO5MfWz6kiY5zGC7pVw032UdBwCXAQaNbyWaPjBqUNrCe95G03O+52Y/gaenXHWbHi+ZpNSGDim7EDFqleaqVFlmVz53JOlT1B+nZTrJLbmKVvr0SM1gbZ09YcHPPT+0sJd4RMOt+SPehhF1oWKjnjIwxBMmm+83zF7vsOkbh+E/uzbFunUieKqqggEZYSQ6PW+mQLuMZIoKIAmig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33wZfe+lpNNr8nJBt56gcT5g0nS6yt+bhK1OZNgTpsM=;
 b=f8l+hzlsXsOZHJ4TV2c7o2slG/VEI7F5tO1OaLvG1+iSsVWZUY9lrz07YsILntkfx3hgJiph+Rclm5jWaD2q1tgm5tYxCMsrDKTvK3RhIH0seUvtfGKZNqZKwFKgFN+6UEQXYUmTU2xe3v/ofC+CIayCsAjhWiQ7iHdeWy+fPxk=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Wed, 7 Jul
 2021 02:21:19 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 02:21:19 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
Subject: RE: [PATCH 4/4] remoteproc: imx_rproc: fix rsc-table name
Thread-Topic: [PATCH 4/4] remoteproc: imx_rproc: fix rsc-table name
Thread-Index: AQHXcnKrFqcfYIjnu0mUILYBi2xRSKs2yIiQ
Date:   Wed, 7 Jul 2021 02:21:18 +0000
Message-ID: <DB6PR0402MB276069B1F91817B014B7733C881A9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210706142335.952858-1-aisheng.dong@nxp.com>
 <20210706142335.952858-4-aisheng.dong@nxp.com>
In-Reply-To: <20210706142335.952858-4-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03bcaa75-d256-4bad-f312-08d940ede7cd
x-ms-traffictypediagnostic: DB7PR04MB4633:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB463398EC64403A24E68E1D31C91A9@DB7PR04MB4633.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RC0d7W5YPc1t6ElqqFC+jH87nOB0Lv3rdeVSreen4ntW7VLNHu9/w5B4oeeaNx3HWBf4fYXsUKHhniR97k5Tt/8/934JUASjCT88ji22I4CkwGBcHTQFMDuvlpEQDE8sh1ZTts6RJAheqXxaUuwADjGwPFl60Pf/ng1a5dciW+M3mzDWv5vNz4YTg+PJhfsVDeofk37zlbRKdFNcprktdPp20yCtsMVKkh+xqMa92c93kzy2lTSMtbm8RhpHkfU7cd03aracj6luqUWF8vdaJoZrV17/H7SX1JjnhkusRxoEh1dH6eB4YMwbpxNINx1kn5cZx/YYwigUInOAdGyTWNlpMlEmxhUTtGSf2EQ0EQrA6Ni8vjyp4JscgPFt2pmPKrLJlggwJGkf+KmgZex/r29ki3hsY4unjVRa3FVQcs9GPXWCLmuHRo6mD8P7Qih2gWtW1+2Dsp7B38MEUuvWHQ2PC0Yp0yvb2fll6wnI/lh7xSVDXWMxPi6nK1jnKjQx12veEjbmw9kBwlNz4O7oQRINblE72zfrWg5JR9mFQIzaoKUqfCMMXO0IrtzZGymFtr/Sy4HGCMCm/6Rss5ZH0hUCDaLmRnrSqJrvTV28P0kmFkhQSmjyIZLnsmOdsadCwD1vKOXyQRXGzRBvVfsMlw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(33656002)(66476007)(4326008)(7696005)(71200400001)(76116006)(2906002)(86362001)(83380400001)(66946007)(38100700002)(8676002)(26005)(122000001)(66446008)(478600001)(64756008)(6506007)(110136005)(66556008)(52536014)(5660300002)(54906003)(186003)(8936002)(316002)(9686003)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BA2C2QPmfYnKOfIVMq/cBw08SiZjEIx2hDbv9j3+UXRVTpuBrpRi3RTK1aq/?=
 =?us-ascii?Q?Tn474xYE87H/L6nf+5nHR6oIWYurLAZ2OUqdp5EAOFMcj/9wrl23Q45IHHcw?=
 =?us-ascii?Q?gn2wrmoDqU4W+kHCcsSscJs1qAac7Gd9O9xskNaz/0jPG7GDrFDF5vaOr2dp?=
 =?us-ascii?Q?zxQbT8QD4DfsL/lT7K3hzylf6NnJFsPkkVyelUBoBUMQZAT14PvkwjKKO6h7?=
 =?us-ascii?Q?fFviRdv3EpziNd9tw9r2yXtVx+XrYe9eshkyp+Bb9wH28GFTZlITT3xBB3tL?=
 =?us-ascii?Q?3LtDehpJjVQ+GKmXDSxGrGqRkzEaqf0qa5C6llxvNl9MD5py7maTfzFo07Lc?=
 =?us-ascii?Q?Jw2fXmrKNmINXHa8F2RegdQkPY7ghhdevmAMJztQCuvOD7RDKc10fTE8RTk1?=
 =?us-ascii?Q?z4+ITtyqcyhy+EsG3YWqMUewywkRRu5K5Ovmas2VYuZemiXSHyY/M+/ufz8L?=
 =?us-ascii?Q?4oZe42k1Ak9BjJq46Zzb3Qi3atSZEim2ZCMG8sUSPPUuSnAhD2qhNvaTlXyL?=
 =?us-ascii?Q?OG4itfoa+fgfUHlDE8V5+LiTYsNs3rEdUnT9EQO2y70beJxPhjLlMBQ+4dD4?=
 =?us-ascii?Q?GeK4S0MVL3VTbh5c64zqt1L8RMWyDFyqV1sQofWm7wwWiaIHyDQOWrlOm9m2?=
 =?us-ascii?Q?XQZjQk29A5N/EKTqpOZalcgp9SClWSs6GaEclYHpbJhz4vs4wT73i0toEwoQ?=
 =?us-ascii?Q?qPETMnBk2zTcaj0ndXnTUEeb4+D2v1iGOmfeYBhUrTBkFozLWEzzlFiqShZ/?=
 =?us-ascii?Q?AyjCZLdp7ZEFyRR1pUrmzTua3p1cDM1eDroMy3mFuk1ZLa1YQj2PN4X4uynW?=
 =?us-ascii?Q?oEYuSDt5SFyfBVAt185kwmlDFROaAH5iOTJCZr+pyY03yJVBn53DLDDt8NF1?=
 =?us-ascii?Q?w+X6+3IG6Pdd1MKPJsMOje3iG8ugnsAmkr+oFJyhCXLLLMHYOIDdctjsV7pl?=
 =?us-ascii?Q?MZigJdX376In296FKimlPkA8FfOZ0ADUSiUCoDO5cIqJuZFEw/xMlSgphvvx?=
 =?us-ascii?Q?hc5IU7escTfLIo2DVgIdrlMZaYH2hi+Vzwqc+hqAVNq+ERz58nel1un3Ka1j?=
 =?us-ascii?Q?Pb77BlWIuIq0Je7kcjbTaQY6GO1WtCGl1UlRNzz7w48VJJNQ0ggBnRAnFCTG?=
 =?us-ascii?Q?6uywQS+qDuM5UypSFf9o8xttmEIKPFxKb/NvGUsGz94KNA32vinKCn8GVo3U?=
 =?us-ascii?Q?F+4fLOHIWCdx3hbP2PVcHezhpxVMhHHj3Z5yG9bnddX3gOmzr58c8R5I9Oz8?=
 =?us-ascii?Q?C4jXFKgY7CRRnVquYPZpxc6lxl8+vjfkEo9rSocOwGYTKWsrWGf+P3FzHH0r?=
 =?us-ascii?Q?5rDDYiQQIofgZHc3iRrNpFfI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bcaa75-d256-4bad-f312-08d940ede7cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 02:21:18.9357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h5CzXlPRoUlmF9eQYANtq1eaClVR26bSHLt0g5DzFzQ1y85dnqo9/LSInc2a0zcMTbM5l/XOD7iYRRJfEWWpbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 4/4] remoteproc: imx_rproc: fix rsc-table name
>=20
> Usually the dash '-'  is preferred in node name.
> So far, not dts in upstream kernel, so we just update node name in driver=
.
>=20
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Fixes: 5e4c1243071d ("remoteproc: imx_rproc: support remote cores booted
> before Linux Kernel")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/imx_rproc.c
> b/drivers/remoteproc/imx_rproc.c index 12de153abb2d..26eb130f3263
> 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -600,7 +600,7 @@ static int imx_rproc_addr_init(struct imx_rproc *priv=
,
>  		}
>  		priv->mem[b].sys_addr =3D res.start;
>  		priv->mem[b].size =3D resource_size(&res);
> -		if (!strcmp(node->name, "rsc_table"))
> +		if (!strcmp(node->name, "rsc-table"))
>  			priv->rsc_table =3D priv->mem[b].cpu_addr;
>  		b++;
>  	}

Reviewed-by: Peng Fan <peng.fan@nxp.com>

> --
> 2.25.1

