Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1FAC433DB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C77864E76
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Feb 2021 01:38:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhBRBht (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 17 Feb 2021 20:37:49 -0500
Received: from mail-eopbgr80089.outbound.protection.outlook.com ([40.107.8.89]:51809
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229850AbhBRBhq (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 17 Feb 2021 20:37:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ClcrWJbrBvbOd1gGPNI2uzRQx/wTBugK92GkfmOoCtYqV2371lURBBWR6EaOc/JOfUVC1QwoS7OEDQ1TFR3LwQ4sm5N5e3Lek+9THdaTaZY+KJ+MJXgSl+w2HS1usWDeBV2cAD1iGIAVGEuAseHFSKMiz0x3wLNjJCtHoUO/tevEZiJelO7pqeplTE50VV7Mrff1JK+KkU5MvbJ+/FQzfiDVdkVcls/1cnldFaC8Z4DurMRGW8tfLY1Gb8H+jPfkMpcwhXCrjkyEGykztk7hsYkECeaE3vfe4L8H+iS4bjO/rOilAID7iXLwIAqr9urdX9K2JuwEvu9/uzDra+20ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yohFhiq5yq3tRnqzUm+PutEdHG95nDtcaQQz3pje+GY=;
 b=Sl6OYMXp9rDLl+hXSwkkS6UPPQmCwlyoJVbVTtPtVx2HdBvARHqzMzuFqgu9GXlH2RX55dy+/W8+F4JLuY4sIaVKFCFQvBKohgTUMA9dqK4Jy9yVpDB3IFH3Gk4HOK8JQHEbKVDQ3i5fWAKt1ZJcHzLH7rhofqfAngl+8gUJDuaiaLkvSwrMroXohJmsYzl9fdQVPGPwRYTACmxJ19Ivbfcrv8XJ/JKkLBcqG2h4Qyl5O1Zd/YWkJtc9brh/2xYMjCp/ZuL8ChRm6du2gI/ef/JU6znaq+hCl4IRhcAgxC+K/Gn+Vyvyh+mnGZDo/kC4f6c24eFHjxej2XHqj1bQWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yohFhiq5yq3tRnqzUm+PutEdHG95nDtcaQQz3pje+GY=;
 b=PsphP6QLeoXXYBRDpU/qYTChKNfMxO3tQgBt1f1I25pjwHoUKZBSTduEs+ejNYdox2WJhrqNOONsl0agvjr50xib1mpnw0EMTAAtl+e89WsE648RaPT1YunVsoZy8OC+s3N0pUVIelBErzdTFwjd0HPJxk7APZlSrEvVauazuFg=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBAPR04MB7285.eurprd04.prod.outlook.com (2603:10a6:10:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28; Thu, 18 Feb
 2021 01:36:55 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3846.043; Thu, 18 Feb 2021
 01:36:55 +0000
From:   peng.fan@oss.nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V12 00/10] remoteproc: imx_rproc: support iMX8MQ/M 
Date:   Thu, 18 Feb 2021 09:24:50 +0800
Message-Id: <1613611500-12414-1-git-send-email-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:3:1::15) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by SG2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:3:1::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3868.27 via Frontend Transport; Thu, 18 Feb 2021 01:36:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7a040ef4-ccab-4cb0-09cf-08d8d3adac76
X-MS-TrafficTypeDiagnostic: DBAPR04MB7285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBAPR04MB72854A3761A3A6346367567FC9859@DBAPR04MB7285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qe8zrXXwMf4Vd5YkhTxPmumUy1WSM5ArHQKi6JpksECM6iO2qbWuOUBcYQZGRuIMQ9s2huCRmH6YNYFSzUxl24hrlSURuV1GEj2gzRZki2HWF6Mm6A3Xx6T2qJL1ljQZGsycjFnsy0VAcWiC/ckSd+dglu9yHsZsss3xkOOOKKCtvDuqTSxnhTNZ384rNmk5XQ/PPNcLn+4NQqqaDADxMN3/ZPUq+dbLjwxQeSeCkJ4n9auezA+6Y0YmnX/FrL8LA0xE/m4WuKmxXpqn07xb2dm0GvGN2n1fE2XaRseNO8h/WnOuzIwtXFxxS90izoL9kGGIfAOUbxjr9kOFalzFHhStoFIIWxF/Mmtnon3jwLThww8bY4ZqpGBZZkQBdW/chbtG9zp2yWxPKJslIEgx10DLDj4dasvgNAMQwWfC6G7S/p+xtGYKWrPmkcnBLPdKGOWv6ZD9bLxhe2ooVSV5zeDMYH7JmE4GRiY92Gb21H9489sW1zTN8XHEtAs8RViLEWAvwbDsrQoVj83lbB6uSJuBrZeeb3Fk+gEhFTa26IlfNJLYptak8/flrBYZhRv26vl4vu2i8c9kLKBSfZBSpzIjXvTQ4IQtJ1p9T4z74Z7/5V03w0E7bG8V5bdTLLGNLNffcyqmgGDZDc6erBt+ipXk0KK3PDbzbCi62v2wCCh8VIoX4pMf1rrGgSq1IV2G
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(6512007)(9686003)(16526019)(186003)(966005)(26005)(5660300002)(83380400001)(6506007)(69590400012)(66946007)(66556008)(2906002)(52116002)(7416002)(316002)(66476007)(8676002)(2616005)(956004)(6486002)(86362001)(4743002)(478600001)(4326008)(8936002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6zVMovEptIc0U2290dnWJsDAOB2ftM7COiby7uZ1CTDkcwV4xVKXYRCfWeSh?=
 =?us-ascii?Q?mf1warRCqQI1OOfi9y8UJFrEz9/o2WyUrvhSqQsfwwu0QosWwHVDfXA8Wwl7?=
 =?us-ascii?Q?Fe9VpajOEjRrdnfEMz/Vqm2cjTKFneCxwVkh7LQJqsMygtsZXFOO1yFmZErL?=
 =?us-ascii?Q?nAbPxKvGRiYKeyFcN8xGKwMxG91LQ65d2cnmWv93bj31x0MGpuAoHE4W0mih?=
 =?us-ascii?Q?EqfTE1GMtfBcHorbo4+K2XNvmi22fzNL1J/8s7GWlvEhXuVfNjsR+cR42rUK?=
 =?us-ascii?Q?eGVEK8VfCXaBwZ/Bn7EKKDQnnAfvrtafdWF2ZPTbDeS3yFvvrXtfLvk5oZ7n?=
 =?us-ascii?Q?DgoYR79FLe9j2jTjGyQ0ugWP0mxIef4onEZfUSpz6AvqatpPd+JINrLNGczs?=
 =?us-ascii?Q?k/TzUTBfwoncMkTqif8Sf0/VpX3fRLNaAO3RkssKixodDNKuee76JQiPps/Q?=
 =?us-ascii?Q?RfNXXioIGF4vLSdjme4FXZocZREGQuXk+dMP31paFoJM0EqHaAmij3+K7Ur/?=
 =?us-ascii?Q?17D3Ils/jSRDV5hd5+nytNzKr2QGxrhCSRak5J4XDElCZqO3zojRkER7Vum+?=
 =?us-ascii?Q?1zvrmiN6RuBzVEcXshzldlBpMlPenjg6rZ/fMCqZrxEgf6O67aUDtdUTO8Le?=
 =?us-ascii?Q?zz4B0GC1l6C1GbGbjuIptHqXm5aBYGRW49A2f6waYm03orpibyjfYusYSOQU?=
 =?us-ascii?Q?HkgFijvqZa6qQyLENYvzPhisfZs9CajDOeyrSsTyYBDkEQEJZ5/RyvWBtiFI?=
 =?us-ascii?Q?TvcatUqbRJbipNbQ5bLxzsSPP2t3YeUDUaotuW+hjAZ761SDF6tEORvGh1A1?=
 =?us-ascii?Q?O7yFaJThulKtbw0gEUoNmB4UtlfKFmQuhZr/cbElWp+4385t7mTwnr6wpocC?=
 =?us-ascii?Q?a0tMcsHVOY6zuN75PhhXRpfS1L+D1bdRqHbDAOXoLuwHANDAt84Ar+5WNbrK?=
 =?us-ascii?Q?8oLtOstDEUep6QMti3sxS2qVhewIEgYQygw/011KvM2sPMwcP/B3EvrB5TIx?=
 =?us-ascii?Q?yXjlxu1LnnXTiN4kHPKS0aoBg4usMAX7gb2mifWOD20Ua6aIxunvrvbl8gcw?=
 =?us-ascii?Q?qdjWM/gvs5cb71BKWnO+d8Ua0jVG2dmVH6fLGzio/dvLg9IJP+ib8ABeo77N?=
 =?us-ascii?Q?T5Hd5xpTJmwX6vTr3B+bHZmy+8tfIqlWl9wMDv+1Z3ZyMCVrELUEfe1kE94C?=
 =?us-ascii?Q?9DC8gWW0cJCfUU665WoeDkXW1pLIYYwsiOjT6DKWw4bRHZ4b8uPvZViTMXCf?=
 =?us-ascii?Q?7wN0AWfx1AHXR+f3Qh8Kg9U8BUzS16uFzGbzLX3YP39OdKc2Kz1Zif2Rv6Xe?=
 =?us-ascii?Q?3vIKvcfaeXcB8GE/kQdPmZ1i?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a040ef4-ccab-4cb0-09cf-08d8d3adac76
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2021 01:36:55.1963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRcJHhbmLCIiYrbqrp2ytjB1eZOeOmyI9U7VbY47j+sXyv++QtZO/WPUTzH7BtjbjHBRQ6WJisEIhCObnaMwSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7285
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V12:
 Add maxItems to avoid dt_bindings_check fail
 Rebased on top of linux-next

V11:
 Per Rob's comments, fix memory-region in patch 1/10
 Rebased on top of Linux-next

V10:
 Per Rob's comments, fix patch 1/10

V9:
 Per Mathieu's comments,
   update the tile of yaml in patch 2/10
   update the Kconfig and MODULE_DESCRIPTION, I merge this change in patch 8/10,
   since this is a minor change, I still keep Mathieu's R-b tag. If any objection, I could remove.
   Add R-b tag in Patch 10/10

 Rob, please help review patch 1/10 and 2/10

V8:
 Address sparse warning in patch 4/10 reported by kernel test robot

V7:
 Add R-b tag from Mathieu
 vdevbuffer->vdev0buffer in patch 1/10, 7/10
 correct err msg and shutdown seq per Mathieu's comments in patch 10/10
 Hope this version is ok to be merged.
 
V6:
 Add R-b tag from Mathieu
 Convert imx-rproc.txt to yaml and add dt-bindings support for i.MX8MQ/M, patch 1/10 2/10
 No other changes.

V5:
 Apply on Linux next
 Add V5 subject prefix
 Add R-b tag from Bjorn for 1/8, 2/8, 3/8
 https://patchwork.kernel.org/project/linux-remoteproc/cover/20201229033019.25899-1-peng.fan@nxp.com/

V4:
 According to Bjorn's comments, add is_iomem for da to va usage
 1/8, 2/8 is new patch
 3/8, follow Bjorn's comments to correct/update the err msg.
 6/8, new patch
 8/8, use dev_err_probe to simplify code, use queue_work instead schedule_delayed_work

V3:
 Since I was quite busy in the past days, V3 is late
 Rebased on Linux-next
 Add R-b tags
 1/7: Add R-b tag of Mathieu, add comments
 4/7: Typo fix
 5/7: Add R-b tag of Mathieu, drop index Per Mathieu's comments
 6/7: Add R-b tag of Mathieu
 7/7: Add comment for vqid << 16, drop unneeded timeout settings of mailbox
      Use queue_work instead of schedule_delayed_work
      free mbox channels when remove
 https://lkml.org/lkml/2020/12/4/82

V2:
 Rebased on linux-next
 Dropped early boot feature to make patchset simple.
 Drop rsc-da
 https://patchwork.kernel.org/project/linux-remoteproc/cover/20200927064131.24101-1-peng.fan@nxp.com/

V1:
 https://patchwork.kernel.org/cover/11682461/

This patchset is to support i.MX8MQ/M coproc.
The early boot feature was dropped to make the patchset small in V2.

Since i.MX specific TCM memory requirement, add elf platform hook.
Several patches have got reviewed by Oleksij and Mathieu in v1.


Peng Fan (10):
  dt-bindings: remoteproc: convert imx rproc bindings to json-schema
  dt-bindings: remoteproc: imx_rproc: add i.MX8MQ/M support
  remoteproc: introduce is_iomem to rproc_mem_entry
  remoteproc: add is_iomem to da_to_va
  remoteproc: imx_rproc: correct err message
  remoteproc: imx_rproc: use devm_ioremap
  remoteproc: imx_rproc: add i.MX specific parse fw hook
  remoteproc: imx_rproc: support i.MX8MQ/M
  remoteproc: imx_rproc: ignore mapping vdev regions
  remoteproc: imx_proc: enable virtio/mailbox

 .../bindings/remoteproc/fsl,imx-rproc.yaml    | 110 ++++++++
 .../bindings/remoteproc/imx-rproc.txt         |  33 ---
 drivers/remoteproc/Kconfig                    |   6 +-
 drivers/remoteproc/imx_rproc.c                | 262 +++++++++++++++++-
 drivers/remoteproc/ingenic_rproc.c            |   2 +-
 drivers/remoteproc/keystone_remoteproc.c      |   2 +-
 drivers/remoteproc/mtk_scp.c                  |   6 +-
 drivers/remoteproc/omap_remoteproc.c          |   2 +-
 drivers/remoteproc/pru_rproc.c                |   2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c           |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c            |   2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c           |   2 +-
 drivers/remoteproc/qcom_wcnss.c               |   2 +-
 drivers/remoteproc/remoteproc_core.c          |   7 +-
 drivers/remoteproc/remoteproc_coredump.c      |   8 +-
 drivers/remoteproc/remoteproc_debugfs.c       |   2 +-
 drivers/remoteproc/remoteproc_elf_loader.c    |  21 +-
 drivers/remoteproc/remoteproc_internal.h      |   2 +-
 drivers/remoteproc/st_slim_rproc.c            |   2 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c     |   2 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c      |   2 +-
 drivers/remoteproc/wkup_m3_rproc.c            |   2 +-
 include/linux/remoteproc.h                    |   4 +-
 23 files changed, 413 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
 delete mode 100644 Documentation/devicetree/bindings/remoteproc/imx-rproc.txt

-- 
2.30.0

