Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE48C07E9C
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 14:43:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD65C613C8
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jul 2021 14:43:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbhGFOpn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jul 2021 10:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232769AbhGFOpf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jul 2021 10:45:35 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::606])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A9BC0613B5
        for <linux-remoteproc@vger.kernel.org>; Tue,  6 Jul 2021 07:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0Kh6cvEv1HxKsKAc1Xg9qBxTAyR+zeXSyDuJa3McgbhPsxv2mRjTwUn1yYLUmVv4jgQAgbe28xg7pCvT6tl2a3Qipx0HlHRpqK2g5x8PpkNCdf+KlYYIw5SAP9oqWyQI2AQvuLDLTp4QEAmKzSgJxvXcUJX5utoFJb0d4vw4G9zZhOlhoXx0kdXaxMWOUG+qxmbKPVVM6OjKYloW5NTotxJSP4aSWef8U85897mmmA2dardtrWvkzv08EfPlFVRzOxo2pDznLY82+7gAbREAFrKkFUzRFrEXm+5fdygevzL0WdytLdGj89N6e/k9sf7zW3+jcnE0J3C9uNsMTnOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgKF7hOBZ8nD/BsEySD+8q18OMir5THC/kRwMxImVcc=;
 b=fMZhSgu9akGMdxpVeTFuJw1HpusjuGfxODqLkXOceWajYqN62NrksEyiHGFFPTTshWQBnd/wjt3qjT5Ie10Mw0IlxcQp1tyPpNB4sBFsHdoi6zqigsBPQKz/CkUYubnVu2REkwSb+yYyLjvk9aYtTx3rXeu57QHFrY5fubVPnVu+l2m1gYHyMlB1ibSvXh57u37r8EVsQDThWnE0WjHU6pVFt6JZS7oLa0Aq2o7YJpk6r1ISbOyrf2wCZ5VsRT5z2TDNVl1QLle2dtZW46MUDn5CmQptLklu03S1udNbUbVH42t0moeiBZlMQ0xH0/MBELRG1sYVaFH34IgwutUqbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgKF7hOBZ8nD/BsEySD+8q18OMir5THC/kRwMxImVcc=;
 b=QuS2xdynE8Wugl9RuHqJnliAvRbXMzNXjYxzaKLBEJUSAZxLSu0XdBZWP3B5Jr5fAKwxiKSIbPCW2WtNP5xDdf0QO8A87hqHAPZAQfIQ4rhCBGeRqIBe53HMYeosmoLkKY9Xifvi49NN3rTCrcLQWO6bq/jTIn/8tjB6ruYetSQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8853.eurprd04.prod.outlook.com (2603:10a6:10:2e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Tue, 6 Jul
 2021 14:24:37 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 14:24:37 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 1/4] remoteproc: fix the wrong default value of is_iomem
Date:   Tue,  6 Jul 2021 22:23:32 +0800
Message-Id: <20210706142335.952858-1-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0145.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::25) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0145.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Tue, 6 Jul 2021 14:24:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 072f2f9e-9c8e-4241-5340-08d94089c890
X-MS-TrafficTypeDiagnostic: DU2PR04MB8853:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB885354B81A7E0C690D258AAA801B9@DU2PR04MB8853.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RcVcjSx8/UMw5H8sIceCqfeHOlls9Q/svrrNhY1EIugsHuQ96Fxm7bkLU0RX68MLshkBtenVxJnYtIOeRlRH2CCKG1f2kQMuMF0h0v89GVdD4eJOcNTwx5JgPaj85uGHyCLFv2hJYmk5pSNspOF4S5ODK1vj9mGruQzFpLDnsmh96tI/qLr38PK+tKBtjws745NRmt+05ZbmhgufNTnwg8XBvUlNxANBzmfM0oGXBYsKLZWRJeBtpOJpFqMEOx7ajoap71SFtYSSb/CC31d0YPPn1fDwfrLtPjQcyoUwasod/UhkVaQ8AStJAszKZx7/PBO5UpshUWqpI4NfqAQCsbCydoguoLfIaDMFbNtXVCN8PMsoIS4v2I0h1Q4mbWj3yZTY6bYYVPrZ2EzVnMWwg5I9j7cmc+WkV0unGRuzFcb9bmC1Mc6C5HbAMWXvhXh/nWcp8iUluGPgX4F5mOGdqQU1LDVpKlEYr1vFoGys+EBIOXQp7ryoGwTGwovwSr3B5joJqgSrTkOddqzIRy0HOJhiGQKnE6qsBMPvVmizy5iOYKVCO9Oz8EHEDig45qG/IPUBQuXO8LJK19UJsRQy3hqvOAqxHNMs2Qm139TYddjyMakUvtCVuSKW5mmLq50DD1TxR6YKHWzOYsG0KfmEVI5oYuZWb2Selyj9aOq+S/OXOficY3W1sb9KZ0WQ9EA6fmTxhWT5hFdKjQex5CssUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(66556008)(66946007)(8676002)(66476007)(1076003)(316002)(83380400001)(26005)(6916009)(2906002)(38350700002)(54906003)(36756003)(52116002)(956004)(6486002)(8936002)(478600001)(38100700002)(6506007)(2616005)(5660300002)(86362001)(186003)(6512007)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?13982ug16LE6CLxjaiWNfSkeTrOQ8rhb2asw3XOTozlL3/U8eOSKzazXBMFs?=
 =?us-ascii?Q?/JSvxqMdopZ7rPNDlRIsCl0pdLLcIrf8Vj5wAozIUJOIB4/jO023XeVTlu0P?=
 =?us-ascii?Q?VNDUn23QDAzi3D/eVceMZ/LHvDCjN7GS2u+XPd54CwQdcI8ABhxdLo6N+dz9?=
 =?us-ascii?Q?WyBqPNgNzO0gNrmPLNPpuo46gHNNVkibzuGeYxOeQYBvenj06ILtgqCs6SoI?=
 =?us-ascii?Q?eTe1pT+2bZzCdCaOrJNQuMb3pj3RDtpWhnkPZw/0pNpO9Dpfd3wOQDJthXW4?=
 =?us-ascii?Q?rkA+J3kvk62OikOCiawu/aDn3h/H1KSt0q/1ex/ZARpnEJ/x4U/3GZM8PwRl?=
 =?us-ascii?Q?6Sb6ahfOuaKINo1fbUTw8IeEolqsf625oWTBYKpglJonCRDVVrHdRgQJql1x?=
 =?us-ascii?Q?ERglkFg1l1xeM6fTyg2aMERzleL+uyUlHaHR9LN8+TA2e8erHrg30o4YqqJq?=
 =?us-ascii?Q?UCwlERwPVlq8wzWxRXX0IhEgiyoVT024T1RHsdvpOMMV+rADpasZra0V4qGe?=
 =?us-ascii?Q?TPoSqpzRmPm/bPwxBwz1agfTNbenGfA9KghU+29q9JfdC56B6Bem08xAXSE+?=
 =?us-ascii?Q?1DkZI4tV7o0I/5/qzO0o7USExUhLwo/nT4LiR8mq/1II3s3D/G65aVGwPi/i?=
 =?us-ascii?Q?Z0CIENlR6xloQS7XFLMyRljqOMclgMde6ll0VtbBW5kfNen4op0Fa8+gTcDK?=
 =?us-ascii?Q?+dJ9BZ+0XQwCRwGt9y9Fh4zJHQKWvteEVis8iHyTr7HK+EFgLl6m0dsGe3xv?=
 =?us-ascii?Q?EBbf5ycmE86ZUrGhbzXY00n1k83oAcPcWAz1tPBthdXbbA788GyOWW7tLOPj?=
 =?us-ascii?Q?ly9qrJjl6RugSdB+VhOOTywXeE2ZNfH3Dn2LdkPEk0FlfTb5oCv3P1bubML9?=
 =?us-ascii?Q?N9AJDMVqQv64b8g+eJ0sz0pn6OInVWRcOj5R75lWZf9fh/EfnYk0EWWPVvT/?=
 =?us-ascii?Q?GermlW8bqXnBByxJfeNQFi+jOeMra3zaLUT3WF8ulSUdHoSY9EdoXIB0ZC8u?=
 =?us-ascii?Q?Dm18HbPk7Ijbfnjp5148mCWIz28iPCubZrHknBjf9QOGdCF7l+2jGLWOYmk7?=
 =?us-ascii?Q?Vqr9qqR3wuRxiLJCNVaF1LdQt8tC6iMh5lIn7b0P16S7fCC2HdG9ZkrgxG3G?=
 =?us-ascii?Q?f+xXCROWArTinSmg0Ug7TiFilWyxtMqnTzjQ4G2y+FH/Mwr2luKoa1CV+Tr7?=
 =?us-ascii?Q?LUOG4q9IyyJvYtyZ4Zbu0Z1n3C8v9xNP9n8idF+X2EYkWU+jPSWbXb0rwisQ?=
 =?us-ascii?Q?GQdOt2+JbVTgYTitEvPVQEgUA9HOu7CyJWDf4DsymOkXnV+oA4D86pe8uacn?=
 =?us-ascii?Q?crR9hXLyBkig/ZOy4EOqcm88?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072f2f9e-9c8e-4241-5340-08d94089c890
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 14:24:37.2151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DW8xrhJN00n24BXbPlWjC9Vjay7X3GgTUy4tumox5eHv9RozbI8Mk7kpdO4yRxthEoXF6APIGy3ljQHP/jwdUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8853
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Currently the is_iomem is a random value in the stack which may
be default to true even on those platforms that not use iomem to
store firmware.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>
Fixes: 40df0a91b2a5 ("remoteproc: add is_iomem to da_to_va")
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 469c52e62faf..2bee4d5a0995 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -178,8 +178,8 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		u64 filesz = elf_phdr_get_p_filesz(class, phdr);
 		u64 offset = elf_phdr_get_p_offset(class, phdr);
 		u32 type = elf_phdr_get_p_type(class, phdr);
+		bool is_iomem = false;
 		void *ptr;
-		bool is_iomem;
 
 		if (type != PT_LOAD)
 			continue;
-- 
2.25.1

