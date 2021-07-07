Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E44C07E96
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 02:14:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A17261CA2
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 02:14:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbhGGCRI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 22:17:08 -0400
Received: from mail-db8eur05on2069.outbound.protection.outlook.com ([40.107.20.69]:34913
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229873AbhGGCRI (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 22:17:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5bC3R3rXTooQFSJ6w8RsmTsryrFiYSN8PePCy+JvXZ0MV8oPDulgrzpyAD5yWJvVRH1MK6SXZ7set6+1moHsIRJfYDiFjb+pR1SjpyNQ8K6dm9F1b10W7RGaewlkr0MloL7fH13MhGZnuODYP1apKHPmA0cky2SlrW4WFXf5MA37z3siORwnlaGFd5K1E3+2Ax/zeoFiW5RUqzghgwqLE7IRLre2ELXhyfFA8xvCTIQXmyjVe3T4bF3DnYp+4UuVxEC9SG67A5VBRf6G78oq8JooZrBpNyx8NsXQWVHtQa3SpGGdWv0/77YyWuUCMrejuF27gXiwFjslseoMfeHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtG2DSid+roBKpBWCfyWYN/+cDvpoJS2KTkI/a96LVM=;
 b=gcFhv+yQ/A5ip2NGeFa4v130pn7ptGfKLjIOQOQvf4K/foLz4W7LJETv/qu9WsLFnhkZqHjaW0D6n57TwZZedufj80z8RTPmL6R20W0foy37vPaVFa8h3RVkfhpviyBUrdTfcTAySYokVxGBJD8iSDHmF/rCcdQY9fjwoh4KTQwjL3M+3HWCNNj0IxTC5ZKqEcdN5rxxBYNe7U2qbgyvfrlSHhFxjqMMPhUczwEZH0zIhCpUjLzC4vDF6CCiWiAakrN/fMaMwVMQ5inCMR7Y8Wien1vzkc3F6BHpMhslXnz1XzNUcqFS5kfoBJV5qbo7slFq06Vwv0TRiPtlcQUtmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtG2DSid+roBKpBWCfyWYN/+cDvpoJS2KTkI/a96LVM=;
 b=D9rM1cPgmYpsoG75DupoRWnmI+p5xEU/h0XRSJy3XNvn5nlEJmRHUk0+8dZ1hWZbCDSKke37wet6SQPhGSESfk1zYNYAFf3GUHtbMcWzmdGQVd6kATev/8JUpDCyt8l/mikz6Si6VXt2r+k2ZgTbJU45J/81dkN2n6mQWdTEoTE=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2373.eurprd04.prod.outlook.com (2603:10a6:4:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.31; Wed, 7 Jul
 2021 02:14:26 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4287.033; Wed, 7 Jul 2021
 02:14:26 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "dongas86@gmail.com" <dongas86@gmail.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>
Subject: RE: [PATCH 1/4] remoteproc: fix the wrong default value of is_iomem
Thread-Topic: [PATCH 1/4] remoteproc: fix the wrong default value of is_iomem
Thread-Index: AQHXcnKmXh3KDfKUA0qSGW8DxENTR6s2xfDw
Date:   Wed, 7 Jul 2021 02:14:26 +0000
Message-ID: <DB6PR0402MB2760F2D114C3D6367774AC96881A9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20210706142335.952858-1-aisheng.dong@nxp.com>
In-Reply-To: <20210706142335.952858-1-aisheng.dong@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6e6b839-745a-414f-4ef0-08d940ecf230
x-ms-traffictypediagnostic: DB6PR0401MB2373:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2373DB74A3B00387D047A049881A9@DB6PR0401MB2373.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2HUyiqzGnUe3szWNkvM3HndDAjV2JiBq0HEgh7mVMMuPkmJZsM8P83p+PAbTgK5a9V6BTtqHmNLTQlIxJBPTqUyUYz3yyDRre/an+P1HIw8TGXYI6I11aqqL/qOF0wlAaX+XOZVjdWUiB8asA7GIvPnb1RToi/W8hECbmc7sLKPfnDY/G4LdgsVBbQrsudYeSsmy9Tq6xIzWO4MblzSNb7i2/TRsjtrtr81Ey2eNAH6umIDIQpw5kr/FByXY2vN7AI9Y/XOlPfKqqjRiJg6gprXNKvHfo26/MsHhCDgU9e2W1hwYE20hR9etogsNPL02dinDDD2sttjSOqGnMEK7IPaHHT+PZHR1lQ/TervBtlN4dJEztd5AUaJAMXDVn3fv5PiqyfXWY20Z3yENp4dXq2fd5iQiXi/6qNimI/CFiNAJ53FlDal7cTykLmWtLzisZDbKqbQ2VjdOH7ncMUXKwTNQku0iPqotKiO+V2EFhYNG0snoRkgV+p5t7s1r9ZHgM/tBFV9xACR14/wZvL4O7YwbkGBSPlrXj+PAdDiO8sLnfchWf8KHYR51sNtQCsxFPBAI2zt22nwPPJdTCX6DfeKhFILHUW67PGQ9Ioo6Suu9PuSzspFHLjMNreei5DYylTh/T3W/knF+R/u+bezMyw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(2906002)(6506007)(8676002)(52536014)(9686003)(55016002)(54906003)(110136005)(44832011)(8936002)(83380400001)(26005)(122000001)(33656002)(5660300002)(186003)(66946007)(7696005)(86362001)(76116006)(66476007)(4326008)(478600001)(66446008)(66556008)(64756008)(316002)(71200400001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xozzGHxxOoGFPzc7lYQWNbTVa7AGRtQZKkJYkJlcOaWtIGJ5sHcyvtDu5JL0?=
 =?us-ascii?Q?22Nvxvp7Wd1CLoT0d/1n7uj/DEvmjjhjRtAXsFCon8jr/qZM92SxJF/Ivr/P?=
 =?us-ascii?Q?OF2CCfAnLLNHhLo4DzdkWZ4hmRwsrVVYPU3q4B5oZo+bLDRl5BWlihkR5NoS?=
 =?us-ascii?Q?3o7ispSzm0xY1Ye3aM/nIK/RZT2r6e8MDhkM2qJkXK7mTxpTRDx2mqabxHy3?=
 =?us-ascii?Q?CTv9vpLAAxHfsPf5IwSDkgPeEtE/NabGSirAhZGRPulmViWS3qXl/GrScKmI?=
 =?us-ascii?Q?7Q5EXFluVjYWoYUnpHKw9M6tAeDkBwzhxERk/4+Wh70Jj6VhVUymHYXf2kAE?=
 =?us-ascii?Q?P324MgwSrjXKN2xH8u7Rs7J8nDPfMKMJsv8lP1nLxrqJ4FohNYx8DrBakCU0?=
 =?us-ascii?Q?DfdMqbr1tLDgGZomrLEg1UcgWWH9jjAW79dgO1Wk9GTQUTeR54p99x+B1Jyy?=
 =?us-ascii?Q?YzWqjGC04tjzdLObNAgQF+lIMeh0PzGe2LklfmGDZt5VqTLo+wKBKQjRlCd1?=
 =?us-ascii?Q?G9cB97py499CDoPoQndYatZ+zWre6ZWxg3I7wqGhgjhwWqZ7j26usDwp8i6s?=
 =?us-ascii?Q?SeP/9ENVipukRxfMKH6e5OZodHQex7SQkS7yHbdsUYgiDau2rj5/haDcURie?=
 =?us-ascii?Q?B+Qxvf+SpNPGTWbH1QGy4zF14WxYZt5EWLE6KMqObpbtBWmVsyudkonWiyeF?=
 =?us-ascii?Q?603pAWBohYfBamk3vHw4eEgpLoYyG5j4BDG7m/fLKojIxwi9rA69S7TbCh4q?=
 =?us-ascii?Q?PWPKO90ocZD4fl7dPrTfujoz5gIhsiUXYfnFO3YBJelfvf/WP2+n0dqZOiMt?=
 =?us-ascii?Q?+CI9n66ZT9HCAH+t2yczSu7nTpWcyx89mxlXxnS/RTA1zEC5M0sDlxwhKmJA?=
 =?us-ascii?Q?ZN81+/IZaTqv5mi80qyz5q5VpbzL6WMOh0/Ke+5Wrzw+naJ2L0Ss3VKNLmOT?=
 =?us-ascii?Q?3kicivRdD1cACZMhF4MNMIyJ6SqwFgbJ6G6SdywU2523qy8UAxAjdHX/7Vm/?=
 =?us-ascii?Q?WkqgnerNpi8K9UZKFIcW1SxAzNfPBY8vrWj2hjqzF47xCQNStUD5o+hZdnQD?=
 =?us-ascii?Q?f6xc5s46hZQIBAgxtJWRV8Ab+6cRY7FfXjHDPIHiKEaxD/aJ2NUMBbrJPYas?=
 =?us-ascii?Q?aKxnE8Z5vOzcTWrMs9aEIRoVXOD/XWGiohfWyzQf26797H72jDQzgc1RvBW5?=
 =?us-ascii?Q?Y4FWx/CzUmZxl7F56en5zpSU3nBCb0hpGaXuG8G9vNUG133csqc+xkjKK2jj?=
 =?us-ascii?Q?h56vxItzO1YJ66rDgWPnhcWY16nRQZJY4KOal03xrCnjOWH+Vaqr+VoA/SZN?=
 =?us-ascii?Q?4p9SR1FqVChitY7nrmaH2isf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e6b839-745a-414f-4ef0-08d940ecf230
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 02:14:26.7638
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OiaMbPaD62bzteGc8yAyKj19C6TK/v8l4lIVMQmVUMidmMQx+jW5CRJ++HsNNBoeTQOS6s92jWjmv4mMk16RNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2373
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> Subject: [PATCH 1/4] remoteproc: fix the wrong default value of is_iomem
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

Please also include rproc_copy_segment.

Thanks,
Peng.

>  drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/remoteproc/remoteproc_elf_loader.c
> b/drivers/remoteproc/remoteproc_elf_loader.c
> index 469c52e62faf..2bee4d5a0995 100644
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

