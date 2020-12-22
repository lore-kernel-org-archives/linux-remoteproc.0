Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6621FC433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Dec 2020 07:55:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24EC622D57
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Dec 2020 07:55:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgLVHzM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 22 Dec 2020 02:55:12 -0500
Received: from mail-db8eur05on2064.outbound.protection.outlook.com ([40.107.20.64]:52737
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725909AbgLVHzM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 22 Dec 2020 02:55:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zd9JMcJDnwo6IjLVGXVq3lSe3euHtdrBsXVsQjOtXv8a73TlTGoZVc8GTAcHsS/cDajuftAXhG4u+RYUmDQReGfjihd7S40NGF4PeCQUTgjEKqVin1EMbTotVxvvUxnu5ZAhnEr/Ufr0zgX4NotDva8IpJo1Zk7WFPGIDRFbJVdY605FKsVxcazg8WtNB40WWnZmxqf2j139jv6GKUa4fS28lr8/R4mAUZ5fJXG+HWWD+CWmlkSA5maDctd2CAdjBjEdF27I3xPn0bMduZn47ZU6ozBblrvM3+NrbupkwH00/voyDRG/9Cg47D/3FvK5bvMU4fXBAqgQxOvB0fcCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiUwywdmiy66YeAo24xdmaWzjXch53fqq37vUlZOuAQ=;
 b=XHxt8h4vRovFeaYQhPDkHFhDhjTkQc5WfudO0AFot22nr3fbxH1R5NS+c5qITnGlms7rgItV65Iyj4QHRQ8DxBHyKovbqi8XbOHdU+aa/7T118jVgXU26FaSa7723rnWgCrYNWJ4SxjjkiHuJ0fuvhgplH1bstdz97eyRWnoqQUL/H3am0a539a7cGVX7KO/nya4tcX2kZts7l+sfJxlU+JBQD7lYNy77FpEjb31MLY4HWnmVorgDaWZUo04ZFqJfyZEyes+om4boOZopFQYxcHiZkwvULORczUqSc3dmnX4y9VNl86ZIZUcvvbmyAB6nkoGB1/xltPbZsLEdryEZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiUwywdmiy66YeAo24xdmaWzjXch53fqq37vUlZOuAQ=;
 b=Q4avAeTTvQN9W45BSqk+A5wZkrNd9YDkdaM88APJtEW6JkvEhrnqawVgLGwTHxkUL+LCPejUAXAdBcj9MN4N4ik7zpvGoAmeay1oUJs1/nQwaSVvvGItjjckFxN3YN2pdq3rKG2AR0SYhmlTViJklZRKTLL+1Y4JuY1+ZPGp2fk=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7180.eurprd04.prod.outlook.com (2603:10a6:10:12c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 07:54:22 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 07:54:22 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "mathieu.poirier@linaro.org" <mathieu.poirier@linaro.org>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "patrice.chotard@st.com" <patrice.chotard@st.com>
Subject: RE: [PATCH 0/8] remoteproc: imx_rproc: support iMX8MQ/M
Thread-Topic: [PATCH 0/8] remoteproc: imx_rproc: support iMX8MQ/M
Thread-Index: AQHW13z+NsNgZ06BrUq/piw/bxdg86oCwFWw
Date:   Tue, 22 Dec 2020 07:54:22 +0000
Message-ID: <DB6PR0402MB2760E30E5F40479BB9B76ABB88DF0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20201221100632.7197-1-peng.fan@oss.nxp.com>
In-Reply-To: <20201221100632.7197-1-peng.fan@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oss.nxp.com; dkim=none (message not signed)
 header.d=none;oss.nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 057164fd-3847-4ba7-2f3d-08d8a64ecbb3
x-ms-traffictypediagnostic: DB8PR04MB7180:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB718003A450F3FC8458BF1D7088DF0@DB8PR04MB7180.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2cmRdJJDGDALls9dvsj6sMvo0/oSwuEjVLR7yWoKNlG3+AvRyu4NlZo+lnbnTN81CQRf+v9mTApQAKNS4aYHse9W6EysgUJqIp8zqPVif9j8dOLSecqFs70XyAuw+ftyuKgeMxuaSMHCarATCDNiamC5TXTXd948q7B9+7KsftIMM68NSyVKzVRYyJCOh/intaSHi4YcIuCm2PDzcFt8N+4rCLnprnLsoHQrS5iFYVUR4J50rMQo2BpTFkSl6Ss3IOnixYUyV4SX6F8V399ziDwUAsnenjbxysvzu4uYqX4QXYaqVaTBRw0SCJQY4SYbcD9Jzsx9q3+F3EBk9jX5yQGvOUYcdMHPP6xckSKXlROgF8atm3L0dc1qS/e5Ho0sEV3YfLaIIhhhGhkrESxB5R16AKgVmGcKxGKGeuYCV3OyP7QgZipM0BLGcBVL0GqnKlMyF7tjuy+QFcD8iTjGRtAArOfe49NuGzvrYOKuqps5aHU0gst96a31CMgHjcva3eHDqsqaWqvkFT81ZyjszA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(76116006)(9686003)(6506007)(71200400001)(52536014)(66476007)(7416002)(86362001)(54906003)(66946007)(5660300002)(2906002)(186003)(7696005)(66446008)(26005)(66556008)(8676002)(316002)(64756008)(8936002)(44832011)(33656002)(110136005)(478600001)(966005)(55016002)(83380400001)(4326008)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SgX4LiJ0ytGBFFz1oQetUqemeOoCPB1/W8AacPGwSo3AwWaDozW//CGNGSCC?=
 =?us-ascii?Q?5csqaNbHE0m629rtvYrCfP9PfgTlf370zM6jmgFQIdUFFlEHEs3EKfFpkpW1?=
 =?us-ascii?Q?rKioN4kcVXcrqqcADJ2wIP5ftG+516cktWfGN4LdSh/Utz1i7X7fLr1vNEmk?=
 =?us-ascii?Q?oqDuD4lI49s044sFFXY9RAyS7w9Oqqj5D+6rDwGkjIEr3hkrzuC/sdKjO1W5?=
 =?us-ascii?Q?XaKWH1gNDnSKhNU5f37bIa5fGQ3+N8SXaqKZaYJG6CQelPkNhxIcRsGQkiSe?=
 =?us-ascii?Q?M5FpvN+uyhnLt2w+v1O9B3URioselFdDrFrMC+XKrzhcrBi6jV6USbWg1FEi?=
 =?us-ascii?Q?Pasd4Vl+47+vb0gQsRQ0wrfwVGnga8/0Z7RnWgkkn4ah5+dhTrzk1Mev2xyZ?=
 =?us-ascii?Q?BODnk1L9P9F3MC+L2ch6LXOpKwKatEZD84eXCp+EOlPmmDm6WaPeycDj3U+K?=
 =?us-ascii?Q?rQ9P2F1IO78f7rH2dASVNpTUUkyckyGsemEqsPBxbIa+pogYRJBtqO0SNDmb?=
 =?us-ascii?Q?sczbmYtgdm0ForajEJdnqR3EXMbBqFw0n2ngvW5VxsLtXJk9KOB2Ee/ZtPnU?=
 =?us-ascii?Q?xKL9Ke6C6hNp5F/muT+OMzkX0oS5ZN/FkXvnCTuGsf64dsSAkqbpnNOoHXbg?=
 =?us-ascii?Q?8ARG/EDzXaQsP2FkpsL0y9O65AvhOCF09OVmCj4en6ee5WIdCGcRnDmHS+Vw?=
 =?us-ascii?Q?vuFA3Wwhp4Rgq6f7j1Ujk2i6PpnSPmR6BSsDmMXPuYc+AFQp61smb3tacg/b?=
 =?us-ascii?Q?1XmTj8UqOHjeuqpAWlkP4ef/I8TT8KsYFL1iKdhHxCidANa/VisphD0XRPUw?=
 =?us-ascii?Q?8d24vNKzopMBEb4Ro79y6jpPrIf+HBaFmHNX1hoTXL9tYogsWqXJkJsILrcT?=
 =?us-ascii?Q?6ifcrzwP/wCWI6essUAsS/9wHchbPUWBTWfqIHK9hMyTylEyOWezKCxNasUp?=
 =?us-ascii?Q?+q39qHvcNPkMgvZ8YjkmkF2ANWeUTUXMr99sxEh5HmY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 057164fd-3847-4ba7-2f3d-08d8a64ecbb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2020 07:54:22.6603
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qHy19Xz5ukX4h1onInwYFCrcv0U+7thxGJvBa9l/Sw+BP4SdH+yAtERAdjUCbPbZIFYvT6AO8LuT9RKvlQw9ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Bjorn,

> Subject: [PATCH 0/8] remoteproc: imx_rproc: support iMX8MQ/M

I forgot to add subject-prefix V4 when format-patch.
Do you need to send out v5? or you could take this v4 version if it
is ok for you?

Thanks,
Peng.

>=20
> From: Peng Fan <peng.fan@nxp.com>
>=20
> V4:
>  According to Bjorn's comments, add is_iomem for da to va usage  1/8, 2/8
> is new patch  3/8, follow Bjorn's comments to correct/update the err msg.
>  6/8, new patch
>  8/8, use dev_err_probe to simplify code, use queue_work instead
> schedule_delayed_work
>  https://lkml.org/lkml/2020/12/4/82
>=20
> V3:
>  Since I was quite busy in the past days, V3 is late  Rebased on Linux-ne=
xt
> Add R-b tags
>  1/7: Add R-b tag of Mathieu, add comments
>  4/7: Typo fix
>  5/7: Add R-b tag of Mathieu, drop index Per Mathieu's comments
>  6/7: Add R-b tag of Mathieu
>  7/7: Add comment for vqid << 16, drop unneeded timeout settings of
> mailbox
>       Use queue_work instead of schedule_delayed_work
>       free mbox channels when remove
>=20
> V2:
>  Rebased on linux-next
>  Dropped early boot feature to make patchset simple.
>  Drop rsc-da
>=20
> https://patchwork.kernel.org/project/linux-remoteproc/cover/20200927064
> 131.24101-1-peng.fan@nxp.com/
>=20
> V1:
>  https://patchwork.kernel.org/cover/11682461/
>=20
> This patchset is to support i.MX8MQ/M coproc.
> The early boot feature was dropped to make the patchset small in V2.
>=20
> Since i.MX specific TCM memory requirement, add elf platform hook.
> Several patches have got reviewed by Oleksij and Mathieu in v1.
>=20
> Peng Fan (8):
>   remoteproc: introduce is_iomem to rproc_mem_entry
>   remoteproc: add is_iomem to da_to_va
>   remoteproc: imx_rproc: correct err message
>   remoteproc: imx_rproc: use devm_ioremap
>   remoteproc: imx_rproc: add i.MX specific parse fw hook
>   remoteproc: imx_rproc: support i.MX8MQ/M
>   remoteproc: imx_rproc: ignore mapping vdev regions
>   remoteproc: imx_proc: enable virtio/mailbox
>=20
>  drivers/remoteproc/imx_rproc.c             | 259
> ++++++++++++++++++++-
>  drivers/remoteproc/ingenic_rproc.c         |   2 +-
>  drivers/remoteproc/keystone_remoteproc.c   |   2 +-
>  drivers/remoteproc/mtk_scp.c               |   6 +-
>  drivers/remoteproc/omap_remoteproc.c       |   2 +-
>  drivers/remoteproc/pru_rproc.c             |   2 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c        |   2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c         |   2 +-
>  drivers/remoteproc/qcom_q6v5_wcss.c        |   2 +-
>  drivers/remoteproc/qcom_wcnss.c            |   2 +-
>  drivers/remoteproc/remoteproc_core.c       |   7 +-
>  drivers/remoteproc/remoteproc_coredump.c   |   8 +-
>  drivers/remoteproc/remoteproc_debugfs.c    |   2 +-
>  drivers/remoteproc/remoteproc_elf_loader.c |  21 +-
>  drivers/remoteproc/remoteproc_internal.h   |   2 +-
>  drivers/remoteproc/st_slim_rproc.c         |   2 +-
>  drivers/remoteproc/ti_k3_dsp_remoteproc.c  |   2 +-
>  drivers/remoteproc/ti_k3_r5_remoteproc.c   |   2 +-
>  drivers/remoteproc/wkup_m3_rproc.c         |   2 +-
>  include/linux/remoteproc.h                 |   4 +-
>  20 files changed, 298 insertions(+), 35 deletions(-)
>=20
> --
> 2.28.0

