Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AABE732E8
	for <linux-remoteproc@archiver.kernel.org>; Thu, 28 Sep 2023 15:59:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbjI1P73 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 28 Sep 2023 11:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjI1P72 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 28 Sep 2023 11:59:28 -0400
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2053.outbound.protection.outlook.com [40.107.100.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A999FEB;
        Thu, 28 Sep 2023 08:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/VKuK6Dk0NPEiWWdtMah9nT3zKiRzeiqSD5WwUa9j4TXN8QqITINRmPMZU9klFHuhO97dnzvo5U0faGjLr+/NetKqXJcLTmuWiYWtT4izgO1W9sN6x807OwNt5vkUooiUumNba69g/OmbPMeW6cAmxtknZfH6UY91n15/guslaIX/vk4QriHz3qqv9zWvkYy9hpqu7EU+aHNRL7igdpIwxa+x184BjNZI1TspD/b3Ss5DdWuAjZVlk4A0KN8syBKWKgL3PgwOoAJyqrL3cXiTi5AugPlruup8Rm3491MSt95AVDvGOB8MjwkCIdXBmaIynJ8/k8wPqjdVov+d0bdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+wMmVVg0Qsojow0FOHofnjFYqoyo3/q3sEeeLZkEfE=;
 b=jMiHG1rcRNDHepGhud7HwLkbgiw9d4jCTRfbs8MfMdtjOZ0ILzz2+4+L48va7X8+MMVDBdDxrrcVsA9FxZu7pF9C6YuMFkBMUa++WvDtzT4wa2r1Wy6Dmumm3wPpNY12H4HHIW0eaOJbNVhuYQ5ZHzt7pO4k5ySnOQ630lW+MaeSDM/d6rZkOika9pWOrnlZgXISzEvALi4rafA7/WGISypxQAizqF99pu6YnJOlIOpDvPzT4jO9EqxgjEY914tPqbXmoHRBlPJG36cEN1BAZm5ISyeYZRRx/2eu+jJnFBoKwfSIGfq9OnxfkL2aPTHJW1c1T6Cdx44hiBMtLzD78g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+wMmVVg0Qsojow0FOHofnjFYqoyo3/q3sEeeLZkEfE=;
 b=MIB5S8ltA2R/FDgN7ujL64dfKBzMd1regB+UHNHUyTJL3139HeWnE2yy1fOHqKO8ZkkxlVnt9xX6CzhrUluT9cyWupmgJvIyK4iFvLoNoz3G4TWkzHxC3Lg0U8YwrXAGgGnRYiI+rXhAcwg3RGHKaDrqfeMEfvytt+Qtt3mAUMo=
Received: from CH2PR17CA0001.namprd17.prod.outlook.com (2603:10b6:610:53::11)
 by CH3PR12MB7500.namprd12.prod.outlook.com (2603:10b6:610:148::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.35; Thu, 28 Sep
 2023 15:59:21 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::66) by CH2PR17CA0001.outlook.office365.com
 (2603:10b6:610:53::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22 via Frontend
 Transport; Thu, 28 Sep 2023 15:59:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 28 Sep 2023 15:59:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 10:59:20 -0500
Received: from xsjtanmays50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 28 Sep 2023 10:59:20 -0500
From:   Tanmay Shah <tanmay.shah@amd.com>
To:     <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <michal.simek@amd.com>
CC:     <radhey.shyam.pandey@amd.com>, <tanmay.shah@amd.com>,
        <ben.levinsky@amd.com>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v5 0/4] add zynqmp TCM bindings
Date:   Thu, 28 Sep 2023 08:58:56 -0700
Message-ID: <20230928155900.3987103-1-tanmay.shah@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|CH3PR12MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: e6cec068-e13f-4160-6435-08dbc03be109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xJtY9f3xLj6NXk5XgIv1sEWNl/9tOkdEenRmkQPEBlw+eM9+LgyhzuHaEaMtmgdRCNiEdQuwThroTyKvfAJRO9IURDrLRP4w2fD/O2lrwP2DVQriptb+T9OUbPWKKHA80dJP5aGFvTrkQlkpiUpbJHCoTa/YjHpj8PMk0j+iIZYugrHKBnnN5fBXec+kSRi0AjaKR6G315tuI6eFPntyNZQ5EZBZZB9sKYnAhElxsEeB0UMki8L51nyEGcREFo0VG3KdRcYLD23oxi9QFJ2hLUSwqxPyCWgefO3X89wwOUy+K7wdJ7naL61GRanctaexP4Y2/8d5l/YLGrt3joLFMYiV/YoFsIqwvp5Dr2wCc2TPzst+3PrGD+r/1X5epQHsu7/rn5v7iau9/BGWHaWdX9Bj+Mwa91xSso3B40wwPWs1N1mpzoPYALVZkhuviH8hkaHryJFrLsTl1pJySZddRhQiv7UQo92s6+0ik9IZrk5nFWHbz1Z1uqtwJm2w7yIxy3oll3kuwasT0D+YeTQD6cXVPzWv780CGftPr1zpA9GW6c8P7ZEMsOyixp4KPrhp4FlsnTQezczVmS36B7LfFkunifILX/3R8pto8JHCft4/SZKi305+IDH8RTvSmFeb/AYbih6muvvcuhrPN56/WKDX1/aD/hCjl1aL/D9j2QAsEzZ3BZ7Or9m82apHjcZTY1LVvqeKn5FS8FL+oeyZTflNsV2I5+v87W9HXRcluGe1TJJ94YKKbBPAUrV1xhUTQcFEEH5pFg3jS9AhoV0Qmrl9md5NSDE6Dk5sbFJOZ3M=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(376002)(346002)(230922051799003)(1800799009)(82310400011)(451199024)(64100799003)(186009)(46966006)(36840700001)(40470700004)(83380400001)(2616005)(426003)(336012)(1076003)(26005)(36860700001)(36756003)(86362001)(356005)(82740400003)(40480700001)(81166007)(47076005)(40460700003)(110136005)(316002)(54906003)(70206006)(70586007)(6636002)(8676002)(41300700001)(5660300002)(8936002)(4326008)(2906002)(44832011)(478600001)(966005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 15:59:21.3368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6cec068-e13f-4160-6435-08dbc03be109
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7500
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Tightly-Coupled Memories(TCMs) are low-latency memory that provides
predictable instruction execution and predictable data load/store
timing. Each Cortex-R5F processor contains exclusive two 64 KB memory
banks on the ATCM and BTCM ports, for a total of 128 KB of memory.
In lockstep mode, both 128KB memory is accessible to the cluster.

As per ZynqMP Ultrascale+ Technical Reference Manual UG1085, following
is address space of TCM memory. The bindings in this patch series
introduces properties to accommodate following address space with
address translation between Linux and Cortex-R5 views.

|     |     |     |
| --- | --- | --- |
|      *Mode*        |   *R5 View* | *Linux view* |  Notes               |
| *Split Mode*       | *start addr*| *start addr* |                      |
| R5_0 ATCM (64 KB)  | 0x0000_0000 | 0xFFE0_0000  |                      |
| R5_0 BTCM (64 KB)  | 0x0002_0000 | 0xFFE2_0000  |                      |
| R5_1 ATCM (64 KB)  | 0x0000_0000 | 0xFFE9_0000  | alias of 0xFFE1_0000 |
| R5_1 BTCM (64 KB)  | 0x0002_0000 | 0xFFEB_0000  | alias of 0xFFE3_0000 |
|  ___               |     ___     |    ___       |                      |
| *Lockstep Mode*    |             |              |                      |
| R5_0 ATCM (128 KB) | 0x0000_0000 | 0xFFE0_0000  |                      |
| R5_0 BTCM (128 KB) | 0x0002_0000 | 0xFFE2_0000  |                      |

References:
UG1085 TCM address space: https://docs.xilinx.com/r/en-US/ug1085-zynq-ultrascale-trm/Tightly-Coupled-Memory-Address-Map

Changes in v5:
  - maintain Rob's Ack on bindings patch as no changes in bindings
  - split previous patch into multiple patches
  - Use pm domain framework to turn on/off TCM
  - Add support of parsing TCM information from device-tree
  - maintain backward compatibility with previous bindings without
    TCM information available in device-tree

This patch series depends on following pending patch:
https://lore.kernel.org/all/20230925172648.2339048-1-tanmay.shah@amd.com/

This patch series continues previous effort to upstream ZynqMP
TCM bindings:
Previous v4 version link:
https://lore.kernel.org/all/20230829181900.2561194-1-tanmay.shah@amd.com/

Previous v3 version link:
https://lore.kernel.org/all/1689964908-22371-1-git-send-email-radhey.shyam.pandey@amd.com/
Radhey Shyam Pandey (1):
  dt-bindings: remoteproc: add Tightly Coupled Memory (TCM) bindings

Tanmay Shah (3):
  dts: zynqmp: add properties for TCM in remoteproc
  remoteproc: zynqmp: add pm domains support
  remoteproc: zynqmp: parse TCM from device tree

 .../remoteproc/xlnx,zynqmp-r5fss.yaml         | 131 ++++++-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  28 +-
 drivers/remoteproc/xlnx_r5_remoteproc.c       | 346 ++++++++++++++++--
 3 files changed, 454 insertions(+), 51 deletions(-)


base-commit: 1a93ced18d7b81be39beba26b1c168ef21c8d0ad
prerequisite-patch-id: fe44cda02ab56ead54bea998952f27c8b7fc5ff0
-- 
2.25.1

