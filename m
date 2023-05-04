Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97576C77B7C
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 21:34:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbjEDVeG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 17:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbjEDVeF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 17:34:05 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2042.outbound.protection.outlook.com [40.107.105.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071EB11544
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 14:34:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4LD1bzsYN5obSjLhv7edMJBtC4VK5kAqSSfUB5iGBhQ5idnrVajkoenU7H2kKbekX9XOB3FZyObcM2hw+ai1SqTiAIow5OMe8CaTHa9/JBEdQ1BCh5X+JagJm9mAYhpY8w4xKFGo2Xm0aiuu71OBJ5gCY9XlFDDiaIgYC3PkIxy/eS7bLSADscLlDCO/uB1OW115y4xRmOrLShe6lAjCVDoXL5A4ZFq2xM7RHIDmRpqwaDKeb9eA78tYVeGpftOvRIA86JrK+cHDxYCn5DLVmv/TRwo9vsYShWVh6U//agQrxXrzMB76BUNrE5UDg8qfS2igw1pWU5X7RCMf8wuFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uahg688CvZAv/aXuLxaUWzC/mFgfztm1/L5Ul1OM0kU=;
 b=UuePhyY3QSAjbuiEpOysyQu2hAF58Vbu2YJIZQIP5L8oZDA5XOhzWWUz4xigwgNyxad4KS4/ULQVo2gNrVJdcbo3XwIUa4bhNMKONP5183pUvcnGJgnT41oaDlxah57lTKD5p2IJTxDg4AQIgU0oE1nQWvsN/8aXmSDFAuVUne2WlaKYTLF9TBykgZvYaLEv1ibsohVOUyFrXqq+uFBizKhXM/lEbukUYyYVFyJSeYUK6sOMATQJVSTklPyw7thNf3L55J5jRgTnylZwdBOkp1a/gIqgFaKBHQzABBpEB13tGHBUNjb6xr9Wm7WxSa6d1l3jW4gGEdyrW5GUUUamIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uahg688CvZAv/aXuLxaUWzC/mFgfztm1/L5Ul1OM0kU=;
 b=DnwTrD9y/yIo8kqcG4+6lP0rvHNAxS2CcZnrvLVB9p2EwoRs5YOygF6XBE+RJP5ILdQVLjxzULUj/J+l+Qe4PmqUZPGEy7Zp46yKtGpvSxFnA1xt3setkHimoHLaQUETl3gWHLjrbC2t4yrYW5kFKS3uOsa3uwOXvpMjpXi2gx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by DB9PR04MB9892.eurprd04.prod.outlook.com (2603:10a6:10:4ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 21:34:01 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b6a5:b35f:94f8:ff53]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::b6a5:b35f:94f8:ff53%5]) with mapi id 15.20.6363.027; Thu, 4 May 2023
 21:34:01 +0000
Message-ID: <c081f0df-b47f-2969-e9d0-a10f09cc1201@nxp.com>
Date:   Fri, 5 May 2023 00:33:57 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 02/18] remoteproc: imx_dsp: Convert to platform remove
 callback returning void
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
 <20230504194453.1150368-3-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From:   Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <20230504194453.1150368-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|DB9PR04MB9892:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8f2ed3-0286-4af4-96a8-08db4ce746aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jgl1PRNebr8/IIye8u4DChzdOUlBuojYu3sgvjd+iWeyAPwLko/X0qyjShu9bmQae/jbLRFkvXmgDRZj2udsOJdEY4gZu1o+UzanvbTcjznUzClctZuRJkHJoCYthMyEBWIJlnFCV8xsOhmHyqy9DheL609Ae6NWef5SdEpUgUJi0lH7b5dkEezCZ6MrH1bUV/ZkCKhv5suEzO3O/nM9t3qGh0Plj/TXTfoTDAWNjFMV1T6Q/5pvQS/ZWinTN0Ou7kIDWKB1VJEKptTjyFiFuAQlIa5nt5VzAuwrOMl68Eugz4CB+IIP9dplzUwiDIf5qeSnk+zeOWXX0HLUS4ZGBRfv5ZAy1oLU8fLAG2kBF2iwlFJSttv3uBdbJjzQcbQxhdZ8462GzYtqWiQKu0jcjCS1GPyYuW1LDrIgNb5QDSsDf5cvy97Aua/Op4ZrFYZf7S7ATZ+xebh8T15aHNe13EdX0LVlquoBZEKcwFmglvd2jQeZ1ECryk8evbjMm2n4RLGEAE39jKLIhSKgvTyc/UXGTgMkapJhUbWSrHDSQycVb5eheyHi4VjAVzJihmUGKiZFjQ9sUrOIi4K8s5eYM+u3MJXZC++N3ROq0eKuuyLHgkSCMlOlc7o+BAxLI9ukk2yYAWK6J8dXnsryeozx+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(451199021)(6512007)(6506007)(26005)(31686004)(53546011)(186003)(8936002)(2616005)(66946007)(8676002)(55236004)(2906002)(316002)(41300700001)(83380400001)(6666004)(36756003)(66476007)(478600001)(86362001)(4326008)(5660300002)(38100700002)(66556008)(44832011)(6486002)(31696002)(54906003)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2l3RW9FZm8vTy9OaXV3SlR5LzdFL1d1K3VKbFJKZ1h5YjRDeVQwdlRFcDdS?=
 =?utf-8?B?ZWZvVktEMTZPdU4rb3p2aFNicmxjUGRFMUptLzZXYjg4L0JwRkhXbDZRc0RZ?=
 =?utf-8?B?cmdvZnpodU1oc3AzSDljck11cS9jNmhTMkw5a2VWNHk5WjIrRTU0OWxhUm01?=
 =?utf-8?B?QmprMXpLOXRDUW1xaGFVTzJmSG8vWkJ2UUg1MnI1Zkh2Q25rZGIwSk5nNXF4?=
 =?utf-8?B?OTBhdVRSODNWdHE5VkRIWjJpNHNEVGQ2WUZIOHB0MXpXa1dZem9VZkxwZVE1?=
 =?utf-8?B?UVhBQno1YjdOWXcrMm1rQWRKNUZGenBSL1lnNmMxeGRaY2RHbXc4eUZ2dkcv?=
 =?utf-8?B?ZXM3SjVmOFl4UDBFVUxBTGN3QjFwaVhkUEtndlJCN1FESWovcVpUeFk1MmZ6?=
 =?utf-8?B?dk96TWRPdVE0Ykoxa3VFTkhhZEl0b3puMU9xdE1BRWZNZmlhVTIvUXM5QVU0?=
 =?utf-8?B?WnlmYUlIT2k4anhhTG1PLzdlU0VEaDBmdXpMYS9XeTVlUFN2NW5wb1hIRlhH?=
 =?utf-8?B?RHUzdTdSMk9QL3RPbm5obi9XeCtlUUtLenRZcWdJVk9NWE5lMjg2ellGNE5j?=
 =?utf-8?B?UlYrYVhnUlJrYzd4dXd6L3VlQzh4d1c3ZDNpVGRUVDgwZ3VYVnFSODJLaGlo?=
 =?utf-8?B?ZzlXRFdETzU3cFcwQ3hSUVNlcTZZR2ZEVjdDZkVpZk9MdzdhNFBuQ0FQN3Nh?=
 =?utf-8?B?Z1lrR2dYRCtJb3dKMmRvZ09pT01waGtDZVZUWngyZzJOdHV4TmxIK1E2WGZx?=
 =?utf-8?B?dFJUdUI1aGQ2cCtDajU5Y0ZETFhZOEhPYXUvYjBqejU5NWkzYkRqM2I5T09D?=
 =?utf-8?B?MVJSK0duUnU2U0E3bGUzNXVIZ0tiK2ZlYktUVFQyYzUzNUpiWWdTSkVkY01K?=
 =?utf-8?B?cy91ellwOENLYkdqOXMvSVpNR3JuK0REd2h2WkJEbkdwZG0zZjFEdm1aUXcr?=
 =?utf-8?B?UkNUSkRsc0hIMU1VTFM1aTVNVlFrVHhWbEVMdGlVSXdiOEM3cVVhZ1dPbUdx?=
 =?utf-8?B?Z1Z6QXVXS20vRURBaUdRdFpXZDZCVEhGRDMxMlVjUWRsTWZwNUVoeXhlelZK?=
 =?utf-8?B?Q0FCY1NJTzl1NHV3RWhlbVBBQ3IrbEFDT2ZiaE5haVNTdVJDWGFWUWdEZWpH?=
 =?utf-8?B?cnRoeFVtR1RWMEUvbW9DVjlHMFE2c3ZyejM0QkV6c050bkl3Y2xuc01Zby9L?=
 =?utf-8?B?V3RtUC9kK2NhdXJuNWNBaFBuVXBVNXE3NVcvZWZXNXNBeUtrNE04YURCNlFp?=
 =?utf-8?B?UmI1MUZBSDdqTjNLVFJHdi84T0tjNGowZ2pLbTJ2UFZzZXBZVWV5NWxtelhB?=
 =?utf-8?B?NXlpUkFWaDhpTTZCVUlGMzlQaEhxVkhaZGpIcGdnWDFZZTFBZGxMdEdPOHZE?=
 =?utf-8?B?ZGpMQk1raEFuajVMUUNrT0MrZWJzRFYyeTBRZTFCNEZ0VGN2VlkwdEZlOVZR?=
 =?utf-8?B?OWJEL1dWMUd5RUJtRDMvaVYrNC9VRnlmU2hlaDVJNTVLL3MvblFuNVdlaGd1?=
 =?utf-8?B?NElmSXBpTENqRThZdUdXamdHWTBDL04vWmRDdUhUa05OYnBnck9hZGdpcHBG?=
 =?utf-8?B?VS9LN0x5cUMyMlpsZWJ6eEkzOGRDZWtVWVpnUGFaV1M3TVFuQ3JsRzUxUk9U?=
 =?utf-8?B?dmxHKzVFWVI0SDVFdjNROW5jWi9CVDk2MFo3OUUvVXBHKzdPWkc2bWFYVUdH?=
 =?utf-8?B?YWNITGdEaHdFSVI4azFhRFNCRGhWUmRTdGlGVmliR2JpOFhKUkxuLzJKNEJP?=
 =?utf-8?B?VTRqUVJLajQvZ1o4TjlIb1drU0Uwd1IyVVcySDZRcGZoUjZVK1hDZ0xvaGVE?=
 =?utf-8?B?YWM0Z092b2pkUnl1UElOb1NDQ1V5bCt5UUlaS0hRb09kL3RFdnhxR3V1VUQy?=
 =?utf-8?B?TGt4UWRjWVJIcCtlQmVnaFdRVlZWWkg4SFFqZlk3MTdhNHYzZHlaaUloR3Bt?=
 =?utf-8?B?TUcvT0tCTnhiYUh2QU1mRHRNZXFCSTQ3eWY1YzNWTjZYZVdRQkRPWnQ3SE03?=
 =?utf-8?B?NnZ1ZXpHeDBEMVJhZTg5VWxFdVpadUliVHZTQWJia29lNXB0TUFUeUo1Z3JW?=
 =?utf-8?B?S1lKdk1ZT2t6ZDlUV3o5V05xSlJvbXZXYUIzTVR1Y0NKQkZRZWdyeDEwcnRx?=
 =?utf-8?Q?SEKuGr/iaBg8pQIHxKQe8rq4c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8f2ed3-0286-4af4-96a8-08db4ce746aa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 21:34:01.2114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hi9uYqVC7dlqLF36MP6cBeLyB+lWfLzMfakAN58wQXL5kCDiA/ZNlCqy4YR10OlJdxH0oRo2jgroQJqyr6FRWw==
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
>   drivers/remoteproc/imx_dsp_rproc.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index cab06dbf37fb..bda7f2a910e0 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -1161,7 +1161,7 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int imx_dsp_rproc_remove(struct platform_device *pdev)
> +static void imx_dsp_rproc_remove(struct platform_device *pdev)
>   {
>   	struct rproc *rproc = platform_get_drvdata(pdev);
>   	struct imx_dsp_rproc *priv = rproc->priv;
> @@ -1170,8 +1170,6 @@ static int imx_dsp_rproc_remove(struct platform_device *pdev)
>   	rproc_del(rproc);
>   	imx_dsp_detach_pm_domains(priv);
>   	rproc_free(rproc);
> -
> -	return 0;
>   }
>   
>   /* pm runtime functions */
> @@ -1328,7 +1326,7 @@ MODULE_DEVICE_TABLE(of, imx_dsp_rproc_of_match);
>   
>   static struct platform_driver imx_dsp_rproc_driver = {
>   	.probe = imx_dsp_rproc_probe,
> -	.remove = imx_dsp_rproc_remove,
> +	.remove_new = imx_dsp_rproc_remove,
>   	.driver = {
>   		.name = "imx-dsp-rproc",
>   		.of_match_table = imx_dsp_rproc_of_match,
