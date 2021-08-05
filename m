Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4248CC4338F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:58:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24CF46104F
	for <linux-remoteproc@archiver.kernel.org>; Thu,  5 Aug 2021 09:58:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239866AbhHEJ6r (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 5 Aug 2021 05:58:47 -0400
Received: from mail-eopbgr50048.outbound.protection.outlook.com ([40.107.5.48]:31808
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232852AbhHEJ6r (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 5 Aug 2021 05:58:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYdauP/2F8am9AByJBDlQunMlMCpaaddOf1NGQIP2RQhYp5wThMfptPuT17cKwekK7rYzsLOih10Q37BXPLnzDXeeENVQOPey683I+Sr+oLsWpWZhYnqeLeBglBfAwyH8drH21Sd9SRPZpJ5dsACbAwur0ai/scQB1UE5euqB6tnMobC29sPE6uW0gqemwr32sHVNzoZdvVFpWzlC0v2oCnGDy4pU/D0iVRIg+P3WGguRd9TN1JoHguyD7AOYCjWTGTpPZ9iQI2HMcZ21HxUPOb2yrHSFUlhyoxtv8bQElUfSQ3c5C6mmfvG2QoZr1WuPZlCpHcOFK74uGayDJJ4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHY730G5Iko3xuA6qWzLYYHQxK6XDXRUNlsICVzp0SE=;
 b=bOZG6CoNJrl3FYkSLXAUYLTIJJ1uIRi+aTJ8Em8++zR8wxv8zNs8AJlQzvsfQSEqks0gYuExwAGmN94Ox30dLwTV/1FMX0+uvwbA1GFiKxNgudqFQrYbKQTKClPIPFIZPxvqs7KgV433gbtGkstBZsJ0rR+s6n4MhSo5qImAaolmZxFtg/DInlO7KcpqLUd+Ic0BXiQnfwnxwG4iU60C7ZyWtyd1QHkYYbiYoZyrJfzneAaLnY3UPx93WgdKS0297n8PQM9f7Xd5Xluo7UJyIUQQhbw7lodEyF9UZ0NDSoI9Wbkn4Zx2ORhpmgvAdRP08TbpiagdVT4pje+g/qE4PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RHY730G5Iko3xuA6qWzLYYHQxK6XDXRUNlsICVzp0SE=;
 b=NjppRtVxYAhyHlHpdqvB2Fsj8DEx9j+RDUWOjq9pce5z6DJWKMRwpoxe3WygzRjrIA/4bvXmqi8xi4uIG2E5SarxCGKa/W9d460XE/sjvh0yW3m2c4ZRU9cWWEhLfwtyViakV7jB7DpAi9qTtITtqOWBOP8imCLQZKN4NgiWfjk=
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AS8PR04MB7592.eurprd04.prod.outlook.com
 (2603:10a6:20b:23f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Thu, 5 Aug
 2021 09:58:30 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::3839:217:6252:b1f8]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::3839:217:6252:b1f8%11]) with mapi id 15.20.4373.026; Thu, 5 Aug 2021
 09:58:30 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "cleger@kalray.eu" <cleger@kalray.eu>
Subject: RE: [PATCH v3 1/5] remoteproc: fix the wrong default value of
 is_iomem
Thread-Topic: [PATCH v3 1/5] remoteproc: fix the wrong default value of
 is_iomem
Thread-Index: AQHXiaqVJmidmm2v6UeHPKS6x/j9UatkrUyw
Date:   Thu, 5 Aug 2021 09:58:30 +0000
Message-ID: <AM5PR0402MB2756C145CA9BEF87B3A70CEA88F29@AM5PR0402MB2756.eurprd04.prod.outlook.com>
References: <20210805033206.1295269-1-aisheng.dong@nxp.com>
In-Reply-To: <20210805033206.1295269-1-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58ce7710-2976-4c0b-3429-08d957f79464
x-ms-traffictypediagnostic: AS8PR04MB7592:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB7592037B04EEA81B0C91FAEEC9F29@AS8PR04MB7592.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QcNcw7CH27JOlUbhDWFgYJ2Vl+bfswaxxo2Ue4fjmfVWslpqIPtd5MXwlWWBIqCKGvsc/mvFjAvH2+Xjrw+KfXPp6zeafRyRxgr84Tx5omzy2IN1pxRfPa1WuGlNulLXUKGOm/uxu/9lI3nN6mb1kmHmJ4dZz7A3VaAhY4xJbJyBtYlVsL4o7kMLneXk2gZQKKto7bLdJtVQJUD4Inczeis6sQsKGAJHBQg79GiWdkyLSlfgwTlWxGZutRGiy8xtg4HyHJFsscRj8iLMXZuWPiZSj/+c354S9NRCIRFCRjj5ntziUpkE4yYKeIaB7RHSiccaP5+GNdi/dsRvSKM66zlH307tsYVv/MsIij3lvnkfW0XOfBGW/WGnqCPxCqbwBY0MLwjuhIDealtyPz1KpB/7eFtHt/kR7AtVBItHlBAdIhQkwX2hPHhimjRul/8aKhn9xkfY+vFQZ1Ie3XUXaEx23RyKxWQq4kfmT8M+hEgQZsMNSD3iUiBTFJwV1qqaAsHj75UC1FNg6+IfC0q79Qn7mCwNxmPtVahMSFgaiQ2aBA0EpJCMp3bhT4ULaAtkdThkk+seCD77cb7VzqDji02cry03vPzZyyHwiO6Pi2qp4drbL1VXItypZ9eO1WYDiJu0/FN0Q/L+xRfzK+4+wtUTDNQWZ7RpcBs5BZKtECLyF8j83SSBUZM4HWX7GNNieky4/Dy62p+m6sBONeWZlgqK/8hS67yauzCuRztFlSd/T/tykUxyK/IaWuQC5KJtm8N2s2SVdarqkKoJY3ads+wPeLkiL2GqB1a3aP43PLs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(122000001)(55016002)(7696005)(5660300002)(8936002)(52536014)(71200400001)(478600001)(9686003)(38070700005)(38100700002)(966005)(6506007)(86362001)(26005)(186003)(54906003)(83380400001)(110136005)(4326008)(66556008)(316002)(8676002)(66446008)(66476007)(2906002)(66946007)(33656002)(76116006)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PA9NHvkfaO+jt80WaCEJVSCFq+d0qv4OINwvz0mBr7gqy+DzMNLI/92pBUIy?=
 =?us-ascii?Q?y16DtAdR72XJjJg4wZUt77ljV6fOGiTIpooSEMdS52v0aC4Wt9wLWnFpkNL1?=
 =?us-ascii?Q?J6MoFkPcncDeRe6wm6UbS6MdpKNvmedgnjEHkioUHMC3o/kTWH+XIft3GovH?=
 =?us-ascii?Q?yY9n2x5voRBzRAbGJcYrm2bRyBet84/rIVovEEVhFv9ghPLvMR02Qt6B0z5b?=
 =?us-ascii?Q?vx4YmEJcU5uZhpjhHUfzEghmODZnuVOwcVp4foulOOKgje0HphshYkgwyMxt?=
 =?us-ascii?Q?9wo2vwbxR7+4vwpP4szA9FevVZjAM1xb5gNUTZoCDHrcwWzkX+j1OSdqhXnd?=
 =?us-ascii?Q?vLlfci25S+tSBvENYHDmuRlI7lEJT3GrQp3H4o/bI8cNBsAMZPerml2iRJws?=
 =?us-ascii?Q?LwbbFAvy7um/UJDXAkY8/tg6O7b2ZGZhZJtppozF/XD5kelP6Jppc2wO3O/2?=
 =?us-ascii?Q?j0E3eVCZ6WgSlESUX4JT8Y9skxbulEJbBy/prA0lm1oGetrDuDvtkmwFIWXh?=
 =?us-ascii?Q?969ZLJZqfgjBCUmKU/0OMvWf23hiQA9GphT+gWBadABpcaBQeV2BGKxB/iA1?=
 =?us-ascii?Q?ey0+p5eluwPH00kFWH6shqo3DqYZW1pMjLhA/drr+gIUPAeOoLYsobjYmozw?=
 =?us-ascii?Q?8pjNxivluJbw6CfNNNEpndwAu59QD1cm0AA2qfwWbznqgOEaWtbmDH+vH37v?=
 =?us-ascii?Q?LVVePZ/kHNtxQ/zls7Uti95f7JeGKSYmv3LuEvaanydBpzvTjKbBov8eUyv0?=
 =?us-ascii?Q?LywNsluE3cYVrAviaLwUq+3+/5XSkzZNOa8JxGSWolam4chCROK45yWu5Ss1?=
 =?us-ascii?Q?wbmeUhMxbJO1VRsXjkudwWackJeMWPyKKCdnFx6k6KqfifdUgkspgEDjCE81?=
 =?us-ascii?Q?7NoQ7kRTUvP6GwEFdbFXt0+r2d2MMCD/QAONRFPzT6jHELqR+6aiHA01jGlP?=
 =?us-ascii?Q?qXN9WT05gBI7+8bJdIZCgd2LvbhWE6U12esgfgrRZJfxvuSog8GwDGrupJCt?=
 =?us-ascii?Q?XaEoX4ZiKPWQvCwSRASfcugkkOMIu7gfccKHueTipaH+dR7wXoYOxuGsnMKD?=
 =?us-ascii?Q?hbqehu38LxrfvZlkEC1Qwo/CWI63us62nhYGvcuoyfQeVx8iaa8NTm7TWGMM?=
 =?us-ascii?Q?ZUJAXm8ta77hsut5rDSBE7xdApUZ3+r/kL2YQQeCwGRFzsIHDo3FvP/T5gIr?=
 =?us-ascii?Q?iY96qSL26k+YqryglVKUqf0/S7Ca6o8jAz/xLcfyUvY7iT5GN8efLkqZ8gPZ?=
 =?us-ascii?Q?UIJ8kd1q9pOtTKTBQ89uTVeFbe+wdYZqzPylMEWZqTDKNjCqOp4YzliCwUZD?=
 =?us-ascii?Q?sPd9w6lto8kvNQSuKzou/A+F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ce7710-2976-4c0b-3429-08d957f79464
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2021 09:58:30.6779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XAz3DiUx/R/cIsssw7illt+SCpDqNgfhd9gE9/6igMltqgvzDQ/ZoApheM+wqNDe02S/VBt0f8A+JF+IIbWnyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7592
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH v3 1/5] remoteproc: fix the wrong default value of is_iom=
em
>=20
> Currently the is_iomem is a random value in the stack which may be defaul=
t
> to true even on those platforms that not use iomem to store firmware.
>=20
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Fixes: 40df0a91b2a5 ("remoteproc: add is_iomem to da_to_va")
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Tested-by: Peng Fan <peng.fan@nxp.com>
with https://patchwork.kernel.org/project/linux-remoteproc/patch/2021062901=
4752.5659-1-peng.fan@oss.nxp.com/

> ---
> v2->v3:
>  * no changes
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
> 2.25.1

