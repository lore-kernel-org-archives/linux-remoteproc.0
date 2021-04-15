Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7605EC433ED
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 551C2611AD
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Apr 2021 13:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233274AbhDONn0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Apr 2021 09:43:26 -0400
Received: from mail-eopbgr150082.outbound.protection.outlook.com ([40.107.15.82]:8918
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233247AbhDONnY (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Apr 2021 09:43:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h349RSEmaORxI67TZt23CbesiQ3so0E2utzm2kvJ05lClD3iMThZZiEzGHiWtlf2EqMIllYnVY2kjIOkoHnoZQ0yDHlsaORblLoyGZVjRIUE0Hgr8Amrz2e5n9uMipXNNsZ7CeKU0u7bdMsOelKGiebdebHbGPNuEH4BUIGhD/Y6pI8oXza5xqD05MEp/x5IOssbPNFnODoTNCjLM6pmhRtfbKcin7AxzV0OW1gTmT4zFpkUp/PzdGt+8jjKln2KzLOtQlW/DmyZT9tP4kHAIu3U1EiiwWKqrG+iOBEOPp529yWm+of2RPGdYW7tFAW+kdHyAOrEhCdHH98Puf1E/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbvBwEEshcvEkPXdSYU8hrSY4625DSWsJaH5UrQy6bc=;
 b=TCP8MLrhbcskqLbb2ZOahC0+es/RQDUMYamX8gtHzKjGavIEw5RdjXd8O6qPmaX6iSY7Yzn7BumyiX90aYC4yxclBaBVqaABj6+vqKmQ/qzazGZ16ea51ayPnykuTjcbdpvNcll9GEVx2rN9FLO6wtze6aSgM+ZJKJham9X8bPCt3QQcO9JqJNV4C6MbmfdCpWgrr202GpN0oHxQ4mdMJu7SAPBO76DKWsl80ILoVsqvnJE0r0NIlBC7ru3EMM1ArnHNMEQ160Ivjt5p/LVOTyyumWHoWOHY2YocdqnYCcgo0FTy5yW+Osx6zlhmObI2loPg6WuirI9yqUZUkvdp3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WbvBwEEshcvEkPXdSYU8hrSY4625DSWsJaH5UrQy6bc=;
 b=dn6KYQn1/8Aaqwt/VWM1UpOGxcFY9rWct3qBE6ZpByBPJ1YY0ytN0alxkvoZMI6P1XcKfPJdtpMW5irka0S3QzqdPULTIvhdgtYs0KO/ajY4nc1/chSkukj4WYdyjwu+guNIQ2r4/Vm0rnzuuJwjMS6t7xPsXQeBKz/NImWkdTc=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5241.eurprd04.prod.outlook.com (2603:10a6:10:1d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 13:42:59 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.037; Thu, 15 Apr
 2021 13:42:59 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V4 3/8] dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
Date:   Thu, 15 Apr 2021 21:27:36 +0800
Message-Id: <1618493261-32606-4-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
References: <1618493261-32606-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:202:16::16) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR02CA0132.apcprd02.prod.outlook.com (2603:1096:202:16::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 13:42:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c754eaf-927c-44da-599a-08d90014619b
X-MS-TrafficTypeDiagnostic: DB7PR04MB5241:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB5241E339B94D31CDBCEEF916C94D9@DB7PR04MB5241.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:243;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tt8IKQUnY+GQ/6dfhNxKGCKx/ybtZXbgKiXoHQym58r7WC4ylNC+9ieVhGlc4bJj6/PBwf+shHQ0McCp2pyocSnDT+c/j07BaDTGk7+foRaUleMr5sdMZgMITWn55jPPSBKqki4okwcZdkf57fDpH0Zr9Y45GX4zZyXiwIxGD3fh7WNWZfCd1cICdRHwIJEbEgSh9+F9A0Z5dC2CDx5BL6GOqfqaK9og1ebPm+3LavLfIlcTQwLM6n1C3qnCNYEAIxTFfzkwFbvgvYWBK4rgkjC0lUnM0V+apxH3pjyj836BEPGo/5w8Ha5EG6pAetkX03+TClIZtWgpYvzAtyjv+PFjp9afNd2QtDuefGb3CL77X2tdI7aes6PFbK6fvZaP0h02+POru97ybfl5rWQqBM/7Z67U/gt7/7q2avTqyetVDYDP40qFADpdcIYLT3f/6aa7f0UBBt0+YVaimHNPotHmd7J0XxgzBQ1GQWyJHdNush5hFz29CTfKNUAyWoyhayT75SU8OjsEIFESIyMcWYKeBMpcdHIBXa3oJ+ObSp7KGbmfQ/jWosaPcZlisaGNxRU8/CbacTQmeCtOVopJCS3IeYpNqJhrEPZ8ivrMK5Eu74pb0OZWkeo9Fra4sAvhb/zBzwGY0tAnatJOh2o8X6+Nvo6yy8yPpdHmaRkfjsUGJR7vyEuFpf0zvDZ/bd1H
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(4744005)(6666004)(6506007)(26005)(956004)(186003)(8676002)(16526019)(6512007)(7416002)(2616005)(4326008)(38100700002)(38350700002)(316002)(69590400012)(86362001)(478600001)(5660300002)(8936002)(52116002)(66946007)(2906002)(66476007)(9686003)(66556008)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?iY9y3GATmTZC8tQj40jvVeXoafccK6vU81YIeVbHKjAhL9FrOzLDpHZDyWeN?=
 =?us-ascii?Q?+7Z9EYnYSXkp+FTP9NEE+Iht+cadXZkQBlXe7hJ2uC1i6elw4Cv5DeG2HhJY?=
 =?us-ascii?Q?kugDnQw9p8qG1n/TztvCMrNOxyB8pW7CySn8FXcULDBoRvQtHG2an7+QotxN?=
 =?us-ascii?Q?Ofp0k1Zj7rjTirjPldohX8OsP+UFD4KHnerJRsF0HRSveVzo5g2Uxik8hgPu?=
 =?us-ascii?Q?4aN/+io7Hl+lM1bagAUQA2JsJ9/6p+MbXEAoMljvQcq9E6bPsDhKU02X73Tv?=
 =?us-ascii?Q?sz+NMkM/ka+zEZK56n6l1BvNnPiyz+wpPH4Z8nD4xtSmZEhdebzgPbNGcstP?=
 =?us-ascii?Q?UcK/5Ufj8qCtJvtUzQt3V86O6970x37BswV7kq+K16s4tF7LMRTF61bbv9c6?=
 =?us-ascii?Q?9P4R/wrtdPn0nbUqlMSKs3wqGwjXqxubmeOwJuQ18tzKyjYp3BoRUtSdW78/?=
 =?us-ascii?Q?/Za26b1y3pR4YBSgXQejFcVfeAjQS/9wcmKAAgz4lXnWPxF3gIn/MfWNSvIJ?=
 =?us-ascii?Q?aTnvBu8B+b9mfDiGE7VnzErIXEZvSFRoTu/udXWPeHavSdrqrGXOo8SUsw8L?=
 =?us-ascii?Q?iBABzkduLqcyxY798vVZZlbzQAhLkO+MS3qqCW2LA+dOq/SxRrC3oWPUd+n8?=
 =?us-ascii?Q?YqWq/uL4tOUZtjjZlnKUcmYMDm3u+PKh050Cr9cLzDgeheMnkFPmK5ZSXEso?=
 =?us-ascii?Q?oddloB73Xf+3pWJBB9jMje80ov7QwJljpC+B4fn3WjVdZp1eYQw/H0Db4NHy?=
 =?us-ascii?Q?ohxlwtCvssLnlCYTBAqAQrNsOlqTajODMe4Ablt25LnQKmKRxhywN7X9F8+c?=
 =?us-ascii?Q?cpimiFpZ2+3YiXcwp9FCSoXdVD13SfDapDv/4IrFKpE1MY7H9CUEX8TDeDKZ?=
 =?us-ascii?Q?KvkyBoFq5LTxz+sRMbvGE50ZzqJZxh6GZQsr7JkddpYWDLG4kh3mPOkoxoyj?=
 =?us-ascii?Q?GJ9T8hyXHPpUw8FbfQxUKK9FJXwJxmKaOFKeD4HHYhX1U6T7TkMWksFZNJBf?=
 =?us-ascii?Q?OXZy/rqLmTmr4G97ItQSYChzpBymRJgohdKNXpgP6HsUBD+xJAbXzqt0c6pd?=
 =?us-ascii?Q?MkN5jHVrdUOuNRVi8wGk7xd2g+iCZIKtdWCIX1V5iA9JnBuLoIOtAvccQFJV?=
 =?us-ascii?Q?NiKPG5ORVer4HIPYNHVkGH48ZLqOngjd1k84nu/9J8DVVt04XF74tCBl7LI+?=
 =?us-ascii?Q?wE+ZMkKLMHBOlaZebxY0m8B+TfKf3JDALZBG5CIeGjVHD2QJOt8JjgPETWr1?=
 =?us-ascii?Q?7szLTUkbNlQvIilGqQpYTA+xMynNDujOpkSSZSYO21UVoFVeC1YFYCcxLRWY?=
 =?us-ascii?Q?vK+x3AIbjQ8VTMMV78TxRy+e?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c754eaf-927c-44da-599a-08d90014619b
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 13:42:59.0530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLOghqBCE4AeIV0BDFoN2XW+o7ohNTJTU97Exp6oh68wK0H0BEFVSqMlLILN2Sggm4aY7waEqePkJfCQ2scsmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5241
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
index 58bc2a2..1dc34cf 100644
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
2.7.4

