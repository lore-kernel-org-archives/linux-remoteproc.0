Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B483C433B4
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:18:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 423186100A
	for <linux-remoteproc@archiver.kernel.org>; Thu,  8 Apr 2021 02:18:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhDHCS4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 7 Apr 2021 22:18:56 -0400
Received: from mail-eopbgr60079.outbound.protection.outlook.com ([40.107.6.79]:20354
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229544AbhDHCS4 (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 7 Apr 2021 22:18:56 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtNB+S/KErgm0PsAyQmWqow+1QtP/lApuOuALC6frTwlqCc5UvYBvSS5oP03AXKBnEbK4DdElvVAGp0wPqQHekk8mU5VhVmTPW7ABu/HqHoXQ5ym1uqVNpWOR6B5IaxLlfIBcwgbZ4S+YPnUt4tLtI/ssNsm1M5jgY+yxGjCZ5BqNMYYS1QuXrHUNm83tdWSmy5c7RQQ11opef5gedj5MdQYOeiE9sdzGqORybKs1x+CB/RoOGpf0bRsu+aJmveBHVMQsTNXtbAWez9bMu/pKq6axJ9Ijo6Ez1ZeI0xDJM7qzlmcvnSU6NAvfWQhtGOG0V9bcfpIp2WPHkVxYJCfLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aH/O9uLKi5vvIyNm4YFOlVWwLx/mlUThP66SCpnT2nc=;
 b=lVpIvLHX9aabPnCPKDuMj/rfXRHIkSjGk3OMiKj/aVIRx9PZdKgvcXdc0j4aaeoCsIPvuyGzGPFQe4bqghyYsbURnCn3TWo9NDfOcCK6ZYX0DAM5vySEIvBDTSx+5kTF5Ls3dTYw3kGhFgxrn+xxC76c1sEZXUlOo8SYgfzEhN7zcGqhBzV123VBAYk0OEAtDbvxj1RAUp6hNBDrQ9ZN8RSB3znov08/im8f0kn0qf62JXfGBFXYuXsDVWVtcjGE0R3TWFXEcZlwjaV4RopJC65/PA4ZGWaOouKN97oXZgZqQmtsWshL+ILnWn825IXiX/aMF8dwmwYPTAkAUqO0jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aH/O9uLKi5vvIyNm4YFOlVWwLx/mlUThP66SCpnT2nc=;
 b=By88y+8x9gykPz6RoMmB/Ph5aTYfuVcMNLGFE6SHIKA8Hw6lDeg88S7Yrx4LA/0RaZXhf70eFae4PTiPRn0Ke1k6r9g0/fx/J3tG/qEU5ZRGbSW2h+to67RVJrfU19Mx8ribhGahRBBAKVS03MnyDAM8BoUYvc3WyQ9Y2n5njzM=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB8PR04MB6857.eurprd04.prod.outlook.com (2603:10a6:10:114::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 02:18:40 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c57a:6964:f72c:21cf%11]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 02:18:40 +0000
Subject: Re: [PATCH V2 0/8] remoteproc: imx_rproc: support i.MX7ULP/8MN/8MP
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        o.rempel@pengutronix.de, robh+dt@kernel.org,
        devicetree@vger.kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
References: <1617095574-6764-1-git-send-email-peng.fan@oss.nxp.com>
 <20210407161836.GB418374@xps15>
From:   "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Message-ID: <f957373f-d078-8591-6c78-d0027f590360@oss.nxp.com>
Date:   Thu, 8 Apr 2021 10:18:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
In-Reply-To: <20210407161836.GB418374@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [119.31.174.71]
X-ClientProxiedBy: HK2PR0302CA0021.apcprd03.prod.outlook.com
 (2603:1096:202::31) To DB6PR0402MB2760.eurprd04.prod.outlook.com
 (2603:10a6:4:a1::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.193.102.190] (119.31.174.71) by HK2PR0302CA0021.apcprd03.prod.outlook.com (2603:1096:202::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 02:18:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3960e9c-8969-4059-c457-08d8fa349fc3
X-MS-TrafficTypeDiagnostic: DB8PR04MB6857:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR04MB68570291DCAD0EDB7F95C328C9749@DB8PR04MB6857.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qqdgLCdRttLa1BkxjQXscj0L4KqZHQaY6oe5U0xTMzINkjc/iPoeKWCrWltCFvMgYisze9EDhZxbirAQjnYnHHgTaamTIBptxyMe7N6tKaAXQ56Ogjvqe9mslM/yFRzfY5Y7Hf6Ah2PyTm4ertyTPPAXW/GVphFbh/uKzNdVId232z824L0V9ZzTd3p4PmOHxXGGrWFDLL5CGPZN+/siAFu417QRLnoPqs7rAK6qR2mx8tqT5AemHFMmTRl19zIS3Nr2HWh+0HLwYxxrIRknzIoawWv0fI9OZFoT6k5TokOjZTglBCv0TElCWnolpRGALJ1m/GwW4w1LRpyd+5RvBSP0z9g5skxEQxTtYEWGNAKs1U3t3NVoe9f4qkxg2X+PYl6/jZ2umAKKPcVzBSEYrN0nSu0kowMb5Gg7Y1S+pb7YgspEOt4zCDeeQ0ZZT1qlo2dLXprCNUpCIR9iUtyw1ZiBIneLr4Ol3GA1plmh31Rs/Jl9kDtLw3QViz8vmI8wH1jlU8vcyB8VOVBmHk9P9JWjCMw1TxUmS6nLPxyPzx2806TVRAH1dohBfePLMXa6Xg3Jnf2aJ3nJ6xHd81QFPqTJUWiqOICMSdwFhoBgvQJnL3bxdSVUAYbU7r1ciWT0whUnJ21JLNW0VZ8emBPuX2sFOp4x+ojHMqpXHM6iVTBeanrQgqj7mQ/koAwcA/ghoz4fkdoyzjdqpGgiSundxwIGqrEOZAYIjG+OedEvcL26K2/rpqfoYZfZnpcJHoOgRGeUwxGOCHDDCJgliu4x8WMHIM+rLtZejM2eXSGKo1p6+3H/4nY7uzW1k5UGivNO+4KVksTE3nBIUhPWQIrr9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(956004)(16526019)(26005)(186003)(2616005)(16576012)(7416002)(83380400001)(38100700001)(6916009)(5660300002)(6666004)(66476007)(31696002)(66556008)(66946007)(4326008)(53546011)(52116002)(38350700001)(8936002)(6486002)(31686004)(966005)(86362001)(478600001)(316002)(2906002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZzkyM3RpMytrUGhSOENlWmMrOE43a09BdnNnOUUzS1M2ZlRKV2tCRW9Fc05Y?=
 =?utf-8?B?MldYdm9jNEpsMzk4TDJQSjRmQ3dBV21TK01NVmdlUld4d0NNYURScTduUC9r?=
 =?utf-8?B?OXcrbFdkU2k5MXk2cmozc0UxMTJkeGFGNVNoN3l6YlRQUEFQdnlhTlpFNVY2?=
 =?utf-8?B?bmZHM0FMdUY3VTEyQ3duenhDdk15eGlKRnpxanp2RkRLWk1RcmNNTi8xQ3dW?=
 =?utf-8?B?MVpZd2NMMzlIWE5BMG5jS09tWlZhNDI2bUwrdXQxNnN4Nm44MmxyYUJqQjV0?=
 =?utf-8?B?dFVCV2RVa00xWmZ1NTRQWnBkMUlMc2FZTGZnY1pvSXdJVVVNNEh1ZTgxNDdE?=
 =?utf-8?B?Q25aODN1eGdMbGlUVnR2eEFUcWFReGhNWG1sOFZad1I0NWsya050SzM3dndK?=
 =?utf-8?B?RithakZ2dGM3WkRXVGtVbU5KTUt0bjlCVGl4b0IzYmpmUWFxdkxRWlZDdXFR?=
 =?utf-8?B?NUhlaWkwN1JLSVFGUWNFTjdWV2ZzekQ4bVZUWWlDR29DRFB3OGJKeUE1NFZN?=
 =?utf-8?B?VDZaTWh3SGZTYmFRWnA5Q0Jyd0FnS29zdjRjVHFZRlJlT1pOQ09GMDcxY21R?=
 =?utf-8?B?dlhrcmlUTEFNYnZkUXRsaHdiaU1NbzNpK1lJOVY1aUFXR1lsbUtQeUdRbHhU?=
 =?utf-8?B?V3ZYMTJKOXVKR1VocUlsa01CbHE1bnIvZWVvYUw2V3FxZERGbldBa2NpWDRm?=
 =?utf-8?B?SURTb1RBcHJUVWx4STZSRHdpNElsVjFXSVNUaGhCb1hTZHBjYXBCR0NQcyts?=
 =?utf-8?B?N3VsRGVmbWxYYlpoZEgxT1Y0ci9mSWx6OU5nTTVzZGhCR1pCU3UydzJVU2Jp?=
 =?utf-8?B?Qlc3VzNpVm9qUkN4ZVNsSzE0OEM1STZTVTh3NklMcnpxeHhwUHJKSlYxNmVr?=
 =?utf-8?B?VFVVTkMwOEZ2WmxjVFNvcmxhZjY5aENMSDFCd25PL0hmYXRvU2ZxNWVKbGVD?=
 =?utf-8?B?N1gwUCs1MFE0Ry9jM0FjU0h1SVJWZE5XVm8xSW1VT1FhK2JpRkxQdHpTTUdK?=
 =?utf-8?B?OFAwditlMTAwRCtxc0xPZmRWcGhFaUQwWi9lWXAxcTI0V05nbDVrMFNBUDdO?=
 =?utf-8?B?eWdkWkI2bkVoclozMThyZ3VqanVRS242Wmh5WDRSaTVKcnZKL0o0WnEzb0pZ?=
 =?utf-8?B?aG9OcEZXNnFaVnFldnNtS2tZeUJKSTJnRkFVVGk3S0twU1VpK0tUYkpyV3VX?=
 =?utf-8?B?d2hIUWZSV1NJeVNWU21XRVdJaXlxWUhOTk1lVEFnWlZPa3dxSEFIamJET2xx?=
 =?utf-8?B?Tzl5bkU0MEg1eHkxUEsrWk43aFBPd2E3MnU2SEYrazRsK0ZFeDF3c3lTZDh1?=
 =?utf-8?B?QUhQbEdMWllQeUYvN3NmbTZtVXJ3ZEhsbGhUOVhncU1GMjduaGw5WU4yVkN4?=
 =?utf-8?B?WVl2ckU0dE5sTWNSYWp4bGxNV1QxWjZKY29FOWxOODBuTXZVRzVyZjErQlFZ?=
 =?utf-8?B?aldBeDkrbVhDR2pDZWNsNzFoMkRvUU9LUzRxWlVTVHZrY2pGTG1sRVQ5Zkt4?=
 =?utf-8?B?TnpXNllsTWk4K1cvZEF4bDJpZnplMTF0azlKblhZWTgyZVZSSXhZQXpYTXdQ?=
 =?utf-8?B?Q1dSYVlmTDhpZTJoUjE2Z1YvWW1uYzRLY3NzTDNYRVhtc2R0K1FyRDdNQ2E3?=
 =?utf-8?B?SDNLaVE2RnVIT3lSVUZyKzhDTm5Qam1jd08rVllUUzI3VjNodnNCUUtHV2Qz?=
 =?utf-8?B?TFcxNjIwaWhIZXdpRVNYbHowbnEyNWM0KzlIYk9BcytVbFR3SjZIQ2tnWUMy?=
 =?utf-8?Q?z9AFBmxhqQg0gB4+/IkcqL/s39L93k8QKSqn+tP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3960e9c-8969-4059-c457-08d8fa349fc3
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 02:18:40.3343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gpRZU14XKKpRjJKJq5TbTtHmVfFcLNGel8G8gsGuXSXzkQe3AyXE19rn0uv7KezdcsZFWFHFRw0nLCClJL99Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6857
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 2021/4/8 0:18, Mathieu Poirier wrote:
> On Tue, Mar 30, 2021 at 05:12:46PM +0800, peng.fan@oss.nxp.com wrote:
>> From: Peng Fan <peng.fan@nxp.com>
>>
>> V2:
>>   Patch 1/8, use fsl as vendor, typo fix
>>   Because patchset [1] has v2 version, patch 5,6,7,8 are adapted that change.
>>
>> This patchset is to support i.MX7ULP/8MN/8MP, also includes a patch to parse
>> imx,auto-boot
>> This patchset depends on [1]
>>
>> [1] https://patchwork.kernel.org/project/linux-remoteproc/cover/1617082235-15923-1-git-send-email-peng.fan@oss.nxp.com/
>>
>> Peng Fan (8):
>>    dt-bindings: remoteproc: imx_rproc: add fsl,auto-boot property
>>    dt-bindings: remoteproc: imx_rproc: add i.MX7ULP support
>>    dt-bindings: remoteproc: imx_rproc: support i.MX8MN/P
>>    remoteproc: imx_rproc: make clk optional
>>    remoteproc: imx_rproc: parse fsl,auto-boot
>>    remoteproc: imx_rproc: initial support for mutilple start/stop method
>>    remoteproc: imx_rproc: support i.MX7ULP
>>    remoteproc: imx_rproc: support i.MX8MN/P
>>
> 
> There are glaring checkpatch warning on this set - the "DT compatible string"
> ones are fine but the others are not negotiable.  As such I am dropping this set
> entirely.

Ah, sorry for this. I just sent out V3 to address all the checkpatch 
warnings.

Thanks,
Peng.

>   
>>   .../bindings/remoteproc/fsl,imx-rproc.yaml    |  11 +-
>>   drivers/remoteproc/imx_rproc.c                | 170 +++++++++++++++---
>>   2 files changed, 159 insertions(+), 22 deletions(-)
>>
>> -- 
>> 2.30.0
>>
