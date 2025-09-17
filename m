Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013071.outbound.protection.outlook.com [40.107.162.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA9B2F5A2E;
	Wed, 17 Sep 2025 13:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758115207; cv=fail; b=rSxuNYz2/q9FTOxbGg515+vXs5xDk0UQhc4ek8Cb4STfe5rg4VcksmWwjnWlNH/1QnuuWxh9JVdgUygaFVXEWgPAnAxaHyw2UzABn+WnUUjr/Vo28ynF7CCxP025NYVYz/VoVEPrCZe+6jrjrzTTxkAZSI9k9pcb0u6df9CsWjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758115207; c=relaxed/simple;
	bh=L62A6LLBslT30Q0VTSgFWxxcN+eBF32yOpVD7e6zmYQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aXe7kYgsjwNhHa6UQ+sCZQ8lcZqjwGw0KS9DTIL/+k0/rGuAGU8iG+fj7T9qtUknYD9viWJB4jy9XOgTpgZVsz/TVhMWaxiBqmNpJ31/pV67VzUPickabuZiKqq7gkxfO26yN4KciKRmbjDPCnof7m0BzS9lr/EOUMr1J/HLfAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=STIMjH5L; arc=fail smtp.client-ip=40.107.162.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="STIMjH5L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WY6wfeoC56PixZNVRS+RJ9qRism/b+2wmKHo9dB2GuZH7jy1qZo8A/Jf/kGy0pgys5wkUf3fu6LGovoJFvsexu8D7AvYlqFs9uBaqiR2VrHo5qVktltRrsWRW+gpE3svOJgweuC8FsLveH4V54qWhlW2zA14v3vltE9NK1JXsQQanLwS+Dp3SGTy82y3H1XD0PW7IcbqBb0ZUhK4lgy/QshfCZNjTfjBv3EKsp/s4HsFpFmisukV/NpzoODD37FTTP24UxdocN1NgoGEltCeEgg4Fapk18PAm1AuNaCIKUU1GjSrhfkIjcNTeeqvaDwYyHTJAap4Ai9gISxVldnduA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bm83KrQ8KrKqhNHed4cC0ePWYr6E6C3y54L5Oa0Z7HE=;
 b=ArOtxyVsNZD2Iqe10l3lcls6//K/PnIM0+5Qa6zi3yebpXyWRnSzujLPTbb+mIcInDv1yIJwRP9DCgkVmRq6a9c1RuKUx9XrW9myLJnJ7bMu9G+cu4x1Ms3Wuh4Y4mm6bIFV2oqWP2yXwBp7FP8sSjAHX+yng4kUVKGEA5uXz42otT5PwAx7W4I6iyyP5VKnkfXSXnQVXfXdrZqC7y0ImSyPLZ6RU0wSsXc62Tqsm200IhDZJRYKxOW2OmQ3k/nZyQpIu5kwXdpnQof0t60okBS9jlJ5tsAdG5F6RP5+eE3F9XNuw4WBhpqUPqsPpTiHyQAI3U6MPWm/4U8MLAVSXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bm83KrQ8KrKqhNHed4cC0ePWYr6E6C3y54L5Oa0Z7HE=;
 b=STIMjH5LW4U1W5LXoqg0aJe3pTwkOn+y2xtOHIPGyX5tEvQxIuZE05PfHxM0SFcZCW9Dou7ewYs9nHOeVU75DgwwGYavtFizkd7wPmVm1UiytdPBzEK/owcJH6/WqyPrMyVn9xQDUpZYoIYchSvndM3/T8uVFtPEs00BTdMVqKUhIX86zU7YdCSNdt+lhmsPCNZ/r1HHqyUpSVICVUEn+8vp9IkPGovsF4fZbEuOyUuiXTUC3laVPr6fcHKZdmK8f5aP2piMrZaOGa1/l7P1hkigdvjde/dntTVp7eoh8QYaFw6NNnuU98DN3m59L710UlpBKizo/qKXEU+yLxRCzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB9751.eurprd04.prod.outlook.com (2603:10a6:10:4ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Wed, 17 Sep
 2025 13:20:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 13:19:59 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Wed, 17 Sep 2025 21:19:17 +0800
Subject: [PATCH 5/6] remoteproc: imx_rproc: Use devm_add_action_or_reset()
 for scu cleanup
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-imx_rproc_c2-v1-5-00ce23dc9c6e@nxp.com>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
In-Reply-To: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Hiago De Franco <hiago.franco@toradex.com>
Cc: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758115170; l=4390;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=L62A6LLBslT30Q0VTSgFWxxcN+eBF32yOpVD7e6zmYQ=;
 b=aBoj+87OG9zeZKNqwqVTWrktTIzxj3T911pY7FlGtqe/p5QCFKBZONI5rB13K4GLDZ/mbxhVP
 xrpBwXXK/EICVKAp2frai5f7/FTpvHvsqR4y/10fU4Gjyy0c9kZgH/N
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG3P274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::28)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB9751:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c0df9f-1684-4b02-3857-08ddf5ece739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWo3dHErdHRudTlMSjRmdk1udGkyZVBaR3JyU21UaVFDQkowSzE5UTlrZlhI?=
 =?utf-8?B?eE1Ed0hVOGtrcjlsS29kMkFwa1dJYkpTQlRrcm82bnMyMlRESlArTFNLMlI4?=
 =?utf-8?B?YVlBS0p5dGI0VWpEZjk1UnBPa2xwRTRPMERLUFd6VWI1d1JZaVdUbDFxaHQx?=
 =?utf-8?B?d0JtWFZEeDJLaWQvQTV3d0xJb2lLTmFXSWI2Vml0WXR0bE1YV25EbUc1TjVF?=
 =?utf-8?B?amRMUlR1LzV4MFNUWm5sZlhUYjg1UU5EdHZONW1HcExVY2pJeEFJVncvcEZl?=
 =?utf-8?B?WktvVi9rMFZ2NElzVWs1V3B1dzNRd2dSOFN0bUJKbWZadCtKWnBEZ2NZNnVZ?=
 =?utf-8?B?ZkdOZFE0WjkxallHWkNJL09paEVKQTl4ME14QXhIK3VTaWRvWmE2akZ2RmQ1?=
 =?utf-8?B?WWxFaWF3b3hobENtNnAwRXdYbnNCcEtiN0JOT2ZQK1dtdTJXZjJiS25obitR?=
 =?utf-8?B?SGxweDREaGtaSy8vZ0tKNlI4SjM5Tm5tMENkUkpIWFQ5QS9oeFZZNFRJOGoz?=
 =?utf-8?B?enpTWGx2Uk9vTTE5eFFmRFZQVk42R0VCTXFERGw4N0RqOVJ3c3UrM1QvZlRY?=
 =?utf-8?B?aEZ5WVBFYmlHN2RaVEFtMmw4ZHdvcExTelErQTh4LzBROFNGM2x1dUkxWUpB?=
 =?utf-8?B?ZVRCdjZaQW5ERlBZeTgzUmNnUUtoSHNaZ0pFcVgzN0t6ZE5zTXBNcnN1SDRa?=
 =?utf-8?B?NGhteWZVL1YrQXJ5Ti9lcXVDaVJjKzJIUFlwMmVQL2ZjMlUwei85cnpDV1hO?=
 =?utf-8?B?YSt1clV1RWdBSks0THFSRi8venEzQWFCcXpPcmV2aW1EOSsvSHlnU1hwY25a?=
 =?utf-8?B?eWNuRnpnSFYrckJGb081dEIvTWVobkNGNnFhd21BSEFGTzRtNFAxR3F3MDhZ?=
 =?utf-8?B?eXlBMlVVS2psVGxSRkJSVEUyUE16SkdjeXNEem93QkhkUWIwS2JoREdqRzMx?=
 =?utf-8?B?VnM2cVRCYnNBRXI1UTR3Tm1RSSt5Vk5obWRJQ3RRSjEzeG9oa1h3bnlNb0tZ?=
 =?utf-8?B?MjY2a2JmOW55QUc1WmJhV0tyVXJXQllQTnJjQ3FHSWFyUXE4dS9yTm5VSnNu?=
 =?utf-8?B?bUo2alFxUUNnY3dQMTFxK1JXZ1FJUyt3K2I3N0NkVUVKWCsvVkJONUhjaVlU?=
 =?utf-8?B?bFI5cmsxbytSWnhBYTZ2ZWhJYWJoRGh0RGNnckhST1pWZWVQaWxhVmt2RmNj?=
 =?utf-8?B?VklSVWZ2eEZ3NlAyRE9BTEx3TWhmNms5RkVoQUNrMzFoVXp5YkhXOXc0cTIx?=
 =?utf-8?B?RGR1aStSaDcwSzVpcUQydGhKQnFrdy9pMXlVYjJzRzhNS0l5STdubDk4YXNj?=
 =?utf-8?B?ZUVBc2FwY2gzUnRQYUprcUlFWjNVV0loWno2VGgyN1pHVCthcnc4SGpiZTJX?=
 =?utf-8?B?RFBrK1VJZEo0RDZqNzFuaEJ5c0puYWFwTUNPUHBsMHVqV1BDbUpOTnJGQTNH?=
 =?utf-8?B?aUlTSlE3Nmx5K1A0Z0xETk1kczdWeFRHVVFGZGhURmhMVTJXVXFMSDlsd1JV?=
 =?utf-8?B?VVVQajM3UU0rUGJBWlpMNWFqb1RXMHBvSFM3Sm4rR3l3TW9CUXFPY09nUVpX?=
 =?utf-8?B?NCtBNytaZnkybUZ6dnQ4bVdRSmdVdXJDUHVIaUxUNDNDTlpqVHdZSmNmRjJx?=
 =?utf-8?B?NU1JWEJZMWY1Sm9HdG44L01zSWxqSFVXcHU5azM4eGZ3SG1IcnhrM3dtOXBX?=
 =?utf-8?B?OVVVTHZ3b3VpbDJzSFhjNElQa1dhbzQxTkg3N0VWYm4rOG80U1k0V1E4eFgw?=
 =?utf-8?B?UUVpV2U1Nkx2SmJYcEdkUGwvSUJUTW5FZmdydEZ2T2hQbGtBYkV5YkRXa3NR?=
 =?utf-8?B?UURNVitka1BBc1Y0aEdWL09najJ6UXUxaFVJNldNVnBiSWJsOUp1UldSWnhI?=
 =?utf-8?B?THE4VjAyb0ppbFMxVFhCc29QQk84NExxcnBBdXNQeDJxMm9lSVY3N2t1NWZx?=
 =?utf-8?B?a2p5aUttYlQ1ZUFBZnh2K2xUdlVCck5sZ29VNkczYmN4a2hOUDhhOXgxd3dT?=
 =?utf-8?B?OGF1cERyY0xRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dy9kN0pNV2tTTm9QeUlQaDlUdGxCTHNjdml2TDZ1N3hDYzUrZ1pMalVDMGRk?=
 =?utf-8?B?TndwUDh4VkYxdldWcUp0VTBiMG9odXhobTIzendMSENTRzIvV0lwWmYvS2xi?=
 =?utf-8?B?eERGQWVma2NSenByb3dhVk9iejdjWHRTc2c0bmMrSjdzYTE5dVBoRHNNd050?=
 =?utf-8?B?VEdhZ0xYM0RVSDQ5bnB6WC9ieE5iT1JhQ2xMMTFZUXBSdVlJRnp1RDRoMlVL?=
 =?utf-8?B?UUt3b2N1MUVkczVEc0Vsa05NNmdDVHk4TFZ3elJOdUUzYUd1WWNvOWxXK0gv?=
 =?utf-8?B?eURKQXBRak8zK2E3Y3VrSFVrMDBlK2w0KzNrQm9OWnowQmh5ZDR6MnBTS1hY?=
 =?utf-8?B?dVUxNk1jTUhkcThJdW04NFB0bDViTGVjcWlvMTJhbXlqelgrYkIrSUdpekFo?=
 =?utf-8?B?MVBKN2dzWXNneXFOVkxWQzVxeEFoU1pQZkYzY28yRmpUWlRMNWdTdzlsdFpX?=
 =?utf-8?B?UndUdHhlOCtkNnlmc1NzcFExaDlNUEtCM3NCbGo5aHZRMkRYWkM0MExFV2Vn?=
 =?utf-8?B?Vzg5WkFuUE91SnNUYmNpOUJLK25rQS8wUnArK3lQNjNVWENTSDJtVnluWUVF?=
 =?utf-8?B?ZGowcFRRUHFGcFF4SlU3L1NrSS9DWHB0QXEvTm5ua3QrVlViSERVNS94TVVL?=
 =?utf-8?B?b3UrS3QrNm9iZC9LUTEvUDRrczFRckUwZFBqSnZDdG1FbkxaMlNFa3Y0UjYy?=
 =?utf-8?B?c2g3a0hSNEJmZGlPZUVxZkRvV0krWjFuRk04OC9uRWt1dFpoVWpuTGxEamd1?=
 =?utf-8?B?dnRuYXJmVXVYZHV6VGtILzFHcXlOcEhvc2txYS9lckZnbTNCcVN3UTNHV1NN?=
 =?utf-8?B?eTFvempLVUNnRjZGT2xvVnoycHMxTlhqYmxJVG1HbE1vMFhKSWx2NURHazZs?=
 =?utf-8?B?eWlubExkTnJMSFppcVNodVdYenNzTXpCVzFFaCs2REhUREZSTjFSOEhMa1NB?=
 =?utf-8?B?TS9DcVN0TDF2Sk0xQmExY3NITy9DK21PZ2tYUkV2NXp6S3gwbzRLYzNzeXdJ?=
 =?utf-8?B?MVZZS0NmNEpZV0RwU0VaMmY0N3dSbVNPcS9XWXpQSTc3SUJPMlU1MW02UEs4?=
 =?utf-8?B?WkVFaVFnd1QyUEtSRm9tV2tDcnhNUUQ3dTVRdGFzaVZDd1k3V1hrTE9UWU9E?=
 =?utf-8?B?VE9wcjI3aDMycTBlekRRbGJ6REtsR1VMR01KbzY2b29QTWhyMTR5Y1RIQ2U4?=
 =?utf-8?B?Vk1jVEhEM0hpcGJSNCtvTHF1SVBUSmFDKzdzZzRLRG1RTWFRa2Fla2xrQXFW?=
 =?utf-8?B?Rmh0VkF4TDM2dFg1ZGJuR3oxRjJ3MWNNWStXbjlVRCtNNUZ3Mmo5S2pCUzhO?=
 =?utf-8?B?OFB5TkxpVWEzbXFuNkZsWmJySjUvSSthd2ZEK1FFVWxSNm40dzFYMFZjeW9L?=
 =?utf-8?B?UzhBUlBUQlRza1p4Y3FDbGRrbTFGVXBKb250MGh4OFhIbE43REZ1WDhqRkRr?=
 =?utf-8?B?ZjJVY0FBdmUrMjN0MXFsRFI1NUFBWHRiS3VhcGNYRlRXRDRjMEM5ek9SZlhD?=
 =?utf-8?B?Q3dHTUp3anRKS1VHL3VKOHMxazdzdEdqS0EzbHpqYmsyeEtTQnYyTWxxNzF4?=
 =?utf-8?B?OCtKcm04UHpaVTJwcmlwSUdvem42NFNQdUVVUWd1UlRXSHEyMnQvaUpMeDdp?=
 =?utf-8?B?RzRDVW1QTVBVZE8zdU5DZXgxM3dRMUVJOVBWSjlkcFNWbTVDbEZ4aEozKy9G?=
 =?utf-8?B?aE5lUkNCb1N1dUR6RkhrOVlWdnJhYng4b01VMDRrUHltLy9BZXBnQkF0V0Vv?=
 =?utf-8?B?dkxFaTRqU29kYnJ2NjVwaUIxNXh2R1Z2RVhzSDhSeDZHRFdLdlRYRHJ0RmtU?=
 =?utf-8?B?cTBnSFZsdTNjT1dqSjRNU2lWWFdHcWlraGl0ZXBFS1hKRWYxSmFpWDBSdDR6?=
 =?utf-8?B?bDJXOWhzYlZBYUdKRHptcFAyeGgrSU9JZ1RvVitUQnhoU2RFcStYOTlsb0xk?=
 =?utf-8?B?VmRlUlo4eHVRQlNvaWpocC9oVkNhdkJVOXA5MzAxUlVaOHBzc0FlRDA0T2hk?=
 =?utf-8?B?Q3JHeG9ZZUMwdE8zYXRFT3dQTEFESkVLWTl4RVdkcFRWV28rQ0VVUUQxdDBE?=
 =?utf-8?B?ZU1RR3c5czlWSEtuZ1AxNnNjVmMvTUpmalVyOWlQR0IySnVkUEFsV1lLV1ow?=
 =?utf-8?Q?gbowaStVNFORQPdaOyXeBvGiZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c0df9f-1684-4b02-3857-08ddf5ece739
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:19:59.8338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9LHuld1xKOHMp59qoXXH/QHpcEblnqbB7h4NOJVftUW//Wmy9TeItys6jLmCbLWQ60IwMYivVscBU+1a1WefRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9751

Replace the explicit call to imx_rproc_put_scu() in the remove path with
devm_add_action_or_reset(). Ensure proper cleanup of scu resources and
simplify the code by leveraging the device-managed resource framework.

Additionally:
 - Remove the IMX_RPROC_SCU_API check from imx_rproc_put_scu(), as
   devm_add_action_or_reset() now exclusively handles SCU cleanup.
 - Improve error reporting by using dev_err_probe() for consistency and
   clarity.
 - Drop the err_put_scu label, as it is now redundant due to the updated
   error handling approach.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 57 ++++++++++++++----------------------------
 1 file changed, 19 insertions(+), 38 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index c6cfb308ddb376f370fd4492f8a84f734602bac8..a53ff186d218f54123e1ce740b0277a6fe95a902 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -796,13 +796,9 @@ static void imx_rproc_free_mbox(void *data)
 	}
 }
 
-static void imx_rproc_put_scu(struct rproc *rproc)
+static void imx_rproc_put_scu(void *data)
 {
-	struct imx_rproc *priv = rproc->priv;
-	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
-
-	if (dcfg->method != IMX_RPROC_SCU_API)
-		return;
+	struct imx_rproc *priv = data;
 
 	if (imx_sc_rm_is_resource_owned(priv->ipc_handle, priv->rsrc_id)) {
 		dev_pm_domain_detach_list(priv->pd_list);
@@ -944,6 +940,10 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 	else
 		priv->core_index = 0;
 
+	ret = devm_add_action_or_reset(dev, imx_rproc_put_scu, priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add action for put scu\n");
+
 	/*
 	 * If Mcore resource is not owned by Acore partition, It is kicked by ROM,
 	 * and Linux could only do IPC with Mcore and nothing else.
@@ -1110,7 +1110,7 @@ static int imx_rproc_probe(struct platform_device *pdev)
 
 	ret = imx_rproc_clk_enable(priv);
 	if (ret)
-		goto err_put_scu;
+		return dev_err_probe(dev, ret, "failed to enable clks\n");
 
 	if (rproc->state != RPROC_DETACHED)
 		rproc->auto_boot = of_property_read_bool(np, "fsl,auto-boot");
@@ -1125,61 +1125,42 @@ static int imx_rproc_probe(struct platform_device *pdev)
 		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
 						    SYS_OFF_PRIO_DEFAULT,
 						    imx_rproc_sys_off_handler, rproc);
-		if (ret) {
-			dev_err(dev, "register power off handler failure\n");
-			goto err_put_scu;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "register power off handler failure\n");
 
 		ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART_PREPARE,
 						    SYS_OFF_PRIO_DEFAULT,
 						    imx_rproc_sys_off_handler, rproc);
-		if (ret) {
-			dev_err(dev, "register restart handler failure\n");
-			goto err_put_scu;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "register restart handler failure\n");
 	}
 
 	if (dcfg->method == IMX_RPROC_SCU_API) {
 		ret = devm_pm_runtime_enable(dev);
-		if (ret) {
-			dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
-			goto err_put_scu;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 
 		ret = pm_runtime_resume_and_get(dev);
-		if (ret) {
-			dev_err(dev, "pm_runtime get failed: %d\n", ret);
-			goto err_put_scu;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "pm_runtime get failed\n");
 
 		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
-		if (ret) {
-			dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
-			goto err_put_scu;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to add devm disable pm action\n");
 	}
 
 	ret = rproc_add(rproc);
-	if (ret) {
-		dev_err(dev, "rproc_add failed\n");
-		goto err_put_scu;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "rproc_add failed\n");
 
 	return 0;
-
-err_put_scu:
-	imx_rproc_put_scu(rproc);
-
-	return ret;
 }
 
 static void imx_rproc_remove(struct platform_device *pdev)
 {
 	struct rproc *rproc = platform_get_drvdata(pdev);
-	struct imx_rproc *priv = rproc->priv;
 
 	rproc_del(rproc);
-	imx_rproc_put_scu(rproc);
 }
 
 static const struct imx_rproc_plat_ops imx_rproc_ops_arm_smc = {

-- 
2.37.1

