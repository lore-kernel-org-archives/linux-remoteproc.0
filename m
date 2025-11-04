Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011059.outbound.protection.outlook.com [40.107.130.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF62C26CE1E;
	Tue,  4 Nov 2025 03:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762225914; cv=fail; b=vDw6kH6on55l5Xr4edMfm7ImyZSsKj+mtJhceyPpenVHunTIoEfcF9kAvpCe5q5+15W81/XOPSsVGLPa+peOvwySt80kv7Xi0UuJaLFKgOXtwoECLaGcAtsi7IRDBnAU3XVl+sLHjDTMIdw/oqn0CUbEOHDe4jYjZwpfVuuX6Eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762225914; c=relaxed/simple;
	bh=wagTRA02upeL2wDtojxnN1aW9GSvM56vYrinksilWiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cCL6ms2qR7EO1Q/kU1WIc4okCBxam5g5zNATPchOG6KNVfvO1+vB+qCPRl83SQ9MnhJmo0N3/cnJqN2TzkKRuj3hrV6SooOkFhV3RUDC6bu/f1sHG6b+91iZyhW1VrSqxvCQBN46PHpU8Q2OEtVVYUyxabUXX8o/9505MByntcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Ca1K8pCt; arc=fail smtp.client-ip=40.107.130.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ca1K8pCt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9IdB0Dce1CRCChG5ZsWEg/QpmwLlYjgNkwZgRQdqgwdqMloH3rmnbYkdo1Od5Z38ZpHHdA+x/oVsQBJlex7zI87aXLWwJgaQz94+C32yF/v7FeG38eZgjQDYuh3vJh68JNLTD5lgFthlsA0MCmr9tkOS24AE7KKM+sSy4vRyisqBXEuPw20fur/RCaqDo/hYcGH+CiVojjB/RjrbD8XhmN3rjRxkms80aJlhe+krxsX3ff6qTmfJWCAgg/C/LQnaEK9JyzMUX3gmjyKpypLYb8wu2Bfd1t982c1FEn7+R4W2my8F2csLZ6NPBmJUjQTjF0ofeCjRThbGUsisbAftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8lPryox6o3CO17kF4Vef4CA1HTdCCbE37Ow4Bicjjc=;
 b=CxaxxhrvBRx+5Nh1bCgd+lMgF1sF7exgHJnmIoiwqMGld3hJu9kTmicNgMZLg0VMrwZpInjSlxrJCMWZRn36XMei0WqLKmkDmK+KIVIiJUhyeTIP0BKkb1A/X2D4P5xosnOxS0B19atKcivXxPn0RdeucQDphJLIuItENu5iHIQLzgh554QZm1H5GjowjczPX8Xc9985E9K/xzSRwobSAm6N6z+BRIDrQZmiByidd/JqXVhqj1xI6BcQ0Z99j8Do3aF/SmxJICWXv5rEfk2HI+LE8rH0Ya2yUQ3Ss4V/oY0Kpza19AM1Vr3TD1YBjekw5/34S0kWL0vlxNN2F5LM4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8lPryox6o3CO17kF4Vef4CA1HTdCCbE37Ow4Bicjjc=;
 b=Ca1K8pCtgmLpUFC/WII0OQPj/W7gzmLPJ7MjlzE0W5EjJeGCOVC3BT++jysXWiZ3xRls6ZEPWRlNKeW95uSOmZyQgW34pxVUuyQdK8b3T38viWUCRu/rly1re/Q9EWJtmDcjkIi9UarWoZ0H3/LrbOa/moNRB0jjIVFbBhfjd+We01lLGl9B58gg1lQF0U/INmcsxkOlCvex2A4sA0K9Tmhca/lltePu6+ySvwycyuiWbYK/MtL1mlyuxHDm3GS51ngsVRbWXpPwgI/a7ZHDbkNXzmudiVA6iUsPoLG/PN0yRe8IKyWOURzbdWb0nfzgm1uWo5/pMB0/dgGf/ypreQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 03:11:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 03:11:48 +0000
Date: Tue, 4 Nov 2025 12:24:12 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] remoteproc: imx_dsp_rproc: Use
 start/stop/detect_mode ops from imx_rproc_dcfg
Message-ID: <20251104042334.GA11714@nxa18884-linux.ap.freescale.net>
References: <20251031-imx-dsp-2025-10-31-v1-0-282f66f55804@nxp.com>
 <20251031-imx-dsp-2025-10-31-v1-6-282f66f55804@nxp.com>
 <aQUIR9YhTPxY0SpX@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQUIR9YhTPxY0SpX@lizhi-Precision-Tower-5810>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG3P274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::29)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 89187913-ffa6-4f3f-3525-08de1b4fe484
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0tEfQyBPq/7pKmVmoOhkVB/3NewcFvIEhN73RysjHSa0mMo+nqyL3EGWJdRx?=
 =?us-ascii?Q?7AJIUXAMN7TH1gJnBQBkBVxtmEqAWieR41LFiAsepnOnRI++ZMXFY1YiwRWH?=
 =?us-ascii?Q?pnjPL3ip+3uJ68GmJCUQRufEfjudRLeHs8uYXDoUCTtbUeMpdLYdLK693lFu?=
 =?us-ascii?Q?1595Vja3KMA9gjRYicTqJOxKYbpMETmg5vC2nadnepjcz0nJ5Wj7BRjyZI3j?=
 =?us-ascii?Q?6MH0JjvQW3lNy0EUM7BUrleG8QB0HmZHOVm0URvzBiW7qfioj3RFPYQej1bT?=
 =?us-ascii?Q?g44XhV5xYrV5tZKe8RosBLs8ZFWblZjvMx+FE92cgSJuepanEJMIi3/RL8nQ?=
 =?us-ascii?Q?Y0mhhAsMReY1BZqA3W3GuVbcCBdwRkNI8+3rBX0/qxkE9CHKJvwxpoxgY/o6?=
 =?us-ascii?Q?XjnVp8NJ5Axkxuv2R7iwK3FN+lZJb9w8pBsVOc6xcsexfSZVZszGkrBXchhA?=
 =?us-ascii?Q?92R0Q5m+SZWQ3EPeOXytOAd3UYvDBWSnseoxC5WRc8jxi9AM0G0vQu5dQYkn?=
 =?us-ascii?Q?P2bjlgyIFRLMflUNRjE6bkeV+LSNpyPId94Jp9UEmB/ATJneNWwrstEh41sB?=
 =?us-ascii?Q?mJrKJB0SKAWtFRvVrh2rphc2thotqo3n1kM8JrYi95We+r7LkcbwZ7KLQqZL?=
 =?us-ascii?Q?yQEUHz9WZ0pf0WS+6LuwautiJKPQn3NB4scc+g0vCk3T+2MW9JiVqVwyzZd8?=
 =?us-ascii?Q?gO9HtZpCPwPH+2m1BhBbS3xlibYvxdx9/UrRRXC+3Cqqgr1NchoS4ZX9q5n5?=
 =?us-ascii?Q?F/2yYALYVRQwaXuUDtlskvyKwRtHkF0toLmgA5/EBxFwGDxpcdE2iqMRinZt?=
 =?us-ascii?Q?hhSjGtENmyEKyBWPs1O3pNDw3VbAySZFbOBzJ+0cRhw53oc/y2M3eo9JJ+E4?=
 =?us-ascii?Q?Qnz0h3aT6q0yzgIU7bsRngD9+QqvjBjFpcFfKRdr9g2wWLaGKkLG5exXcGlP?=
 =?us-ascii?Q?ITIRVxbKuEDIrnsby7XZXLsVFCRz6+nAbhkePwHKELAlEGqNSVJa+UIBf3YH?=
 =?us-ascii?Q?KTFoaAtFsXeNHJcctMQEb4beYBmiB4ToG8d8Ie2hWeKJYrH/jh4Eqfgl91YM?=
 =?us-ascii?Q?5NO6S/EU8fZFE015Rp2hHUo25mrrIgfujtcLnvcDn+zVu8sB78K2lyNQYkjS?=
 =?us-ascii?Q?9CuzaY565O/57e9cBOZDK6pz5mYyh2iZCNXy0hgyGb3+TRgReyuxQUVG68Jc?=
 =?us-ascii?Q?mlhLjjPIzk8r/UVdTOvURrHuij71EOkFEZTLmWMQHwuB9HXB6dKVFPDNKI0b?=
 =?us-ascii?Q?lvTd9n6o0xh8sJ5KDy76OoIWxiqv7HgTE7znSuYm/AhyWolJXyR6vGNiv4us?=
 =?us-ascii?Q?EluTp3ry5yHFG9ZG7n70wegTCowxG2e0l4b02/ASjU6uuyp2DcmPtcYNnpJy?=
 =?us-ascii?Q?K6l26ERKMu1h5Q3FL/TnJ8eGjWXINEd9XMOPNaRYVShu2S/rvajR3ukNHRZp?=
 =?us-ascii?Q?CoCS2sVzoHJaoIMEgMmsRxvA2fGcL8qjlbgKJz38QKESD87AZI/4Af+SFCY8?=
 =?us-ascii?Q?MsGnpQjnlFlVzeZkrzFZ8+kcimrlVn9MWPS3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E4icVr4Tzf7UFOZ1BCqN+d8c7nEmsR+kVugHDgHlquViIdB1ku7Yeg/ywJ7d?=
 =?us-ascii?Q?/5JzNxfy85YijhPs6zwf+AEdRD7WsFAItDeR41NVQZTAzSKbqS1k9w5D6gPh?=
 =?us-ascii?Q?JnJza3qW4eZvDBM1m9S0QKaUfPtBaxTkvk3Hfe6DTQTLCB2zNcVamfdUxpYC?=
 =?us-ascii?Q?NX7nM54f0/a5PdVVeTxVwkr8wYu0L5nm4u95H8YhzAEichC/n7lkXhDaf0hp?=
 =?us-ascii?Q?5TqMd9ZXhWFU18apqcuad41iygPptyqoS+7wqSrl1CD3snn+K/DC7XvGQVOY?=
 =?us-ascii?Q?8eqt+Sg28b4lKeS0Al+rRVhg/RSyqy4R2Uu66zWh1ceemV0tqq4qWWy3pNAz?=
 =?us-ascii?Q?zcv62oPVoVELa5hM7IAHpBBSWogApXe1KYtI4xib9reZJ9Eo6kuAass9lSqX?=
 =?us-ascii?Q?YJDlkM/iBhZmMCLQ6XDgzW1SAOjIu6k+euGXdfVn6/SdNu40p6GPLXEJbxky?=
 =?us-ascii?Q?BNf8VfAmzn81kC3KPZ2St71NckNQBNm9bBSJWSaeNW/VgvzRm/qiylh6RwBR?=
 =?us-ascii?Q?v43fN6p+/i91ZXE+/Y+E9YRK40cAfo1PoCWTEmr7LtSdaIKtpq6wueDVqSNr?=
 =?us-ascii?Q?qqYWjM6dq5qu1D1wP7UhI4BzvBaLg2B84XVpNlFmA/SofvqcsWDgRVU9WDwv?=
 =?us-ascii?Q?0fGcmjWgRaSYNF1sGKrKwlvrQTRcFzP84Fs977/+9cHbhGWOaR02XGeEy5BR?=
 =?us-ascii?Q?VEFyJqR90BAl3pl4pdOoxbyH+qAJKp8Pf1PcSEVpdEra1ZXfgPSLGvHQSCjV?=
 =?us-ascii?Q?6MEcSsAlTL/dlx+z3S4+e+sAfL8pB7qrSDqdQ2KZ5Wk64TjwcbaXVcHyGZ+e?=
 =?us-ascii?Q?iW/kN9qAf1PaCSK0AeHRCixit/soaMz8sZntxaB6m1RxNNdjA4re5WLyCrwZ?=
 =?us-ascii?Q?FhhrslaNUYk8R/78bAmUFGevd4an0CczWjmO01uS6pmppJX2EmoNpptUZ6/Z?=
 =?us-ascii?Q?Lug5i6vAqzEgja+sOtywn6Yke1obg/plq2vf5BbM7JpXHqVtg2tXN7Q3F3PE?=
 =?us-ascii?Q?zO6bK5I5SJJCc/7jiQs/+MuoEyOJOe3of7HsYK3gIYwUpCE3tVxKp1flHR+t?=
 =?us-ascii?Q?/TJEn19cs3h6lYaWbeDgvUv4/SYAt85PaDINesYbbx8YknM4736rTMRhf2Tw?=
 =?us-ascii?Q?CBEjsZHvxCubFySB/WUpXLPttsfpqUbkhPBD5LidbyPf0pc2W/2JpTDx3zV+?=
 =?us-ascii?Q?D762FQJkGbrDZTVKCPPy1Yh8AIvikeRcrqZjALwR37F4KzAb8U2aHP/E6noA?=
 =?us-ascii?Q?vOnvdwRwayEQyKYKOxyiBPddFjDcP9qgQY6UKVWNFKd9HVnxPGSw53vOEYPd?=
 =?us-ascii?Q?ksvaOVwkcX4flrakF0DkizPjfMiJ0pYCRkWEuTas1v9b9XfpXL5Lbv7PO1im?=
 =?us-ascii?Q?qAvMps174Canf0ijhVlnWAINXMDBo3wecxJclhXOYX/5AvuLEWsva9+O6icP?=
 =?us-ascii?Q?XUsUEK89E/0wretS4am3yuhO6qmfsqeQuvij4Z9mJsGpjXA8viVfuvkGxUaT?=
 =?us-ascii?Q?6dlMFC5wS+xqAYPHUoLQejmb7sQxqjaVrI9s9NkBzGpIYLHCDS6l6qLkqXCx?=
 =?us-ascii?Q?D8O0qQ69zds/QlWCcMPNltx17Or7As9RWr8XJ+M9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89187913-ffa6-4f3f-3525-08de1b4fe484
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 03:11:48.6099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EnFZVnIPGsPfJpPnWqQdbpekCnDhk+awaR7drpCNSAYJCEj/WYB/bapGNiLY4OGcLheqaUjl0zQVFhwHe8NgCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272

On Fri, Oct 31, 2025 at 03:04:39PM -0400, Frank Li wrote:
>On Fri, Oct 31, 2025 at 05:08:35PM +0800, Peng Fan wrote:
>> Allow each platform to provide its own implementation of start/stop/
>> detect_mode operations, and prepare to eliminate the need for multiple
>> switch-case statements.
>>
>> Improve code readability and maintainability by encapsulating
>> platform-specific behavior.
>>
>> No functional changes.
>>
>> Signed-off-by: Peng Fan <peng.fan@nxp.com>
>> ---
>>  drivers/remoteproc/imx_dsp_rproc.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
>> index 1726aaa1eafb9ac1a913e3e2caea73801b86dc09..833b1bd4019614157f0bedf09bd348caab802eef 100644
>> --- a/drivers/remoteproc/imx_dsp_rproc.c
>> +++ b/drivers/remoteproc/imx_dsp_rproc.c
>> @@ -404,6 +404,11 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>>  	struct device *dev = rproc->dev.parent;
>>  	int ret;
>>
>> +	if (dcfg->ops && dcfg->ops->start) {
>> +		ret = dcfg->ops->start(rproc);
>> +		goto start_ret;
>
>not sure if error message is important, maybe

I would like to keep the error message. Since this patch is just to prepare
for ops introducton, I would not change the original behavior. 

Thanks,
Peng

>
>		return dcfg->ops->start(rproc);
>
>Frank
>> +	}
>> +
>>  	switch (dcfg->method) {
>>  	case IMX_RPROC_MMIO:
>>  		ret = regmap_update_bits(priv->regmap,
>> @@ -424,6 +429,7 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
>>  		return -EOPNOTSUPP;
>>  	}
>>
>> +start_ret:
>>  	if (ret)
>>  		dev_err(dev, "Failed to enable remote core!\n");
>>  	else if (priv->flags & WAIT_FW_READY)
>> @@ -449,6 +455,11 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>>  		return 0;
>>  	}
>>
>> +	if (dcfg->ops && dcfg->ops->stop) {
>> +		ret = dcfg->ops->stop(rproc);
>> +		goto stop_ret;
>> +	}
>> +
>>  	switch (dcfg->method) {
>>  	case IMX_RPROC_MMIO:
>>  		ret = regmap_update_bits(priv->regmap, dcfg->src_reg, dcfg->src_mask,
>> @@ -467,6 +478,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
>>  		return -EOPNOTSUPP;
>>  	}
>>
>> +stop_ret:
>>  	if (ret)
>>  		dev_err(dev, "Failed to stop remote core\n");
>>  	else
>> @@ -1085,10 +1097,14 @@ static int imx_dsp_attach_pm_domains(struct imx_dsp_rproc *priv)
>>  static int imx_dsp_rproc_detect_mode(struct imx_dsp_rproc *priv)
>>  {
>>  	const struct imx_dsp_rproc_dcfg *dsp_dcfg = priv->dsp_dcfg;
>> +	const struct imx_rproc_dcfg *dcfg = dsp_dcfg->dcfg;
>>  	struct device *dev = priv->rproc->dev.parent;
>>  	struct regmap *regmap;
>>  	int ret = 0;
>>
>> +	if (dcfg->ops && dcfg->ops->detect_mode)
>> +		return dcfg->ops->detect_mode(priv->rproc);
>> +
>>  	switch (dsp_dcfg->dcfg->method) {
>>  	case IMX_RPROC_SCU_API:
>>  		ret = imx_scu_get_handle(&priv->ipc_handle);
>>
>> --
>> 2.37.1
>>
