Return-Path: <SRS0=jP1a=IE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD939C4332E
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A96C65017
	for <linux-remoteproc@archiver.kernel.org>; Sat,  6 Mar 2021 11:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhCFLiM (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 6 Mar 2021 06:38:12 -0500
Received: from mail-eopbgr30055.outbound.protection.outlook.com ([40.107.3.55]:60971
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230238AbhCFLh6 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 6 Mar 2021 06:37:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxQ7if9OtEeT1Cl6dBXY1619iiU14ZTtk0GrmlXgVHjNUMDrN72UggKXSyK5fPRh8hZo+u5rEWoeUvxwoXRSOV19RQGhkD8DUCctd7pGoVBQQ2x6V1dHibFK3OB8e6v3eS3J3Zwr/n0GAw+yfH4omKjuxJp9YhECDqOOYlqn5DJkP1PfTj6+8tbDKnhzSJm/4Tzb6yezvjnVmZpKLP3qA8o8P84+UCZlcm6YnqWrNPZMJ1vfO2VcYVcgBizJ0h8vPYzsJr2SzDns8Hz9VNMGLIr/CAge4ktlBhjX5xVELB2SO3Tjn3U63NNQ2XUk5+yR/kVulSHQREoTBHTiBUVCmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5NMJUQHhqlIBk6+zvQQfgYzD4wXEfXAk3gjaY/qhfg=;
 b=UzK2TqrbiWnypVDPoct0r/fm//LGAo2JBsgXA+JhzrV3Zi2NePALqS98rrpM6W6gUtYkPUulqBwgbXQ0ucvv/XNLBS0xXEqQoHYnqDAoOTrQd5WWh/I4rIgTf+AMAOA+LZ8h83DRIaSVbM0AwWtnuBgA1VnBFAaGRIstt9+ojJ4WzkBDVV9XhtG1QEmsMf736ThXtSJtno1a32paHhRjQV4w9/zlcqeO8bwS3U/o6C6C48n23FlihHRiZCy9SXKyoQ9whpoQ0rG5n6cyvjdmd07yvbgylKQcvpFA5PFEBXHAHd1wgcAcrGe9D6Z+8xNbI3GMsnKZc7LKVbnimPKL4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5NMJUQHhqlIBk6+zvQQfgYzD4wXEfXAk3gjaY/qhfg=;
 b=T/PFtnEMkszEmUT1ivzncPdjSu8ZgeQyQe9mungd/32E2PTsc72Lgqfk21Sd+r+WGO1Jw//BXmz4yFrKI2/kIf52EBVg6eNLpsNsD9WueluS8V04Q3qrQUlBxNJOL/qLSdY0pCBTPyZpIUSLmQLuVzyODwIJSPjnCYgwLFdVIoQ=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6618.eurprd04.prod.outlook.com (2603:10a6:10:10e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Sat, 6 Mar
 2021 11:37:55 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.054; Sat, 6 Mar 2021
 11:37:55 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V13 03/10] remoteproc: introduce is_iomem to rproc_mem_entry
Date:   Sat,  6 Mar 2021 19:24:18 +0800
Message-Id: <1615029865-23312-4-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
References: <1615029865-23312-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR04CA0047.apcprd04.prod.outlook.com
 (2603:1096:202:14::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by HK2PR04CA0047.apcprd04.prod.outlook.com (2603:1096:202:14::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3912.17 via Frontend Transport; Sat, 6 Mar 2021 11:37:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0ae9d832-db2e-4598-acc5-08d8e09448bf
X-MS-TrafficTypeDiagnostic: DB8PR04MB6618:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB66183037160263853A7B384DC9959@DB8PR04MB6618.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDqCUMH7XYHp7Xp/3UuvELbMwYzOEt/y3lEKjo6xpZlLAgMCkBF41nFgnlj0X2dvNoBOAWTByDs/HM22WjHO35EFz8ImFLu6of3NBncSFchb1Yr8t5ZEGEXlyoQl04Mq15Apc6XIa7wEeYa18pX33iDUrJsuxhIc1Q/aIUcQ6PSEO5xNMTG626SangR61fDYiktmYRlzuvt0eNCc8VkV3r0L05jVNP5Qg/+UpOVINgHtfdtzgalRGZJPJJkjkjhON+hN65FkIO9aILkZcPR/IDd57eggjAmipXAQ625GkdYnu3nJlIW6KnTIGyyBi5u5HM9mrx1bTnkPZQM417tuW+P4Mel3CdKYQO31JCsP9amqeqHUuJq8I/R6nlKNRWSEpJMQedgu+Dtl01o99rk5ovOLREuQhfonxBIzbeUlWcY4oeF70VO6jyN682tbak3S5/O0iDXqW6r8DSScJuxPC6bBLtez2u6KuV0oLgB6SUsYjkT57tsSrMQeh3dGZ04VrNNGZsHrhwHixqFAJ7x1m19jAguNWOdYofDNcGlsZ4SH24SGtax+TYFwLVV0lhJ+WLrkVJMTvf+o1dAozSQ3Wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(6486002)(9686003)(6512007)(2616005)(956004)(8676002)(6666004)(69590400012)(86362001)(4326008)(66946007)(6506007)(4744005)(7416002)(2906002)(52116002)(186003)(16526019)(26005)(8936002)(66476007)(66556008)(5660300002)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Cdh2pa87S4Om0n0IV8BdR883tkwDPuEKEHoXvuhXdauWLKpMEbuN7bYX8UvQ?=
 =?us-ascii?Q?6SQ9IgzHUUgDZl5balOgQpU+bYI6hy37atjrXyeFmHTv/XUKzQaVHEup+/zG?=
 =?us-ascii?Q?wcVtOs0LGsYcrgIA9SasxlFLLZhjgIjNqGNVyrIIo159f9bt9p1Vcsqhq2+g?=
 =?us-ascii?Q?XFOkFq2uToM0X+pheSYEPT3dkmFAyCZBjkUvvdkKmOkkYZ/Ho7+NCott696l?=
 =?us-ascii?Q?JNmFklf8ReMwnelzBwvWUzWz2CK9Bmbv78iYvHvwB8mHJFlchqTA7FFluM+B?=
 =?us-ascii?Q?5NLmwU3hQc5+uLBdagvu2vpn33WSs7cTa0Yrwyj+z5uQZvXP/PQDRxg1NQxm?=
 =?us-ascii?Q?OYJQKtyitwUWNTu0wDSMZqiaW5qJSdBGRACvdnCxsUfMZi7O2tbfRruF3ic1?=
 =?us-ascii?Q?a9QGoYJWm37nuPhlEafLJTiaDtjKmvnIR1U4sgwRtXJUypUm+FCVzt2mkn2S?=
 =?us-ascii?Q?mZGBkOjaW2ELSB+vsIvONlyg5iFfCkVC5Jl011/w67Zh2Xj4n7jq8HqvIsm+?=
 =?us-ascii?Q?thV8f2mMZtdNTEpV6lT1laUBPr1fPBLd7CDN5/KAwYSbYlZWy/OmUu33dTcU?=
 =?us-ascii?Q?PRBJDsKQGBQCjcpDo5/rdcjdPDgy0KXLs/Ko+wK0HkzacZXMCi85wQGnQHrK?=
 =?us-ascii?Q?0kzuq16h/r5u+MtIhH9KgVQntELd6LFb4rO6tXusxPAhgMtdzLfPjzpVOqj8?=
 =?us-ascii?Q?tXZ7O2M4CJhGYrRQjcN9ek36yK1LLZvgV6A3kWC3Wm2H8B5TRJ7NUBZzAv9D?=
 =?us-ascii?Q?/sgD8dKG9QgrCrwKLtDODUrDjoaXp8QwX52HETRZsgR6IshtWhWs6S/y4Oit?=
 =?us-ascii?Q?LgJhgN1aKOrm2XnzzHHlbcPMCH4A9gsS9sL+fDIdOMAMRXiZWf714tO2hRVx?=
 =?us-ascii?Q?eKPNiv/mnVmVuamW7CO5GMI6DIPjj7tyO7QTuXUmY7XOzlL4hs7BBH0MFWYV?=
 =?us-ascii?Q?jvZZoxQrRhxxSHMgcqwLfl82JMqYWqdjbWjBX5hYcBGG/UoQ/9dcab5WvvsD?=
 =?us-ascii?Q?aJ1ksYDkwmQ34whMN1rvFK/zfz4TpygF6BG+n0a9sFcLZAtSowxloGUka5fD?=
 =?us-ascii?Q?uAGIkD+it2Bg/pnezPvNEgSRrXm83oGK8X7BAizo4hUhuqXlrw0yvA6IzzoT?=
 =?us-ascii?Q?Myz7wUQMcSe1enExb8+S6CbwUzLUPhj00750/zZuCEf1i9j55Q5boaM1nzBW?=
 =?us-ascii?Q?DcMsWGOZbpCYrsSh3+Gp6mt9f6q6tVlC07A4FLhcdtozXfZoBCBkpnfLEv8L?=
 =?us-ascii?Q?mr1SwbVf5OF6eVstetvcI39rTozdSkJ5c/FEnkm9AuBlQd5O/4QnKL6+zCQH?=
 =?us-ascii?Q?V2/DSdookZShDjpb2CeBK1Ll?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae9d832-db2e-4598-acc5-08d8e09448bf
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2021 11:37:55.7056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUR+o+SQapa/JZNLBB4+xlOZ/fs/W5pGS0el1v28ffHJ993b6pdTC3O+hMaU2Mfxz77i5cVV3TPPceKQhM6ZCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6618
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Introduce is_iomem to indicate this piece memory is iomem or not.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 include/linux/remoteproc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index f28ee75d1005..a5f6d2d9cde2 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -315,6 +315,7 @@ struct rproc;
 /**
  * struct rproc_mem_entry - memory entry descriptor
  * @va:	virtual address
+ * @is_iomem: io memory
  * @dma: dma address
  * @len: length, in bytes
  * @da: device address
@@ -329,6 +330,7 @@ struct rproc;
  */
 struct rproc_mem_entry {
 	void *va;
+	bool is_iomem;
 	dma_addr_t dma;
 	size_t len;
 	u32 da;
-- 
2.30.0

