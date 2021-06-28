Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14DDFC2B9F4
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 06:33:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEE4F619B6
	for <linux-remoteproc@archiver.kernel.org>; Mon, 28 Jun 2021 06:33:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231698AbhF1Gf4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Jun 2021 02:35:56 -0400
Received: from mail-eopbgr150052.outbound.protection.outlook.com ([40.107.15.52]:55464
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229911AbhF1Gfx (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Jun 2021 02:35:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOlkTdtozWMIe2nNFQh7hdHwlWMafHvXAUVnpdxz9i95by02Jyl1NyRHdetOcX4jPwjK0QeElJ9F3ALye6fRapkmEYswSkyjlR8e0hZlsZ4Yh4fhq8cGtNef+du4L1CRB75xdBkbDjnLz1hm23GIgwOky2PDlUhJm9E+hpHCxx28q2mjC+z7LdHDCPzc8s0mmM0zclieOzqM7TJ1azqIeiRmjliWSeZm1HHV2VwVQzmcIuJohMQRR8CnA8w0vLL0SS6ppDx2/HEmoe90lARrBgqXXQKowXpupKtcXrJNVNzgl2wL0wtNUE8opBpH0GGmoQ12KrlrpAY3sFDD7Pi1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vADxpnqeGHEVJUG1BS3hUuPo56+5/E+OfHOafAQiQyY=;
 b=dRaPd/hn3d/okXUvG5VhhzBzhLK8ZZ4S5ZGYdsGkQBVEeTUbst/axfli4rIC5m3mgQCZgXwn/9vGTgdEKBZKWuDlBXXUMtUt+xg3i05KjJZA4I0y4prQr3VdeinT1vI09EjQHZmJ4MoZI8bb1iEM6JQ0DCcXFv8eaC0hRKYzd4QhPqURRZBenCYwcKCyZdWGsBMiEqp51NvwtjH7hBVuws6ev0rzkpGjnhkePrVZRFnibaA3kmeVcT3+CwjVpqQoGtoyfI8d4amgZ1wQa5xJllkcFwMQ+ch9s1fUDUafmmXw9OF40cCuQ2WCmWHlwUbKYPxN/dUI5OMb1lUAPvxXcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vADxpnqeGHEVJUG1BS3hUuPo56+5/E+OfHOafAQiQyY=;
 b=a7IyBijpfUTO+4hBf83GfsX4ORGXRkQErVJRrbhRiDOpF1hnOiRwL5IuibBQucgIYhUGswLg4eYfyIRPn9s69Q4GJNIjzlexN8ZDDh4NVYOj0vAE1QYXE1OGL13YAFDXdasp6IUKRFNdnD1IIQK1z1HS31JzTe3y3TJw6GZGP2A=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR04MB3128.eurprd04.prod.outlook.com (2603:10a6:6:10::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.24; Mon, 28 Jun
 2021 06:33:25 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c445:d742:eb76:86dd%9]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 06:33:25 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        aisheng.dong@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH] remoteproc: elf_loader: fix loading segment when is_iomem true
Date:   Mon, 28 Jun 2021 15:06:57 +0800
Message-Id: <20210628070657.7669-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.30.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.5 via Frontend Transport; Mon, 28 Jun 2021 06:33:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0724a15-4325-4a54-072c-08d939fea204
X-MS-TrafficTypeDiagnostic: DB6PR04MB3128:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR04MB312838D16CC8D2CE1B4F4A27C9039@DB6PR04MB3128.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UqOo8dz2fYy7RAoZErTgrpzE6nuva2SoAJBdQv4z9JLNzQGO56jrCnxHr2EjU+6qr2+ayT1NA+YAIdJ8BPO0ujij1LEPkgQw4vUbnYVxScil6r30hNB5BV/7TgVUZKGh2anbVwaaWAGWbn+N789I/z/qF4KlPyTSLUmiUJooXUqDKYkC+tKeb7aPbxdwcNXHBhDL5CC3nOVu2g4saPO0zxs4EKPwsD4P7qMJFvqFhlDCeJjE2bl/RX4o7E+QtXbNJJ9zA1VBq77JXsT06VQMbhnTEE2RPOaStkHFIzgb+l02qlhBx8muIHzJbwP5LcECYEEf9cGu9rHIOapDJoms5yMpc+kjKQ3Wyra/cSQXLF0Zuj7vLKqHdiwHxfnVYGc6VO5IxYmcOBx5Ph0qkPsJbhKlkEUwXrdJsHxccOPlYg0AkebyrB20Zh/PLLvKeIK+ad5QvVPe2KiLKs+aAQ2rNrHaJxjneKNjgcGarLVqIkqrIxavXvM6RBnAqJwu6shtbkilJvhroN28KKlWTwVZcupS1o8IPGTjUTvLE1GbezmY9DEiRnEY+Un90xG8wxWBHwXgkviOEZG8Dqs27I4J0OUkknKWzWNYQe2oWhA8NNkAZTuDWq2AWpUs9W8L8izzsepj6P752x7EF2nv8VqZ4DPwcfz941EuPvuXIp2DIcwVW7+3imCuAq8LLxHoe5R9cJOY+EQlrygI25tsVBep1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(39860400002)(136003)(366004)(66556008)(186003)(83380400001)(16526019)(6506007)(66476007)(8676002)(2906002)(6512007)(8936002)(66946007)(86362001)(52116002)(5660300002)(6486002)(956004)(38350700002)(38100700002)(6666004)(478600001)(1076003)(7416002)(2616005)(316002)(4326008)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RTRjLLuuL4cFCGRnQQcdO7KJu/H8SW+HWOmrG6Jmt8++TDLjb1IxJbqP5UbY?=
 =?us-ascii?Q?a2NX2/DAgDCWE9KRZY8G5KToGXWHo9K/yS6KZW1rWcmYoFxiz+QyuZpgX32t?=
 =?us-ascii?Q?20LITyczbiD5g19gMMyFuGZxmGRWhjXm7AxZhLiFO2t2r/+UQpdkhHJiWime?=
 =?us-ascii?Q?KZH8oxiGbq5kbzbA6Czk9R73lRsXwh+TqE6VXnQQNTRAtaijN2U8MPofF7bK?=
 =?us-ascii?Q?g/ztYoH7oBiZ8PkbUMVM8fHJVF+bjEyAq03IE9VUGZVpZvuwvXfJmRB8N+xV?=
 =?us-ascii?Q?d3qYtVxSKjZ7pk++RL+crVLZLQtar/P/I/bqzHLH/MEkVbLOxvnVWtGIyWD6?=
 =?us-ascii?Q?Zn71MxtODXpleTz51HyURr9f0UmQY+F2NWwR1dboSbGG+pINaD9Y4RF/Jgqt?=
 =?us-ascii?Q?LHpyH1djpBRBCiFmXot8Mpyn7SAqTkImBDXFdmrwh0OrwwpZ5YFcebYew1GQ?=
 =?us-ascii?Q?8K0HMfVXVQpqcGw6e7XKXgVMxjs39E9L8YaFDxbczUc1x2nro7P2IxDULQZl?=
 =?us-ascii?Q?QmQwG+7gbpiPuamEWx72hPnXtRYTXxNDQPrtiXKIBbYndQ8MT9+HdCr93pOR?=
 =?us-ascii?Q?Pv6zr5UGLLq+szei+tSCPzKEMp8hRO5eeslwsW/bwumbIIrOvJYu97M1Lh1x?=
 =?us-ascii?Q?zdtyK5lzcGt2XQcgwaadyR/i20mJk+IF5HahrSdKXdgcRjwiazF4vj773Pda?=
 =?us-ascii?Q?DB2Nomg3PccOh//jvIScWrcSBj8SS+8QHlkWYFdMFIS65m0KSl27DlAK9U71?=
 =?us-ascii?Q?tC3H715LrmDt7U/6ShPuQvstGlMpQyrcq+/d2YJb0/D0DhmmYJ5cOv/wE5cC?=
 =?us-ascii?Q?3YM2GDR4UBcv9WCgGn75jooE/qqcdPI9IMuMsyGsOgLMXoQsOGorouS/47QY?=
 =?us-ascii?Q?htIoqqCFG9vmyVb8w079FE4izdNFNo4N9y4JovufKJSrUwoJYdQzuXX/hZ70?=
 =?us-ascii?Q?CV0N7cX5V0/eupP4AT1UeoMlC8R6dkyTeNaUs35EwYfoAmdkEKSuxUeR1H3b?=
 =?us-ascii?Q?cfFXfV9LJ2OKnAptKlLQEYgHQLUKWapE/IcXkEjb7V35AP/aWvuvj6aOtinp?=
 =?us-ascii?Q?vUFBy/3UtfWTTaZIUl/73o6PSPt54qzmPfbyY4Lu5/F1hMWxR0rAPF+ftdu7?=
 =?us-ascii?Q?giRjR/607U+5AI+WLtrMBcwl8uAX+w+CqJbJcaYpvw5v5ehDg8TSum70dsah?=
 =?us-ascii?Q?Kx7gURx11B5b4SmzlVFTgvKl7bzqD1e84D9jdvopkV8UF76D1q85PyHAaCWZ?=
 =?us-ascii?Q?O1JmqzPzp9QFa3eOP1FSMHi/6a/fA7N0PR2nRviJt0IyZyuMK1P0e2dOTBSG?=
 =?us-ascii?Q?n9+OaScFxVuF4RvN3mLJko1U?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0724a15-4325-4a54-072c-08d939fea204
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 06:33:25.6893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8DCRmljz7YO4KxAYw7aMIwcO4uD4hBEOv0ody2RrVQ4ktYJj9lp/6h8NcG2vRgIKCn+NaZAqb6z0wwUzpw/Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3128
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

It seems luckliy work on i.MX platform, but it is wrong.
Need use memcpy_toio, not memcpy_fromio.

Fixes: 40df0a91b2a52 ("remoteproc: add is_iomem to da_to_va")
Tested-by: Dong Aisheng <aisheng.dong@nxp.com> (i.MX8MQ)
Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 469c52e62faf..e8078efb3dec 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -220,7 +220,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		/* put the segment where the remote processor expects it */
 		if (filesz) {
 			if (is_iomem)
-				memcpy_fromio(ptr, (void __iomem *)(elf_data + offset), filesz);
+				memcpy_toio(ptr, (void __iomem *)(elf_data + offset), filesz);
 			else
 				memcpy(ptr, elf_data + offset, filesz);
 		}
-- 
2.30.0

