Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0D3C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 May 2022 18:21:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349384AbiEZSVT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 May 2022 14:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349390AbiEZSVS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 May 2022 14:21:18 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 657D81DF
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 May 2022 11:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jU6qJ5tVuGjTxF4sKx04fUA3hN3pVmu2HgmcoOFhyEI7HqFyw3yH/6UkdEmHZt49sPOlfBFSqZ727RReLnWT2ZzbQMuOgs/zy519/vacO9uApVREnHw2GDpZj7tBnv2F6lepzH0NBLWF0UIhXNZp1IiLTsMSavUO/MYDFuTO+bc1DZrLP60bnQ0DG2XZQ30p3Be+IcEpO3jMWaY3nfEpd3yYl1w0ZLbov9XbnYLm1XgK6bf0UxOovvDt0qmOd46mhr3M9NlvuJFTrUXAD2KUrrZ+q+uTjRDtW8gUzwdpwA1Wt4gKRS/leiEMFnm8D2jNtpyc3f6B54q/5kkqCmUBrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPbyxAiquLym7AX6JJhvQB9wxdEubznYN/UtXZToImU=;
 b=P78nBCBqtu8BeIwCKGF82+/w1aX23V8f7YMN9/oFqfeaXoX/ZZHLnlfiemvogbOOtTh76guTdIvAzxgNNixAvsYLzXOW5N4+Pxkl/eDhhFT6E47lbO1VIIE42tdjBtX2jJYwzzJcpDEjpCS4Ek7hdXPMaU6p1l+1DlOV8ZZCv7o86YP6WC0dp9gtvKgxqjv2MyOwkrGkvOjxe7g+jLxEXH+DdQfIMRp6C8UpYBb2b62fu8mN0xx3Yx9NKneLXGTEYIpAxHrtf3RjdxeZHD5d6xQVZv3ZeLy8zK4pBXplLMYjE59hFa+gVbfpc0RB5zIQHJQEBXApu22jV5zFNihxJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=linaro.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPbyxAiquLym7AX6JJhvQB9wxdEubznYN/UtXZToImU=;
 b=jiTqoREvSZjbIVqbJQsZc/1QW0EhIsl9VZ/SB7N/jVyGp8kFQTGUWGLGlq244MvRjEvfbwf8zP7F6ZYUgOV617XNs8RenHsrLqeL4684ivo9CUFfbcTNpK8eblwkxuQon9m15sNHO5670nMZ0DxSykl1zCxM1Chkd4tYsomGpXs=
Received: from BN1PR14CA0030.namprd14.prod.outlook.com (2603:10b6:408:e3::35)
 by BN7PR02MB4050.namprd02.prod.outlook.com (2603:10b6:406:fe::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 18:21:09 +0000
Received: from BN1NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::96) by BN1PR14CA0030.outlook.office365.com
 (2603:10b6:408:e3::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Thu, 26 May 2022 18:21:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT011.mail.protection.outlook.com (10.13.2.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Thu, 26 May 2022 18:21:08 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 26 May 2022 11:21:02 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 26 May 2022 11:21:02 -0700
Envelope-to: mathieu.poirier@linaro.org,
 bjorn.andersson@linaro.org,
 linux-remoteproc@vger.kernel.org
Received: from [10.23.122.225] (port=60807)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <tanmay.shah@xilinx.com>)
        id 1nuI6Y-000Bpe-45; Thu, 26 May 2022 11:21:02 -0700
Message-ID: <119c80a8-c573-2890-460b-20774ec6bfe8@xilinx.com>
Date:   Thu, 26 May 2022 11:21:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v5 0/6] Add Xilinx RPU subsystem support
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <bjorn.andersson@linaro.org>, <linux-remoteproc@vger.kernel.org>
References: <20220518194426.3784095-1-tanmay.shah@xilinx.com>
 <CANLsYkw9HuLso9bGL4fM7C9qH+basgKA9yKFwms4WB4OUHqymQ@mail.gmail.com>
 <b4bef7c4-7f12-1cdb-c2f0-a248c125b9b4@xilinx.com>
 <bb0ad4ee-a9ad-e70a-5870-7552fa1cca51@xilinx.com>
 <CANLsYkw2Yo5DwyPY=W7-mQ+SNxnRhLcRE2YdJp+Jd4pSgJX35A@mail.gmail.com>
From:   Tanmay Shah <tanmay.shah@xilinx.com>
In-Reply-To: <CANLsYkw2Yo5DwyPY=W7-mQ+SNxnRhLcRE2YdJp+Jd4pSgJX35A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a54887bc-8fb4-4bdd-eb59-08da3f448183
X-MS-TrafficTypeDiagnostic: BN7PR02MB4050:EE_
X-Microsoft-Antispam-PRVS: <BN7PR02MB4050590A6146425D5AA35FBACAD99@BN7PR02MB4050.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymjgsECMeFP7AfX4M7o0Dmf/ul/9COnr/KJ/NQfc0E5UFfKksQLgC3d1NUx9+YuswVXf+hLmtT5IBzMkIT6cdGyyDCqwKh+AN/UHnYa5QFbcUYgN1OIQ9dxiNbq5hcLclglZtctncWwvfyYN3yrhG2LrvTvjy28Ep8kmD1CP+xVmj3p0lMZYTcNAepKsRTtLyIL726gmvsEd7V5yQ2bXH6eAqIRPICHiV8ZvLVrnXa3eXQrcD8Sn0WXih3fkzLM/iWENMvORC0LdeS0oFpu3gVaFM8eqEe/GBbcL5qXFG/xwDgpH05Ap2a7/jWk1thOo3ISlLjtsQ6Ae947YDlhAfvH2nPk5ZszNJ9I+nEgbw73F3oaO+Eex8Eu1fMOiy3SCWhUV36htPfRZPVRBoBfwKju7ePibIq8BBxG2bdXMtK3WPeQrd+n/N4szSXVoCuIdb+Gsk0zljdVhkGYz9WpVvia41jNS9D4zYjW/jck/8k1MXAVA98bkn6eljSoyFwRJ1UTJr6MFJ39RlHJADuJMk81LAPV2N43Jm5OyAxV4A3wpBhGiiFG9CextRPTY4GUpNoAQiiQN5UTK+v3ND8KXOww4KbCLsI2GCuOWbqNMLoWHQq6aKM76msAwuS2Wr9U7oW4iCfOJPAONz/aMG8OxfXQicbl2OAaU+UgAHgtneE4SM1yPPESaI/xR75rhIuX4h+F4W/QVnugUGx2E5Kn8oh/E9GlsR3Zlouamac3u0BM=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(70206006)(70586007)(4326008)(31696002)(36860700001)(36756003)(54906003)(508600001)(8676002)(316002)(6916009)(47076005)(82310400005)(40460700003)(2906002)(2616005)(9786002)(5660300002)(53546011)(26005)(44832011)(7636003)(83380400001)(356005)(426003)(8936002)(336012)(31686004)(186003)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 18:21:08.8172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a54887bc-8fb4-4bdd-eb59-08da3f448183
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT011.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4050
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Thanks Mathieu,

I will post v6 in that case, and get reviews on bindings and dts patch.

Tanmay

On 5/26/22 10:55 AM, Mathieu Poirier wrote:
> On Thu, 26 May 2022 at 10:41, Tanmay Shah <tanmay.shah@xilinx.com> wrote:
>>
>> On 5/19/22 8:10 PM, tanmay.shah@xilinx.com wrote:
>>>
>>> On 5/19/22 3:19 AM, Mathieu Poirier <mathieu.poirier@linaro.org> wrote:
>>>> Hi Tanmay,
>>>>
>>>> I have replaced the previous version of this set with this one in my
>>>> queue.  That way you don't go back to the bottom.
>>>>
>>> Thanks Mathieu. Sure it will help.
>>>
>> Hi Mathieu,
>>
>> Just want to check on reviews. Are you any close to review this version ?
>>
>> I have minor fixes in bindings, but if I can get reviews on driver in
>> this version, I can send driver related changes in v6 as well.
>>
>> If my patch is not any close in queue (let's say within next week) I
>> will go ahead and post v6 that is fixing only bindings.
> Unfortunately I won't be able to review your work before the end of
> next week.  At this time this is what my queue look like:
>
> [PATCH V4 0/2] remoteproc: support self recovery
> [RFC PATCH v5 0/4] remoteproc: restructure the remoteproc VirtIO device
> [PATCH v3 0/5] Introduce PRU remoteproc consumer API
> [PATCH v5 0/6] Add Xilinx RPU subsystem support
> [PATCH 0/2] dma-mapping, remoteproc: Fix dma_mem leak after rproc_shutdown
>
>>
>> Thanks,
>>
>> Tanmay
>>
>>>> Thanks,
>>>> Mathieu.
>>>>
>>>> On Wed, 18 May 2022 at 20:46, Tanmay Shah <tanmay.shah@xilinx.com>
>>>> wrote:
>>>>> This patch series adds bindings document for RPU subsystem found on
>>>> Xilinx
>>>>> ZynqMP platforms. It also adds device nodes and driver to enable RPU
>>>>> subsystem in split mode and lockstep mode.
>>>>>
>>>>> Xilinx ZynqMP platform contains Remote Processing Unit(RPU). RPU
>>>> subsystem
>>>>> contains two arm cortex r5f cores. RPU subsystem can be configured in
>>>>> split mode, lockstep mode and single-cpu mode.
>>>>>
>>>>> RPU subsystem also contains 4 Tightly Coupled Memory(TCM) banks.
>>>>> In lockstep mode, all 4 banks are combined and total of 256KB
>>>> memory is
>>>>> made available to r5 core0. In split mode, both cores can access two
>>>>> TCM banks i.e. 128 KB.
>>>>>
>>>>> RPU can also fetch data and execute instructions from DDR memory
>>>> along with
>>>>> TCM memory.
>>>>> ---
>>>>>
>>>>> Changes in v5:
>>>>>     - Add constraints of the possible values of xlnx,cluster-mode
>>>> property
>>>>>     - fix description of power-domains property for r5 core
>>>>>     - Remove reg, address-cells and size-cells properties as it is
>>>> not required
>>>>>     - Fix description of mboxes property
>>>>>     - Add description of each memory-region and remove old .txt
>>>> binding link
>>>>>       reference in the description
>>>>>     - Remove optional reg property from r5fss node
>>>>>     - Move r5fss node out of axi node
>>>>>
>>>>> Changes in v4:
>>>>>     - Add memory-region, mboxes and mbox-names properties in
>>>> dt-bindings example
>>>>>     - Add reserved memory region node and use it in Xilinx dt RPU
>>>> subsystem node
>>>>>     - Remove redundant header files
>>>>>     - use dev_err_probe() to report errors during probe
>>>>>     - Fix missing check on error code returned by
>>>> zynqmp_r5_add_rproc_core()
>>>>>     - Fix memory leaks all over the driver when resource allocation
>>>> fails for any core
>>>>>     - make cluster mode check only at one place
>>>>>     - remove redundant initialization of variable
>>>>>     - remove redundant use of of_node_put()
>>>>>     - Fix Comment format problem
>>>>>     - Assign offset of zynqmp_tcm_banks instead of duplicating it
>>>>>     - Add tcm and memory regions rproc carveouts during prepare
>>>> instead of parse_fw
>>>>>     - Remove rproc_mem_entry object from r5_core
>>>>>     - Use put_device() and rproc_del() APIs to fix memory leaks
>>>>>     - Replace pr_* with dev_*. This was missed in v3, fix now.
>>>>>     - Use "GPL" instead of "GPL v2" in MODULE_LICENSE macro. This
>>>> was reported by checkpatch script.
>>>>> Changes in v3:
>>>>>     - Fix checkpatch script indentation warning
>>>>>     - Remove unused variable from xilinx remoteproc driver
>>>>>     - use C style comments, i.e /*...*/
>>>>>     - Remove redundant debug information which can be derived using
>>>> /proc/device-tree
>>>>>     - Fix multiline comment format
>>>>>     - s/"final fot TCM"/"final for TCM"
>>>>>     - Function devm_kzalloc() does not return an code on error, just
>>>> NULL.
>>>>>       Remove redundant error check for this function throughout the
>>>> driver.
>>>>>     - Fix RPU mode configuration and add documentation accordingly
>>>>>     - Get rid of the indentations to match function documentation
>>>> style with rest of the driver
>>>>>     - Fix memory leak by only using r5_rproc->priv and not replace
>>>> it with new instance
>>>>>     - Use 'i' for the outer loop and 'j' for the inner one as per
>>>> convention
>>>>>     - Remove redundant error and NULL checks throughout the driver
>>>>>     - Use devm_kcalloc() when more than one element is required
>>>>>     - Add memory-regions carveouts during driver probe instead of
>>>> parse_fw call
>>>>>       This removes redundant copy of reserved_mem object in r5_core
>>>> structure.
>>>>>     - Fix memory leak by using of_node_put()
>>>>>     - Fix indentation of tcm_mem_map function args
>>>>>     - Remove redundant init of variables
>>>>>     - Initialize tcm bank size variable for lockstep mode
>>>>>     - Replace u32 with phys_addr_t for variable stroing memory bank
>>>> address
>>>>>     - Add documentation of TCM behavior in lockstep mode
>>>>>     - Use dev_get_drvdata instead of platform driver API
>>>>>     - Remove info level messages
>>>>>     - Fix checkpatch.pl warnings
>>>>>     - Add documentation for the Xilinx r5f platform to understand
>>>> driver design
>>>>> Changes in v2:
>>>>>     - Remove proprietary copyright footer from cover letter
>>>>>
>>>>>
>>>>> Ben Levinsky (3):
>>>>>     firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
>>>>>       configuration.
>>>>>     firmware: xilinx: Add shutdown/wakeup APIs
>>>>>     firmware: xilinx: Add RPU configuration APIs
>>>>>
>>>>> Tanmay Shah (3):
>>>>>     dt-bindings: remoteproc: Add Xilinx RPU subsystem bindings
>>>>>     arm64: dts: xilinx: zynqmp: Add RPU subsystem device node
>>>>>     drivers: remoteproc: Add Xilinx r5 remoteproc driver
>>>>>
>>>>>    .../bindings/remoteproc/xlnx,r5f-rproc.yaml   |  128 ++
>>>>>    arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |   33 +
>>>>>    drivers/firmware/xilinx/zynqmp.c              |   97 ++
>>>>>    drivers/remoteproc/Kconfig                    |   12 +
>>>>>    drivers/remoteproc/Makefile                   |    1 +
>>>>>    drivers/remoteproc/xlnx_r5_remoteproc.c       | 1045
>>>> +++++++++++++++++
>>>>>    include/dt-bindings/power/xlnx-zynqmp-power.h |    6 +
>>>>>    include/linux/firmware/xlnx-zynqmp.h          |   60 +
>>>>>    8 files changed, 1382 insertions(+)
>>>>>    create mode 100644
>>>> Documentation/devicetree/bindings/remoteproc/xlnx,r5f-rproc.yaml
>>>>>    create mode 100644 drivers/remoteproc/xlnx_r5_remoteproc.c
>>>>>
>>>>>
>>>>> base-commit: 01a1a0c8d456b11f2f6b9b822414481beaa44d6f
>>>>> --
>>>>> 2.25.1
>>>>>
