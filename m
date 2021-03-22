Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DF7C433E2
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E2DA61970
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 Mar 2021 08:27:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbhCVI1K (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 Mar 2021 04:27:10 -0400
Received: from mail-eopbgr10047.outbound.protection.outlook.com ([40.107.1.47]:20032
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229941AbhCVI0p (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 Mar 2021 04:26:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXBHl4sefEW5o/fUkBvtSeU4Ry6TsQNRAWg7irM5jrAXY39EP4BNOQNBoIFrtIWwLIsem7IUwkxQBKyxMJ0YcsYOFkHZae8x1U6PlM0Xp04ni/rqJAA6hEgeCAivjsJnvD3LfFHbcPxG+2FB3fQgswnShLet0HXKTGsVEBkXzqAhHRZAkKnCehx1HSDf+SeG5uhgZuF6by4i/GXqWZzNwZycoLvp6QTa97qzh+W1e2sXAAL9M7e2qPo6Xcw+x7i+FniBinPkMOdCcQ0wGXIYxXBGiAH6XtmMKJ6l/5uD7KbNpDeo+Hc0N4wsm53f70S3aN/kqRlm89cQt76uIQF9pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/40Hf9kELbcDGZl5RtawUldwr1Kv4VkzL/QMfgPoJHU=;
 b=ML2G+AV35GYY7g8OoYtk2654hbfbRLw1wM95em7YvCpOnkmU1txL0oQIzl17PeI6HeSsgjHxAD+BdziU4N+bfVsjpdOlmh4eXcNSqFNSQ0NRRXZmD+TxnBumH1NT/P3UW8QkNijqc+Df8by78ZNvI35v4lCgTVpE1hzZzPmEVnCwn8BmHnTqFvHXN2tif+4wq73vI74nxj7CggiKGhHJnLlOL3YGMsCL4caKKAzJYdB1PbXCaDNj35OOcTwcdI6yAjeHFBJNYGNT/TVYSyFJVu2rBdoGTVWDLgOun8RkUOV671UGqhWRuQb3Q9k0BB0bWkEyP4Aa9Lbs8jia5ZP/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/40Hf9kELbcDGZl5RtawUldwr1Kv4VkzL/QMfgPoJHU=;
 b=Fs90nWmutxka0/WjCrKPJXVHtpB8niDxSw013NEdiPh87n+IvS7R/OmBQkkYaTFJ3nwnoEnGPGYCD1PhjmCd69DzweWzzaCEzLrHxzUuPOpTBA7Z6fwpoAhxYeL9Rs5SYUF5yKzGrvvZOnIgnwfuROhz2mbvQlGFsBjJb/eYmEA=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB9PR04MB8316.eurprd04.prod.outlook.com (2603:10a6:10:246::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 08:26:43 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 08:26:43 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 3/8] dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
Date:   Mon, 22 Mar 2021 16:12:38 +0800
Message-Id: <1616400763-16632-4-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616400763-16632-1-git-send-email-peng.fan@oss.nxp.com>
References: <1616400763-16632-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:203:c8::12) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HKAPR03CA0007.apcprd03.prod.outlook.com (2603:1096:203:c8::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3977.9 via Frontend Transport; Mon, 22 Mar 2021 08:26:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a9bcb5d0-26ca-4f55-fbd2-08d8ed0c3908
X-MS-TrafficTypeDiagnostic: DB9PR04MB8316:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB9PR04MB8316B61068D912BE08B57CDBC9659@DB9PR04MB8316.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: btfyVSdClTkJSyYO+6dLs0tHNLk0cMGbl5iRFo0NSoY4oo2kerqMbp1HQCe3qWBPuFwDrj73CkuYlj9cZwEE6/1r+28O+ldqPRAqyhS6IU7pSQkz4QiEsmTRtJQUpMt91fKQHPWaZ+oCKLjPSVCwY4BR1VnO7yhuagLjF7CNl8gO+NaqT099jE7rZGpzIQTcnpfg5hMGB3OdSc1tfa7Uqe0RORMS09o++4sH/ufP3EcAjgSsxBlKsngjxvz/KNdVX5F05zWZNfuLKQ3oTaa1YgLpUIAiGTSkuG9CfZnD44sEZb0gW9/cBuoNEq3cGDgvbhQTncCNJQWiVbAzNrtqdsVmZ8CuNHfhKCaL8fusOA3jCwZp9V/zHgl3BkJZZ1Nwjx5k8+ZFRAdfy9+f3fK1b5ilZrOvHsFD6OZm116KqEWrgUeyyzpAjEAuyENkY0fhxftrbIZnF1hGk8Up1LXzBWfTRciX9dhlngoAmXGrU8yN8NaskWlafbTo/Lv3f9a9m47g7zn5KV3UoDfhfQbVV+2ssN1GrnwrPPKHuG6sfhEI7pM/o9/rWQ2KTiNRV2+GMF7OjFuvjSCXDSm8b0OoAoNmBfZTj8vVsRAl4TNOmgKcIvu39tmaz+WFvfsvpVTBp32Zu4ytQG9msG0SgCaAZNtp/E2Zc9hk/b0YpxJIoP+7ywggQwZZgRNeONG79oVZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(8936002)(6512007)(66946007)(66476007)(5660300002)(9686003)(38100700001)(86362001)(8676002)(52116002)(7416002)(6506007)(26005)(4326008)(478600001)(2906002)(956004)(2616005)(4744005)(186003)(66556008)(16526019)(6486002)(316002)(69590400012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eiMkhgkYtpKO7ZEp8791Y6F+Alpm4xes8/rPDlL2la6EHxYLPPbkUdz6ixHV?=
 =?us-ascii?Q?4AQOd1SwNC2FApKNJejETPZmd8PQt0eWjcJHe0RJynflIdH39apkNPLyc/ie?=
 =?us-ascii?Q?S9Paks40bAtGge0O5dWy2JFxrWW+JALBskiKIS4+a9J4TCcitbRHNVHCKotS?=
 =?us-ascii?Q?EajO4BKB24S86EFxeKowWrax3IgW7FuUkRJ6GsyHVeqzxrLngcJglUUKR3wC?=
 =?us-ascii?Q?E4OEhrOY9Z+LfdhAz5Y1CLHm9ldyHPPMLR4tAgrRTQ60/DMHrAjfZj3DNcUu?=
 =?us-ascii?Q?gQ/rDnwsOVXP5zu8YipcUL+Ucyqd7xU5JXpS88I2bjIjdWbLJXftnmQQeENb?=
 =?us-ascii?Q?r4I09P9TJTHvrpHarHz2bXOy2d46kusOlk9VRqD3+5YuNcTHQ+psTGuNRM0S?=
 =?us-ascii?Q?xG3qr63Lnj/F2W2id/k6fbqRPQlF+XyN5z/RE/VtVGLtQEE7A7Y3H63/wT9d?=
 =?us-ascii?Q?ZtUdvIu0evNt5JIxyfIMN8HTbhCAsmbkpCCCVGKiXX3HlFCQ0IUQt/XG82ZC?=
 =?us-ascii?Q?+vTiM8RKgu8wR0nmCSPbqhw8P6jZIiVzxrsWiRm38IOBev9CrHOEXxoZoJhA?=
 =?us-ascii?Q?qfg/TYGTpZ0HbrYI7a16U1tnfAdNfm+zBeYsDkKnQaJYqYYzU73phrT9RK5H?=
 =?us-ascii?Q?fhDMJVCX0dqXCjdQ4d7JLupTimDx2GginvOKLP9VFmhR49zjEmnlPDgK0UfR?=
 =?us-ascii?Q?D6omlSG5ajCgCsAnTNfqpZQ4NlLbsUsMxUX6pskpzo4xIdZ3KgdwDu01aTIF?=
 =?us-ascii?Q?egChBPEY5U+Rto7NIv1CtiTkXrZ0wOEEheVIPre7d8k2GiLlKAcBzCn1eNE2?=
 =?us-ascii?Q?iP/AH3h2QdQTvPrDdsOkIcb1YzLsAy0gDl4BrK1s0xcFXGv59dJxSNAiCe4N?=
 =?us-ascii?Q?uHsCOBPYBaSpp6XtxCscJNrqLG/7twMJFhJ/2Yz0Ku9FLGnB/nINv2OuZ0LD?=
 =?us-ascii?Q?/Kfo1WfWR5yqbLhPNeYcOmkpDV8vV6aOe2RJVHFo2sZP4Lz4EXVjcd4rHMOX?=
 =?us-ascii?Q?C5CM2iRtasLgXWZjlGyhlDDtu70wPud/lDXxyCNgDLJ0Ykc/IlIsz/ySHNSq?=
 =?us-ascii?Q?OSy+elsrdVvuvvxNNnZwFedV0v9HH4DxwV7eQW+c+NfE7Uoad9tVHLsvYoNc?=
 =?us-ascii?Q?uF8b51xoLvZYiCkeGBnQpHqIopfJxnfoMYyppYGaOgicD4+ukpXd04eeKfBW?=
 =?us-ascii?Q?9sKkeHGdBPZ+fAJld/aHscaov+RnHbuS/PoJPwa7PgiYOLDZ69IXuoB64GRp?=
 =?us-ascii?Q?xT5h1yCDHcdDgzh8Juxk4B1QcPATQ62hEgS4qj/gH/mKC7fPcAYUPU0u6Ek8?=
 =?us-ascii?Q?vl88Z9Zq4Vq1Y+XaEl+iITA3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9bcb5d0-26ca-4f55-fbd2-08d8ed0c3908
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:26:42.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o3pLxXpmFVVmtAEjv1qnPotZ/rx6Mt0qXHs4GM3KYyTSV8Ri46MRCK9EZHlMK3YNPfsU+oiBFGaERPu0jKMOgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8316
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MN/P remote processor(Cortex-M7) compatible string

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 3040420ad6a3..dea92538b983 100644
--- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
@@ -17,6 +17,8 @@ properties:
     enum:
       - fsl,imx8mq-cm4
       - fsl,imx8mm-cm4
+      - fsl,imx8mn-cm7
+      - fsl,imx8mp-cm7
       - fsl,imx7d-cm4
       - fsl,imx7ulp-cm4
       - fsl,imx6sx-cm4
-- 
2.30.0

