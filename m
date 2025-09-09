Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AB3253356;
	Tue,  9 Sep 2025 02:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757385684; cv=fail; b=XtfV7C7S08e4rgr6I/QMi4GlNV3DDaIcRLGSOmXjQgT9PaL5GAoQBPnhrljy1Ppnq2gpy4PqlID4iQXO6Z+WC8KkdJPXrgdIQ/+6xFRLNzVaWTWRR8QtmN/dcTZXhF7izn/daD86K3rRFlf6sIsot4pTOJ0unCDdmIEhjC3AsEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757385684; c=relaxed/simple;
	bh=Vtd2VxHWoOXI1HDWu4495csIW7/V1EqzECDthHp5Kl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GNK4in+H+w4ChcMr4VrHplYN3DfbmVQtfHq1iRESFo/nw7xWRO9fcTJbC6llOdL31y41+RWkQuEfa3j74AeW1uxa9gx/3YPlY4GKhRcMzXhoLIgiW9KVZQLP66gblfrskohN2koj77D00eXnmGOnFCH3BBnUJKGpAnRU0vYnyt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=MBDJG2/y; arc=fail smtp.client-ip=40.107.159.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="MBDJG2/y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZjFz1atnUwHYe9B8amqHCKRIaN/0FAU/8j3cwS8XV2YmqK+cKphHR1JzGJlXiiU0i9t4dx1nVoKQFoHKmaxBeRT2LshQLHFWj8SHi9ADzR9OKgmRQ5h2d29S/VvPWCaPQ0q1lrrxUdDZtSoG4GTwLCmN+tvpuElrnJwPMAPbQdWK8Zzjmo69rSC/yp08wVeLWMo/yvDI2KBPQaLM2w18t64vou5fDrQIBCBwBbxQGDp1FIgIOkXaxvfUUpbhcz0qOCAMOUQnnUloKgaWqbgrTiUUU138ZA5nqGDsxyAC0qQO8az3CdgfOl3K2T/Ee6MZ4kLPFS6VdiqqXosQTNlwSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+EaksF1OFGAot+FgtgkEHBjQvamkXNf1heS5PzdM54=;
 b=O9XLYk1jUyCk5wV9Wd4eMlTfTkRZfntxME/AKw0t1aGadoypKZpc8g96Jo3/1e0NW+GF+KxFwQiVW9BJODIjEMy58rMy+wGDq2tJN+R4kCQw5EzR8w5PVbPkVOqqN0wJp/b3GQFQagXoTena66c7UVxOv6PSp1PutoMFM62IPKHbvKDpQR0WwHwQ+4i//g/crtmf8DHOFzOKEL+5padWCN/xhmhPaOO4v4VQsLWf0lPnRQMHGFW2Nztx9OgZ8pW/EHL7Bth34AnJTWrbAC15vwvjc06qhQGilIogJorjibrF4gN1sqGyC/LAJ0qWAoAXa17NhwYTdG5P4VNpOi047Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+EaksF1OFGAot+FgtgkEHBjQvamkXNf1heS5PzdM54=;
 b=MBDJG2/yz960Vgo3rWs7eFyzQcG6nZ6WZF9xYb0EushremXqrn2Rp7+gO406ZZcvfOxuPJ90hr27lKQOeZkgAI9icYGLnA8yVI0/0fT5Q6XIBQmnBq0ifZAjZGoiUHZ4oXKQc1IY/89z4zXPzOuHCLizK84HI1UYyjVFcmohwGowoeH+4/Y69hjVv91kc2z7oASiDlupbBQR1hHZZiJhiF9LS2aosTTSKFr/6eJ4SdjIZia02i0m/U9LwV+fiBjd+4+ALiOJwjTSC6ipKavwDdAgYvb3zFPR++6VCwwleNTGzbtSG4aYapL7h4kyi7XKgDnn7I4HGryE24uBpzsQgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU4PR04MB10693.eurprd04.prod.outlook.com (2603:10a6:10:588::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Tue, 9 Sep
 2025 02:41:18 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9115.010; Tue, 9 Sep 2025
 02:41:18 +0000
Date: Tue, 9 Sep 2025 11:52:44 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] remoteproc: imx_rproc: Clean up after ops
 introduction
Message-ID: <20250909035244.GA20475@nxa18884-linux.ap.freescale.net>
References: <20250908-imx-rproc-cleanup-v1-0-e838cb14436c@nxp.com>
 <20250908-imx-rproc-cleanup-v1-6-e838cb14436c@nxp.com>
 <aL7wUp3lS9E1R/gQ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aL7wUp3lS9E1R/gQ@lizhi-Precision-Tower-5810>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0118.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU4PR04MB10693:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ee74ec-1436-437c-d238-08ddef4a5ab8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?caOKaew1weBOtz9l4yfj9L4qjgUt6/X0+DwJBj91U18jHdksUhkVwpi+/qJi?=
 =?us-ascii?Q?t/y13dqgdne8eDqBx/e3fGPvnoVGev6fWQsr60dsOOKCPLpQDdT9xUcTAmoO?=
 =?us-ascii?Q?fbxnPb2DmCCgJRlTjYpHekWUt+0P0D0AxaoTsZu0x+O4p9wY+CAxbMPLRUjT?=
 =?us-ascii?Q?7FU0UBfWW5uzOAtew4dNgLQWn8YnzUKBEmQsN3EHxHDCJC/+1ZWMgzxLjwh5?=
 =?us-ascii?Q?tNcXpBYv2A5enmTJZzbbwRMxwUqGkj1/sPZoXff9Y2WiLCaDiZImPpf0NwWk?=
 =?us-ascii?Q?ltK4EuPCgThHNpBwhH/jaRonMSyxdoYc+VFsr1CSZgioTvzrU8fqFXrcFuBL?=
 =?us-ascii?Q?SA88Yf0lN4TZHs2hvNuIdu/toUyjHA5cegtrvqbc/xPYd973sIjvcAhsUr7q?=
 =?us-ascii?Q?srhxXXrO7Tgx8hHEOZvoG4JgV9zV7S74X1MGFkedCo/fRAQ7N/+JsqYlu6Lh?=
 =?us-ascii?Q?6DYd2ECgEijphbXmgjHv122YMKZMv5VKaN12dy+ULiMEdvxvSwPeftuAetvD?=
 =?us-ascii?Q?hLflmDT4o9GbOWwsGSTwRLXuwk6ERyAix+mCjSYJOekz34w14h7TrgAxl5Bg?=
 =?us-ascii?Q?5FWQl6B9a+lTb1Rdo6r8tlWxfVXa8wtiWRbJA1x5k6PImkFKx6+GUyldEFR9?=
 =?us-ascii?Q?Riv0qMRCghAY+wxcdnFtib54eO0O97tJWW7YdGU9828uBPgV+j9WL5FiIpfx?=
 =?us-ascii?Q?80Ei9hwQb3ThptkPgw+g3Y2Yks5MKON+ZW9/6MnksrEymom4PzeAVirn8dq3?=
 =?us-ascii?Q?UOIwhFAWwBzY9s9k7t2phwL7D5n+Pmat3U3y5RqFrrzR0w02SSzYAzSmmSKM?=
 =?us-ascii?Q?gDgM2a1VjmI0V909kQJfMRdmbdZL815n7I0cQQSogKtsjIFlMzPq9mS9vG8H?=
 =?us-ascii?Q?samW/e3Aie52U6SYKEMvaLkRrFw4sI/+QQ8/w09v2Y/gUovscZ+nKj6FiM+z?=
 =?us-ascii?Q?vsT9wNgSnjHAYMyfYR/jzIDLj4KvBlSgYt2TQ+8bnmFqtwsjhO4/wEGTVq6o?=
 =?us-ascii?Q?fkSNdMz0XdGyV/iqmxOM2RdbyZT9Sffk6A5c2XUyQfI3ZVEb7NTCj+UHhAYh?=
 =?us-ascii?Q?7cW2ALV8/fWzxmkeo+syA8Baz3hJWxkAgMHP4W1vkeeGtz2hn9fjZTPtomSd?=
 =?us-ascii?Q?2uKDpH8TUB2YMTBBaoa9K04k9+m/eNwj/qgwORuaV6ClrsFx0q0r2j9Noo3T?=
 =?us-ascii?Q?kOcx1CFLmItFRSqQT7G+MhmXf/QBqHH+y9HpXpSQxZG3f+2ZczLegZJ+kbBl?=
 =?us-ascii?Q?QTJQ8AyAfMleTtNcF7s0TCoyY1af2YouYY0jGXTPcg42nCdQ28HD8MwMNdBu?=
 =?us-ascii?Q?VGoIrH0T9AqfWjzDs6MHy5x2wiP25cuyfVGfRDm5M1QCjZQt3GYwz1rXbovG?=
 =?us-ascii?Q?g3rmUH2Sqgu3G8FkhXy2okF7loYD+J1sTWehLy8P/B1jtp0c4zqeynPhHEEC?=
 =?us-ascii?Q?7yt3yBepW9c9MKM95Vi/zeNAXNlglDp+/yItH/3CyceVRppHpYhxPw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DSPnY+IECv0i1jgI0jQiLm+aOWpKsA3XaSKDDzWdHoU3mKqvQ2uRCYIyOJ8M?=
 =?us-ascii?Q?yqk0V/rXsucVeV1oYP1rsp/FB4NpXMKFvNujfu9+kWOnewVe/M2GS2kYlicV?=
 =?us-ascii?Q?2eLChcXL/9tGhy5pDShgcs227UP2YhB8Xp4KPIKJVEt7qmLdmlayYgC2YG/k?=
 =?us-ascii?Q?KqrOTV47tHHW4Adu7P1oyqfsPUSOI/Jzg3hlYBDHXReLdB0Qe0kARmvv7slK?=
 =?us-ascii?Q?YuFASVaHi0limHD3U+ClwqFn/VTZNEIaEvQwy5Vj9QJFmgwBP57HihfiQ7Q8?=
 =?us-ascii?Q?rAqiGuC1EKetznJyudz+OicBcXnDtW/4utJKJDwMgIGtDgyqsFryfvs0IyHv?=
 =?us-ascii?Q?iobSaejCCOEmvO1cHV5n7KvmvQEQljQW5fJNyD61OMTnkQ3/K14FfRmoOFi5?=
 =?us-ascii?Q?IAMbOWP4RiuEdJP3Y3p9im9K8QTiiahe9p97azE/3YCqL9BVzKU4rFzj0NyV?=
 =?us-ascii?Q?xe30GPN6pmfYTvGaGPg4HHIhGWMcp/AlLV74AQ4Li27SlBRdVXtNXeDT+hgV?=
 =?us-ascii?Q?osjWT/vAN1oTdsFuBRrZIOJ1RvLJsGRAOH8IMM0wC4ZO42OCcizUnw4S6tTC?=
 =?us-ascii?Q?2wxk9CQILQp9AkntOi0rBPVt2uiTVfwLEiN7kDN3nO0du3TqiwckcPdNp+Gw?=
 =?us-ascii?Q?W66OiFIj08W4LZ+tSrcmK3osyjR7DY3az/XhLKkcYhKWHmgHKH97LUzzHdPp?=
 =?us-ascii?Q?RZ+jrd44omV2yK7tNgzIyeC5NgtG/7Awae6EWFteDVcfxkEZlnJHnza48hqk?=
 =?us-ascii?Q?F4ipGJWuMCimz4OLTfKDRr1/iHxcKgf94Ic6V93+wCivCsdv8LgUGkzPNe1I?=
 =?us-ascii?Q?hEHTvZtIIx8nR9eq1fEjjy+uII2ngWR2dPAHBazgzSonIxm5GowTrnAP/L/X?=
 =?us-ascii?Q?4i2Ml7eNs/MYicLvgQzF5zhtfXU1IdGoX4BIIkMHaaKNCMn22kgRRkn6VBUu?=
 =?us-ascii?Q?iHCdhnZdxBuKQ8gU9b9BQauJuUgUJ0l1KWpIqRec9r1fcYbQ8wun5FEhG447?=
 =?us-ascii?Q?CI1nnFBmq6XJXn92Ouk9V/josfRIkPRP6wLYvk8mJpUB63oDuT0FO2K2dRLh?=
 =?us-ascii?Q?/Gn+AA0QNpBplWPGlFfK/QNEAxbnNERoKqizugxNTzhqgq3wJJr0Ew2ln6/4?=
 =?us-ascii?Q?fF9JEb9f9d9t2mdh3DzBkHApyBj279ejTQejC8g/mJu7MCWox86jfVEoWyvP?=
 =?us-ascii?Q?kdb8qlGl/YAiOrEk4oT7Gfhy8D5TFXDOpmDaWDPqvcDZRzmy+Ct2RIKWzQSr?=
 =?us-ascii?Q?OCNAELdRaZWa1150KxNMuXLXTpaLJzun4eKF9aeO/JnQ0JTy+ALe1+UbaaLS?=
 =?us-ascii?Q?/nee7uEDvdx13QTfyMHC0pZxJrJfBclDwu6NWDxRJqXOsAwxAeSVhe4RSMq1?=
 =?us-ascii?Q?8T8xOdG9HhiOHMnAeTG/CRHhT4x6ZpG5DWLUR/g7ousr5yH72k9lZF7a4+L3?=
 =?us-ascii?Q?soWCykFIRdMga5qAaQ0tAOYq+01EtqkazHoD783Ku254UvAHQoEGhhEPt5y9?=
 =?us-ascii?Q?zVV4wDCCtOYwfz2D/J2WuN330ivalRPEcujhYhBqQrdd0O3SmEXk7OidoJqg?=
 =?us-ascii?Q?x+B9djE1cd0MrcbT0QBhdLHofiEYh9RZQRfUHnaI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ee74ec-1436-437c-d238-08ddef4a5ab8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 02:41:18.7613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uo0Fp/2xt9w16WPEEB5AaFyqPZc2bSiLFrXTuEo1bQl+gwwlWwiJ30CAJDinbqXwkrHtlKCHeywp9mds9jlItw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10693

On Mon, Sep 08, 2025 at 11:03:46AM -0400, Frank Li wrote:
>On Mon, Sep 08, 2025 at 09:07:39PM +0800, Peng Fan wrote:
[...]
>>  	if (dcfg->ops && dcfg->ops->detect_mode)
>>  		return dcfg->ops->detect_mode(priv->rproc);
>>
>> -	switch (dcfg->method) {
>> -	case IMX_RPROC_NONE:
>> +	if (dcfg->method == IMX_RPROC_NONE)
>
>Is it possible remove "method"? Can you check dcfg->ops->dectect_mode NULL
>here?

Yeah. we could do as below.
	if (dcfg->ops && dcfg->ops->detect_mode)
		return dcfg->ops->detect_mode(priv->rproc);
	else
		priv->rproc->state = RPROC_DETACHED;

Thanks,
Peng

>
>Frank Li
>>  		priv->rproc->state = RPROC_DETACHED;
>> -		return 0;
>> -	default:
>> -		break;
>> -	}
>>
>>  	return 0;
>>  }
>>
>> --
>> 2.37.1
>>
