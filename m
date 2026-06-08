Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9917A4071D2;
	Mon,  8 Jun 2026 05:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780894923; cv=fail; b=T3FxBSvW/F2KyBQTf2IhPhgZd0VhwGVB1sdzABiZBUakzy0AKyoi6v8644SnJ2Vt83xniXLl3LFcGQxBvDCy6Y9R6N2ocv7vMvdK97wbpioWDMjApXH68pkK7LilHfHIi9SJqxcypaFDuW6Er4YTraoi/nGcdrNtfg/9sy9X3+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780894923; c=relaxed/simple;
	bh=ZOGDFiSGteT4S3GyawDU/c29Nel/pr8EguQWWnWogpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qpB7UrxYF3cn3eJK7kabL1EO7wr4YpfhdO+j6FyidqtrLoVuFkmQv3iUB+FxP8SQktcJUiSD8AQOLVFqgOFy/bY+AL7hbP5wrf1yCQriv68leVNPi/MEFUDlMvbIJyXEPiEKdM1YNhh6gX4ugxlhL8aFUi4qm+0Pjoh0ikovujE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VkgLCWP1; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VkgLCWP1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CB1y6Hrij61+K5Cgtw2nyhxcMbl0EXKV/cq+6JZ2TGf15qg7o1xFz+E4Kv3h2FFxA/GPfnQjfbNSzBAAjQckctZJcaAmNB6RiqZBI8RBICsUNRhnurGKGHvMZELNLD9DMkAWf1DWVIHA7hFOy+wuG5SRkVlEZnqCopGDfMZZZY4oawURYFy0U/BWUZyeTvp3k2Vsggq2rqqBW1VuX5Eq3ExDV7d7d2EmuCoASOXpruCGfolQsra5TtH/EZL3wysPgbY8FEZKfhv2EkjDXxKR4Z4bls7dsUcqd4UXQnN6myJNsAimmXfFth8Qh+urhadOtkmhGJascCjObAYXVESD2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOGDFiSGteT4S3GyawDU/c29Nel/pr8EguQWWnWogpM=;
 b=FPYnX8wYKI47hQpulDRr/VJZr0YyPrvTzbP1i7o15Wnf02XXB/t0PYlnzQNujZxLqfNxGhdkQdfs4Q38BJQch105fKC1qZ1aCvU4obpbsoDLmmYvRBhGNZ9gsHVNWUmDJO9tFE5dKHzeBo7iGO9Tq6ocFGVype+SFW+sVMD140/ENqDEAXuHTQZ9YmEcdFRlXH1V+wJ6t013bs5nxFWJseYwue0lsOII/zUVkqQ994fXKOAJtKGgN8HKGAfPvrwgE70kwnfuFQitD+ElxW1z1Ntwr8+AENvvzRtAoVSjxV6NlCSSbcJmHmLY4QdlFrnnbc3nBGVBUCLBVZN+SUoWxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOGDFiSGteT4S3GyawDU/c29Nel/pr8EguQWWnWogpM=;
 b=VkgLCWP1pthMs9BHJVMk6WJ2w6JtZmbqGnUJyxds/fqXdpiHL+EirCZ+CKbbcFqqQDAon0gPBXxsUCso15CtkjRYAgtwRtatPr9xoukbL9BTv/dAzFzq8YlveNo75tL0rxcKJyXu2iaoNaWwNc4Qd72TNbhUVYknjRrq4alRTvOf4ZI9tayJgE6ru894j+0INDKamVY99lAGxTIuJ9DrEUTreSGuiHSDSg+1nwctIK+p+zZDAdCavugK6aAtbyoPlit6j5Uk6bBOyd54OcBq2Y0rhP2XBRBt3B1grfGN9DK/UKh1ptGWjXFUCh2PDZxoRlTDh+uXHuPOOcB5Ouw/gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by GV2PR04MB12653.eurprd04.prod.outlook.com (2603:10a6:150:36d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 05:01:59 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0092.010; Mon, 8 Jun 2026
 05:01:59 +0000
Date: Mon, 8 Jun 2026 13:05:04 +0800
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
Subject: Re: [PATCH v2 3/9] mailbox: imx: use devm_of_platform_populate()
Message-ID: <aiZNgGmSQNnGeHbH@shlinux89>
References: <20260603-imx_mbox_rproc-v2-0-a0059dc3b69a@linutronix.de>
 <20260603-imx_mbox_rproc-v2-3-a0059dc3b69a@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-imx_mbox_rproc-v2-3-a0059dc3b69a@linutronix.de>
X-ClientProxiedBy: SI3PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::16) To MRWPR04MB12330.eurprd04.prod.outlook.com
 (2603:10a6:501:7f::23)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12330:EE_|GV2PR04MB12653:EE_
X-MS-Office365-Filtering-Correlation-Id: 682a89f5-167b-422d-ed57-08dec51b11ff
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/yXyN1T4bA/7ekeOaQVr6vSq0PAi9MBZvESNekyP0tIuLEUgHBz/6wyQP2ThaU8IcQ1p0hLSJsJ48rfByI8gxmkwrexp1f7gMbhtM9lFtkROuPZKJdurXBrr8P7gscVrE2mnUzWN9U9oNtH3Y9fQMhBgwkxye7hKV4Xx71UeyyY5WSn7g3j6w99xDEs3qnbe/DMeZGwT5INy5brQ/Guw4lV8ZZiJe5UooR69Z/+IWKMoPKoLRaTsmIt59rkIdXiOcr0FI9rGgQUzn9bTPl1+d0YoDr8fDN1P8NImqjlBZwgUuc1G6sVCvm9ymDhPJuj5IQ5a+o9AQhK9Qfm3DazwLm/kh0YE08RxBWbGXGmxESRAfDSLecd5ZU14r/AwKHFEcITfpMtKYS5xY4QQc10yhpBeBQC44izFB6wqe8KHmpZ/i++qJDOMxDZaBTYUbRWneYYQOBFZn98I4kyrKbtl5NE9qxNWqvJ7JGfYWfTVJ12rvBjAdWBBoyQHF/W8Dc/SGlKkfHqoJ1K1NuQSDnlHZTq98/XE6KcjmNC5xj+6yENzgKP4R+cF02DpiXErc91wG3VUsotPjGk7BA+hDttOrjVw6z00edqo0V6C1eKXhOgqWd574XlRPfPvkk0KGv6Mfr8xlVb4RExt4uxZ8bCi3Gz4p3kq+jqKibHrrfg6q+GGnyWiYuWJJcplN0B3W2BFMbw20Zegf8ie6dVYx5Y7ptM182PT0revYbSqlC6AvYdktyoPQibG0bAJPiX5Qr77
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LbtQv++vO07dKXh5oCl5Qc8/FoL168RsCmc6NBg16hrpjffe4PKAmAdlNzwP?=
 =?us-ascii?Q?cZ3FPW2VfrcGxi587agIzOeIgSd2SRKxeglYjAPBr+IfqEl2Z7qnKNX8ninD?=
 =?us-ascii?Q?hEGM6VnWwALWAoRwhqGCr4ZQNTLFarrL93ytfzpAuPWchxyoSB0Fw+zXkKK5?=
 =?us-ascii?Q?RRSOww4k8YtdOMW5heXuWUhLWk+zC1gVz20zCw/3xeyvVg28BzwYcEVK8TZ1?=
 =?us-ascii?Q?6oqBxwS9YWRaDHvVEl98UgRtY4Kb78t+JOg9OY31o/37shmhWzTzYDK9NxKy?=
 =?us-ascii?Q?j23H3xDkZCAeeWWZoHvDGfHdYhc6iAUlxY5A/i0TA/+KCCk3hH4P+uzVVoQX?=
 =?us-ascii?Q?aokgeCKSdGHX0GOHOddKiC3jBBTKcvbavRVO/zF4oasdllsoZfsmcFyA84lk?=
 =?us-ascii?Q?qBDy1iDt9VcmKEPdhv5/NJjVNNLoqPQLQFQylykTJPZauPD88tPnH6lt9FTt?=
 =?us-ascii?Q?6l2/pk7aV02mGJLA/B3WGMPI+Y2tkF14QqgA20AsO2s+UbLEnTLRGssckfWI?=
 =?us-ascii?Q?QWIGaImmgfBrzCpdXtmp2SDvwmwvzlrTddyYmyeHG81w04KS3+6MythPl01Z?=
 =?us-ascii?Q?+mZYtxvefSVzgKhwJm+2/VDZzO2FWzckC8ItMJfwqxUmznJf+sLTzIgal29+?=
 =?us-ascii?Q?a5btFTYBO9UCVmwfuml58ioxPM9+1ydHXAWPAB+PctSEd6TqytV9YgbjHRyn?=
 =?us-ascii?Q?VJg9foOWCQTFsmXXR11cM91sAxOUQo8aPGWFvkDjtlQBeZ3KhSOqsvBtwqjE?=
 =?us-ascii?Q?yiE1fix2Fnm9oGrn9eirFJpKoMBRpGF3W2bC96H0iGnFFbUS0xBFBRaia7b+?=
 =?us-ascii?Q?WK+8PpOP5EEEb6BhyZUpeXPOwwly14xsDlaOv6Lrfs5MLbxSCAsTiuNiAvNE?=
 =?us-ascii?Q?rWFyldQU3PwJeX0r9Xw93wVyV9NzswXItsEzWvsBdLFIpOudYr/qxLdauibJ?=
 =?us-ascii?Q?uxhWARAMIWwQpWjIlRb3v+GwlWcOUb7yHg20eRZmv/HSdwS+7mswqOZQT9t2?=
 =?us-ascii?Q?KcZMqHAI+P5E7fpEKPwtH+fnOiFEeaJT0T8scEeNu/Ae43X2GyGYRkzY3eUT?=
 =?us-ascii?Q?GoACWHhmUOAE1sYH1CprgIpwKWm86jYUosXNLSArvfLlSrk405xY3ZVZ8lm0?=
 =?us-ascii?Q?A7C440fZcCl1xb/nu+q3t/Raz6yjynf2ppS5od0dmLwme1STvUWutAU/6ekx?=
 =?us-ascii?Q?ePeUOzgzgp5Rj0ATD6YmW003d8azJyoMnegtTA1CANa34KTP1JBp3VpAqZY/?=
 =?us-ascii?Q?Fvvo5LohRGNdxSpn4be9UqEhAf0KgiyUeSqMjtxhE+sWLl5AS5vIMDAJlZlD?=
 =?us-ascii?Q?2SXOSk+bQUqqVde372PobfmHdi5DOIMR/YQnv4Ap0vUAPuguxc+GYCN2J8i8?=
 =?us-ascii?Q?1R4gzVAJFN5IN+YA9UmXtT8KtMa68XkmQBm/FEce3/1bdWFTyQ1Uqd+jfhLK?=
 =?us-ascii?Q?TvLNYf8lZcm6qTCYAtHL92v+Es1S+qGoo6D99V2UeO4Bhz51eNTqsOwNTSNz?=
 =?us-ascii?Q?3+PipvNd4h1RNK6wiSts2amsfav2+IjVXu1yPsQvHlpaZaLNPfBvz6KQJRpx?=
 =?us-ascii?Q?nlI09HnSpMwWf+hJUGqnSkc7Flk7DCY1kSKVX3yiTAj5UK2kL9TjP83dvXhf?=
 =?us-ascii?Q?92krTFGcY/bwXkH48kU9+cOTgdA9S2lFqTI3b1bRCRyIDidteQjZMN0hSMrF?=
 =?us-ascii?Q?q0Cf8abq3VTiTdBN050l8adq1n0r7eg89N2lzUcQWqRF/3YuZw73e+mjQvBD?=
 =?us-ascii?Q?K7vnKGzjoA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 682a89f5-167b-422d-ed57-08dec51b11ff
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 05:01:59.0731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aTPotqWik27bY0wH/A2F6jWEsVYbRhVK3IR9o2qRyxQjYXaA1DEvBSklByft7K2bcDAwJWb9sytSL8GkdbFJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12653

On Wed, Jun 03, 2026 at 03:05:06PM +0200, Sebastian Andrzej Siewior wrote:
>The driver uses of_platform_populate() but does not remove the added
>devices on removal. This can lead to "double devices" on module removal
>followed by adding the module again.
>
>Use devm_of_platform_populate() to remove the populated devices once the
>parent device is removed.
>
>Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
