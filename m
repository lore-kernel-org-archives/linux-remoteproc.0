Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013057.outbound.protection.outlook.com [40.107.159.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B059F2EB864;
	Wed, 17 Sep 2025 14:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119660; cv=fail; b=oesalFuAdARfGTOMxA54ZgDgfxvzwIHs0nYJpJCcXbNlcuN9hiy47b7FB6p+QGBAi/UgI6iZMr7BudGKRiOZ6JVX1F6UStM15TYx4J9maffG0UNRp4leF5CNeSktKY6XW4pM42Oe5lCzKmWl6Mq+qY+G3GqPqd1h6UrdtTaLhHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119660; c=relaxed/simple;
	bh=/ToGOE3mo3Hsr5H0Z8ZG7Ariwpiq4WIm6iurz4naflQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kl2B7fx+E5aPIVEPQvfIQ2p0nEgolgs5qBe440Cf0OoODKNQbFixnD02JQYv/CsUUmlwe/O5kNaDe12D1wpY1PIZuxNi2BzNH+Jn6sAjUw9uyz9nJ3O7gyCmhBTo31uvVz/bbhLtFJ7hx5v8izESdCa6OaAQdbK5eXcDrsQ3Ye8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fqNtFKeE; arc=fail smtp.client-ip=40.107.159.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fqNtFKeE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyhEUD3BQAG3IyIki3Sm7SisxCcMRjurRuoh/s1DCHraaJcXDQ3eaObF83jg7y6dZl52RxCnZSUUiuXylR7fZmOkQvBDxpZsSAsLGos320Ucn9ulrPLdIm4yaoGw6Pqwm09GDenrXXxdjRS025Fyb7Cj/B3AZ+MYw4deXiEBmKtObzUebykEMlC7KWErpCUHeXqeFonBkeUuBSL04F00JEHBC+4fQoiCmYUv4rBd6wkn2MY3Moh1VOzsUQ7lOEo2XSGZdbWlrZkwO7WUhPeblN9Mndkfg9/DXUV+vHrWfIzXWxmv/TyGUkRzJOkvGF2WVZPVxi3bP4J4fa94YRU6fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uwKAUTz3zrenKTW7M1WxoEboj63bmY2iFE9gzEKJl8=;
 b=HDi7A4fgCF91l20zQf21npJ8hASrFmEj728qATJxOMuJ+gNAOSezRkO6IIlO+98gwNFTb6B1Z0cQrmhhLCQiaTg9rM0qqrkki0pPmdL/xwtEGuP1EMgwFajs7FAqc56+knEfnDJPr+rtFSQE6GXqbWDgKcQvUGvBdngWvrK0dsfRA4SpEN/7w6Boaj8YFAysNPtR/uJ8+1nHOhnnitKo6rZRwONeuFMeDM7fn2gX4ysJbXx9mCHFcaVKN0+xXKpoXti25zyWJ9wPEaqETRhst+qMTDuagL/5q7EsF9FIQIx6VNhkPAgqMiAkUN3Nz4DZTVfzCewMNntgEG67qwXolQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uwKAUTz3zrenKTW7M1WxoEboj63bmY2iFE9gzEKJl8=;
 b=fqNtFKeEzVH91iV1A5DlMAUxmIhOHSSf8iOMoffAnURnAs17XLYjaZI3Nicjle9JQXlEKV1OHw+ioGMKlkWP2vcqMeFplwMPGGoEjhf03wnvWfrn0UAb1B98RHslbyD38fZD7cgHZUjnVqXf/kElVHvW911xw+DG31eCLSHus2Wv0dhEh2iO/uvvbqvCgvlc69eDYXaCU5QavM7GAOvUwpnBhjSh5apEGpYCfPAwpfCHd0UYiwIQPQN9dk1AUsAsD7kcUfHppyF6hncVqTtEUthWW8YK0fqTY1cFbvSqdeo4ZJK4APV715Ru4ZC6V+7b8ix4gqhFZAX4pOnwVgxlDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DBBPR04MB7628.eurprd04.prod.outlook.com (2603:10a6:10:204::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 14:34:14 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 14:34:14 +0000
Date: Wed, 17 Sep 2025 10:34:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup order
 and error handling
Message-ID: <aMrG3VlhXi+Fww7g@lizhi-Precision-Tower-5810>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
 <20250917-imx_rproc_c2-v1-1-00ce23dc9c6e@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-imx_rproc_c2-v1-1-00ce23dc9c6e@nxp.com>
X-ClientProxiedBy: PH8PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::10) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DBBPR04MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd3e9c3-6608-4c7c-d918-08ddf5f74651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WGQVVbjUQZen0Dp+Sa4dH3QxEw8T1ZOGvEXv+HCqO7tKrCGUwRrYgMcyFsW7?=
 =?us-ascii?Q?RjeJ5QYKoY3mzYuom8GStvtdHdG1gRpTi8K2s5JrBluAvCvq6QlxWei5dZ/w?=
 =?us-ascii?Q?J9LYYH4qQmEO5PfNc3JWRGeFi3wUAx1ku3N1ybp+E7k/y+S42t9Gv2y8I0ZJ?=
 =?us-ascii?Q?rL6AlFr4OZvjwC/daAC1yORbUXzDW5ybFqjIeS61hlh97Nb9IiEpFatHVvDx?=
 =?us-ascii?Q?lsZCbwzkkOXseBBkeJG6GdNmjPnvkXe9NGu3GQ9yZoMyfpCW2AxagGaHM52U?=
 =?us-ascii?Q?DjrtD05Zqm7K6BvPPRpxgbRHakqfZ9c4ynp/FbbvXe8mvXra+4OcnlZBcGa1?=
 =?us-ascii?Q?HwlAiM0YMuxA1Q0HXGxpBBRfeswEgUBnBhVQlgRCj4GfxUnNfBClUP7CwxdW?=
 =?us-ascii?Q?zfyA19QkUmjSEQop/C0H9ywPeRQgUVE/xp5yPRXE0vyuzsO5FYMBl7NU63JK?=
 =?us-ascii?Q?1nh7GGJKAvr2sAsyVWVAddIB2lB1IRbQoG+zWYFZDjNv4SaIuLtgii5AY3Xz?=
 =?us-ascii?Q?qoHpJUqkW+l8GH6vEjEw9QXwQRdmtJMOFXkv8glUbxl5dpbnlPXT52B5djuE?=
 =?us-ascii?Q?ZPzMDCkShZ6kxKorqPdTOavBL8PY/4Ubxjo3E0gr+ZrOtXz+nlJcI9r8VIN5?=
 =?us-ascii?Q?+5ghpgIK8iH//+xGoQBdFpkdJM8lfyq+OQBiNbMAuBD77ZrrfoM1EINAVq/t?=
 =?us-ascii?Q?kXNMs3+6OYwQhzuR5qMKAmnqUSUluoefqZnmGZ3tPjI9++rkQl8PJsZwu1UV?=
 =?us-ascii?Q?OU4S2cOzD+a86NGY4B91ei2UvVZ4eYCz2zIYKVPOS/noFUCH/ZByTW5aFyhl?=
 =?us-ascii?Q?E84BvbAjHxzGwaZdOxanlFf4zkzp70g65DO0xtYz5E6cK89rAme7yOF/NA4O?=
 =?us-ascii?Q?XdfHSk9MxPVKBlLKjz4yvHguMI1iLYk4/rU0udkuWQEb6R7T0+VsHyxjRCvg?=
 =?us-ascii?Q?ezb9t6BaJIU7gc+unjzaKK2Ph5/z0SyGfzuNm282Q3ooXqa0oPEd7lbwiENW?=
 =?us-ascii?Q?4WRWmDDiON86NnfCjqHzmsk6Jrb/7C0kZytvD0atkBJgT/eIK/YXoBO+mzDp?=
 =?us-ascii?Q?HOZ9tgTnHSeIX8FpIe0PrRXljzuFuIkXvbiY/ehtrRDlIkKzvZq01+D02dCD?=
 =?us-ascii?Q?hM7ehKHvMVkAJtEryOoDrmYuNPRZTL6jZgqdTEq6SRIzdGRQ0yZKwLMia1qb?=
 =?us-ascii?Q?EfNqZA24UYfVezY3RFaNnRyUArWovZga0U0WnQxL1kO259vq6wNy36591U5Z?=
 =?us-ascii?Q?w3lRCSA8f5gtkvOVixW2DoLR65v4CYJY34mxHvM45Y4e1n/8wQ+RSPjKwqYu?=
 =?us-ascii?Q?1X+Mrr8i5rBbJxY/8k754wxIwpMGmm56Sd/6uaTBsYbuFbZV2ZuIkBMiuDDy?=
 =?us-ascii?Q?3/lzTK1ohDRqJA642ebENhq6SkslpRjOiBnZckxS7BiS70XsGQso5TFoRYBs?=
 =?us-ascii?Q?mcPdLm6Dk2tFfKKSnbJTGSh96K+1KaRwiwtI2o+xEhDM2ENhCmaPZw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ojku8uAK05z1LG407A5ns1uLD1dNa2n2eRJOgMGlngk1ERjN3SYDyXNT1w69?=
 =?us-ascii?Q?3SbB3UC3Gpf8MtQZVCan0sdzSLPZulGPPi7rmIa33PNAdT25J8XfZaw22Zwh?=
 =?us-ascii?Q?Pj0i6FMVYzbAlfmCagFbvd1i5U/0iYMha07aCpxOH/aVTpmYqrg+bm0lC1wk?=
 =?us-ascii?Q?CFMhT4XzKAZJKjZytzraGo3XYslivnhoOm2pw/an6dfskdjhyyO7pfvLay5Y?=
 =?us-ascii?Q?yUh5Rq9hAxDdtSdDdyQuyxdMGdtjnL0sl5pfdRBy2Zuw/RL3Rl/677gRppmA?=
 =?us-ascii?Q?XeELnv73JhSshS+4Quzo1lwtc/3VS4msRF8ytRPePuDGPfi5UpbJ6W159BiE?=
 =?us-ascii?Q?LV7rrGrfdphbFdSjbaqwntLkoTxwidiI4lyrKc6zPNs3sHU2TQF54IoSfssV?=
 =?us-ascii?Q?CB/+YSklO5APY8cg2kQBzmxLzTNLkNil3CV9Vovpml/a1OzXRGvC0LWUYu5A?=
 =?us-ascii?Q?il2ZwulVkLebDEyjzmq5FNJnEclYcX2EPzcAg0k1pypgI9/Lc2++iAllSQqv?=
 =?us-ascii?Q?sKP+ZWLRK/7CFmZamd0ueD0rQpEArfg6FWmouEwMLHo5fr0Omj9xAHAJIGhl?=
 =?us-ascii?Q?xcKjWl1vyscJGTkzu3sI+VaVm2ycnrwNteF/0jgoLTd96WPMmDjDWO5K/nNg?=
 =?us-ascii?Q?929MTu8va4LCz3CVa2rq6YCURfolocTBgUksLzOT86i0Vox+K8IvUrMSpLS1?=
 =?us-ascii?Q?V+xPXAumHPRYRjXQh3g9fbkMM9HYnPHLtdoTrwqdpKx5abyZYteIv7zShnVt?=
 =?us-ascii?Q?YCFT/dgRnQjFOQcAvkIOQnHBaUvE5Ka8W7AcfjFbepzNLzWO2+u4OogOjreJ?=
 =?us-ascii?Q?Jt3WKdil4ichUGom+fe+OpYCzCnb/wfAgcul/i+fqPmOZP2H8VmS9kY8VM6s?=
 =?us-ascii?Q?fH+II6RH+0G2pNd/tt+aJkfXJbGUix42nUwB70bCVKkCA01bPWB3lxUl4pQ3?=
 =?us-ascii?Q?NW51TlgqrsIsdDW+uummTJ76VFh/QUQfRwUpzgBTpMCEZH4jODxWv5AJiukn?=
 =?us-ascii?Q?2Bu91Wm05tHGKh5hLdv4CjBIfBgZ84tDW/reTfnX+TPf5WQTPBeNn8coO5tO?=
 =?us-ascii?Q?ENuYYizSGMyqcotpJSIhhiecpVpXcNoxDQnquzlLAFg/y/CxAryeQ9Cl2sUn?=
 =?us-ascii?Q?QkYnUhE6ig6JjeUfrGJZsvhFLxlQ8moJ2uW6Twf1GIfM7apIiNZic3jwMwj8?=
 =?us-ascii?Q?jTX7zRrY3fL999qh1k6MQke46lX74DNoQwO5D0Y6bxrFr3qHSgStTT3DrbHW?=
 =?us-ascii?Q?kXxbehSLJk6kZfL4JZiQFxOx+ZF3PkkKYILwSBzWa4H6UtW4SESRBO0q350R?=
 =?us-ascii?Q?AWRBYU/bBZD93X8xdeYzKYa9v97HB12T8vj3N54zwgCZT7JZd+9giaFw0c96?=
 =?us-ascii?Q?xoUYdCaTOrKcNwiBncr27RVPInQmy6Ulon/ciQHkTekrttO28yAwU0PfWhfS?=
 =?us-ascii?Q?AZPpZFflFLFdg7pTaskJm0iXgA1ST5khDs0inFfm8Vyo/F39p4jitAHcHWxS?=
 =?us-ascii?Q?lls9HPGRbMDovghYZ8QwskhuczkNLpwdTHWMQbLPx/7g4gkMwJ0UGc5EZxV7?=
 =?us-ascii?Q?o4EiCvndTOndxCBYK/jdYeoXT+K2pDtR0K014j+R?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd3e9c3-6608-4c7c-d918-08ddf5f74651
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 14:34:14.4766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bYVynuxeUG8dteS8CYB7EhbRlUmOR0rtfb1XO0AHAGORNQQ4/TBrYzic8eGAQYH75WMs+wK0xupFxXlaDPflQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7628

On Wed, Sep 17, 2025 at 09:19:13PM +0800, Peng Fan wrote:
> The order of runtime PM API calls in the remove path is wrong.
> pm_runtime_put() should be called before pm_runtime_disable(), per the
> runtime PM guidelines. Calling pm_runtime_disable() prematurely can
> lead to incorrect reference counting and improper device suspend behavior.
>
> Additionally, proper cleanup should be done when rproc_add() fails by
> invoking both pm_runtime_put() and pm_runtime_disable() to avoid leaving
> the device in an inconsistent power state.
>
> With using devm_pm_runtime_enable() for automatic resource management and
> introducing a devres-managed cleanup action imx_rproc_pm_runtime_put() to
> enforce correct PM API usage and simplify error paths, the upper two
> issues could be fixed. Also print out error log in case of error.
>
> Fixes: a876a3aacc43 ("remoteproc: imx_rproc: detect and attach to pre-booted remote cores")
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/remoteproc/imx_rproc.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bb25221a4a8987ff427d68e2a5535f0e156b0097..12305f36552fb5265b0953a099ea0d561880e3ff 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1046,6 +1046,13 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>  	return NOTIFY_DONE;
>  }
>
> +static void imx_rproc_pm_runtime_put(void *data)
> +{
> +	struct device *dev = data;
> +
> +	pm_runtime_put(dev);
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1125,12 +1132,23 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	}
>
>  	if (dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_enable(dev);
> +		ret = devm_pm_runtime_enable(dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
> +			goto err_put_clk;
> +		}
> +
>  		ret = pm_runtime_resume_and_get(dev);
>  		if (ret) {
>  			dev_err(dev, "pm_runtime get failed: %d\n", ret);
>  			goto err_put_clk;
>  		}
> +
> +		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
> +			goto err_put_clk;
> +		}
>  	}
>
>  	ret = rproc_add(rproc);
> @@ -1158,10 +1176,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>
> -	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_disable(priv->dev);
> -		pm_runtime_put(priv->dev);
> -	}
>  	clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
>  	imx_rproc_put_scu(rproc);
>
> --
> 2.37.1
>
