Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A15B6C433DB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:02:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67374206F9
	for <linux-remoteproc@archiver.kernel.org>; Tue, 29 Dec 2020 03:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgL2DCl (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 28 Dec 2020 22:02:41 -0500
Received: from mail-eopbgr50055.outbound.protection.outlook.com ([40.107.5.55]:14917
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726014AbgL2DCl (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 28 Dec 2020 22:02:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCfW1hHAe99ysGCjJqAX0fnjrDu73TY9SqaHEYge8O2BwkwoJxUrRHBoNK2AjcC7RlqKqtV0YPoJAdU7v7fLHFJiU7haSm6VQ57eUVZKtJruYWpOAbFO9MSXIoyTe9ymqOCFeTn8pDWe9/mLv57OTjYLQe+lNOjqIh38UsTrGP0hUjvcTJOr7TuCC2Dc6jJZ1iSMzCgPUpc5RqPvow8InEm3JqSZRT7KRmqp2wE7KAi0lMm2eJ8dV7JS5jpf5oIDbB8skEKP7ZTkBL+CJuApy0ocgE35Q+vlOhvXU8J7HEvE3DE1tGfCWRxbtdUI2zg2dZmn5UDx5mFRct1tzjVUyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVkMujKesKaXKRiuPJ+CmM/7KunB+Grx6Wd9B7qZVsw=;
 b=L3D5NdshgyBT/rcpjzj3d/BfGM6GS8+Qe3TxmnL2Z6tC33j57ZVaWr5VPzNkW6zVlnLHEm9f0+u7yGkcEJIWZEXmjDpudMzLzp4Yd1HP2XbDqRN+7ypZRq9MW3Mb736IZ/3mk9apvJggZ2K8xSLMc6Ahzvydtj8ARaNWtanWyhTHCOStvFRboNsKa9pyLEUXVeaUFe0Rg7WJZGxOOzWHcy2UtdiQdapO/jfR910VTr7xU8s0YRaMqHC3F3xJI4iYmcW2NIWhuh5DWsvzpq/R1J3Xwb9tAQgyzMsl0BP6zlckxq5rvPYyDjUJ8xYmWP1/SafvY0exDcAXx14TBqjYew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVkMujKesKaXKRiuPJ+CmM/7KunB+Grx6Wd9B7qZVsw=;
 b=NJrNsvR3jfgMg2C7V/pMbA3Gmz/xEBTTNA8Hiknyzs0+r5eLR8tSkMBgXOzUBLfLSF0U811Bf1jpgrKD3LryGgeU0o2WH236gx1jxhbJ0JqWRLnnKsJiYwkQLcHOD4GSQcZHAc0I51DcvNyYIHc0+5Wg/QAPArAkC5pga7uOmX4=
Authentication-Results: wizery.com; dkim=none (message not signed)
 header.d=none;wizery.com; dmarc=none action=none header.from=nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB7178.eurprd04.prod.outlook.com (2603:10a6:10:12e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Tue, 29 Dec
 2020 03:01:46 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3700.031; Tue, 29 Dec 2020
 03:01:45 +0000
From:   peng.fan@nxp.com
To:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, o.rempel@pengutronix.de
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, matthias.bgg@gmail.com, agross@kernel.org,
        patrice.chotard@st.com, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH V5 0/8] remoteproc: imx_rproc: support iMX8MQ/M
Date:   Tue, 29 Dec 2020 11:30:11 +0800
Message-Id: <20201229033019.25899-1-peng.fan@nxp.com>
X-Mailer: git-send-email 2.28.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: SG2PR06CA0178.apcprd06.prod.outlook.com
 (2603:1096:1:1e::32) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from linux-1xn6.ap.freescale.net (119.31.174.71) by SG2PR06CA0178.apcprd06.prod.outlook.com (2603:1096:1:1e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Tue, 29 Dec 2020 03:01:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 078a96e2-5de3-4f33-29bb-08d8aba613d8
X-MS-TrafficTypeDiagnostic: DB8PR04MB7178:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB71781C775B45F57BB709513C88D80@DB8PR04MB7178.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 39EAqW6KulWqRUlZzHAk8PatjNnrIFL16XEAK3Bq9rtmw2M1v0FoEP4XUkMVK3y4rLsnjTPDyvxQxqM620FQ5W+q/VeCIfjsRkc61RlBU5qXYH7Q+zUNImz9caK9dzYnrYLWNYtrw5yvKUkX8s1moK/vc6JjkBypBjUkzwWGBnsWKJvIW9lhJcL19RnmqptqfmeqPA226pNhIIAMyPSVkcPQMbH9gbfubMDnkfNa0XROUKWL+EzLwWCnh91m0fPHhXU+tgwHn+DKXpPFMGj3f+RNYMrY7F8GmDljnWOGNAI26MDvoi06+VPRvBqRACPCV+sWcA63/Ca8PgccvHfpmTAGpSZ/aD0oFMCr/RZYdVEplpiaMgQvBBbSzpx74Ls/1d5aT5JQ51NCye3aKB+JrOE/Qssiie5zn/mfrgqaMXGRmikGSkAJAznrWp51yae4K3EhfIvE5sxVKtBasx+R1Qtt/kH4/vCTLzS2S3CehaOkaQxt/aNPmEpltVTSXjy8CKprznMhqS3K0/QuICkamg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(36756003)(66946007)(16526019)(9686003)(2906002)(7416002)(2616005)(86362001)(956004)(478600001)(83380400001)(8936002)(6666004)(52116002)(66476007)(5660300002)(66556008)(966005)(316002)(26005)(6486002)(1076003)(8676002)(186003)(4326008)(6512007)(6506007)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dwfChaaOoTDXL4Sio8M4u1ZLizVTfuwotvNaoi9jChdWSrYKmFdKLQ6UWYZN?=
 =?us-ascii?Q?Ixf+rc1xSxwQ0UWeq6vfhiUe8k8o0XKCY+fMeGcy96vur84RSlzygn+zcX8z?=
 =?us-ascii?Q?qCoXVMN0urNrmzUHaD8twW3XuWBSfhnwvqq//DTZld40eq49lxQJBTnJsUIx?=
 =?us-ascii?Q?U2XKxlNBDefoo9ayIV3GP2gJjsb4i9Uw4Whx6W6sgfS+CYcIv3xcAWVIZTEd?=
 =?us-ascii?Q?ZPW9UVmbbWekdfkvcm7/vnHmFxVKAXrQWyHhSPqQ3NN6to2bz2BrdjFzFvoU?=
 =?us-ascii?Q?V7xp8iRnY5Qq36Uq+pLLsvtQ0zC14qaizLJeFh9st9wIhFJMOgh2Xi7Pxj6f?=
 =?us-ascii?Q?hfig0hZRtID3iDNezlAdM4FILTvQgzKDQSRnKaUgsc5SjBV3iI7sZ1xcs3FA?=
 =?us-ascii?Q?FBOJZMdaJCRrhrHM01ktU9w6cqUgPZo6XkYTwfMsdynEkWbqXI3Dd8D96xd0?=
 =?us-ascii?Q?JMjjsAQy3wwjarnMyDx0ICrfrZNYiW7MLRlwnsNpwcNoegxM64qQxJQQkw+r?=
 =?us-ascii?Q?NcBQdpN2b8s8sq/QYCiKdoxBgo2ABv5MSyWtd0vl5xvIRe4qTv7/PqFr852n?=
 =?us-ascii?Q?vIBVd6pwvxPITt0GdTCCIzvD6z5rFaDlTUeh2rksYHJAttXROwwJdKa1lzKN?=
 =?us-ascii?Q?z1zdPdR9XUq5PjBIU1mijoZiQHewEBFhmdCpPc++gZY2LRfUH/ikhoKBckMD?=
 =?us-ascii?Q?as7HrcqsSENinshbSwFZewzMNheBDiKR7wqFrVfo1CGC+raIT0QNhLt2Y3qC?=
 =?us-ascii?Q?wZomK6cxBBHtasaqoaXvGbqETYvjisShMM3JUmJKK3SXBflFx8J3pDuIlhD3?=
 =?us-ascii?Q?Lq+y3FHghlosxWukBOMPGTa1rubIsMW3vxLX1yptOOe50fsHZNGDrbAYt6aT?=
 =?us-ascii?Q?mK9nvtQN+Sy1iekeEsfBrap9MSvKxkslZ2PXPoZnfIiWyUyiDYEzoxCl1CbN?=
 =?us-ascii?Q?jheUrcckNgAj+/XN31rCR6RkXelecM3aHFmFxaAitrouOsGXzRQRHYF7zysW?=
 =?us-ascii?Q?c50T?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 03:01:45.7969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: 078a96e2-5de3-4f33-29bb-08d8aba613d8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yv4FCClFeSyJYiJ3u5svF970q5gKl9H8jPlltM1Mnrqk/PJs1uRDoSfsQwmmyyjpzJ9/Pa3tvUw0IaT4Ajc6nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7178
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

From: Peng Fan <peng.fan@nxp.com>

V5:
 Apply on Linux next
 Add V5 subject prefix
 Add R-b tag from Bjorn for 1/8, 2/8, 3/8

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

Peng Fan (8):
  remoteproc: introduce is_iomem to rproc_mem_entry
  remoteproc: add is_iomem to da_to_va
  remoteproc: imx_rproc: correct err message
  remoteproc: imx_rproc: use devm_ioremap
  remoteproc: imx_rproc: add i.MX specific parse fw hook
  remoteproc: imx_rproc: support i.MX8MQ/M
  remoteproc: imx_rproc: ignore mapping vdev regions
  remoteproc: imx_proc: enable virtio/mailbox

 drivers/remoteproc/imx_rproc.c             | 259 ++++++++++++++++++++-
 drivers/remoteproc/ingenic_rproc.c         |   2 +-
 drivers/remoteproc/keystone_remoteproc.c   |   2 +-
 drivers/remoteproc/mtk_scp.c               |   6 +-
 drivers/remoteproc/omap_remoteproc.c       |   2 +-
 drivers/remoteproc/pru_rproc.c             |   2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c        |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c         |   2 +-
 drivers/remoteproc/qcom_q6v5_wcss.c        |   2 +-
 drivers/remoteproc/qcom_wcnss.c            |   2 +-
 drivers/remoteproc/remoteproc_core.c       |   7 +-
 drivers/remoteproc/remoteproc_coredump.c   |   8 +-
 drivers/remoteproc/remoteproc_debugfs.c    |   2 +-
 drivers/remoteproc/remoteproc_elf_loader.c |  21 +-
 drivers/remoteproc/remoteproc_internal.h   |   2 +-
 drivers/remoteproc/st_slim_rproc.c         |   2 +-
 drivers/remoteproc/ti_k3_dsp_remoteproc.c  |   2 +-
 drivers/remoteproc/ti_k3_r5_remoteproc.c   |   2 +-
 drivers/remoteproc/wkup_m3_rproc.c         |   2 +-
 include/linux/remoteproc.h                 |   4 +-
 20 files changed, 298 insertions(+), 35 deletions(-)

-- 
2.28.0

