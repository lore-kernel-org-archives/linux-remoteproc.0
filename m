Return-Path: <SRS0=lozc=DE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01945C4346E
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4565205F4
	for <linux-remoteproc@archiver.kernel.org>; Sun, 27 Sep 2020 06:15:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="DcaGszwm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729291AbgI0GP2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 27 Sep 2020 02:15:28 -0400
Received: from mail-eopbgr30087.outbound.protection.outlook.com ([40.107.3.87]:33393
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726382AbgI0GP2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 27 Sep 2020 02:15:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6toJW1Al6BHXKFhhSuZO4z4eKID1z666Fd8BiD3FITflb6vlES/Mvl6fscS42qA5FWn2Bozh59YlQF3PHtGS+/UnxpazHXHAjAelIoWBXrBODBjTnaUxEudviitZOXJsMq6bGP6wJGRl6of6wsgitbgc/fuRvqvCXC52Sw5V3SMjsOW12ukvrmwPEJWK7uT88xJY0kKGL2UkzE8lxotA6rbdqB3ebwB8T7+mCuh6qL5fNvzuAaE5CeGKjzc1+YCRk7Y1uHO0A2qOQxOY4jIcmGO9bf/GBn4DwpRF9UJPff0DGXag4AOiXcg/TK2m2tIPK6S/fcslmxwJUdRbsYO+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/pOuQj6LBgF8fFJh7i2Torx7UsQ3jCjesFO1oG3Rm4=;
 b=a02aDlEcUxJjn/7WoGl4v0ya80DxU4SU7YueU205i2dyRH9ZLA5HHY39Hx7Xuj/Y0ZyLEumlYB2T/NCpFJBX/kyNaPNJ+iZ4DrB7lO/TkOQfKE24FClxTU9GVdzMDhYXCSF/nBgw8Lm1AeSAB8a3zaZa3MdmrJCgAOUFfTbzeEcYoPyyD8lV/8UsnaBDUKaepsXbAmF6fqyK+QLS5/NyymiZ3VmgNUR44A3KXENanWQ7FXm8vHJzvVHYHy7tnoL/sGO2nS9rvMl3F46k5dd4VKFCwuuBJ5lYs0WGEUwd3Wj9dVCUZ7g6hLROlObbSRZNOqArfTEyjHf22zXEvYMtBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/pOuQj6LBgF8fFJh7i2Torx7UsQ3jCjesFO1oG3Rm4=;
 b=DcaGszwmM7g/zdyuaba+uk5zkwG5Sw0OxjXE86jePdti+ocdT6DQsrK2Ooiw5MYFOsFYwnvZTpkqFGnqBUQPuOxBbwLDberydosvWeyAFwotIjlqFzQZ8mlTrsWrib4KyeULw3uN6onz4yeGRdDwZHmllZew6szoQuAno65OgfE=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4633.eurprd04.prod.outlook.com (2603:10a6:5:36::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Sun, 27 Sep
 2020 06:15:23 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3412.028; Sun, 27 Sep
 2020 06:15:23 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 0/7] remoteproc: imx_rproc: support iMX8MQ/M
Date:   Sun, 27 Sep 2020 14:41:24 +0800
Message-Id: <20200927064131.24101-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0178.apcprd04.prod.outlook.com
 (2603:1096:4:14::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR04CA0178.apcprd04.prod.outlook.com (2603:1096:4:14::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Sun, 27 Sep 2020 06:15:19 +0000
X-Mailer: git-send-email 2.28.0
X-Originating-IP: [119.31.174.71]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3b48f2e9-d619-46e6-78b0-08d862acb7fa
X-MS-TrafficTypeDiagnostic: DB7PR04MB4633:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB46335A737D90FAAE55AA291E88340@DB7PR04MB4633.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q5OgeUNRApW9IdtKOm+F8G+ro6EunmGTsgBrrIfO7PCndTm89616l3TZXmfO0O0Js4fK7GScw3j7xdTMfDaiWTp2l2aS+sRooS+7llov0gB+aapyKneMO7khszQti+PRAA91ZeeJX+yXiBeXKI2M1SZcyftw8wUPRIOWrVgXBKJWhm2WN6OujJ3P1QzQYe4J+G5EYRgGH5ODvuHO+mIWXypIRSOj6vjsNQQMCnP9JTbebph9Fzbp1PnAGxEQd7Os6nY3WPiG+L/Eabb6/lWLl5dYbdHBzrdfG/C2OYaQ7t6IgbsZkqMk46I+IL1VA/4THakiLyRWvFznp4AAc2vDKnPiBhKoDEGNI64pwMdcmDnjM7Vpx/p/1L3aQpJojq4axi7OCGSYRRC7B0loBQQAtGMr2d7WiNdX4iyKmj5D93F4AT3k9kNu5aKgzwr97x3sJj91aPtcZsL/ar836Wj73+7OU+vALxdh+syObea6TCJ8L8iEziph/SCbSzC1cEiU
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(16526019)(186003)(52116002)(7416002)(6666004)(6486002)(966005)(316002)(36756003)(1076003)(4744005)(44832011)(5660300002)(4326008)(8676002)(2906002)(86362001)(26005)(956004)(478600001)(8936002)(66946007)(6506007)(6512007)(2616005)(66556008)(83380400001)(66476007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: iP9lYYynxIdsNul8sgJmotv+xo5H927W7PkvhliHbiSj2pRBPz3MA3C+Zdk1f6nqfuj1JU5vWiX7hs0inQfhIAG4X7G96RbWHf7VUhBukaV4ZcpHAvYedsU8pHO6OFpeRgSaU9pgYXzXK7TKnXv2U5HAsyjaFKcE5xCjZhO84v3/Kr713tiLpBQJsmDG6QLE/77VX94VVj/7m5VDnSJ3VfNCieg6GtQgvLP9lZAwJf7mqs62J1wp81uNKVknIzsJ6m8y+QFhmZ4wVzxx0lVwSZvzIcTdLq4g259x2uM7ClUI6Tu5H6392kfwyf89m1mkje5yDsEkmExXcHaMbamXjvqrhv1OrZqQUM3rkDsvPvzrksTNOE9onzpbU7JBbgvqxCRNewXKhgKsCwRRyxYMzYpqT4NEn96UiRHx3z15Au8n2EbMt54/Jbo/OW+HAoVZ/r+CLGiwRN+Kz1J3wJgaaVkbO8EAyg16vn3j5H8rTbPnjYCOG+we7V9zOHf5zr3yyZtcMbxNP7K7Z5Ddc2hJ1uRDYGh0i1IqKQtDbu6CS82CxD2G8hAsnT9dsVxcq1eYh5vD7aZtiMQxlEU+wu+EUS6yOOHXwnVbXifciYl5Dio8p/5NQt339W1wVC/CtdzK6bSlaejadhexuylhY8kUxg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b48f2e9-d619-46e6-78b0-08d862acb7fa
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2020 06:15:23.7565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wbqr6QyAxcL5KacjvTbCGClGUE7Ta8Xt28DBD8VKoD+iyNKo4Bew+0/4fTiovDsYVAFnp7uP03CwTpPMNAL42A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4633
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

V2:
 Rebased on linux-next
 Dropped early boot feature to make patchset simple.
 Drop rsc-da

V1:
 https://patchwork.kernel.org/cover/11682461/

This patchset is to support i.MX8MQ/M coproc.
The early boot feature was dropped to make the patchset small in V2.

Since i.MX specific TCM memory requirement, add elf platform hook.
Several patches have got reviewed by Oleksij and Mathieu in v1.

Peng Fan (7):
  remoteproc: elf: support platform specific memory hook
  remoteproc: imx_rproc: add elf memory hooks
  remoteproc: imx_rproc: correct err message
  remoteproc: imx_rproc: use devm_ioremap
  remoteproc: imx_rproc: add i.MX specific parse fw hook
  remoteproc: imx_rproc: support i.MX8MQ/M
  remoteproc: imx_proc: enable virtio/mailbox

 drivers/remoteproc/imx_rproc.c             | 273 ++++++++++++++++++++-
 drivers/remoteproc/remoteproc_elf_loader.c |  20 +-
 include/linux/remoteproc.h                 |   2 +
 3 files changed, 287 insertions(+), 8 deletions(-)

-- 
2.28.0

