Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778EDC4332B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:12:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C80864E5A
	for <linux-remoteproc@archiver.kernel.org>; Mon,  8 Feb 2021 09:12:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbhBHJLf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 8 Feb 2021 04:11:35 -0500
Received: from mail-am6eur05on2086.outbound.protection.outlook.com ([40.107.22.86]:49473
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230475AbhBHJJn (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 8 Feb 2021 04:09:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wo7IBa28Rt2oHkLkC5mDE5f74fslm51rnsPIO4b4GyyHyS/buVv+L/pN15NFEnEsO8bGQXgYMuHdUOpBfQZwPpHpR7DW5ubHtszQdOkU1OoT4VvnmMNbpmgtoegy+Y6+Om5/1Wf+9WPO7biH8pT2WfoZut+MwL2tRBg/n0aDHPZyRuirr7eLi9Mem/kyhwEISxP+sJ+yJ8dMgzS1NVIe6g576+9fjLO5/lMfFkF9wV4DMUaASCzO0gEENKMf6fvu+SmyPuUWxHdPVnETENBmzMXnWetcy2WZTaGFB13qDRc7n8EK2SPTNEO95Cpq16v6noVlIRmR5UYjffN8j9CdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSh0Klx+zNLSyY9W2gwUiOZPVVqrU82ogdPg4tjElUs=;
 b=d1xQ50ppjBVLcgnSdXeo2qPF2ehlLhpginecoT5imMIyNwO9HTpFOSRKihnOBeKr10P93o+HpzwE7iu9kW3dq2koOPFg7qxDhNdHRzP7UhLpc2/8elFyp9T3LkuXXMLk0ib+u1nSFGDz4ivCS00edxMV/i5Zeav6SH3fLbrkwJqaDIU3byTc8GbYXwI0zOUj73kUwvRkMH/8jIDRLqGsZz7sYI+frDS8a1Rf8qLXo+/MDaD6ckydQi54ROHBiBn+A6vDuO/6p8fCCUbskNyT1YdL95N1If8Gvh/k+c6J7Bw6nCRAZW4OgfMCWw+EMZArFoxOoEly6EG+JqzDG4Vcrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSh0Klx+zNLSyY9W2gwUiOZPVVqrU82ogdPg4tjElUs=;
 b=hCi/NF3i9rcj6XfZ19QjqlFshHWojY1P/XMzoTmq2+WdRyj+HShostNOqm0vVSfK4qL6dhw6DHkXXT7H+0+HPgivXSIwwQuqSXVxdHdihtbEbLt/z/aKqIIqGLomSVHDbR1BEP4KY16xhc7KygS7GdI2Mp1lVOlcI0QDQvpvx2M=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Mon, 8 Feb
 2021 09:07:55 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 09:07:55 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V10 03/10] remoteproc: introduce is_iomem to rproc_mem_entry
Date:   Mon,  8 Feb 2021 16:56:04 +0800
Message-Id: <1612774571-6134-4-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
References: <1612774571-6134-1-git-send-email-peng.fan@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR01CA0102.apcprd01.prod.exchangelabs.com
 (2603:1096:3:15::28) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR01CA0102.apcprd01.prod.exchangelabs.com (2603:1096:3:15::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 09:07:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5be43924-fed9-40c4-6c98-08d8cc110545
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2933:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0402MB29333FF139CC4284E010C19AC98F9@DB6PR0402MB2933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hb8M5wN0Umw4pGILZvVBAAyubnNWC/Tz60LrPdSf+2WBjq+Q2sFgouGwm/y5Wu6rGVQaJBb4y/1feaLwd9jAmZqCdl6Lol+l2biNTnI3RENvLfk/VCJLX98ozHYPJPQZulscuKAHyiBDKh+H1zd0Ds0epm5I/8KaJemsUXqk9+fz2cM69+1WBXqCUVijCjdNTWDN1YSaJIFAq73K35D1PkI+jFrGAFBbxvOVX8g7E+eblOuepjyjX3In/nmCyAVjOZyytMVTujKaQ6xho1f5TIAXUDghWBewrKLdtNoRD/cFQ5RiFab4qNOggPZwDgxHJnePS7/OrOqWknR+VUhe/SY0L6sBltlQrtqr22gCbrBjHUwAI2ehbzoR4y0vxhohNWHZn0yzZ/A2dZMoPs09kmNRJ6ZTIKk6vpplRJC1l4m9lEMl3tr7dGF9d8x+bpzT2saaxq37oAM6LX6hsXs5v6wvlCeQnxpKY5kPENjVynvMb1/eSaM3FOs0hDxSUcKdtVSyQ4VWQu7r8htGoHcI0jtH0q1UhMfWu4qOg3YpIjKWhyyTgv2/rJOo5vBpYV2fMMDBBOBnUXTDUPOpP8ZRLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(7416002)(52116002)(6666004)(316002)(4326008)(8936002)(186003)(69590400011)(86362001)(66946007)(6486002)(8676002)(6512007)(478600001)(6506007)(4744005)(26005)(956004)(2616005)(5660300002)(16526019)(66476007)(66556008)(2906002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZED2jS//f0jyqm2JxH5rnm5ORs4mlCfuw54UWnHR/nBScn6/Kv6WVHBqfTY+?=
 =?us-ascii?Q?VPM1phtSFMVEVQ+GN1s2NLhB+M7totBCx6SNRLQthxip91kQSABZ1Nzrsqcv?=
 =?us-ascii?Q?N4bqxGeLlvuK23SsDwU77z55tisQ38kYn+czORktlSAQeOiTOd5iJaBe9ocC?=
 =?us-ascii?Q?4qlXzBLZfa8bzPkm1nAtTgDwAm1SUqqWV1FYi2xGwtTOo+Nr5ioOP1+Bhd6k?=
 =?us-ascii?Q?m7j53ciUTMH1Gh9LXiL3L0Lei/HOfxB7/JOG8blJEUeScpuICe1dZEADqLhJ?=
 =?us-ascii?Q?sUmZ70ype1tmquth+2ZP6jPehNN6Q5HSooEQ6PmbWyktI5DfrnDyplmM5nxl?=
 =?us-ascii?Q?0FjJyhqBBzdy0Fj3Vw43wPD/nyUfP862A80YVAkvN6GfyXmUu37EpQyiA6J4?=
 =?us-ascii?Q?2u1IHu7UpKT1aIPzEIMxdaXps2Ki7GiY+AYbV+gZkq8HqJzjU3XQGtWTmCU1?=
 =?us-ascii?Q?0xucmBbMULFofLp8roUrMB5+QqlU1zTsIIOCB8ie9uIWPnl1oJ/7LpuxfS5e?=
 =?us-ascii?Q?6WrIDusQRbg9e7qVR/hH6F25k11Pcmx6wlFCjVp/IoiJulphnP2Q4GT7hJ+Z?=
 =?us-ascii?Q?bS+6kfGFXS1S3ESeDR+l1q8grBJY5dBxJjbANzRTA0uBaW4P2ST1BUdrbCvl?=
 =?us-ascii?Q?JrVfQGt/nPNPmswS5ASfVfBSdIDCndEyY2SJZBfnX32tBWQ+3+EV2l5COLW6?=
 =?us-ascii?Q?N9qFFRm64Fud0N1dOWcz1+9gteI1w+wzHODwgJhvrFUeNCfA7bbiDBqI/usj?=
 =?us-ascii?Q?MzNRKx4vydmKffc+iFC99/RtggQYgVhGc8aHuSYYKyyzRrw2aBzQBlm1Hxg9?=
 =?us-ascii?Q?Plat1WX9ZYaZ+LhBvRWIMIlkb436hiiOc5PI3MjIg94303U/jnWornQMuP35?=
 =?us-ascii?Q?GoaskX/C7ns/RDtdnzQBN1x9VbB5WlvFyESYduqqI0omVsuvbfdxvyaVxUvD?=
 =?us-ascii?Q?w8eiNeMhv4tqitZdOJz69+AS3h8bXwlpeZEcCBx9kZyv3eUp+wQYlh60UM/V?=
 =?us-ascii?Q?gm54HJHAWdKxxyfwAB6Il+Mr+UXgJALwxj4B3vMW0mIiFym9BGOjaTKvKaCU?=
 =?us-ascii?Q?av0aI71ZO0c+9thO4IyYFkXNIpLR5Jt4Ogu+SMUjNlyLS6YRxz8EcXK4dGS+?=
 =?us-ascii?Q?T1UE8XB0oA3wIbl5i8qXIKLoguGSNBBdJY7YUaihaFx/BIIesPrLZHnQLEM+?=
 =?us-ascii?Q?4aoRCkldrRSXKPOJjMRunuPHB81wHJqmx0kvJ9PqjDFgXyRTUYywExvjqs0R?=
 =?us-ascii?Q?85Q4VttlTdYTfZPbzWpIPZZ7OcLRA8XEaAWvm+8rwgRHMHS2+kKEFtQeLMwt?=
 =?us-ascii?Q?gy5CO32d73YGjfHpvu0qMec/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be43924-fed9-40c4-6c98-08d8cc110545
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 09:07:55.2149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwNk0serdpjFhNUZh9HfSbtybUKL7C3mn3Nlfk48R2EY7TX6zWVBxW3OjlYgrsqg72luWZwNVXwE8WM05+osCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

Introduce is_iomem to indicate this piece memory is iomem or not.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
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

