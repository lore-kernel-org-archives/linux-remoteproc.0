Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDCDC04A6A
	for <linux-remoteproc@archiver.kernel.org>; Thu, 27 Jul 2023 13:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbjG0NXT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 Jul 2023 09:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbjG0NXS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 Jul 2023 09:23:18 -0400
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2064.outbound.protection.outlook.com [40.107.241.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1792728;
        Thu, 27 Jul 2023 06:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GULyka6snWK+qbix+TgZuzsNYDNqAmDbqx+A1pCALSwLmZNFUaGGo9RW9aCmOtyWz8xIfoR7mTBYdL+dtNJ7qJm8YB9vGewMmFst2XTCcJKb3++v4BRSbM9rJnjFH1kZqaMbZ3yGAN61SvbtP9+YdNbyaLz+kwha6hT/UQiG3QB+fxTkrYpFbnx7wVoKuo2RkhcVy/5zQwImq6JfaJ/v3tcvtB8uCiX0F4X0m9WKRCJH52ojwf3BiF2w+8IEXcrvGwroPrBDHZp7+727MdNp7Ltjr16wIJGqvPIOKODsvhbpLXu2gO1lILcJZ5ImVpelzcvK8bU5wfoFUfeEdTeC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsJycqggzRVvaSKNscPOb51oPyDrnolTNHuI8DpyPXc=;
 b=Eiow0I1XTwKOx8l3/DwBX8ho01WOX5UDWhL2FNPlgknQMU6iGEhqTe9dJm98tou2Pl/GIZocTkMoS/yMAE5B9yU5edgXpXBXL0KyGc4EeIqF9/xcMEoSSR7gvY/7mTvuhbVWzX9hjDBxtpSatUSvBb6fBoYOPS25Hm3NnmEydp6KwgnvvAa5BsQl5+NIKOt3Kvd0dYkKzr0ie5udcmN4v7HJeZFH/eOAjA6DzbHdCsn6RkDDGqIs00z++ihYrIraBsfg6et3xmfu3I4JKYYn56bNJnuM88MI30qvsepW3aPxgyCBqS9kNkgOlpKkYXFnl5jeGfys//HrtKGt1aAzSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsJycqggzRVvaSKNscPOb51oPyDrnolTNHuI8DpyPXc=;
 b=XhQrtRnvrhugzSOqLc+5xSME1AT27lafpl2tkMv6JmgCkIwLPw0GMDBUylgnSP8T8M90NTb9Ju1Ax/3t28incBnAdPUD6zW6Hn1IS/XesSkqScgGTt23C1lt0e14knOdrA6IoxiuSU0BBap5kPFPwHtqc6I95P3IiX5JVqMAuqA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AM7PR04MB6885.eurprd04.prod.outlook.com (2603:10a6:20b:10d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 13:23:13 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::5d6a:ec53:f2a8:5b97]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::5d6a:ec53:f2a8:5b97%6]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 13:23:13 +0000
Message-ID: <f958022d-5e22-3729-79b0-9605d87c9fe7@oss.nxp.com>
Date:   Thu, 27 Jul 2023 21:22:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 2/2] remoteproc: imx_rproc: Switch iMX8MN/MP from SMCCC
 to MMIO
To:     Marek Vasut <marex@denx.de>, linux-remoteproc@vger.kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230724222418.163220-1-marex@denx.de>
 <20230724222418.163220-2-marex@denx.de>
From:   Peng Fan <peng.fan@oss.nxp.com>
In-Reply-To: <20230724222418.163220-2-marex@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0024.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::11)
 To DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9417:EE_|AM7PR04MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: fc56441f-42a4-4d36-9056-08db8ea4a0df
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S0L9NxRM03NX+zmn+/0pnJWZ61KjKBM30THbkEKOHTzG7qPfRgZknXNpmf7NPvrWJVCePEX2OTGitT+HVx8HK9bLxi9kDDZxSBJz8IKuV9ujmZMYIPegC5ccxG+63uiYW0T6bVzL9Dn9Ju7Ldw42OPwr/+I+1I6j34I9izWa3w5CfBAG36k3EYJxyeif61LCHS/80VVDfs7/eYQxflQgkXDluxy/KSxcygKWjiwYG1xDQIf+ydj1vf9Ga25QdMW8Lox1cVOls48Miydxofei1lShhsOcqc2ip2Dgx3sxrMlFIzNhae3ZDpXyZSu0o6gSNw5HPEoRm63EJwjSU2APIM0jI9s5FpHleFt1JHnzJ1ZFqYALZ6fNd+04SRStcvMctKXOJe5fbwS14TDVIlKX3BK+9N6tZTJ+HYq0xUkexNeNkDDJHz//5G0cJn1PLfYRtflmdVTUS/TCuDuXZlt0U7K1bR1QS9KFyF4STo9sM4dxCGlxFGKw9lE6KSji5ZEYgk69rz9NhXHFFAjpsF6694Rak1xDl6tp8UfzyxEZrbxkqWS+IO7QYNqU46gSC64ROWypPtWqJSRiA8DjQQouhDb6Taw63JuQUMqyYKsyYWgHpjoD6cOzIGUa0wogZIs+o0p+aDDnxhw36EUVPxsnY3/xyEAr687+HJJDwGvZWg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(136003)(376002)(39860400002)(451199021)(6506007)(31696002)(53546011)(2616005)(4326008)(66476007)(66946007)(86362001)(26005)(66556008)(6512007)(186003)(31686004)(44832011)(2906002)(6486002)(478600001)(4744005)(54906003)(6666004)(41300700001)(7416002)(38100700002)(316002)(8676002)(5660300002)(8936002)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXBoTjNpSmlCQ0ZiUmZxT2JhbHE3RHM4UTBiOG0xVTdEM3V1cW5HMk5WaXFY?=
 =?utf-8?B?QTZ4Z3A2YW5KSnZwN1B3dkRvVVhMVzdJaHlxc09TTzdGcWJtZzd3WlQyUHpi?=
 =?utf-8?B?L2N6UHhVUmd0b1Q1NS9qbUlHbFpQMkNGT243UjBORTBUbGNQcHF2ZjNZN1VU?=
 =?utf-8?B?SmJuWWhjTmg4M0g0OUU5azYwSXhXejFFNkc2bXYxSS9BR0UwTHN5SDdxUTZQ?=
 =?utf-8?B?OFd6ZjNRajhwVlZ3VGNUdE1oblNrU0RSSmFtQyt0Zi95ZG4yZFdJRUdZNmZn?=
 =?utf-8?B?c0Z3RXBpTW9tK3IxSkFYZmJDU29xcE5hYTU5U1lPRitwdjBQQU12d0NPOGVH?=
 =?utf-8?B?NEE5RE5WdnRna3FXR2xZOUJ3OXhjaE52RTljUnRvNks1T0hwQlMybHRBYWx0?=
 =?utf-8?B?a09iSHk0WVYxdFo5N2hRQUxZY1E2bWZqdmhndTJEN1lkdi9uN3Y4K0s1Skpv?=
 =?utf-8?B?akZZbTVLZk9TVElTdCtqUEEzUzBkRmFyc0c4SE5rdVNUWG05R2Q2MWVhM0Uv?=
 =?utf-8?B?Mk9aRGhFZHBVRXZmbjZCRXNMbWpWb3FUdzRpdnZCMzhYNjg2TTBjaVdWa0w2?=
 =?utf-8?B?N0VqM2VpSmw1R1ZOVjlwajk5Q21PWWh0VXZVY1JwcTVmQ25DM1l0YVlvaFBl?=
 =?utf-8?B?cXcxUzM3SVo2RjAxYkhRWXRCRWwweFpRVllzQTF0eUVJRFFHVkthT1VoSGY4?=
 =?utf-8?B?UFg3OVlmVWFER2RDY2RJTWdEek9CQVk3VW5zK2xSeGYvL0ZXOEtQc1Z5RU5w?=
 =?utf-8?B?eCtIdXVOMlJGeDVzRGQ4bTJlU0ovOHJmNXZVMFUvTjc0R3BzNUN4M0NoNjZn?=
 =?utf-8?B?bDlNSldnRjFaZzR6UzFwcUVwSU1RNGEwY2ZKYVN2dVBlWEk5cW5kSktwc01j?=
 =?utf-8?B?QXo4SmxIN3ZYdnM0K1FGVWN1eCtwVFptT3NVNDc3bFFnblkxeHRyL0oxU3RE?=
 =?utf-8?B?cUd6SVdmcFNvRzZBVFBOdGpVdUowa1d1cTI0dmxvWEhSYW9RMnpJdU11a3dk?=
 =?utf-8?B?MFo3WWUyNlJkZERBczJRNjB4Uk9RU2hPaTdhU29CZ1FOdzhvcC95ZGR2RVRE?=
 =?utf-8?B?Smh3MFZHc24wZVhYS2VTQ0o4NXZ3UE1uSC9LT3RMRGFmeVZSdUs2OU4vcmVB?=
 =?utf-8?B?eTkwOEpNK2xHb2xGcHAxMWpMMHMxcGhRWXpNRGJZenlKQUdqUkRONUxJOU44?=
 =?utf-8?B?UExPdU5od1grU1hIeVpwS3JjUThKMXpkbUltUjVqWWdjcUxhdzVadFo1K2Zj?=
 =?utf-8?B?SENXSGIzSUVScmYvdU9xMHJUaWpVVDJQb054TndjK2tOb2tUeElRaWptN1VZ?=
 =?utf-8?B?c2FXNU8zWU1VVERqVjZMRDJJQ0x0VnNXQVBXNkNZLzZKd01wWTR1SHZqV29K?=
 =?utf-8?B?UWxlUnZBUmlFdUpuTmVUY0VOYUozcTlwOHluWDN0L1N2SElhYUNXWVRsMk5M?=
 =?utf-8?B?ZStNaDNiSC9CQmVQTWcrdjBQWHVSbjM5Y202VWtEK291Q2lnd2Y1ck1HMXlq?=
 =?utf-8?B?K1JDbnRlNWY2dHBHQUNpTCtxbjBmRk9JQ0VtYUEyRG9EVE45K0plb0ZIOFNs?=
 =?utf-8?B?UXEyNzFMTG1adnNJVjM3eldPQ3lsSStpTzE4OTlqNHBJVzVuSlM5dWZ4MlQw?=
 =?utf-8?B?djdyTU5WaW1pYTdQQlR1K3FQdk1KY1d1dmpXVzhrcEt1eXp4cmFhbFNtYk5Y?=
 =?utf-8?B?cjA5b2sycDg5R1R6alFsU1UzZGtNSGVqUGVuQUhZWXl2dElqM2RucFdvZWtn?=
 =?utf-8?B?cktwY3NUUmNic3NEdlhCclB1aU9KZ0NWK3JFSmVrQUNRNUk1QU5XWDZucHQz?=
 =?utf-8?B?Q2dOQThicjA1T0lNQm5tazhXR2hTRFpwdWw3SWNPSWRsWVd3eFJwVE9JM3gw?=
 =?utf-8?B?YnNwaU9rckNRTGZYK3JjTzUzaHdIVXo2bU5TTmtyWFhReHBNMFJDbzN6UmJB?=
 =?utf-8?B?MnN3cUFvd240bGxFS0NzajJ1cGJaMVRibEZha3MvaWRSRkNvVjRMVzFkS1JX?=
 =?utf-8?B?eWxvZ2x3WWRzU1FrNHcrUkZBMUxPUlBrTThGY1ZPWTRNZUZSWUJxMjZrQmJt?=
 =?utf-8?B?U1JsOXNYVG1QZmN5bUMrQitJLzgwVjVXY0pnZjRyNlBTdURMNVJYUDd0MW9E?=
 =?utf-8?Q?LdtE5iNClTuCdqgGz7udeum9f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc56441f-42a4-4d36-9056-08db8ea4a0df
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 13:23:13.1720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpLmiPA6xHPHzfB3MCV0oKNjURCWF3Rr3yBNyGamJke98GJdAH+lhEkqsjqNTlfJLSCc5+NBhyKDkwxMkF7i+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6885
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 7/25/2023 6:24 AM, Marek Vasut wrote:
> The MX8M CM7 boot via SMC call is problematic, since not all versions
> of ATF support this interface. Extend the MMIO support so it can boot
> the CM7 on MX8MN/MP instead and discern the two alternatives using DT
> compatible strings.
> 
> Signed-off-by: Marek Vasut<marex@denx.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
