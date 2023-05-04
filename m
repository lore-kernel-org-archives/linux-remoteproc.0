Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA06C7EE22
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 21:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjEDVej (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 17:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjEDVei (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 17:34:38 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F891385B
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 14:34:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mainoUN4n4YTno164hMTKlvSHMjKoC8pFpMxCh3NOZ9+toeENS0tmwnP4n1ElCrFv+EMJ32NAdRqdiTzuvM9TNkyhVnfbMZU1WStQbtX3rVGy0zBOLmwSlCHccIIfM9HJTfwDPimwB0IThaG4ypFEhBwj4/EEDwEvjnjPao5LQHBF8IVVEGDLVCJEKuuV2STr/Tc4XsmXJxaG3ReBX4bvGwqEA/JeawdYtfp4BMONjkZ3I7TUYsylJ2+ERJgG9uexSScsHPv4fxrMtKN5G7K2pp9klaMsZNimC5U4D+4A5064XSaQ1TW1VaK+rD76H8NnohZhfDr1g7UFF64FMYaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtD/qWq1PsuOrWe0Lyc+32an8U1XFwVwobboO9la6rE=;
 b=XkAD3Zu4T5JbtefC+PfdMvcxazfNBM2HOzNH4YdngHccugslufifC4U8mqijgkAat7tiLjdgfs2GVWUxwWwd5UgMaAiePy4gpQ2WREhBUbnIkfPB3UZz/Pub9wOyVJF/ibDCngH9SlI8J7FwC3SQe0mhXciICU9CmubMXg77rCQtIOz0V7b0Roy83tM4Bc0/9yRP6J3cLGSb1g+a/aMPEsg2Abu7S68FDcxxlaV6GEnnS3DClClf3KEh7nQSCEEfAaud/tJt3u7xtZTnmFiMD+mCRP5DPS6ixhOHpAyK/TiWCg2cpA4C2OUqs5o6ed6gu7NZBGZ9PyZofiu+Bwgh/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtD/qWq1PsuOrWe0Lyc+32an8U1XFwVwobboO9la6rE=;
 b=ZUKxG3pO5JZi3bVjQYzMAvYU6e5HhswqtegHBnRL0eH9D8YCFzENeS8a7CPZ1YHeoNXqXGchut6kLle6SIKxeItCQbtgLYyQ5AhOtwQc33yAlwQByABia4ZKrEX/Eyu1hv/ulFDONmXBqQva/Ziq81W+9BxEwYtclNvztQcs0PE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DB9PR04MB9892.eurprd04.prod.outlook.com (2603:10a6:10:4ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 21:34:25 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b6a5:b35f:94f8:ff53]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b6a5:b35f:94f8:ff53%5]) with mapi id 15.20.6363.027; Thu, 4 May 2023
 21:34:25 +0000
Message-ID: <4ecf69b8-741f-a2f6-5ce0-bb0fe467c090@nxp.com>
Date:   Fri, 5 May 2023 00:34:22 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 03/18] remoteproc: imx: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
 <20230504194453.1150368-4-u.kleine-koenig@pengutronix.de>
From:   Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <20230504194453.1150368-4-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0202CA0007.eurprd02.prod.outlook.com
 (2603:10a6:200:89::17) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|DB9PR04MB9892:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f5d84c-7c42-4349-3422-08db4ce75550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w8VQpVIC0uYgdrb7nGdeRfzRK2dxxjbkkFwmv47MPyqm6G6GmCmcnnZm/VEwVfZY7jh/LevOH6x3kk/JkuYEL8k9xS4IXrYFHC1vYTWS12KEFPalARg6wpWQ1H9JXvmaYR6K6IYlvLR9cpax1sh9KDbCkWXifsiAtpahiclfs/a/KFdFW7+7qptmslJQhdFoNlYiz1mwRfKxyFRxu1o6hwhrxuV9cL69cyhglgKl5uMqwsy1XUP/4AaCaciFehpw4lXWI/Q15co6AiRhLlQdDbXEUftOHfppd0o4XhWa3JXmVYv5/cVcfw0834NHeZ70txTa4x5cvEId8hxE+FDcs6vkaoo1WXauV1FHfBuAMpGQQviO5jleF0w2sx0W8BaiZ2r2GKcsl9gJOqbXtQJ6nCB/7n+771H9IfREyFEBbK7sELb0SS1UEzAzh2pDAsRVGI+LnjkNa01C7FyP0ZEO8dLmxGfQof7J9sSzhZF6CMccmYM3lMBMTur4V/o3VLiFBk+wtsolmMI1EGIlCRB/LqEOpN/NBO2bYoFbLY+kVt5mKegT5/e2zfKjGnyLhy1pN7ARj9ANA1KqVRPYHyDyUyAn10FHSuZvf7VJDzW447613KlzWYr5hcATJDoLNeTY24Y3i9npgPXw8F45ST61Kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(6512007)(6506007)(26005)(31686004)(53546011)(186003)(8936002)(2616005)(66946007)(8676002)(55236004)(2906002)(316002)(41300700001)(83380400001)(6666004)(36756003)(66476007)(478600001)(86362001)(4326008)(5660300002)(38100700002)(66556008)(44832011)(6486002)(31696002)(54906003)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzA0endIVExrb1ZVelBhMVlYSENLc3NodTB0aTh5S1NSM1Rwc0tsYzErbTJj?=
 =?utf-8?B?NkFyNW5Nc2JiVnE2dzZYNG5vcGFHKzlLOVNRWmZJWnVQMVdVMGpJcGNmUk9h?=
 =?utf-8?B?azNqWDU4VVZZRzNJWE1uN2xnbkJvQjVvNVoyT25RMG9taUZROTArVC9UeW5C?=
 =?utf-8?B?b3hHUnlvWWkxYmcrWm5tVEN6dFVqSE4vM0ZBbDJUd1BLZExyb2tFZCtHQ0tD?=
 =?utf-8?B?Z0s4dVZja29VZWZjMnJNVjRLZ1Avd25hampkSGFGL0t6Y1ltSjVIWDRmQ1Z5?=
 =?utf-8?B?KzFkU3JOR2VDTWJZSXovK1FNT1ovajMzMUZoWmVTTlMvRE1mKzFycDF0bUp3?=
 =?utf-8?B?WW5KQ2VVc0l1MnVNOXFLZHFobTFpajZGaEdUeFc5RmFQU1lac2JXUnFwcXhh?=
 =?utf-8?B?bWFCV3dYK0VHTHgxcis3UkFmNUVHK1UxNm9oYVlxVzJ4ajJsU0QzUjlTdmk0?=
 =?utf-8?B?dzRnazIyWnhVenZtYng3QVJ4MjV6Ri83VEZKQklOWWI1dlpGeUN3S1ZPSzNq?=
 =?utf-8?B?clk1SFR6ME9pTktHUFordVJGTnBHZWdqSDVKbFRBRkpjSUU2eXpUMHdJeWVv?=
 =?utf-8?B?MHplclF4YlNXRVMzVzIrZEo4cXdtSEpZMzA0QkNLNjYwZ2NjdWU5Z1NUdmdP?=
 =?utf-8?B?bnpqSHpCam9hV2FoSzAxOVJKT1ZUbGEzRkwwMWVlWG14ZERLVVRqNklFaXpL?=
 =?utf-8?B?VnNmSzc1dnpLbFdVcFczM2tRZENHTXZaQ2QrY1pkVE9EeXZMTUpaWSs0UE5a?=
 =?utf-8?B?eU5XY0lSTVFndTJqL1BOSUcyRFM0T2hoZW9ISWVYeHhKNnpvdGlXdHlGUkl5?=
 =?utf-8?B?RTIvVlprY0kvd1BJS2dwWjhxczBmRVdHb2w1WjlvODBDbUVYT2RDeXljcGw3?=
 =?utf-8?B?MTFPU3hxV3UrVlU0R3UrczhCV2ZXOGpaM3dGMmN6Qmx2S2szaG0zZ3pqcU1h?=
 =?utf-8?B?TkxsYjlPMGMwVzRpZ1ZQVG1IeW9oMHdQcUpVNWRhK1ZzSGxXZW5MTzF0OXNq?=
 =?utf-8?B?MnVvNDlZSzRhWXpoRWJHaXpxaHhtSFdJSVZzSi9FMW9qeWVZYmR4U2FOSVdQ?=
 =?utf-8?B?QVZBelM2NVJzcDRaWElCdkl0L1NZZCtNd3gwNlRxeHg1b0p6eExKRU5UWkRR?=
 =?utf-8?B?TG5nZlIzMmtoWHBhbE14bDVKdTlMOW15R2VpZFN4K2lSOXZSMlI0NTRqTHAy?=
 =?utf-8?B?bGJCcHlwNmxJVG9qMHA2Rm04bi9vdmVaMkdING80aE9qNnpCVzdaTXU4aDYr?=
 =?utf-8?B?R3c1S1NIaUQ5YlZBMURNZTF4bFp0SU0zUER2SEJqeVBqSENMcnlXeEcremRm?=
 =?utf-8?B?SWVkK05iWGk2NFczdzFEdXF3R2dtbytYblZTWnM0eU9LRzkvNVJ4SVVGakU1?=
 =?utf-8?B?bFVkVTNaOXI4bWh0OTVhYzVBaHkvN3g4dHppei92d0kwQTV0R2NFem5QdURh?=
 =?utf-8?B?b2tJT08vcG1CNWh3aTZpcGNtcXdZU29QMmJSRmFPdnNER2ZxeWt2WEh1WVJP?=
 =?utf-8?B?YlkzVHBQVUNiMnRadFozbFlkaHJmeDZXL1gzQWJTcTVXSWNOMU1MdkR6WjhC?=
 =?utf-8?B?YnQvQWQyUFdrUUhtd0pSclVVeFpBS0diN2J5NkIvZXVDaXBaNFhDNHhGMVVE?=
 =?utf-8?B?VGl2MklNOVpwOTdaY3FhQ0pTa0swTTZmaS9TZkpGUTJiQWZqNDRzTDMxWjlO?=
 =?utf-8?B?VkFqcDhwU2JXdEpKeG5OemlSQmhielJsVHMrbU93ZXg1TGgzb0wwa25GSFIy?=
 =?utf-8?B?eFFIZHJlZUZGbEoySTFpaHpoZGRuc1FYdVIxckZOU292V0VFR3ludytmV042?=
 =?utf-8?B?TWxDUjFobDArSHk5ZVRtbGVaTVlXWDF4QnhIcTF2OTRkKzBtNVE4YWhiMGFT?=
 =?utf-8?B?ZjNhekxQYjA0ck9JUWZpbVppdGwvSm8rRG9qeW1oQkRpdzV1RThYSzBNUEwz?=
 =?utf-8?B?ZDlyOWM5TmdZQ0NhVnowMC83NXB6WjI1dFdlSHVwQldKTlY1Tjh0a08yZG1N?=
 =?utf-8?B?WTJFemxCKzZLTGxHd21XQWU2aU9ldHRoS1RIS045dFZjOVI2YW5Rd0VUU0xw?=
 =?utf-8?B?QUJZRjYwaWwraTRsVDNpajYzMFYxdTlUazNiMGE1MHdkYnlPczJuU01ETk5V?=
 =?utf-8?B?Sys5N3F1U0tieTBhOHhZZXZDUWJBRUdZV0FmbHhJT0lpUElybzhnR3FQV2hI?=
 =?utf-8?B?a2c9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f5d84c-7c42-4349-3422-08db4ce75550
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 21:34:25.7074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81faHOndKMTHjTGY/2DJNlI7sY4t9sKd3lZEz9I1H7nF31cUmcmpZ58LWkIZQ9FfgaBCyJ+MDKuxC/8J1qKBjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9892
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 5/4/2023 10:44 PM, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>


> ---
>   drivers/remoteproc/imx_rproc.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 0ab840dc7e97..f9874fc5a80f 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1112,7 +1112,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int imx_rproc_remove(struct platform_device *pdev)
> +static void imx_rproc_remove(struct platform_device *pdev)
>   {
>   	struct rproc *rproc = platform_get_drvdata(pdev);
>   	struct imx_rproc *priv = rproc->priv;
> @@ -1123,8 +1123,6 @@ static int imx_rproc_remove(struct platform_device *pdev)
>   	imx_rproc_free_mbox(rproc);
>   	destroy_workqueue(priv->workqueue);
>   	rproc_free(rproc);
> -
> -	return 0;
>   }
>   
>   static const struct of_device_id imx_rproc_of_match[] = {
> @@ -1145,7 +1143,7 @@ MODULE_DEVICE_TABLE(of, imx_rproc_of_match);
>   
>   static struct platform_driver imx_rproc_driver = {
>   	.probe = imx_rproc_probe,
> -	.remove = imx_rproc_remove,
> +	.remove_new = imx_rproc_remove,
>   	.driver = {
>   		.name = "imx-rproc",
>   		.of_match_table = imx_rproc_of_match,
