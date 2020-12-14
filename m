Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC034C1B0E3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Dec 2020 11:54:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 850FB23443
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Dec 2020 11:54:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731067AbgLNLx0 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Dec 2020 06:53:26 -0500
Received: from mail-bn8nam11on2046.outbound.protection.outlook.com ([40.107.236.46]:16759
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2438295AbgLNLx0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Dec 2020 06:53:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+XnOoZkZKl/AD26avVmnpzn7g+kxSsed+wPh2VKJ5lByXmy8APNIKJsWS3uMoYP8IYPnAcQ3dSbNpYgfuC5HxQGxpWdJZQ8Sv0/4AglXO6OpGNrCybCXAtw3suIsGLP6iQHZIXZe3ZF/07jgHOowHq5+F6yzkvBsEMGUXzq8FnwD98dvC5nVKQ8+OplSWI5iTjqVEM2bzccNEfEvg9yb37PojqBSfGtpzWrQTabuU5dh4Rx3XnUJVSrHLi9UWZHmBaUaxiEucnuTvD4L8lM/P/8e98hAgCNT//Dc07WWfYAC7egTzQJu4301iXJiWhsyX8g7Goq/9eXBkqFJd2CiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3ujDSO41om9HsHayhgErc8sUDKTHv3g/izaDpbkZqY=;
 b=Wa7s5jJQYk1S1/s8/jvi2iWJQGE9dr4kWEe08UnkDqx06k1vlFwlWkQUDGQ+3h0fJn3fqt0EifiHFzgnKri5D65m7qfFMqgILBRN8PAYye1XbjSe+D7DTJIaTySWHpH9yU3xCiNBCf/wEWh9ODmKsbwEkcbsxtrS6dJe/g9yuR6Bm2hAzDLiE+ZA/ocoazqGhu+cWjTmXrPqvkeTwpB5nxgnq1AWwk7R3IYoMBGJ3F65QKr0wgFGaxfEgnAvopUafdM/WNnZ/RrJ9BKcnPaNZgfb2KCjm7KMvxlGPmHg2Z/k9wFF4WGdnTRCPi0cKJz6Wv0iNFINsNKdCNZOjpIUdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3ujDSO41om9HsHayhgErc8sUDKTHv3g/izaDpbkZqY=;
 b=YzkZzkvvOZh469eAYytTEFEamqnFvqQdLl1H5tH39qLA9+Cf70dJhrHlAuiQ/+wr4Xp3GwI/OVaVZtk6keep8za2XvTlp7IYxu3fIf+78w7Cd1ZtguzuL9jJEoo7qLhkfhgvhoNqNkf9bkM4Ct7PkZFKP/0WpPGbhnf2QdYHgfI=
Received: from SA9PR13CA0013.namprd13.prod.outlook.com (2603:10b6:806:21::18)
 by PH0PR02MB7144.namprd02.prod.outlook.com (2603:10b6:510:9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Mon, 14 Dec
 2020 11:52:32 +0000
Received: from SN1NAM02FT044.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:21:cafe::71) by SA9PR13CA0013.outlook.office365.com
 (2603:10b6:806:21::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.12 via Frontend
 Transport; Mon, 14 Dec 2020 11:52:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT044.mail.protection.outlook.com (10.152.72.173) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 11:52:31 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Mon, 14 Dec 2020 03:52:31 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Mon, 14 Dec 2020 03:52:31 -0800
Envelope-to: ben.levinsky@xilinx.com,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org,
 mathieu.poirier@linaro.org
Received: from [172.30.17.109] (port=46352)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1komP1-0000g6-2H; Mon, 14 Dec 2020 03:52:31 -0800
Subject: Re: [PATCH v24 1/5] firmware: xilinx: Add ZynqMP firmware ioctl enums
 for RPU configuration.
To:     Ben Levinsky <ben.levinsky@xilinx.com>,
        <mathieu.poirier@linaro.org>
CC:     <devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20201130155717.26008-1-ben.levinsky@xilinx.com>
 <20201130155717.26008-2-ben.levinsky@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <bf2b1981-e2e2-750b-df71-1a230850e64d@xilinx.com>
Date:   Mon, 14 Dec 2020 12:52:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201130155717.26008-2-ben.levinsky@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cc678e1-b396-47d0-1bb7-08d8a026bd6c
X-MS-TrafficTypeDiagnostic: PH0PR02MB7144:
X-Microsoft-Antispam-PRVS: <PH0PR02MB71447D9574DAC3B1D933EECAC6C70@PH0PR02MB7144.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yoBC/9Ez6LlU+41vQ7gE++7zx83pe9ApK9bWPGyMa7tFgWordJrbkAsS8YR9bgj3oZNQletXCpZ6n3SG9Mu4Fjmp5SXMO1FYHPNJF5l2v3JcIr13/xlDbb+uz2X7us9xd9X9c0ZqVbeRES0Wx8DG3lt55eY0YBq4VammCsacvh+I6oJL0II+mLMGXmFvVIR02J9lzJy6qb/Uk2YWeqdG6iqcmM35uiQN0DspCfgmZ4ZYXhGJKyBJRibCUI1qv0a4C2pLm9ykU9Mz3MlO3TcQjhh0FctY4ZngL0qYblY5rY2MQ14Flw2r0KPPo1/oKAaNaXAqzSqCXt1E1xKnuKBTShyi+PuwyNcCj0IZE0ZM1k3UpjFpdD7RvMTcmVsDvuDyv9v5nTsvgmWdtbTag6Mj0sHo6izR2ykNxd6Zhb5eajB4cXLE69QcDyA/C9U5yXhoTvYSoc7MKQO6AWtnr8T71w==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(46966005)(31686004)(2616005)(31696002)(186003)(9786002)(26005)(7636003)(2906002)(110136005)(47076004)(36756003)(44832011)(6666004)(356005)(70206006)(8936002)(8676002)(83380400001)(54906003)(508600001)(426003)(82310400003)(4326008)(70586007)(336012)(5660300002)(36906005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 11:52:31.9301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc678e1-b396-47d0-1bb7-08d8a026bd6c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT044.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7144
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 30. 11. 20 16:57, Ben Levinsky wrote:
> Add ZynqMP firmware ioctl enums for RPU configuration and TCM Nodes for
> later use via request_node and release_node
> 
> Signed-off-by: Ben Levinsky <ben.levinsky@xilinx.com>
> ---
>  include/linux/firmware/xlnx-zynqmp.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index 5968df82b991..0dd2d188f8aa 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -104,6 +104,10 @@ enum pm_ret_status {
>  };
>  
>  enum pm_ioctl_id {
> +	IOCTL_GET_RPU_OPER_MODE = 0,
> +	IOCTL_SET_RPU_OPER_MODE = 1,
> +	IOCTL_RPU_BOOT_ADDR_CONFIG = 2,
> +	IOCTL_TCM_COMB_CONFIG = 3,
>  	IOCTL_SD_DLL_RESET = 6,
>  	IOCTL_SET_SD_TAPDELAY,
>  	IOCTL_SET_PLL_FRAC_MODE,
> @@ -129,6 +133,21 @@ enum pm_query_id {
>  	PM_QID_CLOCK_GET_MAX_DIVISOR,
>  };
>  
> +enum rpu_oper_mode {
> +	PM_RPU_MODE_LOCKSTEP = 0,
> +	PM_RPU_MODE_SPLIT = 1,
> +};
> +
> +enum rpu_boot_mem {
> +	PM_RPU_BOOTMEM_LOVEC = 0,
> +	PM_RPU_BOOTMEM_HIVEC = 1,
> +};
> +
> +enum rpu_tcm_comb {
> +	PM_RPU_TCM_SPLIT = 0,
> +	PM_RPU_TCM_COMB = 1,
> +};
> +
>  enum zynqmp_pm_reset_action {
>  	PM_RESET_ACTION_RELEASE,
>  	PM_RESET_ACTION_ASSERT,
> @@ -273,6 +292,10 @@ enum zynqmp_pm_request_ack {
>  };
>  
>  enum pm_node_id {
> +	NODE_TCM_0_A = 0xf,
> +	NODE_TCM_0_B = 0x10,
> +	NODE_TCM_1_A = 0x11,
> +	NODE_TCM_1_B = 0x12,

Please convert these hex to int to be aligned with the rest.

>  	NODE_SD_0 = 39,
>  	NODE_SD_1,
>  };
> 

When that fixed feel free to add.
Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal

