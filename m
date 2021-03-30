Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27138C433E1
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:27:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0C1E619A7
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:27:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbhC3J1I (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 05:27:08 -0400
Received: from mail-eopbgr20074.outbound.protection.outlook.com ([40.107.2.74]:36491
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231468AbhC3J1G (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 05:27:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5ZxaQMPUQm2KX8v9uCvniGG9vvQODT/OsvkEt/CdlSQmj/opHMIiEzyvx1NuKkAEMg2JKjmzGtT+hArensjzkPo7AZDXQU6X775lu24w+jc92jxlKxx46IQALXUDUovxc5BDId82noKDp5G7HTP3zTiyE+tNZY0wEmY8vn5SR4Gdgj+FF4oYfClvZRriRKclz8ywMv3skdrbuEzFEicd6cinGiOtkrHEeiIEAp4vekxQhtaB97WrfoC697Fk3WAHh27TRMva8gbOy7YnYVzFlr3PLxQ+/GjeoQ+jclIWa+6ssMJ/1gBYorQQ3jl5os9TEZP7Q9qmW6bi1DvPG+RDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXVi9c6OS/4uK8EikwH/zvLG4mT8yTDKavSDugYylLI=;
 b=kd121vtgTg8H8D+C74/rJuLDhu8LKEpZ9ZXqQXohcWOkmITMOAK2wQsIFWJMndeJwiTET9eH+1KcAEBoNWWbap+b7A75/EDdFMVQ6NHOIMak5GGc+HSMKzcsJ9dfIy1pzNjpZ6B7GhKycHDvLxy9hIykVYwhlOzTL2b6xdYqFYTpoXOsu8Rv/CCcchgniOIjifzMwpTcUAnQ5g87dhOR+jUZ1ZV/FF+ZZ2CDVHBsEsNIdMdtxZ6ALLYf9AmM86qGkZ9uqlwmCVN72P3IodDMN9Qo0g7zTgP8k25ijsylSWOJ/zEdLO/398u/O2mZ+irMX5prC13B+sA1Dl3tTijr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WXVi9c6OS/4uK8EikwH/zvLG4mT8yTDKavSDugYylLI=;
 b=QOxwrtHWwXYgvvQX1AbxZ2xEe6/YHnReENlPddtr5G5FibRowiiQnvzpxO8QbmZdlrsZCsynMnRHjA7XjHFOBNTBhu1KhRz4MoRZQsJ0cvukLsJ8W0jaRARWUEuj/p7gpr1Tyur02cfb0DtvlVdKU55uleZrXfIqMfKzRZLkG4k=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3659.eurprd04.prod.outlook.com (2603:10a6:8:5::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Tue, 30 Mar
 2021 09:27:02 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 09:27:02 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
Date:   Tue, 30 Mar 2021 17:12:46 +0800
Message-Id: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.0 via Frontend Transport; Tue, 30 Mar 2021 09:26:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 518301b0-980e-4126-cebf-08d8f35df9ba
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3659:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB3PR0402MB365930CC06606C75183DBE91C97D9@DB3PR0402MB3659.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i0rRJX+LuImzJFFUQC35e55+PCZ5izoZwOcCJXqWV1Cz0p691/ny02zToPKRR8lsjuzwWO7z0NdgpxjtY3S52v9JMMJw8uk78IUrrlndFIj+GITlZQEgxu9lM/NIXqdo7J44Ut94STlRdy3qKe0MHfoFhfU1Z7kqJ8DZMFMbd2kx8VCvmhnc9mNgGhOhELseifrf1iGAhkYt+Ej4TDrVhcB1+1jriXy/MYHXNNRCnG7Cb3e+miks5/1avHr29h9E+CiWVgyivYJRazJ0AdUYUoEEUwWiTXuNTXjB/8OzlraOkBYsEEVOqNefyr1MLFY8WI2mEHMQ9UN/aB2ujh4KGOy3WvBOiFWvwH2EfxKviTasx736AbqFwWQdjAldMc/+y1wTMcAPA9D/+qMZoTqD61kbqdUb6PDJd0GILq47wUqJI4g9npuW0gzySV0CkJZx2G7fvfO5TWbxnaGwJNeNgsz4Uo9m0arhOaTM/q66gVwM7F8Qrylaj6L+nYRITf9Jar1Q5ep7mlXdno65aEs/I4d40LsQGcloN+FnFDHb5EiHJIGed99m56fe+uf4i1EzR63nsYLt18u9HNDfFyJgNoknrkEivvm/inE0GriXNl1zgoo5Feiqm92sEgVfBSsTwfuLD3wAf2cKOesFyqeOvDTPizP1uFw2epZtWYWbgZq3DPkmggs0RTRN981pTHUWH/f77cOPYlXfrLNQ/bYjUE5aFGpFqi+MwqsIRt4rFkfv2lVpxhvCAx9FOZtzSerlXIlB4L3TpZPgiksIAP6Xvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(366004)(346002)(396003)(966005)(8936002)(5660300002)(6486002)(26005)(4744005)(66556008)(186003)(2906002)(478600001)(316002)(83380400001)(86362001)(4326008)(52116002)(6506007)(2616005)(66946007)(9686003)(38100700001)(6512007)(8676002)(6666004)(16526019)(66476007)(69590400012)(956004)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?s2cr0NWIXr1FdppSxboyBUiOkQWD1qLUu0GARP6ii5QN8gHaIYV63iYh3beV?=
 =?us-ascii?Q?FRTxC3zNblWR7lSB1i/Ek/9W+J7DQSH+aIlEpNSvX2PotogK5T9qCb6weq/F?=
 =?us-ascii?Q?6TfGLtXD2f/rdR6erXU4aqiRae53QuymU/5ZscSTWgwChtDntl8MIpPwtRGl?=
 =?us-ascii?Q?YNxvNXrcwwRZCQMvwKyrAjLc0QYyJajJYLGoXMZp5M3gI495nb5TGVqjfAka?=
 =?us-ascii?Q?GAxX/A+Sj5BVeNR8iYMvcSPGTWZ0WFLUXFRhm1Fmu7v2yfscrJjFWuHq5FOd?=
 =?us-ascii?Q?26m/mROikaohztL/gul9pwsLZhXk2ePhJr9kShYKbcFEiiIEr3CNubZfhwzT?=
 =?us-ascii?Q?Rtc093N99t3PK8fzccTsp/HI8rAu9GNUb1PR3OzDVoohGcCuvzgyDcJ2n/7A?=
 =?us-ascii?Q?A4HKpHiJEH5U4LxzgjBgwEWidqpTLsrh08MxVGo7cZtMFtGqKY+va6YXcEaQ?=
 =?us-ascii?Q?veWi8cdx7T3D+OUlrB5H8eNT7G41MvhjDmotx4oqgalCdQsTfGb+prfV0XYB?=
 =?us-ascii?Q?WZLLQ3RMdIgzOvYZQKL6fx2hOakPMthezhtfBRHl1p7nhLKQNpM5hNVcm9Uz?=
 =?us-ascii?Q?QUdSWgYySuiaNqZi/T0WdD8B5fhKjz+46OKSJN1G8QlfDTqULDWd3MpID80t?=
 =?us-ascii?Q?jqm33nFMfJMYDfe5g2LIwlkVBlLo3TApvOJaVbKyc24fDjLob7Skqa8172Yq?=
 =?us-ascii?Q?tTkzrNAyYDSIUvCjxorlRX5+//ODO9UePy9ZJlaAGSIJuL8YhfUu+h4N0Bvk?=
 =?us-ascii?Q?N/ENb1RgdpriNPf38Vz10jXDgo9YP0xXC3tJFOk2KjvVE44cx1ZngOQOyJhi?=
 =?us-ascii?Q?phSvWyA9Espo8d8+u2Jx5MfMy4L4Q5HSZbYGuvlliCoZTMwBlTvnAdX9DYNm?=
 =?us-ascii?Q?2/D9D9Y1ba59BAYFm53ewQT3na/Yob6cDKHbGl1/A7CpDyempQQUutSXEKef?=
 =?us-ascii?Q?ME+Ajv1JnXL5OxU2KIyjNeH2aLQZF4oISQwkSlaro069c64l8uqUlba9Tb0t?=
 =?us-ascii?Q?OFd9ioVLMQJmEw9H3WtIHikQKurACzA2THnamVBCDacknUMYFk82En/ApgOd?=
 =?us-ascii?Q?SVAdXTHsdlxlwKgNkvPKSrVTwObpVapOcdcsudcyjFy1p8jiuw0LItE3vQ3V?=
 =?us-ascii?Q?V1UIa7Taq3Th1iaKqUcG0jKsJ7YOb1/eYLcSDa8XXddHEK6X7y4mJ0n73jp7?=
 =?us-ascii?Q?Pdhf6Larrn6UnqQ8umGroz1i0l19zG8AQUDG8G7+JjhwQgggQ+JYx6eEaz0A?=
 =?us-ascii?Q?mwaLO4h9Q7pduj28L+g/tk8AFXdwt/VNXRjS2p+qUlLCOP46sutSv8QWfR1k?=
 =?us-ascii?Q?u/RaxlkPWeiLba0RxG4zBnJfaBSAZcIssBs72sTWvy9jiw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518301b0-980e-4126-cebf-08d8f35df9ba
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 09:27:02.5360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZ9ptQbAoZIVHhEj4mfT81Dp63yXespvvK5nWD2U0Jr1lJa854R4sWPcU6deAqDudMXGyiU1nSAhYLWNG/+doQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3659
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V2:
 Patch 1/8, use fsl as vendor, typo fix
 Because patchset [1] has v2 version, patch 5,6,7,8 are adapted that change.

This patchset is to support i.MX7ULP/8MN/8MP, also includes a patch to parse
imx,auto-boot
This patchset depends on [1]

[1] https://patchwork.kernel.org/project/linux-remoteproc/cover/1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com/

Peng Fan (8):
  dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
  dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
  dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
  remoteproc: imx_rproc: make clk optional
  remoteproc: imx_rproc: parse fsl,auto-boot
  remoteproc: imx_rproc: initial support for mutilple start/stop method
  remoteproc: imx_rproc: support i.MX7ULP
  remoteproc: imx_rproc: support i.MX8MN/P

 .../bindings/remoteproc/fsl,imx-rproc.yaml    |  11 +-
 drivers/remoteproc/imx_rproc.c                | 170 +++++++++++++++---
 2 files changed, 159 insertions(+), 22 deletions(-)

-- 
2.30.0

