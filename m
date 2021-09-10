Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BE8C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A67A61153
	for <linux-remoteproc@archiver.kernel.org>; Fri, 10 Sep 2021 09:07:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbhIJJIo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 10 Sep 2021 05:08:44 -0400
Received: from mail-eopbgr50055.outbound.protection.outlook.com ([40.107.5.55]:63811
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231946AbhIJJIl (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 10 Sep 2021 05:08:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRCDLaCu8kCWlJK+gmga65GOZApM9zim+Yq39mjjfMpYAMcMpiIOpvZ0CCKfrNwqhtZMblGXE7Py8JRT4v1xibBf+vRrqR2PSRe1q9MEvmjMNUWazX/udzGBs1CYN8FWYjLlQAAcJIC9++NVXHX9PHyCfvLN8SWfBT9+fjQazYSD63jKRm+6j8anMS7YPRNYY6zJo0hK+H2YRSMf1k/tt/Q1So0oom/BkfhnHwrKcO46qLIHysCs1VYnL5+3a33o/W71vUuERFRX5VAZNAQ4jG3wx6A9WiR015/YjSvE14OLzOyjuy9f8qji3aJ0b5Kn+NlBBwWXd00xfiEatHzZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Pl5B+yjr5YhPukrJQKVdX7vDi9qLNpcs+DEFloHaWEo=;
 b=POl2f2WG/StBb+bkRcjy1c6IET+34CCNy7dNUcITP5PCGhSuzUP6QbMSJOR75DmqHSd5kaSQiklUPeoNfVKcvNkWFPQAYygW8EO035dxR3M67Qw72Y4k39rcixPL0kAD0aVX1UxO5of87nJg6feUJbd+ERQ92uT2dvZ4+L9u5qr7BhcE+DWpHRiX30wp3fHymF6v787mHXHoNDhXCwSN9YywUdLavvP4BXs0v8Fd6M5Wc3v+i7O6RzY4Glk6qV4gOzxtVt4enjflnO0cPLxoAvtbv1DN9rWqfqYUVgm+VtU+9vpKzlDOFe3uDA6j8nA1k3yqqXWmA3fnlZtXGil1hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pl5B+yjr5YhPukrJQKVdX7vDi9qLNpcs+DEFloHaWEo=;
 b=i5cXqCOOBwtj2XEouwqhQGjEoSbbTAHM5pX8OXCNY2IZzHgJdnZdI76DeO8zqpPCjuZXDRPYgnf0qqsocHwv6aWcUUVRd+d9GHAVeR2A6pxWRBOPden9bLcvCx5idUk9JV4I66bxeA3uG/xTWbAOCgkAdXqgi0zXaabEkPIK5uA=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4763.eurprd04.prod.outlook.com (2603:10a6:10:1c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 09:07:26 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 09:07:25 +0000
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        aisheng.dong@nxp.com, Peng Fan <peng.fan@nxp.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH V4 1/6] remoteproc: elf_loader: fix loading segment when is_iomem true
Date:   Fri, 10 Sep 2021 17:06:16 +0800
Message-Id: <20210910090621.3073540-2-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
References: <20210910090621.3073540-1-peng.fan@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24)
 To DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 09:07:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52d492db-0851-4095-ff29-08d9743a6844
X-MS-TrafficTypeDiagnostic: DB7PR04MB4763:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB47632FD8B5E53F5EC3F0F74BC9D69@DB7PR04MB4763.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: boiUn4gsEGrxdjVvMiRIQ18L6aXWPFgl3apmYqiLNi12Bw9QKBMeeePcw4XMNghTHoRZuL0SZ03fnmR55/qCFkXYsjruADXKruNkbcP96idlvpTUr8juZhBrAmhSyxRdREV5ubaJUFF+aHOKCZyXI3MpcxLEBDywIYCevHeI3G/fsslIFUdlwL87JHJmyds2QuI53qm+oc9wq5LaR0zTGtWfRE+bLSl6WhtwMyIo+aZalAz6xo+q6o+T5ZL4qvxKRA31bDLBd8WWEeF1aYMNNqd9J5m7gZxo+yjPrWPjj0/Q1bchSeOsEflQ8hL+kQszFKzBS9P34CleFmQz01mlY6Vf2nAgOnIm8hjM4pmr1eMPNBJe6yh2mnOJqUEpDDL0ZOg6meQNav96wxiQO5Hz4ffhfFqPc+yK5EnH7Ti6t8PcmboTKg3WtrhED02+P07OBmv9EzWMHPaLcDgfs924dK+tJwzK6qRBBqv62oxUASvy+8jg082JARZBy4Wsw0B4uxDyPcjXscEFhhRgJZcKWlhAgSkTj+SoTUJxSUE1hZLQn976gz8wc6dlu3N7EIbjtnfjVxZbLyu5skPnKVL7ngAK3H5QrpzSToFMJbZmYp1dOfdtaihsm1m3Qu31IeN2/uFw/02CMCbpP5u3fl58VDXS5jaGRtaCAU2KO9C7hLtUaW78piKW5YgTWsrCQK1+1UjbYE1vqL3z6wTdfsXh0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(6512007)(8936002)(66946007)(66556008)(66476007)(83380400001)(7416002)(6506007)(1076003)(54906003)(6666004)(38350700002)(38100700002)(6486002)(8676002)(316002)(186003)(52116002)(86362001)(26005)(478600001)(2906002)(2616005)(5660300002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lcOq7eklj1/UXy9fo+SklFhghzIqWed63cRhvteePHJPJagCuVlsotmmMe/l?=
 =?us-ascii?Q?jTHceWaljDL+tNOQ4in0hS3G0m23SkvOIEmV1MHX0K7u77QvpvtIJpqoPwLU?=
 =?us-ascii?Q?FphVPtLPhpKD2FmxHFnASceTYb0IqF4qYtP1EndwL1/OK4F0mcOr+Exslu2a?=
 =?us-ascii?Q?u08H3Ca1U1/s2JOXrFy99/q9Cb4UYggB68R0GoXII8/QY+I0dPNUhsw0JoCd?=
 =?us-ascii?Q?oYLG55F7eiUvsfj8nj6RNqjG0Iv5gRT/5CvYe7nttedJPVAZ5CC3PGMKoFIe?=
 =?us-ascii?Q?DNiV/+ladUHdErqAqEuPzGOnQ+Ju3lcm7uA2VgSmH5tIqCAnmA17Abf6+dXy?=
 =?us-ascii?Q?mVWv2IvFMp5oIFzUior68Rz/ZDJAArdWHaVo/tD76FZzRp80LvAn7UCJkmPL?=
 =?us-ascii?Q?fLMegffUiMD3Itp4Xupxhgue28R1WqqanWcjFGBJj2r+r5YT5DAnf4rqB//5?=
 =?us-ascii?Q?g0wkQgD1CchuwLHLBuZIJ0j+/5o8FoJ5DBRxxaMnHdCz2WfUFJ33lfXK94eZ?=
 =?us-ascii?Q?/B5xiKxhdk+knFRlyCa5weOA/8JqviCYfflnwMDKGKVMtJoEzjYWXVVNj7EN?=
 =?us-ascii?Q?VQ4dNqoWA34i3HxLI19BZzz9jQg5Giq5N3mvJXy2IuIYvZVzXKKuvjjoHGY7?=
 =?us-ascii?Q?+iceYEZ0qJVW2KOKejie3SzzNxfNxNf9Lncg1w4+KBy6IQ/zRjGahlKwO28Y?=
 =?us-ascii?Q?QapX0lcwwtuntxI2fme7Is13XSCJIWGk6hVv/W6bXS1WNMzB7Sczb+Q33PEs?=
 =?us-ascii?Q?J0cV/gRjVcvK38JPWd7JqhVkGOiiAqF/YWOfcvO2xUajScKvnIJCpkzWWPcw?=
 =?us-ascii?Q?aI5b57Hzw5mUc+aWju1mb4pqBvj6kmmnvFV1Pu+o93vQ59MTi6JTtB1fZIrV?=
 =?us-ascii?Q?YNeGu2CbCa6zQo1jRMOt1ttgKjiuaz2JjZ1C+IieJlaOVUy9kFWgZ0vpSAtI?=
 =?us-ascii?Q?ULSLVAV1YU7ZWKvGnvla/biqewl+JSyZtroYYu2G7TMjyRtX9NLvxoXpZmqO?=
 =?us-ascii?Q?XMHTX7PjdxMIVXDERFOfNfjUutHQCntCEwHt/BodtFGaH7YhQdAwq7/gRbeF?=
 =?us-ascii?Q?eemEbVRZK0J+Pitqq0SmQlDeD1yCiFAAR1EhxX/Woh6Uh3K8AL0dcRWSsygT?=
 =?us-ascii?Q?9yc27Qn/nWY79reQ/7TNUaFHXve53g0OZCPqtsjyaPDBn0jLA8C2LxSenJsx?=
 =?us-ascii?Q?wZYsZcQgbNrm8tSZzma7BxyPxTN1w1dZ0XGSeoqGE1fGfwTtQnDVWXU9qyN7?=
 =?us-ascii?Q?Jz1XyPNQuIrPXb1ui6QKvkzO7p59E2Vx5tDQJebDqZf5YK3cgf/4/CreeE7o?=
 =?us-ascii?Q?apB4uBS+qXxVJ0Yv0Lo4ayN0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52d492db-0851-4095-ff29-08d9743a6844
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 09:07:25.9221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObVR8+FlGnNVRGWylI1RPyH4zOpCUi5CDTAWXpcy2YaXJjJHcUd9s0pd0uRpDXRsz2bi7ezs0OvLJmojEa50NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4763
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

It seems luckliy work on i.MX platform, but it is wrong.
Need use memcpy_toio, not memcpy_fromio.

Fixes: 40df0a91b2a52 ("remoteproc: add is_iomem to da_to_va")
Tested-by: Dong Aisheng <aisheng.dong@nxp.com> (i.MX8MQ)
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_elf_loader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 469c52e62faff..44e7f9308f4bc 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -220,7 +220,7 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		/* put the segment where the remote processor expects it */
 		if (filesz) {
 			if (is_iomem)
-				memcpy_fromio(ptr, (void __iomem *)(elf_data + offset), filesz);
+				memcpy_toio((void __iomem *)ptr, elf_data + offset, filesz);
 			else
 				memcpy(ptr, elf_data + offset, filesz);
 		}
-- 
2.25.1

