Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C157352021;
	Mon,  8 Jun 2026 05:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895459; cv=fail; b=uOrUx0PXrkD4GFdzFwvpvbTOiR7FTj99Ng+Ka57bVZIOcvB9mHG9AmvfLY+tANKz08dOY0tLN73IWUUr6FjjN6GrXV+W0BhAupbmo6YpbWf3Ees/hsVy3mAJ2y+NV+V80woZYt++HMISZuL1cEljrV+k0SWV3aYom/aTAupsRlo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895459; c=relaxed/simple;
	bh=nNvYJuT/xzIPV2pFk8IcLiBVb8AgwjwfOrBpfo37RQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Sc/Qyc7WnGKhD0e+6EExa3xVsGahJwKkROe6HWX57sKjBTLClbXz/bIO4OxjnfogKCzK6EtRPhvcrZ8djsdhVCSyREaVC8lORMDRvDD4O3Zlx9n2/DXfZ4bOz302fAM8+fbV2iwokjo+6kkmkYZ0zzGNTXru98GiClCGDBuKgis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HXHPj0AI; arc=fail smtp.client-ip=52.101.70.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HXHPj0AI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mYyXIH5pv/lWMQI6Oaxv9sZAmqrCDx8WdnobpZhQuY/jo1TnU65IXdRTLuyyr8I5L8Xo1BGp9RG2t0W1eyet3gkZ38VGfMXiKS5PBQL4l7pX1j6Bue09pFcI/fqvQoAMJoRRIla66jmSpz8kfTgghR76GJeutz1wL9cYZHYPCAbipfh3pj4JxffI+4qM4PUvL7zlG92LkJULcDgxxwUJ8O/sPrDIN2FLMI+qNW4IrUSj9zqwaS16pCYfZQsYUnsnIRC96Kx9P5NVwiIxFpG8GaLpNhOHFZ5nfJ8ptmOzplV7QuOW8gns//MHnnu0NGY4zTTnUNYBGTISSWgjeAyC9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNvYJuT/xzIPV2pFk8IcLiBVb8AgwjwfOrBpfo37RQU=;
 b=Z+UK5EPJEmfeoMfU/FyGIe0mevpgx8UwZZcKworOS5BvIiIl8PzVtyc9gv6SVdklsSMwNfmKtqr5qqsDdP/Zb1wAEGUhEhlThZcyWanUBwEihRmLAb4qDbbVwCVJSXnJXO5B/VELQ/i1GdTTRVU74fUSHHm/YqGnXEiDKflZnzvKrzEdMdZQZ353lz6TrzA5kgGYby7z+IBkT8WHZOwlBcdkEjhHXlFd/GT3QUB88VDgLlhE0Fdm249uWa4jXlaY8bNOAVO1XxHmiPKkVyu80KSlI8MyeIgBKKr2PlT6AHrNZBJIWszIHgZczb/b27nJVGbZg40WfF33R3BjBs7JDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nNvYJuT/xzIPV2pFk8IcLiBVb8AgwjwfOrBpfo37RQU=;
 b=HXHPj0AILffO0CSFU9DkDFKelB5pC7Z8aRiQqOZOPh3APhUy5yDtHH63engZDuYY3+hxOK41aDOiU6vBNG9JHhz9G3q8NE2gff9EW04juWJyz+1iIQY6koCEKkpVEv8AEkYPudqYFTw1+Z2GvtZEuZMUymWE9l/3FN+pktAnifBl2r4iWJICZKA3gmA/bf61Ptmhd440M9qt0nn3a3MfyMNIM5jxrli/PeOP2nAxuM+iSuipxOJSnahu8n9ebzpNpdrQhgsJt2bVWCXq24zfqchN+W5cPEEPtwVaYygzuEYyZFwDXzArENze44nk+b1dxvBoPWLPPWAgQ1wKprcU9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 05:10:54 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.010; Mon, 8 Jun 2026
 05:10:54 +0000
Date: Mon, 8 Jun 2026 13:14:00 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH v2 5/9] mailbox: imx: Start splitting the IRQ handler in
 primary and threaded handler
Message-ID: <aiZPmAniLJU/ORmb@shlinux89>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-5-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx_mbox_rproc-v2-5-a0059dc3b69a@linutronix.de>
X-ClientProxiedBy: MA5P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::16) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c1d72f-62b4-4a96-acb7-08dec51c510f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|19092799006|11063799006|5023799004|4143699003|56012099006|6133799003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	5nMhf0qjPWkfIUu0LroTZfRYk0USCv7rHexo/VboRf2Y0v9pTvhChtgRN3Hn3IeIF/nXY9jlL5/NK2V4J6vyjzctj+xFtGkLQuGko3QWj8TO/jbP0T8zKZ6VCXe2B8MVSmZi9mlTn3RZwyAm+gbwGtsgM7aAuKt1Cz9xGE6Y9WfKKE9tE4v6TyHi3jpqc1AcJQ8TCSMenYNX5TGvs7f98nofU+br9KU2xZkMHZ6GJtknNf9Bef5a75BGaggIOtv4t9njwofCfz6ZI7EzjC1FZZ/ZpGZ1yWZyI1TYgqd0PjXdUPsJcUHTB4zGurm0riGBoS02kNtOSC3UiMZDTBnP4CuzxFXdwahQSKWRA1rmU9jZtTJ/OfCTwe4Um0Pp+yGOCwnYoQouCmQAiJHSY9f/p+zSEFAQ0aaGZEG/DksMjnOUeJtA1tWt0V+J6nHOlrr9ROfR9+cUXCVf0xMZJM5EP2ce/+K1d3q0p6NRkM4xSgQyl9WXoUTDop2V5TxPJZr5K5esVI4fIslyESI9ZKwhhCXGJVK7s7NvkAHHU7P47CQSdEtwSpgtN234/hdt9J8p0bSYqInohgHmqaHZhtUUhqLGPTtN0SOGUuCxPuYKU8S2ygKlRLYjXwJTVV4af8OXHD7kZxgmVxuYwyf9psk/Yvlf+Kc24M8AeRUu34oNWgPfFzH72fkfi0cRToG5LyJOxeSHPKrJtrUGa7RdvrApfj+usvQcFOCrBwYilgYP1ggbGVtizx5/6+ELLyb16sfI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(19092799006)(11063799006)(5023799004)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oNHf5aAn3QOrVaRv1mHTZh14zepyw5ko5YYQ4AIF+j6ojoGXdnSWEO+ccBJ7?=
 =?us-ascii?Q?ZJGOxUy+HGb5L+pOsUQYPj51WXxo5SW/tTlV19C9ovr0YbQcwyBThKqFFDfe?=
 =?us-ascii?Q?B4AcQn5lAO8ytqEDU1nlgivrIn0lf51i8FCwT2MxFfFoJGLGSEoQXq+3y2su?=
 =?us-ascii?Q?DwRCl/f/vsXvAvg5FstPlZdDZynrvg+3fDVgJQmSvhX4O5qMHEtZCkF7vXZw?=
 =?us-ascii?Q?Hqj0y3TV0YoL1ymDGqKzjvHRrB3bs+hEcT4/6q0YkRQgL+unJaVQ2ZKnP4LZ?=
 =?us-ascii?Q?2/kLriidwZ99tF7ikzaw7z+v3JHcv5Cc1WK+hWmM5ijUiEZzURoB1K0wrn6/?=
 =?us-ascii?Q?dMtsyW3ILr3akymDdYF9YxUvQ2xJBXyADVYtNgWPnkbyOktGfJ/y0bsMPlvE?=
 =?us-ascii?Q?oIVVAV9ei3yTudW/tFN6HYLqwrXSTmOMeU227q20EziMLRKRK3B2Sr7Lha52?=
 =?us-ascii?Q?OYyOT+rfT/hI4CY/qWS1JvY/jS0zYYowfkWfteMrENTi04TXXw1//mRbaF3d?=
 =?us-ascii?Q?Vx4A9w6boe/lcgf7KAb2Qv8uG4kZc/u84XZmiliPpa6ff8WzHX9saS6UOtso?=
 =?us-ascii?Q?txZ9FEAuCeIOTZtXd+d+NqyNgVgEy+eYsf9RFQpVDjiUSBHNgmcjExP58aTQ?=
 =?us-ascii?Q?P6p8zLly8qvEqUcKt9ptyltQqF6r2TVVJ9AlZSgrUSShXcgS0jvRf1sWFbXI?=
 =?us-ascii?Q?xXhKeLvLES+xn56YtiODzaWN0EQDQRR0AzJq3yxGup+G8v/1lB75C5mAfwyf?=
 =?us-ascii?Q?PQ/7tEWgUqy16u0RKEYSAeEwsNvU6M++UeN6By+uqtVz9Uk/KGHjDLhyxqys?=
 =?us-ascii?Q?UWRUzyGpqhzXefgde8cEp0riOARRIn3dV9wRrW4CunKoo9GF+RzJwYSG+Jn8?=
 =?us-ascii?Q?8/ygGlaKLtRokWM8mnC50ApGi34Cz9+RJEQ+wb6Gt1reAzpt6El5NyHfgaHG?=
 =?us-ascii?Q?YGtIlE4/+1jlfx629LMlcm7wP3mdemcq6zK18pQF4Tc5VvdE2sOT1YBHfC2S?=
 =?us-ascii?Q?zt+lzxxy5uUTvEFbfqibDzR4cpa9SfOv2rUFiMe3x6lPWZ/2iWjMAkWMyexy?=
 =?us-ascii?Q?ObcjnvtAIVskeThr1aJ4SSgPa4917ZEbhc7iMW9WPBbe6vQ1ukPRMQZcY04Y?=
 =?us-ascii?Q?ggFT3NaCQ2sVnZXeI4a58moxnGDqgi7EfVmmKqbLEiyn5V6KhzqZXTgYrTXZ?=
 =?us-ascii?Q?pZidlnRbk+GhqayMBnH1Mn1SaAIC+oiiTbapbcYf9hcXImro1hvpKuWy0GoJ?=
 =?us-ascii?Q?syZM5JzPxrUUnPkpcD2G9dtgkOU6SQTyAGP8ram5zMrrUQmcP4Uxn85+HxsY?=
 =?us-ascii?Q?hUgemIN+G/IEK50dTCOFoko1T5pBcFn6kpWTmXfodOx/XhGVk2HZG8j59Wdw?=
 =?us-ascii?Q?iuDqdb1aql5q2YoFVhJM3om9KePWGd6hcbxjSYWA/V+opoN9a2p7wwmgl5Rb?=
 =?us-ascii?Q?k9/CnDUOSBcfJ8nBVJwNsaQFUtjRjodwXzb9OWm5oqQMkEzZeUgPAS2u1OR/?=
 =?us-ascii?Q?hQ1q9RRov9SUmbapkgUBPuAVjt6564gtexCBuTot5vtqVBb5IP/RoYofNRs0?=
 =?us-ascii?Q?1tj2OMeZjB26zSGL0FDLLXLFHhATyURgCF2qlHz8U18hIdZ42atrPN6atqI6?=
 =?us-ascii?Q?Zsc98+5fb66/vjGTXwlJ0ETLF9Ljq8iQHWAS4MwK5PmcN9my8z7I5kZsKggg?=
 =?us-ascii?Q?uH2UoDRF/ldnXX8jPZSjCzGPTcug9buc5EcMbm7EaJfZ5NdcX6H4ARbz3h09?=
 =?us-ascii?Q?1sk4TeYLsQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c1d72f-62b4-4a96-acb7-08dec51c510f
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 05:10:54.4205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DmidBFtoMhCqmyueJNKmADhF8Xs/R39+ZoSASxaC03yjazqlkOJPmXdqS9V7xcacOvwYwvsCtUNhZ2KogE8ofA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936

On Wed, Jun 03, 2026 at 03:05:08PM +0200, Sebastian Andrzej Siewior wrote:
>Split the mailbox irq handling into a primary handler (imx_mu_isr()) and
>a threaded handler (imx_mu_isr_th()). The primary handler masks the
>interrupt event so the threaded handler can run without raising the
>interrupt again. The threaded handler can invoke the actuall callback in
>preemtible context.
>
>As a first step, prepare the logic and move TX handling part.
>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
