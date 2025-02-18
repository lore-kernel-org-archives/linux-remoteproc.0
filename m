Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645B212CD96;
	Tue, 18 Feb 2025 14:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739887306; cv=fail; b=nXDtg7qj3PjIs+9u7RaFe37/qlJsKaJ9dZXgE5Ou4YO0iJ51xGI6tIMKUIYBEuQiDStpR5NQp0D82K9UYeuvNU9CwhIWZIshLEI3jdPMLnVtEFpPpvzAJyzIDaEQDNbrvxVN0TEM4ol7P6jgNSWfHu5pI8OKtDwEkcwDMfFM6tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739887306; c=relaxed/simple;
	bh=1ExSnw4JyijQD2ymaKCwQ4YSULUXiU7Tn2BPgFnDOJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=BysMQPTqch5smzpCK0hPMfi0FmdvYALqdUSdXe462gXl0MkXHO/eUHBK7J4UneqkqCvK8FZxSexPbnANxkyXzahNzn7GouiHoefU5uHRDjcu+h4pjy2+QiVnIkeEnzFxIJ5RmaO+GMEQKYtUUjj4xof20bqULrjyAcuZC/tnWG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YASki/u4; arc=fail smtp.client-ip=40.107.159.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YASki/u4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJmXbLb97Ul8fis8rQiXvU+P4Vsv294YQ2dg/KrBdieOVGJW6PQUvL4idiJk96u5neismMopbm/mdxR8ynlE6KqhnsTxVRC8wSjr1pVhPBSfbDX+vthQ1eA/CfKzs5e8RVkQI+bHfOHiwnqbKMeHeURG29DIuganAKQD03jHlhVZIyQAVEQSGZtt0Hjyzo97XYk7jrYVEYst448HMZSUkHjq5QudBxP7SoTwjctnVdt+/aDuPxRDKD2eyc3X+gLXZZ70rTPHHRA1CwMn8gcYKXNL8dA9v8bmnt9oUGGb5UhANyiWnv0INl8qOW2IMn7cl39eRCJVKRXWEvtKqg/spA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OQXrCGgIax72fV7iP2OBRMDakN1CxP0zpi3RKjbn7Bc=;
 b=HcgT/QBTI4gT9jW3Lk07C6u3x1fJypDfDCusdMw6C5AjFQn7f2MSLWxhnXu+daAZjQi5XSdcV7+u3d2i1bk/YRnVVN3xJ/8l5sX0DDbIcBVpYs+A2hJPUuG3AHa3JNt+JQ4AwEhpgjdqekQB/0+m/dxUohsmgistNX/XtTv6oWThOelFvt4AIeW+iI1WGI5qkRpXatVRG3+nWtIQ1yiqxX/NFD+aeenOjz9MmKcvNdh8HxsAEqlpwdNBJSY76zFzqX3Wrta7+S1xQasL9cDdXl/CZkuDX9PmhgV17F5ejAVuzFooH7u+DkYKGSwIga4Z2gYpLe0RmCF2Ki3tv0aLiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQXrCGgIax72fV7iP2OBRMDakN1CxP0zpi3RKjbn7Bc=;
 b=YASki/u4emeX6QN5hLTX6IxJIR0CzxbyzmobYomypWrp7lgG0KG2hPBTB61dbXBruHMJqBIXfN2AgZRU8E7xCqgZNDdEJMd5hNgcqNqikrF9iMXUq+CXRN2rAa1VrdsiaHE4YSyaLggnqA3vbyhA7BrdX84cukoXeLAawMrUCiCNC1A9y6dAHz61h282fO0T1cIhkyjtJCpDN1lw92qMQ+XmAIGAqCWf7Xl+OrGs12hKGcpRr5XdUtlGvy8Y3gjnWD6W803sUyM/pgRp1z2JEt7A3z58+rtPlEq+WY2k1kGAMenrtF4iEBw+UVj/xTjn+pJ43pCGyGZdEW7t8koFIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PAXPR04MB8078.eurprd04.prod.outlook.com (2603:10a6:102:1c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 14:01:39 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 14:01:39 +0000
Date: Tue, 18 Feb 2025 23:08:38 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: p.zabel@pengutronix.de, shawnguo@kernel.org, mathieu.poirier@linaro.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, andersson@kernel.org,
	linux-remoteproc@vger.kernel.org, iuliana.prodan@nxp.com,
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, Frank.Li@nxp.com,
	krzk@kernel.org
Subject: Re: [PATCH 2/5] reset: imx8mp-audiomix: Prepare the code for more
 reset bits
Message-ID: <20250218150838.GA6537@nxa18884-linux>
References: <20250218085712.66690-1-daniel.baluta@nxp.com>
 <20250218085712.66690-3-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218085712.66690-3-daniel.baluta@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::11) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|PAXPR04MB8078:EE_
X-MS-Office365-Filtering-Correlation-Id: 959e6554-1d56-456e-f5dd-08dd5024c3e6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Oa1xVDzFRyUkKxdxltD/vTrCJsCxuN6ku/gxAYffjPMKWTLl5o6AzSJbYgdh?=
 =?us-ascii?Q?o3DxSjH3dbPHKDWElVGAhXEG0uyemkZTvMRDieuI1EMjhKcRW5JlWJQGjQq7?=
 =?us-ascii?Q?qo+qn+fGX5qjmO8O06nuqLlL8waCn08F1mnL3VTk0Nm1MtG7b/VnWuIj+Vnl?=
 =?us-ascii?Q?D3yDRjI6PMuIfkPcvln/G8UghLu/Br10/mln2F2aKWEVshlkSe7BS2evG5dO?=
 =?us-ascii?Q?Nv1AzFDKT82B8dIMEIXfansbKkBNXyZoqePKBGOWy3KiDdR4B9jAnK/M4evp?=
 =?us-ascii?Q?NYBSU8/5MUTtvpUoKxCIXr2/V7JS8dWnPwUMI1wo09sg+4FsvtntXiPsewOt?=
 =?us-ascii?Q?BT4a7TSQkmVZ6Ncg8q/gjiMGX3XVa+ek4TiD2qT7VsKO/fWpHGLFhWNQm8Ad?=
 =?us-ascii?Q?nQ8HCS0CTDFOJDh3WAxG1a3I/tOZxbXsfAVEKe0jzWcnu77RmtL+oUc/8vG8?=
 =?us-ascii?Q?igJ/iYCTqUGzKO1JhKph1KYQF6rfU30cChopZVi+GCV5kih+t/ZDH2FUw8vX?=
 =?us-ascii?Q?zmcnX3WBVSLMoJ0D4e2O+yHXa4CahmjIGKrXhFW0pUE8iM7FpNVmM7cYV9hF?=
 =?us-ascii?Q?phq0uZZ0UP9wVCtDcP/Qw0ximDFKjbX62Wmut4XyBNBqc0gk2cCXmH0Ak4mA?=
 =?us-ascii?Q?hqrEzXdOc/f+Cjotv1HvZtwIlN+JFmkhokw/rUltdEPqdTwAwkYFWt+JzU1U?=
 =?us-ascii?Q?WLf/Zi2unm2RzkrarCdUsB8SC6nC6M0wOIwxL/OhoJpsEo0XVHShTF3nnBUA?=
 =?us-ascii?Q?zQYC+I0mdW2T1g+J1ruMeZuNwgK2p224w45VNHQ4EL3AlCXtJZKYwQoWxzZC?=
 =?us-ascii?Q?D0NTyVwb9JW1b7Y0YAtvZBt97JIG3Tei1weX0oSBkhz9IO0tRuSROBq50q2C?=
 =?us-ascii?Q?uHlqu4rn2uASktmhH5F0xYpE19G+G86mQqkqbMMbazI951R3t472ZDB0RePR?=
 =?us-ascii?Q?4NkyGFPVwe+/ZgiExxoDmOTObadMIZSJ+ZTyYbEmi3CWr3PwIM/VbEFoF/Bp?=
 =?us-ascii?Q?w8J3NOz04MsIKP9of8tqzTodSXyuu2qZ8Li5yoPGQ5ZmissvgMxWxwiVkC2A?=
 =?us-ascii?Q?K1CX97AXXULZv4hpPxFVajZBtJ/RfGn48eIkiSzj3QaoAu7xu1FwAAWDEVaR?=
 =?us-ascii?Q?3kDxS/yD1kcTUop2o1hYM3D5L7Pyh1e1LjL2t5nmGg+7WDQYwAqqqjakTZb9?=
 =?us-ascii?Q?AvApb9MPFr4qM6qXnb3Vi9fBPHZNyAHE6Agp6TiA5++I1yejap/pRFQm7puj?=
 =?us-ascii?Q?Vr+i4s6sQb+ZCcCzIIcGIUsebaPHW5DtV49j4Pq8OXmqRuyV/G03ltO/WcLO?=
 =?us-ascii?Q?qdSkhmSFfb9AbRp6bqp8Hg1/fdb6EHLdvzU7nDu6Y0vu/iJxSERfkFjF0oX3?=
 =?us-ascii?Q?QIt6dHYw9n8Fy9YlTTNiASOzFuDlkT67Is0rV4m3hJLOJkwX5hhurCdPtCd9?=
 =?us-ascii?Q?f+8UGMaMd6AZ0uJxM5mG8nGk01+X7/8D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kt0uqph98a4/iexGcIoimN64lSzja4mkN3NvL35+EzjM+xSEe/Zvt/BJd8QM?=
 =?us-ascii?Q?xmGNa5xiAqTeVSyKUCSJyBUX5romjNgE2DY7F57bESbFR1pAgL8lw8uxE9He?=
 =?us-ascii?Q?WrsFSSmtvy3ASM8+t9bZqjaeMBis4MFU2Jwe4uzJMWgX795uqkdl9SvZNejp?=
 =?us-ascii?Q?zjKpGOvUjH/65RMS+Qtg2FHNumEBxndBzj1GIpZo3KF+t3aR1TTd0gAValmE?=
 =?us-ascii?Q?WnXVIR2Ez7F+cAgAAsgxztz0HG0ijJqy/BpFRdK6lLp5D4mnFuXDTYj4w+CR?=
 =?us-ascii?Q?InAf9UAZLyeVjzlaOERTMsPI62BsD3jKJljxovh01EG4yFZw0PjuBEYY29I9?=
 =?us-ascii?Q?qV6NB+OflnqzJhZl1NlE+TM928+3o6+60M5+le2qx5Sed1IVb/kG1rep8tc0?=
 =?us-ascii?Q?roZz+X7i5GrTED6yNxNRvygkIpvyqpKihW4WWfQMLc6/Nmloj4ax/EwXT8ei?=
 =?us-ascii?Q?Dn+Yvpch3HMtkGOyc7yfsZOfs78GcolVcMrh7cJWfo5/sx1TC7eHapy9nEZ1?=
 =?us-ascii?Q?oDFRKCY7FCZL6LlqY8mKdlBZI72VReH+9JynVqyCErDDSDLYz9tkPf1l1dBa?=
 =?us-ascii?Q?uDu+w9rm+ioELyeDOzOmRlhb4v3y3tMOE2nPr06NpAdCmkMvFLWMY36FRytX?=
 =?us-ascii?Q?hOF61SA0yb/yKrMbUcmOAq7XdQioDfG66CaJHMmXiET1uB2HzwlAuByIu5ya?=
 =?us-ascii?Q?+p6Ggl0vZpYRQtp8LfzQgewTwGku33mn/6HGsVyyqnQh4kdiipEtCTf96+xb?=
 =?us-ascii?Q?/FWQfee6aAgH5QNVeQ8brpfUMrI79PgbAKD6yCEkGFERMeV2z0+63MG3FTRP?=
 =?us-ascii?Q?QTRAAM+JEybg+aBSQl3TbdgJbtBXn9gWYDgL2hXmtA5cJWMlwwBOvNPiVYiL?=
 =?us-ascii?Q?fgOppfkRd/dPkkoM/TVYEOYaTxZqD5R4Hosc5eMjHTojrCqc0kz91jc7gGyt?=
 =?us-ascii?Q?bEZZ7W2YwodVnW6FBL3p3nXPwbc2wpdDMUSaPxb0EtNlZvnKkNnLVxvm9Fqn?=
 =?us-ascii?Q?Xxg+9so/D7/ZXZ9LQDnxbrblAwcWw2qvkiykeyf+sPm5ZFUD1n09y3MsLyZm?=
 =?us-ascii?Q?t+Iwsi7Cvzx17NmMiznEp30FZlSsv/0pW/YQGPKCzaXA6j0ktk49cpivMr8y?=
 =?us-ascii?Q?8GSytZqfrflNtHm1dSYioigfA/r3va/6x99FMZaHMDOOsLc32cA9hZBmEA7g?=
 =?us-ascii?Q?lYJlfbVroU2EdJXLp2HA+F0/6ErKihJPLVwk6Xv/wN7HuOF4DuqqA0Wptdcc?=
 =?us-ascii?Q?U7JFHna5LrBHpSfNApNTnNSaWCifULz0T0/W4E8DrW1+r7eNBB4OpsVm/plb?=
 =?us-ascii?Q?pLMdfL2wmlbjttFXMF4wWxoZ6rKvw3XNDiv9rp0fN6+un1R9bKYm31xgd+pw?=
 =?us-ascii?Q?xmPO//3wTBFeCthTGrKUv7RJKgCWolz8XjRfKlEEAsfpq3Cf+oGZrcp1VkW7?=
 =?us-ascii?Q?ZNx7c67D888DM0vdA9J8a5FDPIKyYwGap79ZlBHF3JlsG8I0dvGqdqV7rIi5?=
 =?us-ascii?Q?DWANNaKLd1ZuomQDgXZhynqFAlSnmLIX7oBibVKMfLXHKd0iboypI5WuNCMx?=
 =?us-ascii?Q?5fzjlwpid7P2BDCTsvJNG056KFjuDFyz0CjFZRSc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 959e6554-1d56-456e-f5dd-08dd5024c3e6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 14:01:39.5274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxXjSELM9le5KwwRDB7847Gqe8VazwVZbTKOc9qk7NjMot+G3xjGgnP8D+RKq1RQ7oEReDcGSLVRgNWz4yNHpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8078

On Tue, Feb 18, 2025 at 10:57:09AM +0200, Daniel Baluta wrote:
>Current code supports EARC PHY Software Reset and EARC 	Software
>Reset but it is not easily extensible to more reset bits.
>
>So, refactor the code in order to easily allow more reset bits
>in the future.
>
>Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>---
> drivers/reset/reset-imx8mp-audiomix.c | 53 ++++++++++++++++++++++-----
> 1 file changed, 43 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
>index 1fe21980a66c..6b1666c4e069 100644
>--- a/drivers/reset/reset-imx8mp-audiomix.c
>+++ b/drivers/reset/reset-imx8mp-audiomix.c
>@@ -12,7 +12,30 @@
> #include <linux/reset-controller.h>
> 
> #define IMX8MP_AUDIOMIX_EARC_OFFSET		0x200
>-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x3
>+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		0x1
>+#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	0x2
>+
>+#define IMX8MP_AUDIOMIX_EARC		0
>+#define IMX8MP_AUDIOMIX_EARC_PHY	1

Should this two lines be put in dt-bindings?

>+
>+#define IMX8MP_AUDIOMIX_RESET_NUM	2
>+
>+struct imx8mp_reset_map {
>+	unsigned int offset;
>+	unsigned int mask;
>+};
>+
>+static const struct imx8mp_reset_map reset_map[IMX8MP_AUDIOMIX_RESET_NUM] = {
>+	[IMX8MP_AUDIOMIX_EARC] = {
>+		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
>+		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
>+	},
>+	[IMX8MP_AUDIOMIX_EARC_PHY] = {
>+		.offset	= IMX8MP_AUDIOMIX_EARC_OFFSET,
>+		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
>+	},
>+

blank line

>+};
> 

Regards,
Peng
