Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EBAC433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 May 2022 16:41:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236677AbiEZQld (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 May 2022 12:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241861AbiEZQlc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 May 2022 12:41:32 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54F42B184
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 May 2022 09:41:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N/DfOrHEM16BCClb36k2XjfA69xdLdkCvlAN67iTlZTkOCn+hVEmdEEI04tTpePYw0nyuDSpUA7/YScIARMQ+M+O20LdiydljuTNEVeSM7KNjCNH3TBLSC61sJH/nXaX7aHlUYV5DXAd7izcAMUMKHGWa/Qkuf0fS7CMDtENrndqrJsJE2gqDyzYsWaLWkYbekscsy0SVx0nbEodKUluoI7Z3Z8TqDYgOeACokuEm4IDyPifeNcrw5LM6mreToOoHKNRVGyd0/rb9q66AIzvontc4zN54E98GG1BPru/gGhyAAftFIB+2PCLM17lUhsWp5AOyYf2CrWVLxd/Z0LkyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vR5v+KCyCuyCj3lFmvWvk7SiOsjzhAO91yXgmEnfVrQ=;
 b=DHe9J93VTxOyCr9YqqkzVHXAM71IBnCqbvj3A7t2SMqpkhTmtnru6UpuCRkNNaIXD9cBibObD6sosMvOs8Dc4JixW6AoUUobRvyD2gGw9zGi4qnp1lxVLIzqE+/XR8P1wU3rQgURAaLmlpa2eenbFO1nTVeAVP7mBfA+gapvpwFYCX4mwuH6OXEQoAwF3upX6qwBf4+kQ42Pfx+2ofOKFHdjmJL8DMMw46Bj5PbnsdfShG7vMlBZcHoKsUh50Znyt8ZWr1mYx/BDBfoy1BdMMTvf51VjyciAPnBPrCSUWjF9CSqcMnSyftDa4MNC2mKjlx3Cfo5aA14yh3q1vcFG/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vR5v+KCyCuyCj3lFmvWvk7SiOsjzhAO91yXgmEnfVrQ=;
 b=J+WYxo0JOpFCuDn8vQw5yfrBva3NCfwwGHt+9Siux0oqZtmsITvh71ZXcjmUMyPfMMR4/HzNN7ORziwema1fNHdtZXdoFU1rdgm3JY6aGS3fwe5Nw9s3sfpSmsWZbB38t0GqQc3nHQ/wowb4yOcCuK3Gvn/QfUNrDazqgZYlhuw=
Received: from BN6PR22CA0037.namprd22.prod.outlook.com (2603:10b6:404:37::23)
 by BYAPR02MB4341.namprd02.prod.outlook.com (2603:10b6:a03:56::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Thu, 26 May
 2022 16:41:27 +0000
Received: from BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:37:cafe::78) by BN6PR22CA0037.outlook.office365.com
 (2603:10b6:404:37::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 16:41:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT033.mail.protection.outlook.com (10.13.3.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 16:41:27 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 26 May 2022 09:41:26 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 26 May 2022 09:41:26 -0700
Envelope-to: mathieu.poirier@linaro.org,
 bjorn.andersson@linaro.org,
 linux-remoteproc@vger.kernel.org
Received: from [10.23.122.225] (port=59782)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <tanmay.shah@xilinx.com>)
        id 1nuGYA-000ACH-It; Thu, 26 May 2022 09:41:26 -0700
Message-ID: <bb0ad4ee-a9ad-e70a-5870-7552fa1cca51@xilinx.com>
Date:   Thu, 26 May 2022 09:41:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v5 0/6] Add Xilinx RPU subsystem support
Content-Language: en-US
From:   Tanmay Shah <tanmay.shah@xilinx.com>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        <bjorn.andersson@linaro.org>, <linux-remoteproc@vger.kernel.org>
References: <20220518194426.3784095-1-tanmay.shah@xilinx.com>
 <CANLsYkw9HuLso9bGL4fM7C9qH+basgKA9yKFwms4WB4OUHqymQ@mail.gmail.com>
 <b4bef7c4-7f12-1cdb-c2f0-a248c125b9b4@xilinx.com>
In-Reply-To: <b4bef7c4-7f12-1cdb-c2f0-a248c125b9b4@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 357c42cb-fc75-455d-67dc-08da3f36941a
X-MS-TrafficTypeDiagnostic: BYAPR02MB4341:EE_
X-Microsoft-Antispam-PRVS: <BYAPR02MB4341C55B349409DFB50E2449CAD99@BYAPR02MB4341.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c1nQ4YqTZcILvNW+nIuTLPgu27dckCgY+dTX1fBD5t8o5QtMrRDAAFL3h4p+llw/1La4+3DS2PCyM55Dnh452m7fRBYcdT/ATqEh3c4DbBRRh9RgwhCzS3+3yjlXlHDuD7mFdbMtEAd3rTigAy52eFzSP0nzGpcgL483B/QmyxkvJlz0cZNJZiG01ztHJjGuKSEU6zUp3kVgoaTeMX5X2r0PO59QfF4S3b6vLmr7jSrwA31DWKngF2jZJzqk1XGUNCgd36yAO6Bq+kR6Fuhgm0YrbBVzJ1Sqj07BUja2+w+GZjTtiJrTssuIIi+GGm2p9Id/MYDK+ohWojf46JNE3n/PFqc103GbY713J+YHRE/CpEcDCxJA7+aYNTBXJxvP85LaPtIZl8DyUnbMDXkpiJ2CS7Ij9Lpg9gUZ0pU5XGR+GJ9fgDMgM0abnZhabo/PwCkZQzUAK41kBppw5IiI256M0/9PLUMsl2XLqTbBiXU+/v7c3ja4gJjxcffmUntA+ca7J3PC37S1/7PlCvvZLGMau91HZFXd6Bgg2jlMX9ob4Dwk8SxmHIA/4th8KC9XB1qTKKzqcYUnIgLEla9rYKVQTpoEMemghUVXMP+8hFIuQ7NZztDyrU/evsd48x3iFFfzpYeBuEwCO6hZjW+4OQN3Yq+caxmQexc9RGjeAVQ8uwZRw2VqcDgSzKAnhRl0DwhrGIe0cYPies2dnFBdIswsBqybN1jNhFPvEAY2HqU=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2616005)(70586007)(8676002)(70206006)(40460700003)(356005)(44832011)(5660300002)(316002)(26005)(110136005)(31696002)(82310400005)(186003)(53546011)(9786002)(31686004)(7636003)(2906002)(8936002)(83380400001)(336012)(47076005)(426003)(36756003)(36860700001)(508600001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 16:41:27.0482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 357c42cb-fc75-455d-67dc-08da3f36941a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4341
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On 5/19/22 8:10 PM, tanmay.shah@xilinx.com wrote:
>
>
> On 5/19/22 3:19 AM, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>> Hi Tanmay,
>>
>> I have replaced the previous version of this set with this one in my
>> queue.  That way you don't go back to the bottom.
>>
>
> Thanks Mathieu. Sure it will help.
>
Hi Mathieu,

Just want to check on reviews. Are you any close to review this version ?

I have minor fixes in bindings, but if I can get reviews on driver in 
this version, I can send driver related changes in v6 as well.

If my patch is not any close in queue (let's say within next week) I 
will go ahead and post v6 that is fixing only bindings.


Thanks,

Tanmay

>> Thanks,
>> Mathieu.
>>
>> On Wed, 18 May 2022 at 20:46, Tanmay Shah <tanmay.shah@xilinx.com> 
>> wrote:
>> >
>> > This patch series adds bindings document for RPU subsystem found on 
>> Xilinx
>> > ZynqMP platforms. It also adds device nodes and driver to enable RPU
>> > subsystem in split mode and lockstep mode.
>> >
>> > Xilinx ZynqMP platform contains Remote Processing Unit(RPU). RPU 
>> subsystem
>> > contains two arm cortex r5f cores. RPU subsystem can be configured in
>> > split mode, lockstep mode and single-cpu mode.
>> >
>> > RPU subsystem also contains 4 Tightly Coupled Memory(TCM) banks.
>> > In lockstep mode, all 4 banks are combined and total of 256KB 
>> memory is
>> > made available to r5 core0. In split mode, both cores can access two
>> > TCM banks i.e. 128 KB.
>> >
>> > RPU can also fetch data and execute instructions from DDR memory 
>> along with
>> > TCM memory.
>> > ---
>> >
>> > Changes in v5:
>> >    - Add constraints of the possible values of xlnx,cluster-mode 
>> property
>> >    - fix description of power-domains property for r5 core
>> >    - Remove reg, address-cells and size-cells properties as it is 
>> not required
>> >    - Fix description of mboxes property
>> >    - Add description of each memory-region and remove old .txt 
>> binding link
>> >      reference in the description
>> >    - Remove optional reg property from r5fss node
>> >    - Move r5fss node out of axi node
>> >
>> > Changes in v4:
>> >    - Add memory-region, mboxes and mbox-names properties in 
>> dt-bindings example
>> >    - Add reserved memory region node and use it in Xilinx dt RPU 
>> subsystem node
>> >    - Remove redundant header files
>> >    - use dev_err_probe() to report errors during probe
>> >    - Fix missing check on error code returned by 
>> zynqmp_r5_add_rproc_core()
>> >    - Fix memory leaks all over the driver when resource allocation 
>> fails for any core
>> >    - make cluster mode check only at one place
>> >    - remove redundant initialization of variable
>> >    - remove redundant use of of_node_put()
>> >    - Fix Comment format problem
>> >    - Assign offset of zynqmp_tcm_banks instead of duplicating it
>> >    - Add tcm and memory regions rproc carveouts during prepare 
>> instead of parse_fw
>> >    - Remove rproc_mem_entry object from r5_core
>> >    - Use put_device() and rproc_del() APIs to fix memory leaks
>> >    - Replace pr_* with dev_*. This was missed in v3, fix now.
>> >    - Use "GPL" instead of "GPL v2" in MODULE_LICENSE macro. This 
>> was reported by checkpatch script.
>> >
>> > Changes in v3:
>> >    - Fix checkpatch script indentation warning
>> >    - Remove unused variable from xilinx remoteproc driver
>> >    - use C style comments, i.e /*...*/
>> >    - Remove redundant debug information which can be derived using 
>> /proc/device-tree
>> >    - Fix multiline comment format
>> >    - s/"final fot TCM"/"final for TCM"
>> >    - Function devm_kzalloc() does not return an code on error, just 
>> NULL.
>> >      Remove redundant error check for this function throughout the 
>> driver.
>> >    - Fix RPU mode configuration and add documentation accordingly
>> >    - Get rid of the indentations to match function documentation 
>> style with rest of the driver
>> >    - Fix memory leak by only using r5_rproc->priv and not replace 
>> it with new instance
>> >    - Use 'i' for the outer loop and 'j' for the inner one as per 
>> convention
>> >    - Remove redundant error and NULL checks throughout the driver
>> >    - Use devm_kcalloc() when more than one element is required
>> >    - Add memory-regions carveouts during driver probe instead of 
>> parse_fw call
>> >      This removes redundant copy of reserved_mem object in r5_core 
>> structure.
>> >    - Fix memory leak by using of_node_put()
>> >    - Fix indentation of tcm_mem_map function args
>> >    - Remove redundant init of variables
>> >    - Initialize tcm bank size variable for lockstep mode
>> >    - Replace u32 with phys_addr_t for variable stroing memory bank 
>> address
>> >    - Add documentation of TCM behavior in lockstep mode
>> >    - Use dev_get_drvdata instead of platform driver API
>> >    - Remove info level messages
>> >    - Fix checkpatch.pl warnings
>> >    - Add documentation for the Xilinx r5f platform to understand 
>> driver design
>> >
>> > Changes in v2:
>> >    - Remove proprietary copyright footer from cover letter
>> >
>> >
>> > Ben Levinsky (3):
>> >    firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
>> >      configuration.
>> >    firmware: xilinx: Add shutdown/wakeup APIs
>> >    firmware: xilinx: Add RPU configuration APIs
>> >
>> > Tanmay Shah (3):
>> >    dt-bindings: remoteproc: Add Xilinx RPU subsystem bindings
>> >    arm64: dts: xilinx: zynqmp: Add RPU subsystem device node
>> >    drivers: remoteproc: Add Xilinx r5 remoteproc driver
>> >
>> >   .../bindings/remoteproc/xlnx,r5f-rproc.yaml   |  128 ++
>> >   arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |   33 +
>> >   drivers/firmware/xilinx/zynqmp.c              |   97 ++
>> >   drivers/remoteproc/Kconfig                    |   12 +
>> >   drivers/remoteproc/Makefile                   |    1 +
>> >   drivers/remoteproc/xlnx_r5_remoteproc.c       | 1045 
>> +++++++++++++++++
>> >   include/dt-bindings/power/xlnx-zynqmp-power.h |    6 +
>> >   include/linux/firmware/xlnx-zynqmp.h          |   60 +
>> >   8 files changed, 1382 insertions(+)
>> >   create mode 100644 
>> Documentation/devicetree/bindings/remoteproc/xlnx,r5f-rproc.yaml
>> >   create mode 100644 drivers/remoteproc/xlnx_r5_remoteproc.c
>> >
>> >
>> > base-commit: 01a1a0c8d456b11f2f6b9b822414481beaa44d6f
>> > --
>> > 2.25.1
>> >
>>
