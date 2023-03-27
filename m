Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08C9C76195
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Mar 2023 11:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbjC0Ltk (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Mar 2023 07:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232545AbjC0Ltf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Mar 2023 07:49:35 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2115.outbound.protection.outlook.com [40.107.7.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B1713A95
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Mar 2023 04:49:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MCCvxpl+NyB3CKzc6V0Jly+6xJ67jf6g7JbCQ3+gNoD/PyNGjzjnilFjoQbC5WQa+DGdnEZS4RjG5U5yl7KK4EZaEceJIDLUGyfSKPtFC/12nNohCwKimSGjqSFd4anOLYZ6PXNRzaZL6FmqtU9k7Ov9SlQUTWw3bDHbe28bM2O5ochUsrdib6BaAZ+DGPGoCoDyTx9OBdloNHwoIoqRlbsK0M7jbr50KwnDqMtnMRy1lyKglE+RMKf53SleGnG8NhUBOVeUBTbbgcwbnabYUDkG4fayGou1LnjBuET99zhXCkWi/+IdlrKgnuAFvjvEE9gaPsmVlsYBsqggC+IwbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfrsfa7wdPf/G3VBWrPCfj5IErHeLTXf3M/yosIMoI4=;
 b=RUE3Nq6Q89FizQ/DjfrwwxqXKnV2meNLFOTLO3jro+9oMTgXxmJHWUfBf5wImLy6pvF6WMrNJ5wUThylLypBsP0fvIkj3ocgJQ+tOHwsrxGUc3pqgGBDljcJBVg3HMuFBoyYNhHiiHRgAfeQAXFIZ2dQ5hC2NStbQkhYUn37VmgQIDV5K/QrUV3M52t4TuFoHBlqHCfXDMB5airkECAi5Hi0RugFrAiFxqdu9jYxOmNF2O3xjiXLRehEd7lTkjfs1nAaclIT5oYsFPFC03468FPKxLMmRPHDhSjzsWrG1t9wwxDtWMJoqqcQf//j4GwPJE0Uhd4XQKSLX4MjYbP9Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfrsfa7wdPf/G3VBWrPCfj5IErHeLTXf3M/yosIMoI4=;
 b=nkhTinahnlmA3wPcu81IiZeI7xE9jmRQTma57B7Km4wtPrbFAHJOwylYIMmOdO2wurtWQ+jZP9mctY9iNfSJmNLRPTFUA4iy6NkeB5DguSt+dLSssGAFvMad0aYeEs7JvWycGoGPfKwlYBv2OrV+TFP3ajXaENxt9+wir8XiBi0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB8PR10MB3577.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:139::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.16; Mon, 27 Mar
 2023 11:49:30 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7ec3:9d2c:15ac:e1af]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7ec3:9d2c:15ac:e1af%3]) with mapi id 15.20.6254.016; Mon, 27 Mar 2023
 11:49:30 +0000
Message-ID: <ed554149-5671-0c59-5add-5d1dc8f1f898@kontron.de>
Date:   Mon, 27 Mar 2023 13:49:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US, de-DE
From:   Frieder Schrempf <frieder.schrempf@kontron.de>
To:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peng Fan <peng.fan@nxp.com>, NXP Linux Team <linux-imx@nxp.com>
Subject: Race condition between Linux and M4 app with rpmsg link init
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR2P278CA0054.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::17) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB8PR10MB3577:EE_
X-MS-Office365-Filtering-Correlation-Id: c76f7e60-c42c-4122-8d4b-08db2eb95302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RWUZsqHWjGnVY41xN62OZbyzJfme1czsW0Mx15Ad2Jh9jPE85gu2aJuPJGISb7XD9e6BDU1wKkwd3+8ubZ9CWK0J05iubz6Jm6wA88E7YBYcv6x13jlv+Xi459FuLYNtaSMlm4U3CaN+ESgtIurznDd+7FWm7b5GuNH45oG8daOH7ghHxFRzCCc9zVkWCL1hoBZHUrry/Ll+3NKFpoUlMNIX8aP8fd+QCP+j3y6wYnG5Lcjj6i/9bzszpGhMifAj9HK+zVIhcrI/wOlG+S0w+GRVrPEIRv6wyJaVFejCa5FkjaLpQnDFQAJIlqHJCQ40esUqbXLkuqArOtRj20q3lw4khhL1g/N6Zza0KTca/5G8/ml+K7hNUzD+SiY9sIG5jLhVET7zsrUU0dGyCy4m9rlANwtLQmjcqhStF2h99Sp1B5n+tCuGHPAjRCmdhG/EDalhMqcINKhJoXZe1Mdbrxln+vv7w4XNRNN7JXASC/M7zhGaaUpvVe8BQjVnIXzGt/Qkx2yXPMV7yUybFnDLgTmnp9owKTAXl0vB8zgcA610ljY47l40LXF9pcmliejt7FZ9DvSC3p1ti16CYZqPEctkeWM+HypxE7vwCDuzk6Y4PXN1dUyqCxozaaTGXik4v5bqqv3TIbhjfLRQk/MIAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(451199021)(2906002)(86362001)(83380400001)(31696002)(2616005)(38100700002)(6512007)(6506007)(8936002)(5660300002)(8676002)(4326008)(36756003)(66476007)(66556008)(41300700001)(66946007)(4744005)(44832011)(6486002)(26005)(316002)(478600001)(54906003)(110136005)(186003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFFWdTYrWTl3aHd4Y3dEOXRXL2pBenhPSGNBQ05Ib0h2dlZweml6V3JyVmxk?=
 =?utf-8?B?USsrOWJVYUtIemtBRTN5QlRiMXJuRE9xQUV6bUVxZHR3Njc4dFBZSFNpUEFr?=
 =?utf-8?B?eEoxN3lHQktVdzRaUGZLRGpjNmF1cVZINjVYbENSRzlqcFdNMDhXdkhiRkRJ?=
 =?utf-8?B?TmZrTnJMSmlxMWcyNlB2SXZ1TGtrZU5Bejl4ZEZPNllaVE5BNEJaTmJvSmxV?=
 =?utf-8?B?THRuVkt2VXN0VGkydU4zQTl3SWVLaVRmQjFiZjdNNjQvV1o5Qkh2ME9JTFQw?=
 =?utf-8?B?UzQ5eUlXSE1HQ00yVTZ2OXRFVFdZL0RNSW1UUlZJUmlGbC8zRjR0YXRONVd0?=
 =?utf-8?B?VURzdC9SR0V5UDQyc01BMVhTM2xKNjdnT2VPVERNU3VRM2JicGdPU0NWUmlv?=
 =?utf-8?B?MVhXMzlNTS8zcit6dVJmTXAzQmZwaU1KRlF0U0c3dnVLcWN3QlgvRzFwalFq?=
 =?utf-8?B?RjZ2VnNXSS9BRURZNWpHTURqWmhpTlZaN0xobmhjaUVzU1RLZGo2eTNjT0hL?=
 =?utf-8?B?V3R5T1pGeUhycUU4Yk4vMllTekFaL3JoV0VWMzVza0xxNGxGcU95VTdqL1Bi?=
 =?utf-8?B?Wi9Ydm5DM1RYMG1OZks4TVJtaUw2cmNXMmpQRjMveTBWbzhxRDNhMUpRMVFL?=
 =?utf-8?B?UE85QXQ3UHk2MDY0SFFLZEo2Q1lRc3ZSZGJ1WFlOcVU0Tm9qZnJvSC9JdG5U?=
 =?utf-8?B?SlFvK2VwSVpkcVgwbXNHQnY2NHRPR0hGelY1WGg3dE9TTUxUR1VFdUF4MHlq?=
 =?utf-8?B?N041OUdPS2V2aEtwRnhGTGNFcXRkK0RFeUdGTDdycmg0YllXRTdSdTdTcGtI?=
 =?utf-8?B?dkM1cS90UG9QZ0hlcTlQNGVHdWlSVEhPMWtIL09QNkxmQWRhTHVMbTJJQUN5?=
 =?utf-8?B?cTBXeFBYS3YxRUJ2Y1ptdlI1RVFOMWJaNml2NGxoS2F2Y3RuOGZSWHpyMms3?=
 =?utf-8?B?YWkxZHUxNnczbmhtbEI5dHVOY1FvaEFWYkE5QTVoVVMyMm1WKzhQVDJNTUU3?=
 =?utf-8?B?MFVFTVRjSENpd3hSZlpvaytMSFFpOWl2SEV2RGNORk1YY0IyaktSQ2plMXJj?=
 =?utf-8?B?Nk1OYncwUnFmaUsxV2xaSThQVCtKY1JDSTRwakpYRHpFT3pqbnd2aE84TjhY?=
 =?utf-8?B?TDd1VTdzS29TRVI2cVh3N0dGMGFRQmVjOFI0YTNJazkyMDJCUklTS0JKTnhX?=
 =?utf-8?B?ckNWQkYvU21PU2tqSkdvQ2l2YThDY0tRdy84QnE5ZHdLZDJWMCtIczJwMmhZ?=
 =?utf-8?B?d0pnMHp5b3VGL3IvM2pqajhtb1g4NlA1VnEvQzBTZ3dIak5SMHRrU29mMkZa?=
 =?utf-8?B?ZzEyRk9qVzZ4UnVWcnpoOUwzVmVvYXQ4MUVseEJtMkpsK2dkTCt3QkJ3Zkh3?=
 =?utf-8?B?WGQzWTUrRVV2cEZhT1BxZC9CUDVBRFVkYVIwZVY0RW0wa2c0QmdySnNRYUpJ?=
 =?utf-8?B?SjAvZGQ1c2Y2UUpzSEgwVHY3UFAreEd6TGlkMnpQNEhWSTNjR3gvVzBiUi9o?=
 =?utf-8?B?cjhibitXTVYxT05JdVVLeG1aSWJmS2ROc0I4WWJDcFdTRk5mQUg1eTJwYVVr?=
 =?utf-8?B?R3V0WU5aSXVkTTMxdG1BTUtIak53T2xONktPOTl2bzVibjVpOU5OeHVBc3hY?=
 =?utf-8?B?K0NoMTNVTXRXRkkwYlhyMDI0bUdFR3VwQWE3aU9ab3dOYStIUjRlM1FOUXlU?=
 =?utf-8?B?Zi9IUUp2Z3NMNWF0ZHVvOEhzZzJaU3pDYU01RkNoNkpZbzdoK043M251cUxn?=
 =?utf-8?B?ZFJKOVNmN25ncXFtTGFsTno0QVVNblRxSk1iSjZoaElXM1h0ZUxrekp0Wi92?=
 =?utf-8?B?cko3MVFqVm9xM0VOZUpBOFlBYTNvSitCbmVQU0k2MzhZWHAvUTl6L1FEeTZJ?=
 =?utf-8?B?Rko3OHQ3TDhZYUE1M1M1SUdldVFKaTV2MFc3YlhsdHpEVjNXL0w5R003eS8w?=
 =?utf-8?B?V1l2QW5USGlUVzNISkQzSExmRkZKcHdHc1dyYU1hOXZOWFhnL3Yyb1lwNFBB?=
 =?utf-8?B?N3NLUzJQKzlCTm0xQ3ZXZDcva21RRkNrQ0RnRmgrbWtGbVlDRUNKZWJZTSth?=
 =?utf-8?B?YmxxaVdaOUVoK0xPRUpsanh2aDE0eHJYL21FdEM4VjdyNEV5dUNuQ2M2Wm15?=
 =?utf-8?B?QVNrUTQ5cC92MUJUa2o5SzBwMkdXWFlLNWR1RHRvbTQzRWI4R21paFpuTU5m?=
 =?utf-8?B?Rnc9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c76f7e60-c42c-4122-8d4b-08db2eb95302
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 11:49:30.0778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vz9qPZP2pC0OsRHbGSKrO733/zLqerJGn93Bw454aQ1tg9Vp+lT5tl3Z8r8VsV/shNvGX66RazIhO62x7CPsWoYi1KN5wn18eVR4MU1Gd3U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3577
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi,

I have a problem with a kind of race condition between Linux
remoteproc/rpmsg on the A53 core and the app on the M4 core when
starting the remote core and initializing the rpmsg link. This is what
happens:

| A53                          |  M4                         |
| ---------------------------- | --------------------------- |
| * load the ELF file          |                             |
| * start the M4 core          |                             |
| rproc_start()                |                             |
|   imx_rproc_start()          |                             |
|                              | * M4 app starts             |
|   rproc_start_subdevices()   |                             |
|                              | * M4 receives mailbox IRQ   |
|                              | * M4 app doesn't handle     |
|                              |   IRQ as they are not       |
|                              |   registered yet            |
|                              | * M4 registers IRQ handlers |


When I add a delay in rproc_start() between the calls to
imx_rproc_start() and rproc_start_subdevices() this give the M4 app
enough time to fully start and register the IRQ handlers. In this case
the rpmsg link is initialized correctly.

What is the proper way to fix this? Is there already a mechanism to
handle such cases?

Thanks for any help!

Best regards
Frieder
