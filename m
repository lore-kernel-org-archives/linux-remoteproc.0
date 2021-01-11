Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AACC433E9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 02:03:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0A8822573
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Jan 2021 02:03:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbhAKCDr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 10 Jan 2021 21:03:47 -0500
Received: from mail-bn7nam10on2054.outbound.protection.outlook.com ([40.107.92.54]:9953
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726841AbhAKCDq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 10 Jan 2021 21:03:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQWLC9eshNUozr2uT1xO94tFGsjOPz5N4BtXo9N8tJL9n+ljpe3WPKvxX/K7KOWRSaRqBv+C48DS4lMYxIKSQ81kHlK52aIydjvXr+ZGraCoP3N1uMRlKpWt3eEHWXLqo055EwYB5CCAHI+XZJ1ok8IX4EtSKI5j5jh5zFO3dAMunZkycNiBs6rRn3BBv2Xv2EGztrXA47TfqK7UpjYX72kvJKgB8Y0ZQJJi4dBzE8J2djxAuEazS05mU6xBr15/WfyGIM1Xfc+zTpD0G3gbcGE+5CgkbTSf0CZMTnS/gzIcu8F4AmGCebkRLLsIOOwSwgCjgzxRNkxeIfpR9PWtUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVPZGi3P6nEmyO2aWUG5XFXp7B5w+YVZwXx7I0nqq/s=;
 b=Wr/ud2tMm2uHs6Tv6VWgySYJysKM0ryo/kXw/qqBhlgjyU8S8dQUReb1SdaAc1WkcrRKIMelc1qlX1J5MCjbijFaZTrSZusD86kUZEnRJP7yXmsFye9CC+J13MH1FQWgAna8AQ4QfR1jTzBzFHss7PNr97+eeRilxc2n2dJCRQXBMikAXZTca284/nnQRO0SaC5bbQYQM3wcomgvGLV5ZrAm+8v8QRu8Vcm/3OKZ8QRsner3mplyEvNlYq3Jq9BrmDr7TtaVpAVb0M9D4hop6wXOONeYvuCZYsIMyy4W+ouVsfyk+YX2saVuWb8fplH0379ugtJz/7FbDod6QLnWQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVPZGi3P6nEmyO2aWUG5XFXp7B5w+YVZwXx7I0nqq/s=;
 b=aMrgypEppZTLG9pLfoiWyQxrIk1NMne6e+VshEM4fiB8Cp9JHjOcsieTyhIeK7rAeWykM65AEybitSUtLTuQwRSM/m8qUydhibX6zJqRzeC2e1xhax3plsPzTHhJeDyR55ePjynSQ7Jl94u4gAsyo9MKFfl7QyGwT5mOTzy8Ry8=
Received: from SN4PR0501CA0145.namprd05.prod.outlook.com
 (2603:10b6:803:2c::23) by SJ0PR02MB7647.namprd02.prod.outlook.com
 (2603:10b6:a03:320::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 02:02:52 +0000
Received: from SN1NAM02FT015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2c:cafe::69) by SN4PR0501CA0145.outlook.office365.com
 (2603:10b6:803:2c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.4 via Frontend
 Transport; Mon, 11 Jan 2021 02:02:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT015.mail.protection.outlook.com (10.152.72.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 02:02:52 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Sun, 10 Jan 2021 18:02:50 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Sun, 10 Jan 2021 18:02:50 -0800
Envelope-to: michal.simek@xilinx.com,
 mathieu.poirier@linaro.org,
 devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Received: from [172.19.2.206] (port=48226 helo=xsjblevinsk50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <ben.levinsky@xilinx.com>)
        id 1kymXi-00008K-H4; Sun, 10 Jan 2021 18:02:50 -0800
From:   Ben Levinsky <ben.levinsky@xilinx.com>
To:     <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <michal.simek@xilinx.com>
Subject: [PATCH v25 0/5] Provide basic driver to control Arm R5 co-processor found on Xilinx ZynqMP
Date:   Sun, 10 Jan 2021 18:02:45 -0800
Message-ID: <20210111020250.6846-1-ben.levinsky@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cc7beff-375f-4086-d98d-08d8b5d50114
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7647:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB76475199F01EEDF71F2F8FE8B5AB0@SJ0PR02MB7647.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YFRAlcvwPoeg8OBB592/Gpqewl4N9/0noEIcGQmRnWMZjV3uw/zZeR0JFrpGp+O06nbmBUuvSiSVCuOO/OXUXDlvYD9CZWmXqP+B4mlg0DNBqUgaV/9Bq+cz8ADNVWSr8hoExOCSP1X1RpkK1sKudpjEEXZvfnj5f1uMtfQOxJsvvyU9jCWZ3aK+In0/e1FDdJBLoWYFJfL245+vfsUQPj6/UE0tjf8G5ezVJEKihwKIs+1BaKCE4ox4ih22rBqru5lgmR8/Tl6NypOMTTVwlpkdh111ZhwYqqDa2G8qpZ2jntd8MniTuAkO8W+kBl4DXPxd4/gp8Al0Qkd3kaA8sdKNBV0eV/113kKC/+mqDMNUd8vRBQvgmufgZRfX4treE0DIoMa8u2ETB/ck1nybVEbwAlunggcEZsnQWO+htFsEwIWV7g5nzo5lPLZtwalwzjKzKtn51J64mrcdanpipzAlGOrw2Bch3FFHPE1Zd+YZdnV6FBwk2tyBpMAcTqNBBIESxzg/Y2A+CExGO92QL/K/Pcv7UJaUdl1dJv8Adt8/qz0rr5KIg5i7Osc3XIVVPN4dPfg7h7RsrxrFoa4ivFLXIIHKwIoyZ0AlHuXh+TQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(396003)(376002)(46966006)(356005)(478600001)(8676002)(2616005)(70586007)(70206006)(5660300002)(44832011)(6916009)(7696005)(7636003)(336012)(83380400001)(6666004)(426003)(9786002)(2906002)(8936002)(1076003)(82740400003)(966005)(82310400003)(107886003)(54906003)(36906005)(4326008)(47076005)(26005)(186003)(316002)(36756003)(34020700004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 02:02:52.2930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc7beff-375f-4086-d98d-08d8b5d50114
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7647
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
remotproc driver, we can boot the R5 sub-system in two different
configurations -
	* Split
	* Lockstep

The Xilinx R5 Remoteproc Driver boots the R5's via calls to the Xilinx
Platform Management Unit that handles the R5 configuration, memory access
and R5 lifecycle management. The interface to this manager is done in this
driver via zynqmp_pm_* function calls.

v25:
- reword error message for rpu configuration
- change char name[15] to 16 chars to have null terminated string
  in parse_mem_regions()
- reword comments in tcm_mem_alloc
- grammar in device tree bindings
- call xilinx platform cleanup in parse_tcm_banks() case of failure
- check value of mbox_send_message in all calls within this driver
- update include/linux/firmware/xlnx-zynqmp.h style to match for enum
  pm_node_id
- indentation in zynqmp_r5_remoteproc driver
- update style of constructing carveouts to match convention in ST
  remoteproc drivers. No longer iterate through memory-region property
  using of_count_phandle_with_args. Instead use of_phandle_iterator
- use rproc_of_resm_mem_entry_init for vdev0buffer carveout as per feedback
- rework loop in zynqmp_r5_pm_request_sram as per feedback
- fix comment and linebreak in tcm_mem_alloc description
- add comments and remove extraneous devm_ioremap_wc call in tcm_mem_alloc
- in parse_tcm_banks remove check for bank not being available
- rework order of locals and remove else in zynqmp_r5_rproc_kick
- document and update logic for zynqmp_r5_parse_fw
- add dev_dbg output in event_notified_idr_cb if
  rproc_vq_interrupt(rproc, id) == IRQ_NONE
- add comment for handle_event_notified mbox_send_message function call
- add comment for zynqmp_r5_mb_rx_cb
- update zynqmp_r5_setup_mbox to match convention of mbox setup in ST
  remoteproc drivers
- change return in zynqmp_r5_setup_mbox to use PTR_ERR
- add zynqmp_r5_cleanup_mbox
- in zynqmp_r5_probe, reteurn zynqmp_r5_rproc instead of taking in as arg.
- in zynqmp_r5_probe use return of PTR_ERR and use zynqmp_r5_cleanup_mbox
- in zynqmp_r5_remoteproc_probe update use return value of zynqmp_r5_probe as
  either zynqmp_r5_rproc* or PTR_ERR
- update loop that cleans up cluster and mboxes in zynqmp_r5_remoteproc_probe
- update loop that cleans up cluster and mboxes in zynqmp_r5_remoteproc_remove

Previous version:
https://patchwork.kernel.org/project/linux-remoteproc/list/?series=393387


Ben Levinsky (5):
  firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
    configuration.
  firmware: xilinx: Add shutdown/wakeup APIs
  firmware: xilinx: Add RPU configuration APIs
  dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc
    bindings
  remoteproc: Add initial zynqmp R5 remoteproc driver

 .../xilinx,zynqmp-r5-remoteproc.yaml          | 223 +++++
 drivers/firmware/xilinx/zynqmp.c              |  96 ++
 drivers/remoteproc/Kconfig                    |   8 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/zynqmp_r5_remoteproc.c     | 897 ++++++++++++++++++
 include/linux/firmware/xlnx-zynqmp.h          |  66 +-
 6 files changed, 1290 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-remoteproc.yaml
 create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c

-- 
2.17.1

