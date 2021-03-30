Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC49C433E2
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4B1261874
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 Mar 2021 09:28:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbhC3J1p (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 Mar 2021 05:27:45 -0400
Received: from mail-eopbgr50046.outbound.protection.outlook.com ([40.107.5.46]:5605
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231313AbhC3J1T (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 Mar 2021 05:27:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lT7Lh+sZdcu1XAyBwj88tkEn7aLP5GLierTOVZAg1ktRG9l02ujLVvdVPhnHJZRA5csaf2sBPuST/iUefHG6eUK+SHZIcrtBWW5Z8Mo5Y7IH2/6DPw3AHazJAWdfPRxuyrkMNbzg6y854n7He/VkmuWuVgTQwurI+iekxNICPyePWcst34vlH6fPw7HEbMyJSB22ODlEgMI8eznqlWQPvC4/swxHeFPXMeueAZbvX/vxgwtm1kxHdMFIayA/DJZulvky3OteaQy3XSqTLtxboN7LupCgfcnIYb/OycM3q1h8LfXkIFfKkKZwwx0leTDQDUIX868q5IdW6mXYSgACQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r2YS1IJ7iZGrBoTfdGtwCXcI68fncREV/Lm1YGhqas=;
 b=YmfQC/Vbx6mP2Rryp8yxy2dOYGJfqBIwRfv2Ncp+DmZYjOe+WGAVdrMTWm2M29jzj82214x1Ticqxhv/6JD2LvRJfWHf9mpUcAtX+fB8gjW3hYueYdNzT4Mtido2SuaMhQt29uIJONgnECqEfTJgt06YMdLBY0Uh+JzX2B1H5wae0MpW9q9SLuK0a+griYdjMNeDfesEATP2rvXEou9YTs8or3PEX9yQZOtpl+ReeBagtCJZjj17vCGneNgZxCvFV/bJDtKFBjZ0AGTmY1aZugbwvGb8OCHPyJCXASumvVaixmD3tE8I9RcEUiUZ3YB/ZoVcvRLcFWrVcIfRwr9jHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5r2YS1IJ7iZGrBoTfdGtwCXcI68fncREV/Lm1YGhqas=;
 b=jvAik8nPjD0oYmp4xQ67LLdudxRot/1+Qlr0yZUkngIYJ1aaKfU97tjwvB2U3bGSFqzf+QuofSfjyg4Dkk38KKryr3G7DxXh+XBqdCPBzE5ImvsAaThZBQvrJHGTvVPHJHKzqU43otE3c6F8m0ID1JURAAzB2N6T6/Xw4yLODmY=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB7595.eurprd04.prod.outlook.com (2603:10a6:10:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Tue, 30 Mar
 2021 09:27:16 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3977.033; Tue, 30 Mar
 2021 09:27:16 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 3/8] dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
Date:   Tue, 30 Mar 2021 17:12:49 +0800
Message-Id: <1617095574-6764-4-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
References: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::21) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2P15301CA0011.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4020.0 via Frontend Transport; Tue, 30 Mar 2021 09:27:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 938234a8-86bc-4457-3a74-08d8f35e0246
X-MS-TrafficTypeDiagnostic: DBBPR04MB7595:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB7595D405178E91BB4CE24579C97D9@DBBPR04MB7595.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Knp4FtNZSR/k/z6wgqgaMO6DrsYoM0xG1Ngn5+ocFxCQVJ5STpoymNCtRraPW+PGCFUm5HGgjcS44Vu+/RpBrGsipcnGai7A67wgDG1wo+1bNZqn6FexA5l0pAq+YerYmJMQyvQ3O+oYPWdNiqekCUzdFY/potjQXLLaSYsp3LqFRuDwHf6ESHgMtZfDtSbrJw3LWmO7ibPBIEDMwQ9n1+yhi64vs/qBlMcdjBTgGznZ8u3kYabNvIsB9t45l/RMmgEdHqn6V9Q8C0S3UN8ua47W+hspnDBsuUSksf1jWr2iLjtckDvrn+SSNiF0oH/1UOFVSquFv6qTMYIprCsAT1nkCVkCfuF/kMLQTgkID9WaowgPrAcnHQd0zJc6XCDkVOUXn+IQRAi7gybCAuWBmcLmTzjBRGTWv6O3P2ydxQdOojjUGxX6zGDEKjsfrvh40au+yo8PzKfHQU7zqmlH4B50mrrgRzhfl+45fhoYGBLxUf+cYulDGsKLKObiDuqC/TysMaNLSlbdBR36SXsxIkmxAdgwixyGIizlpUGLT0MrFfLtXksU8zMEeLDx8jMK6p9Qc5HyUSwbgwHqRXcoMygBOtL/dDlX78wK6a+hU4lOBH04mPIPrqGmJDor9PKwgG5B2b9Y1Wj/jl8E9QsmK7vnWuwPm+HS+7Ikc1oHoB9hIl5PegPE5uPOFBfcHecB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(9686003)(66556008)(4744005)(2616005)(86362001)(6666004)(6486002)(52116002)(956004)(8936002)(66476007)(38100700001)(26005)(4326008)(6506007)(186003)(16526019)(478600001)(7416002)(6512007)(2906002)(69590400012)(5660300002)(316002)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?L1cvRvtgooT8FHq2Gz96PjDmIebP5FgEGSCS+g3y2gelbTn4mpRbF3pVVvur?=
 =?us-ascii?Q?MoWcWzEUg1xvq218puxjq0AWHCLf/cHwxRwFWxN+XNwyDokfNtVBg0XreD8X?=
 =?us-ascii?Q?FPioAvvSx5TNxXcY0FoD56NzYM+WhBXrw6QOniSom8oDJ/KFHZpKsxh+36Mx?=
 =?us-ascii?Q?E15wv/SBo3Km+wAh/lbFjXBEW1AKRAzZi7Do1+2hsWixG9BbVmoPR/gH37qn?=
 =?us-ascii?Q?8DtFpMxGw7qOnns9sdCyWfep9qs7xCprlCQan5lGZwnYMmxMN2mDGqGGctjO?=
 =?us-ascii?Q?fXZS7joIqtG1IcVaP7W4fuAO9SRlPsR+XfYAPLk0RRbZOPP8vYMG34/+ggLq?=
 =?us-ascii?Q?1WHIkJyqyjR4soPWWu0BIf908P3C69nxg+8kWwOwYg6f4/a63FCW1qhWzA7j?=
 =?us-ascii?Q?/4NYxIC8Tcp/TsVh5kgGZGQbittVSEe+X+ci52k/lCw52oPvukyI7ZHt5KZ2?=
 =?us-ascii?Q?7ok0SFC5z3uPbScsAGhIfrcOMH4fRZ9+ZYr1b7fwoSulw6d3XpIkT/VDdiZ5?=
 =?us-ascii?Q?yXuM/N4gbGb2OQxNqyBeU2DOEF2yGVu+CudTl3WL9VxO7MJyzYBVwqJyMlBV?=
 =?us-ascii?Q?HfKq1ixvsAspD7cxDnR6fD5VC9pnUaojdOqZCsDN+Apk8/hesB+IXRIRdpFA?=
 =?us-ascii?Q?Db1y0VPP6Yq1He0gk168vnqTS3K/RpVb2z+3ycyI9Yn4Bwz+t/ZxvdN+cBOo?=
 =?us-ascii?Q?AJbwmgbPdAk72kpRuII/i5cXcE4BmURE0UR0zz1D32/PC/8kcR9nKosZTeRX?=
 =?us-ascii?Q?jl42uHkCMskAr9vfgfG83XqUzsQU/zRUnPMb3NWnofH40rW+UZbIc32pD+1a?=
 =?us-ascii?Q?c1F9Ul8ClYxEWNvFe5XpiBRHs/CaBSXNkx+TF1/WcAmETRnvlFk3twtMWXiQ?=
 =?us-ascii?Q?2DJg+Wad4DJ/PQRHpyupbOdtC4w5OqIT2B297t4Q+LqYb6GyleiHcHXg2Zer?=
 =?us-ascii?Q?tDXAZiIHMOU5aWPlgmd24f9Ro8Xf/vPx2UEhKBHP9W4urU1hM6tEXIDIb4Fy?=
 =?us-ascii?Q?r8fFrE0F2O0Btc4eqyEFTB4pEUSczqoQmYtQOkakq4ZbNizv1R2P8NNUhyBT?=
 =?us-ascii?Q?Ja1WxiQVEX59HzwPamOIjq9Omc6gH3a3IuOZuXELQ+IdCc118VcJdfPJQVoO?=
 =?us-ascii?Q?lssCzm2JXDC3wFvVDA1tx6cJREzu378EGS6zu6qbrn3NXF9nZcmUi9saeZBW?=
 =?us-ascii?Q?PONT4dTMlDutbPqH2uQvqFewrYnO66c0QhCeQxJ/vEYclLRip9CseBlk+4Gy?=
 =?us-ascii?Q?sKl6U4T6SGpY3xW7jrGU7Fbt3Ynt9U/cDh5bmubm22ARW0dbBtNqlqIOyEah?=
 =?us-ascii?Q?Jjzino4Gfby37MW3TB+kOp1s0ZoiALXDyb9AtKLbzba7YQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 938234a8-86bc-4457-3a74-08d8f35e0246
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 09:27:16.7715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: opn4UM+ii6fic43LeuzM2RY4rQz9FvkWv/XCGRACaLuNqhRQlsN0YV1nt8SnuZMG890g1yFbWy2uMdysaU/+6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7595
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Add i.MX8MN/P remote processor(Cortex-M7) compatible string

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
index 58bc2a23f97b..1dc34cf5a4ea 100644
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

