Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570031D5AC6;
	Wed, 25 Jun 2025 02:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750818348; cv=fail; b=dT/SdgOUz6zDo7/AtBmBGyZwb8H+kfLsDxvd+nOb8b3HROP7HjXpNaMfTbfM+Bn85MVLme5byJ+URlv/ZCgrg6tNTL9NwKEMQcF89YkpCZFuQjBBo+s9iGuh4Z8Hzhpc2hWgyz/RDHD8FcU5NNJ9aQFo9rgZfAtefVWnqxHGYJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750818348; c=relaxed/simple;
	bh=5RVUELMVE0l/FPE524MkN0bvwxqrlDtUo/8ReRMJKvM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qTJUxXhv2ee1eEXzE+U3m3wsYz/vKxOi510mIFqTNPYMpyYALlxMMOcdjwuGA6ETD+lil8cDrcMx+mYoDKdMYJvIaH2+A0lZaFKcxeWmVuOSDK+g92fMafIfyvcgy+b8ixCjZGC6QUx0WneIZtIMcwqRDIE1lDU8oPSNKLGZyUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WNmfKuz9; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WNmfKuz9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atfWwOieHmzBUOfNw4UJrjC+b2DWssPD5IPh7moQlWWidEd5qmNf80QoSFmdP4E//KzpDRS/3IcJsI5ALxtIqh9G59I92Z8KvilOYRazp2QMyd6ymtOSs7QJE6waLQ+rG+eQl4OXiya6KpV2wwrwM5zxMX3Y8s5qO5JwOmOqmBfLMk51JmyZqCcw0Q31iAF4ATq4q53Yx4/thXuBuqsFkCgDtxQOAvuWbD8C7DXWIWz7CLeJxwZ5yjpgR3uI+DiSg5WYPHmEBae2UTOKdumCXEg97SqFz7xh8e0nLelRJiNKqg6wFBws4Q+WvGRz0uO0UpURhJwUMMrO8eV9Sg3vdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lp5Vv3E3X9KCiEfOhTBm9JyDkbNRFe0+/isLnXErHtA=;
 b=YzfpPqUzjIjpPpzWCIgVk9CKcSCRpZ2xvX9+GpuA8CC5f4/DVThpiXcS2DlMiVx9y4DiH1pMWxlZTixv1Q8fAAphwbVdriJqIGMbGVfANMPMpWldheQGKu3qdFHX7U7DXnORo4RMDDT4dfNdamtNwxWvsR9Il+G5uqMRVvvmPBslciw51HjKyfqoWBz6HERqNucNXSXfNn37O4rP0pfQW0J8U7zbkSJTLJZSpQU+awSvDxB7kCtTYejEYAajyyMBbD5XLz+vmzCFuFeWCM1+vG59qpUueI+E6Zgf31HOvkDHTxeusoPtGk36a87zmu+awoD6ErXBXVzfs55TwPrsfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lp5Vv3E3X9KCiEfOhTBm9JyDkbNRFe0+/isLnXErHtA=;
 b=WNmfKuz9Y3DOW1i0WsBYWAcCBSE+LKXkv/Nu6mWZYWQeaOe0G8N8gVMYyjToT78Um8K7RpoUTfTGxJdmhWbysa6dS/Gs2gAptPecw/fZcWBj+nKdflNN3XDSlKbofyprqjNUzHltXGRLEhF/v6nIVkVfBiKOq5OebW18dXZc/9ZgPsHyuQnYpA3ZdhVvZQjRsajjuPcJQL0tc5H5PO+1zBsX5l0e7dWOy0qizh3pklEJos7lvtfWzjtEhLK1BaAPw4+AO6xyuYRgFsoJd1E5ZJ/LnA0O9eANh+Ct723oEm1dTJrS6PVL7TUl3709T3zoo1NM9FUkNv+jQVaMc6z2iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS5PR04MB10042.eurprd04.prod.outlook.com (2603:10a6:20b:67e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 02:25:43 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 02:25:43 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 25 Jun 2025 10:23:31 +0800
Subject: [PATCH v3 5/5] arm64: dts: imx95-19x19-evk: Add CM7 nodes and vdev
 related memory regions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-imx95-rproc-1-v3-5-699031f5926d@nxp.com>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
In-Reply-To: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750818218; l=1741;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=4D4B1DLK2yfWkZLukgGcacMh+0MYq2p+DeG1+BompD4=;
 b=iRmENieWFQLyV5LmfMG9rZ3YgEOOj+mhfkz7nQRCTtiGoSv4m5wsxmcY1Fw0fJRsPmVsG5K4T
 z0C3YyeOcqFAkIEm/QtizwtAjzyyldgCz88qCNvQ090QMXPy+Buukfj
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MA1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::28) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS5PR04MB10042:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f3cdffc-0699-48a0-b962-08ddb38f95a2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1NtSmNITXNnOXBOV1g1alNaQjRvMURyQ3RhUTRvWTdJU0VNaEpGQ1VndTFw?=
 =?utf-8?B?Rzk0WkVLejlxUGZDSWtaRi9oL01KTWxCSTZmVnVyT3A2VEFGRktPUHduekRz?=
 =?utf-8?B?ckVNN2xpZ1hLZ3BEZUFmK2dlaW9BU2cwTUpUUkE4UjZHbXJOQUNLS2hSWk52?=
 =?utf-8?B?cHZuSUNkUnhtTjQ2NktwZ3hObDQ0aUNnZWoxUzdBSzVUd29ROGVPQkVNL0lx?=
 =?utf-8?B?WGFXZVQ0REY4T3B3L1h0dVJnZ1AzRDd2a0ZjNjJGM3lwQm00bmdSVlBZeU4x?=
 =?utf-8?B?QTAxYk16OEJMbHZZdnBVaHUzekJCSXVzU04wQm50T3JObHhvbWFEbTJueTR1?=
 =?utf-8?B?bDZXSkV3bXBobzZXMUt1S0tDODJaZDdWOHhaYVk1N3hvMEIwUWt4UUNUZkow?=
 =?utf-8?B?M3F3K1hRdzVKeitCYUJPNnpVdHlrVGNQeWZUYzdXWG9KajhsWVFDeDg5TnlI?=
 =?utf-8?B?OUxEWEhGZHY2OUZJNTdFVW5EV28xdTZocW03WjAvbEpTY1drOTkwK09DaDVG?=
 =?utf-8?B?ZmdEUHloTkxldVREdngrMnpZZm9Ua2VqaUJISmk2QXRIZ0NQZ2Z3Z2xRQ2FH?=
 =?utf-8?B?elRnZkZEVjMrSGJMTHk1OSswSnZUQWUwL1JPclhXV0JSQXg3NUZJMTZ4QWhH?=
 =?utf-8?B?NHFHK0FVbTY3V05ibHhZaE1GVHBhWFFQRm0vMXNwZDFJQU1wcHJoMXdoek1L?=
 =?utf-8?B?NUk1bGxDa3ZIbUFraS9qT09TOVR2Z3FoNzdiSGhjazFtb01aclhXelhlcEt6?=
 =?utf-8?B?RXU1OGxOLzhhVWc4UjJ6WGdnNkxrVDBJVzQwSzgwMnZvNnJwaUZ4Y2xyNDJw?=
 =?utf-8?B?SUxWcmtZZFFXa0hlamMrUkFNNk5oNVVjQkwzbW9oS1hwN2tuamZlbzc3bjBU?=
 =?utf-8?B?MVE3MTV4ZXVVV2JmbFJnWUdKbUNKbnpiTWFPRlRPWXdjQm9nL2hTc1pPQkti?=
 =?utf-8?B?K2laRnlNY3NydzZLOTBlallMcHRKajhYbmQzVkwyTVNNbGVCUVhabmtQQUpr?=
 =?utf-8?B?d2xXUEl2dWtOR09HblVvc2JmeGVBbDlRTzJVK0xnck5MRzFlM3phb0hJV2NO?=
 =?utf-8?B?MS9tMEtrQnc4bTlob3pFbE0xaG13ZU1sVHVyUW11NUhxd01Nd0JVSHR6Ylp4?=
 =?utf-8?B?bFQzZmR6WnpiKzI0czNHSnFsMjNNL2Z6bG9ERjAvdnJwZGdSSW44cWw4N0cz?=
 =?utf-8?B?L0NGVk9iaEVBTVBTQ1VsUitkQlZFNXJKRXdweTc0eVVqWEdETGJGMTBhSldK?=
 =?utf-8?B?KzUrcFdGb1BQb0VrYnB1bkZGWG1xR082dk5kSVUxdHpITy9ndzE5alhnSW9B?=
 =?utf-8?B?QyszNVcvVUswK1o4K25YNlBBczVrL3QzMWdCb0x1UTFPVnFPNjVXMGRzbldj?=
 =?utf-8?B?enFJUWs0N0FWWmtxZ3JaL1g2eVdBaFBDbzc2NndKNVNONURuTTNyOFlTc3U0?=
 =?utf-8?B?Q2FwNTRjdysyWndKWGU4T1hHVG13MUVwTTIrdEpyNU9oVlM0UG5HRUpXQjla?=
 =?utf-8?B?ZlUzcXBuLzRkQ2daZXBJWXFDTTdHY0xLUDBUNDBlYUxWL29ybGVvdXVDZFB5?=
 =?utf-8?B?MVRrQ1JKUVp1eDlzeHpFT1MwY1dQR3RYa0pzb3Ztb1ZlUlNQZXhNYkdnNS85?=
 =?utf-8?B?bVllbHdVRkJZM1pEdUxjQlRYcUZsOW1yREJUQWJZQmtRcmxUa0V2M3BtTXVK?=
 =?utf-8?B?cXB1YTdpRWxRSHZYU1Q5OTZ1TUwyZDJ0OUpWVG9BT3BUb1l3N2tQT2R5ZmZS?=
 =?utf-8?B?VUp5czlleDhlZk1vZjdnRjFtUVJJVzNrSlVIQXNOMmhoNjQ4QUg0aXVBQTEy?=
 =?utf-8?B?YWxPWlQ1ejArQkJFbjBNMEZVd1NLRnl2MUdGTGZVWjEydGtRRUp2VkRseldX?=
 =?utf-8?B?bFEzRkk0RGRlZzdvYzdEamtZTnFpRjFPOXNzMGJrOTVFUVJBb3laK3FRQ3VO?=
 =?utf-8?B?N3hPUGVPaGFKaG9QVm1sQ24vOXNvODIxSUw2MGlRelZuNExIWjYzNHdGMkFQ?=
 =?utf-8?Q?TW7+OGLXrh60juQbY4RvTYTSIjgvAE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czdXS3MzenhuVUFmQjFhQm9zYjV5dVNuK09WRmJzZVFFLzJxMlNsZW1CVVBm?=
 =?utf-8?B?d1JHaGJvUG1KaWxSWFo2cGVORmVacVBhaldXbHR5UHFQZjVOVzBpNElYZlRl?=
 =?utf-8?B?OGF1Z2RHa2JtTjM2NGFqZ0VzS2g5azNkZURSQ05tYnFjcHN6RlFnK0R3NHBZ?=
 =?utf-8?B?U3dER1M0K21IeTRBNnUyTFlhWlErUXJOcjBzM3RONzdwRlZ6T29HWDdsajNt?=
 =?utf-8?B?azhvNGdOcXdMWXNjRTZkbVk5NTFBSDVXQzQ3YWovczZJbDZyREh5MDBGUUEw?=
 =?utf-8?B?VTJieEtDaVQ5UWpuU05FYm5nMlNabjliditiMmpic2w3SmZUU0F1TEd6cG1p?=
 =?utf-8?B?SnN1WlpsSzNrSmtFT0ZoNXVmaUY3WnZpakQ0SHFFcTJZYWhlOUUva29QSU42?=
 =?utf-8?B?WStoY01zd1puYzQyMkc0aXVqTDU5RnNrL3JGWFh2cCtEbkdKZm5ZNFF5N29Y?=
 =?utf-8?B?RHREOTVOTnFYM3lkVnBZMkM2aHlVUS9iVHcxVVRmWW1MeFlERlh0Qm1WRkNk?=
 =?utf-8?B?M2xBSzVYYWxlWGJYdGFSaUk5SlVjZmd4QVZWUzc1TDg4Tk5NeDVFNnVySlNv?=
 =?utf-8?B?ajhNQkFqWGdYYlZaYnlGZUJXTnZUeTVmM3R5NFYrS2pxVS85Q1k2bnIvZG1D?=
 =?utf-8?B?UUhIRjBmeU9VT0VMM29qek5VVjN1SW45V0dJZndTQ2FIZjFBc0hjTFBLcjUz?=
 =?utf-8?B?akh0ZEszZlEvOG5vdyt1QWdZZUlhY2hYY2V5elp3L2p4WFNjcXdLWWxBU1Fi?=
 =?utf-8?B?UXFEcDZQMExtcWJkWkJIZEEwWWhVNzhtVkpud2FLNVBuenpoZGVkaldkRUVo?=
 =?utf-8?B?aGI4aXBIM0F1b0dZVVVGQS9tbGRUUU9KcE1oRGZUVkxVRDZBODJRYkgxa1ND?=
 =?utf-8?B?NTZOYVZOOXJKd205RTdiUkFsK2lrSXk3bUh2aERmTHJ1M1RQQXYybHRVdWpX?=
 =?utf-8?B?cEQvQmpNY0RiaitBbm9pelVIaG9vaTJXazZTMHJWeVZyKzc5TW9kWjFVbDda?=
 =?utf-8?B?UnJyaE40MkEzRjYwS1YzeG1qdjhBYWU1T0pOcGhkd2tsalZXWm9LTFRpU1NQ?=
 =?utf-8?B?N0FzWlRQK0haTjdZc1M2Ukx2QTZOUE9iRXNKVzVnVU8zOWtBaWJXRXpLazlt?=
 =?utf-8?B?M0tnTWsvM3Nxb3U5QnJyVEJkKzgwU0YvVUlSOGlrUFhwUk5lU1FCL2srUmRM?=
 =?utf-8?B?K0NxMVVwb1RiemNvTXdDb1QrVThVdFJOMm44WERvazNIRnFDdytra2lraTdx?=
 =?utf-8?B?cS9LTG1DSldidFNUZDVNdDdIWm1mSEhEUXJrRVVUTXEyNnZyajJrbitmZFlo?=
 =?utf-8?B?L3BBZWlya0IxUGVzTDdoZTVQUWRrUjBjczdSRG9rWng3QURoalEwYkYxM01D?=
 =?utf-8?B?dHRDd1Rteks3ei92ODEzQTRlY1hFZFUzZ1NhRHF2cEY2dTg5RVhhd2Z5S2RB?=
 =?utf-8?B?eXlNbW9za093azBlaEcydlVQQ1kyL3M0N0wrc2tkVXp5dERmbFVqZkZ6ZjhR?=
 =?utf-8?B?VUZCYmxRQzBpUExFa3ZvMzVGc0lxbW9reTlJZ2lyTU43cEpGM05VN0F5UkF4?=
 =?utf-8?B?Vk9YTG05cXZRZE8rdnhtM3RmRXkxYm1ZRUo0Ly8waXhvREtjY1dleEY2Vldq?=
 =?utf-8?B?Z0UwUFFwTVFGaFpzM1FhcWVLSTJYdkVQRzYvWTNPNHJvbVBMK0pKbEFIZFJL?=
 =?utf-8?B?VDROUmIrTVd0OHlRcWd0RFEzbE9PcGRieGtSZTB3QS9aREpGRjdYd282YW9O?=
 =?utf-8?B?N29lOXlGVDc1MkpCQ3hvSlpyYWRDczc4ZWNrUGZDYXVxSm9FR3JkaEluK3FS?=
 =?utf-8?B?OTgvQXZVdlg5NmsyK21GWFdRN1VRV1NXQXN6Nk0wV3doOWJTWTdZcXgzU1NK?=
 =?utf-8?B?TVF4YURoSUJtSlVHMHpZMXdCaUJMWW5RUTFzc1dSb1lRSTF5cGJzb0FBZkdD?=
 =?utf-8?B?UWh5S25mdWVjT2MvWHc3aWpqT3M3TmxCOWhEZzNEU2l5MWlpVnA4SzMwejZx?=
 =?utf-8?B?VmNabzVxeVdHNDZ4U1d0M2RBZWpFbUhXZTNZMmZlS0lxTUkvNlBSRlZrSTVi?=
 =?utf-8?B?TWJmcVBFdTVYVzZ2YUZCK0FSeUtGTGpVaUtTZ1ZlZGViRDB3eFlVaGlNcFRZ?=
 =?utf-8?Q?EElG+6cnP1pgYeLfvlJkr2uye?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3cdffc-0699-48a0-b962-08ddb38f95a2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 02:25:43.0084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y69vU/J7dB3z+thgwXkODq6Tm2mPIHwCCcRw8lJ0W16DE6NF5Xp0lK9jnCIpkOVa7hdM5DWh1AcS666IeH0BHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB10042

From: Peng Fan <peng.fan@nxp.com>

Add CM7 nodes, vdev related memory regions for remoteproc.
Enable MU7.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 6886ea7666550605d6c2aa3d81ff270164e5796f..70f000b1c4032a449cbf9ceb746c16c9f3062a61 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -75,6 +75,37 @@ linux_cma: linux,cma {
 			linux,cma-default;
 			reusable;
 		};
+
+		vdev0vring0: memory@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+
+		vdevbuffer: memory@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	reg_3p3v: regulator-3p3v {
@@ -202,6 +233,20 @@ sound-wm8962 {
 				"IN3R", "AMIC",
 				"IN1R", "AMIC";
 	};
+
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu7 0 1>,
+			 <&mu7 1 1>,
+			 <&mu7 3 1>;
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	};
+};
+
+&mu7 {
+	status = "okay";
 };
 
 &enetc_port0 {

-- 
2.37.1

