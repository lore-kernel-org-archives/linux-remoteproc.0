Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3D3C07E95
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 09:41:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17F4961C82
	for <linux-remoteproc@archiver.kernel.org>; Wed,  7 Jul 2021 09:41:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbhGGJoK (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Jul 2021 05:44:10 -0400
Received: from mail-am6eur05on2065.outbound.protection.outlook.com ([40.107.22.65]:39360
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230429AbhGGJoK (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Jul 2021 05:44:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoJrQ6FE8KDaR3Jyge9c51Tr0EqiCwZM0PSxn1jMusiIEV+QTKHGp4ThMQeg6g7og7BYgoEAjHkCss6uIu3dqbzWjOj3hFqUHUIL5EkhGong8hQiJLhX4GPsVslDIc5OUnuEN0UkeaSXw+CLwueb7KJ5i8K0Z+VZIQmfUI20loWwyMraPHmzV2nRLx7JBJ5NUiG4vjdQpRduxfkZ3K6S1axILSd4Vdim+WtQZQ5FEmTIP/SNNMTsyvl5IWX3hsWRgL+W5/XqbjMKgynJuMiLhCq3aMhsisCZqI2igMJjcdcSJ8y1ktUr36wRTGk8hm66kGndJm5Syw7Y241FamlJyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKsbWyfe07PseCqnlASYSgLMBrjN+fKjPpDfJ2JrCSc=;
 b=JW8rgsZPyE8A2lFzsJp3uCwhsAhK5su++dZwiYrBTM8JjAPynT5i+A9ou93m62V1jUNqnTmtayCkdFU7wGx2Bn/n3LaGkXht8XOABREVIOaHG5ZKrSjwsXoklMgLE0YM5U9jWpy0mcrO8OMgvis+wJO1SprEfqS2bekztetQJWw8jG4MIU9b7piL9S8lfAwoDh10s0BKzsArT4VJmtsKT8whBVzrm29VoitpfK47pgOzmREbvyIjWCpAMwwfGc2trzsccOzwBM4A3ns3TEyiFpzrjCtD3BilrT/OUbGIH5tX86wOLXLvUM6VFB0FFT9/KCJnWNgB7KwG/BWJ/bM+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKsbWyfe07PseCqnlASYSgLMBrjN+fKjPpDfJ2JrCSc=;
 b=l0t62PBviupkUOCZITq6TAGK1Z2gCsfWYjcjluGJqtn+hM96illfymbjl42I3QCOSVuDRKDF3Uc39VsYNVHtyyET0MTBzdGHv0QYVtH652ViKdRHLknwCefDwSCao1l+8AclWO82fEK9ZUy+l+qaJl9CkJ1sfbJ5672vxMHS4WI=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com (2603:10a6:10:2c3::11)
 by DU2PR04MB8824.eurprd04.prod.outlook.com (2603:10a6:10:2e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Wed, 7 Jul
 2021 09:41:28 +0000
Received: from DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2]) by DB9PR04MB8477.eurprd04.prod.outlook.com
 ([fe80::9daa:ab21:f749:36d2%9]) with mapi id 15.20.4308.021; Wed, 7 Jul 2021
 09:41:28 +0000
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-remoteproc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, ohad@wizery.com,
        dongas86@gmail.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V2 1/5] remoteproc: fix the wrong default value of is_iomem
Date:   Wed,  7 Jul 2021 17:40:29 +0800
Message-Id: <20210707094033.1959752-1-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:4:91::16) To DB9PR04MB8477.eurprd04.prod.outlook.com
 (2603:10a6:10:2c3::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR03CA0112.apcprd03.prod.outlook.com (2603:1096:4:91::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.8 via Frontend Transport; Wed, 7 Jul 2021 09:41:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc235263-4229-407a-6666-08d9412b64e5
X-MS-TrafficTypeDiagnostic: DU2PR04MB8824:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DU2PR04MB8824D0C09504D7614BBC9609801A9@DU2PR04MB8824.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a7+jf2P3NQ0pdNOSW0e115pxpNihia1haT80Z7EFcPUq9FzMqhHdPRG/deN8ay0v//vDL2NmltYgMiMPQzzDq2CsefCQHWU6MhUXHrQ9uJ4TyshBsgl3EkqPZgoguqWJ/ncWeHLLXehKPEjb4AnBmBbaZOZlc15lurCic4t8aj/n2RCtnaaZ+UIj1TBx/yucWW6TnmkV7WpodcD29CCeMLwPaFYNUeX6nS8Mrr/P8iM0TECTKv4u0JVZb78CWxj/PQSbGD2MkZlkW+Wd6d1yzIP4ut74N1rdmP3ZnuRRsfhvM+YASrsxv8IlHI/EMgWNBZplMmuFMBYBf6ELYWOnbHAwJuE8QqzhkN/z9cROUxLNMkoOlSOfPG5rF6A1CgSEidFsrueZYFdv4mAbCrDoQFm8VI3uDsWhxMV2hFxi9a6IYTrj47kx4SrM2pg+ERR1Pr1c5ZE7Gld7y/4825XObS9L+8OBmPGJKG0lsuENiM6BHcJ6eMknTePgCCPiiES250g70IoM+LtrXx864JfiEXvZMR9zFEbFQGcweh5cVgrB0fKrqTDSRPL2ZuWK53lqJS4bHQHwvVtIC+ttM2E0ztCnBhVy7AfY2rb8yCgVcH1CHhXgxCoYYtIOhY60IPehPdcQ2Mq5XI5hq8L0UeabRMhX0Xd6QjMMrWwVnmvunj/0zD7a5igga5f7qC+rcCoqJqvGMFo2/86Pg4DgfK6ieg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8477.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(5660300002)(316002)(66556008)(186003)(66476007)(8936002)(66946007)(36756003)(54906003)(6506007)(478600001)(86362001)(4326008)(83380400001)(2616005)(52116002)(26005)(6916009)(38100700002)(2906002)(38350700002)(1076003)(6486002)(8676002)(956004)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lJ/juckwM7NSWXTAhdvSOADklEsyKcsT4wc2Rsl0B0e/EUgEPqFyQHX95DML?=
 =?us-ascii?Q?6skX5U0lyK/cOlvE/NOM2P2U9eQx/R5GhXTt4Yqh5VPrFh6KUYkSEx1nZxcR?=
 =?us-ascii?Q?MhFalcimt4C2tTdGgLPiEpp1zENQWIknGG5CCsxpDi26gNjChN2dB0wxO3ad?=
 =?us-ascii?Q?KB5dOIsKDUAYsPrpXKB+VAejxzuEaxS1Ck/0AmfNFpHlXJqBFfvpgk1uZB5A?=
 =?us-ascii?Q?YUsLVhcgu5ezjihP+VrQxP/ui/pmlTTCY9Y12adYHL/1HdVaeYZE0sJ6yqRN?=
 =?us-ascii?Q?uGbN+Y2DRFCZuNKnfExPiQjMRnZnWU2UmG/UWWINFrho83JdXPI3s7c87+ZZ?=
 =?us-ascii?Q?xx+bGDOAu53s524dXGi3who5e1SAjzGkM5twNukgXvuaNf0zu8TCxueNl+WO?=
 =?us-ascii?Q?4s7WwvyYfoF0yiN/sTBupqHaAqLl6HC4t/JVRgXJ6Fk39tfFpOX1pIKsNlbc?=
 =?us-ascii?Q?Spdb9DJq52b+lprw2XKAhhXZS+5udRB2gerYGJ5jZlLECLqC8CyCSeb4sQx0?=
 =?us-ascii?Q?u7kKDUGdpBPaKKO7aC+SKC7M41MPrk9EDaPMi9IDN1V/oRhiJiuYaR4KfFrz?=
 =?us-ascii?Q?dFcl1JX0y+Qkv7xp05yrEieZZzFOn5dpsip6wwn7+DU4aNw3X0YusrJvCXmG?=
 =?us-ascii?Q?3F1HzFgPj7eiT7T5s0I80Bgbj/AqLUSPsNErxDBIRjYcwoTfhdcMiW75QV2t?=
 =?us-ascii?Q?pUvOd+tOInjL75Iun9EZRxNpFy4CB8eS1FCGbLfWyFX4gk1HR5ygkiqsqGUc?=
 =?us-ascii?Q?wfGoycg3rWOLv3bUYxNry3mlnxl8tEZavMpSbnBRhh/HK4vd9Q2CoaJ5koml?=
 =?us-ascii?Q?v64bgXF5W8ooJQcts6hPHLm8vf5Hm5glGAFTzptuUZ+mUU/0LuTcEujMrraL?=
 =?us-ascii?Q?V7SgVQw82LPjHnJRghgFb9/iRdsLpqOSNeQA6kgcOy+BiGrZjqImxfyx/2kh?=
 =?us-ascii?Q?2eULDTTM7/pVgb9vrsnKZlCKXgbDwT+GwcDU5dQtiQ32TBChzo7jJn0uhLHl?=
 =?us-ascii?Q?YODwXkYuD6WJdnhxQlJ2R+uu6uB0S/GljxUVz6YN6xGh0S4dGNYkkoqpYvmg?=
 =?us-ascii?Q?2sKPjT3cBw3VtMw5l/Ed8OsaOaC3c1C+d3wBM6q+KxhYVpBwSh/gBmQpg1YB?=
 =?us-ascii?Q?crVZ9hCsy/owV/m83q1lPyOdLNgsuPoP5R0gQB4LV64ZvOZKyWAVZkPhWlGX?=
 =?us-ascii?Q?UCLBH8sVokYKomSWC0hcDaHGhDbunTgnMyLm3iA+n1wG+h7dDfJoDc4vIkav?=
 =?us-ascii?Q?kxlmVQgh/e3RaUMl7DZej92vzR2pW2ZGtc11z41rng4f+fgMJW/bkhHQtTC/?=
 =?us-ascii?Q?+VLu+NneMKMRH3OazM4Sgm2k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc235263-4229-407a-6666-08d9412b64e5
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8477.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 09:41:28.5613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EKlvcsZWS8bDDse4Sd8bYB7oDTP/ERBF7HMciB76OHt1Qxhh2O9TGU+5GFPziO9KL1lj1Z6QF38qlliE0kyBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8824
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
v1->v2:
 * update rproc_copy_segment as well
---
 drivers/remoteproc/remoteproc_coredump.c   | 2 +-
 drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
index aee657cc08c6..c892f433a323 100644
--- a/drivers/remoteproc/remoteproc_coredump.c
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -152,8 +152,8 @@ static void rproc_copy_segment(struct rproc *rproc, void *dest,
 			       struct rproc_dump_segment *segment,
 			       size_t offset, size_t size)
 {
+	bool is_iomem = false;
 	void *ptr;
-	bool is_iomem;
 
 	if (segment->dump) {
 		segment->dump(rproc, segment, dest, offset, size);
diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index e8078efb3dec..3cd1798f17a3 100644
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

