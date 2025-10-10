Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B002ED174;
	Fri, 10 Oct 2025 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760099097; cv=fail; b=mDOfZV6So6wdHS8krkKZnpuiUPi+dcIi/UuV1e5CSsFj2M0VKNfXpodMD4xbhJWYVcYP3X7g8/CNkQnz2xntbzUAWSahnG0NKCjoh7t4LfvQmfzOwQ9VqVofX0eCIEvtVXNROIERK1UbjGooIuVU0jdbcURWGAiSkSC//sPjXvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760099097; c=relaxed/simple;
	bh=1eP+4qoxC8Ik0Xg73as5YgroQlDFbM1tbRFuzU0Qkz0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IDHbnz2YB7gHM94FC8pvS8r3I0/iboeF/UXpFpkoYxZU+3ZhKTIOuLOoTAntGbO88PYBy+x5dGJU4dD8hzIEbVJ4JpqnAiwDixYnhScJsDHd2UrzYa+X6hlRhf/B1E4Os/gXQioi1vBS3clu0pkHLI/zpS1Wf+XTP28qRd4a/Aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fER3XVCc; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fER3XVCc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IybjzS9tsOBUeuNKs0+Ot/Sv1pQqfxTh4AfRhir4PJqhRwNa35H+7P/naFaq4ASMuwdGeIU1dTqwA8Hq59k1H38pWv7c5+UefczR9eOlEojby8hSksPX6rCZwUzYKK8eqCGg9ygja5CHMA8QcTXy85YfonCtH3kREbQXbS4fyARPHsxX4qPZ+/pU5KXOO63cBU/TmUtiJQWsX20+uXv8jsYAKbPP5Q5bKpy0XYpRAhgJmMvMUOWIhvbFehlgOhsmJJp8y2ZDnscNKTIcmhfNyiU9o8I61acmqkjyGYOpTQHxrhUn+YyXuBHdLSydZzNTUQcuSDEe9Y82mJjZ6m4+6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlJ80CsSvf9wQD9brbGU07Hx8SXlWZcis4JATqA362Y=;
 b=I6J/HOhRaUqr4I1fdTc1MEgnZXTEtZKmeEy6MyfUgYcIHLzREC2CSARCqYZkaqmRdeDLyWfprBVpAsGZsMSagNQDtd7MWHmFiij5Ac6xDToP8whmWxxAjdFzzZlkzcuojMlKNrpm6ug07FTZDAYvwM3d2fz9wM/V8kO/YrbW61F2OP70gdONFBR5eHQ0o9ssb3liauypR+ax7j4UMmXFCHXqWo00DSl9fI7VR9Rd8lLiqbnKDPfBt25p5UuzvWssHKudg1BJc4RtGIddshKstXZnaGFwtOICpRA93kqhNqRmmtoMotjiwnDU0XWtKny691tcQeJ4fWoyKkFfxRGPIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlJ80CsSvf9wQD9brbGU07Hx8SXlWZcis4JATqA362Y=;
 b=fER3XVCc50gnCC0AMatbG6cOSBBMIaD/p/xkS0n2eIN89dNfeIuBbyn1Tfv6kgZpyBfFmOxcSvkPrGtGe9CLT7UDwf//UpS1bVlIEW/dT7sFPQUAO+h3TFoEEwgi9CpdYglhZuv4MYVMBjLuk5oBm1nBi1L+N1SMTCcQgPlmROe1zYAVW4XjJw7mJJH/oavDag2hifc+mWo9BkVyMRvyVhoBAz1zTOkvJFSbJPX0cg4RbLjvgFgNfbi3FjxpNK+w0W3U1ZOcpKyJnO5pfDjeOB0z5+HjFiCD1iUUbgqymVcTJtR0bOB2fm4K1XcYRSQwx6BnFKdFqqYR144uXorjCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8535.eurprd04.prod.outlook.com (2603:10a6:10:2d6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 12:24:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 12:24:50 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 10 Oct 2025 20:24:15 +0800
Subject: [PATCH v2 4/7] remoteproc: core: Use cleanup.h macros to simplify
 lock handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-remoteproc-cleanup-v2-4-7cecf1bfd81c@nxp.com>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760099067; l=7837;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=1eP+4qoxC8Ik0Xg73as5YgroQlDFbM1tbRFuzU0Qkz0=;
 b=tkGg8NH1t2iMDh9d4cLV4o4vDzHx8/OFYzPcRq+Dd+Aj/J/yXSjbDHdmqK77A1H61ZXE9ZE13
 Osf+LlmFHU6A2CIP4XC5LUju8+AIiKo0fMuhLCn/r6Kqh9AIyyrC/AL
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0134.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: b866c8fd-6304-4ee3-afba-08de07f8024c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzlIM0U0L1E4TGgvSnNSK2tWZ3FkWUZuSmVoZXhYSDlKd0pzK1A0SnVLbDkv?=
 =?utf-8?B?MnhHa0x4VDRPd3B0VmRHS20zSkxjUnFQK2NzVmxNUWl5dUkralhrWVhNbGp6?=
 =?utf-8?B?T0Zqa3lLc1ZBdjJWWTFWaFZrTWJTU2VPRlgzSWNTQVN6VTEwQ1VXZ0lST2oz?=
 =?utf-8?B?K0o5VGltNFQ2ZUZpaDZod0p2S2tBWHVpdHZDcTg2N3cvQTBBRzM1OVVnZ1V1?=
 =?utf-8?B?eEtEZCtOcmk4dVE5L25aZmhQNjI1eWlkZG1WMlVLUjZUaFE1NkhRQ1llS25j?=
 =?utf-8?B?UG1sQ2xUOThsWDJIVkF2OU4wVjIxYmdKdzdIVGVEZ2tCMVVheDJjWDR3elNR?=
 =?utf-8?B?cnZmRUVMb0NpWHFhQzQvbHV1OExXbEVaNWZZdHJXeThGQkZ5ZVZqYUl6M2c2?=
 =?utf-8?B?d1VISTBpTDF5NkQrTGZ4UStJY21heTV3VTJnOGtmRXR4VlpsQ3lLS21DMUVL?=
 =?utf-8?B?dzV6YzNibGlxTnlNbHpWMXp3bWpJZUpodEdPVXlReFR0MDBaZGF3ZzBLN0lX?=
 =?utf-8?B?TVkrb2VwVTg0NkNwL3ZRSmFSREpXTFdnVVJoQjVydHVUUmJ6Y0tEQ3BmQ3Qv?=
 =?utf-8?B?SElJeXVkSU9tTmRuM3BTR0p1RTdMcWZSYlZMYVJmeGEyM0QrMy9IUWprWEQ1?=
 =?utf-8?B?T3F0MUpOMW1velREc1ZTZldzRDcyOUllZ0pvNU5acmxKdVhUZDh1NlF2Vktq?=
 =?utf-8?B?YUdZUEw3TzBtSEhYMFc1YTdnQ1RZUlpqdmhpSmE3SXpTeHVlRTlZaURsRUdI?=
 =?utf-8?B?WUc4dnpXeDQvcngyU0VlUzY2MERPc0c2SUFBNEFFMVVUMnpQdmJ4NVJ2bzEx?=
 =?utf-8?B?VEFSaERKR2Y3K3E5Mk01QkZROXhycmVOOWVKTnh5OU1vTWNUTjdSWWtrd1VZ?=
 =?utf-8?B?ZTlOR2ZRZ0hPUnYzTVdrd2JnNFRueG40NCtDSkVzZW1PNkVvbkM5d0pNTHVz?=
 =?utf-8?B?M0JlcGtjakdPUjhRc3FNMDZlVzRPdUkrNXc2V2UvZ3B5cmhldVowdmZTTDhU?=
 =?utf-8?B?cHR1Vm5mUFdDQ3pkZ0Z1enI4RHB5NHF4Uy9obEh3Q3ZLOHNldEFCNFVUekV6?=
 =?utf-8?B?dlpyNm5ubldYaWhhS0hvS0dwSmlxY04xV0FqS1Y1ZXVFWCt3bVNSMXlaci9k?=
 =?utf-8?B?Q1U0MFhWMEs1RWJjRWVzM2RaRDlsTTVlNThLQzNFbm4wUFkyY0h1WTNXdWUw?=
 =?utf-8?B?N0NjL2pxYlpSU3FXb2hmMS84dzR2Y1pBN0NzcU1KcW1CUlM4QVRHZzcycERS?=
 =?utf-8?B?QXd3QjdBeFJNNUZDRzhUOUNSaFJzU082T0ZvMWFjTjA3MmdGdkl0Q3RJVnhO?=
 =?utf-8?B?eWdHQ21XKzd3eXNaeGtvbUdDN2x1K0w0S0NXTk5pUWxSdDlHS1JlSG1uM3lo?=
 =?utf-8?B?cFRiUTdkbzZZS2lkbWlxM2J5aUw3Tml1WkdNbDlvRGJ5Sk04Vm9RTWNTTC9F?=
 =?utf-8?B?L1QxSUpxUDRoekVyaSs3ckJJMDZaZVpOQndzTWpvNnp1di82Q3RCSHJMOW1R?=
 =?utf-8?B?dS96SWZCdXJCV0YyT0IwdGF4TW4yaUZSc0ROa016TXE4TzI0bEtWcjNNNXUw?=
 =?utf-8?B?WXFlalY5eUR3dTU1eTZhaUM1SFozczFjK1JjRGx4azBDelBjNmE2OHRpUktl?=
 =?utf-8?B?YjJpZ2E1ellYcUZBbWJ2UTFJcVkyNmhtbzFzQU9PN3FkUzJiZ0dGZ0ZnQXNx?=
 =?utf-8?B?eitENXhlUWlWcG1HNEFaSUJuZnhWdlVaa202SS9ET0FpY3RkaFR5cmVSSUJQ?=
 =?utf-8?B?aTBsYXVNQVRMYllwbFM1bkViMzJvNVJIR3VGT3VUKzgxcWN3dkNnbkJXUDFh?=
 =?utf-8?B?OTNlbW5KdDk4TkNPaG4xM05tKzZ4ME5LcDJ3bHdkdHFPZGVKVmFWMVVkU1BI?=
 =?utf-8?B?SjBHRWY0cVVadXdNZS9HVWF0MG1SZGJpd3RtLzFlVjNaNEkzYllaTndodWxk?=
 =?utf-8?B?RGlxV3ZSQmMzR1lkeERSbzIvODFVaWNRTnlBSytXc21NYWp1MnBtUWdjckJ5?=
 =?utf-8?B?ZUlwcnhqRGY3QWVFL2UxYTFuWmJNV3V6VjN2Y01yU0R2OWZ1bS9VV3d2eS8z?=
 =?utf-8?Q?LudPBh?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU1QT3RUdCt5L3c0ZzU1NjVlanJxVURXalVJWFdMdExVVFZhS3RxdndubWI2?=
 =?utf-8?B?WmpKYVZURTlwY3pLdWY0dmg0WWZQd0wzeExJQ01ONzJGblhRemwyc25EbDZz?=
 =?utf-8?B?L2RJdWxuTG5oSkVRbjFZRnNUTEZkajJvQVZUUGtLOWpCWGliYUlSa1gwMHow?=
 =?utf-8?B?TW15bFBncWcyOHRMN0wwNnl5eUVRQ2FQSW5hQUlXR3JtNVN1WkNVeDc2M1gr?=
 =?utf-8?B?T2ZFZFllS0o5aG5GUisvM25mc3J5NFNTVGgzQUZxQUxHWjlobXdxckUxTFJw?=
 =?utf-8?B?d2U2eFZLSDUrRXJDYXJQQjZYaFlYWFE1VUJNZURRSVp0aWZPamJNUXRkUFRo?=
 =?utf-8?B?enVrMGV3SGIwVlU0TlpHMnA5Q2trbTg4MWorTlBERHRJUk1DYzJheGM1TE9w?=
 =?utf-8?B?U3RYSk1KTHVHbVZIcHl6U2xnVy95ZHFCcEFEUUtURWYwWlo2REJFLzBPLzZz?=
 =?utf-8?B?NGQ5Nisyc01PNGZ4ZzVYLzBiYWtkcWUyMWlaaDVlWFdDcDVPbDZMSUtHWmNr?=
 =?utf-8?B?aktrZnhISEJ6blpMd0pydXhsaHpzVUtSZkMzanBFeGU0VUVuSDFZQkZ1aFl4?=
 =?utf-8?B?aWtZZWdIWVQ4UkcwOGYxR0FseHhkMURCYWRMN25EUVIwdGpkaGpFTTVTOTdW?=
 =?utf-8?B?bk9SeHVpdjQySVZKeUsvZUF1bnZtQW1pQlUvSXl5eTN4K3E3RmtnaU4vbnNq?=
 =?utf-8?B?THgwVVlvRGVvU2JlcjdtVGpIcEVzRTV2R1V6U2d3U3llTWZObCtCL25keGRh?=
 =?utf-8?B?QWpTQ1M1U0RYVnMxZ24ySkFQOVhZaE81V2hPMXpDekV5QmU1OWxCWXBJblhl?=
 =?utf-8?B?R3BzNHp6VU91QVY3aUFrTDFTNEtOK0tIV0xNRkV6WW5kK2NvRTVleG5tZkFo?=
 =?utf-8?B?MWRIaC9Rb0VJbVphVFU2NkZZSzlZYTM4SVpGRkJvSjZTaXlGcU52VHdYRDM2?=
 =?utf-8?B?bnpjUXR0QWY2T2g4TjNiNFRsRjRKUy9rRzBRdXNoUXNhT1lmYWRmeDJCSmFv?=
 =?utf-8?B?TlpyVzlRcXl5Nkd0UDRYMkFuazd0d1k5bVVjQUxBQWZPK3NFN2NtUFdneURv?=
 =?utf-8?B?aEJHK2ZoYW5hdUtSL0gxbkxNY0NVdWY3WGZSMFhSd0NGZUZsdU4rdG9uWFJ5?=
 =?utf-8?B?OFd4ZnVTOXNLbTBVOVRXV0VTQ0J3ZGpnNjJxN1YvVURyd3BOVlV6K1c5RDVG?=
 =?utf-8?B?RFVRRU1oUisxM2tnWVV4eTV0VXQ5Z0JrWGVGWHdzeGNKMWJSTlo1SSt6SkhB?=
 =?utf-8?B?NzA1UEZQRTVYUDhtVEQwM3dDOFFSbjhNMllCN0lTcVZjOGtka3BKd24xZDc1?=
 =?utf-8?B?QXNGRDRXd2plQkRnd3JCUG9YbU9sa0RSK0RRcUo2UVhKMFNhcFFOQ0IwTFhU?=
 =?utf-8?B?VzVVNThTelBLVUtGSXpaSGl4Q2YzNysvVGhsM1N3dHczWXhvQ0xEQWRiUGx4?=
 =?utf-8?B?dFJWM0F4ak9jTnZ0dHpjN1BUZDZGZ1IrYWp5RkJuS0dZcG1pd3JSc2tRTEky?=
 =?utf-8?B?d252R0Y1N0lKRzVUV2FjNjlET3RtRUdWWVNYdEtXZjhzaXgwcElseWYzbFFq?=
 =?utf-8?B?WE9JcXg4LzIzN1I4dzZ1V0ZiN1FWY3lzQWdkb2xjZE9wZ1pQOStYYlJOODdV?=
 =?utf-8?B?VnBJemkzaVE2bzE2bUJ3Q1E5Nzc4citLdEdEUW11aVIzcTkrSWRSVHBCNzha?=
 =?utf-8?B?ODU5M25UQTdidVhmdU56cGZNTm5PY1h4YitQaXpXbGNRcWpoM3NseWdpbS9L?=
 =?utf-8?B?bzNrZU03ZTFYSVRENUVFUlRXdC9HM1lCbzJ5WkdKVkt2Q2lYYkw5eTZNTFNw?=
 =?utf-8?B?c0YySFJXa3Axc1NSKy9OUjNIRzlNbEx0SHVCTmRyQUg5cVg4YWNaVGhKb3JJ?=
 =?utf-8?B?VUNoVzByajZtZWFVQzVxNzFyT2hqa1RYRzRMU2VtVlJyQy83TzRvd1duZHJz?=
 =?utf-8?B?WlozL0pTazRXSVpBK3diQll1SU9mSDZ5TWR2K3plSDBPUGpXUWh0MHZsem1U?=
 =?utf-8?B?bmRXZi9OQkFsbmhuanRiTVJhbVVvWis5bUJxbGRnOTErRDhlRlpXYmR1MGtD?=
 =?utf-8?B?anJyS3NpMTVxb2VyeUdMUnkyNmJRR3JMNjVtM1E0UDRkbGVuMEhzWkpxMHpX?=
 =?utf-8?Q?pdDnU9Wflkmgu6A1jIukv68aj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b866c8fd-6304-4ee3-afba-08de07f8024c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 12:24:50.6743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: InrkP1Pn6r3AkNU7cPi+k3HdqDR7BpYo/co+g6a7Kpzo8yqmCFeB9VS3wmgXkD1oIYvi85IO91WgIsOMlOoHzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8535

Replace manual mutex_lock/unlock and error-handling patterns with cleanup.h
macros (ACQUIRE, ACQUIRE_ERR, and scoped_guard) to streamline lock
management. As a result, several goto labels and redundant error paths are
eliminated.

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 113 ++++++++++++++---------------------
 1 file changed, 45 insertions(+), 68 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 8004a480348378abef78ad5641a8c8b5766c20a6..dd859378f6ff6dec2728980cc82d31687aa7a3dc 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -17,6 +17,7 @@
 #define pr_fmt(fmt)    "%s: " fmt, __func__
 
 #include <asm/byteorder.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
@@ -1830,13 +1831,14 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
-	ret = mutex_lock_interruptible(&rproc->lock);
+	ACQUIRE(mutex_intr, lock)(&rproc->lock);
+	ret = ACQUIRE_ERR(mutex_intr, &lock);
 	if (ret)
 		return ret;
 
 	/* State could have changed before we got the mutex */
 	if (rproc->state != RPROC_CRASHED)
-		goto unlock_mutex;
+		return ret;
 
 	dev_err(dev, "recovering %s\n", rproc->name);
 
@@ -1845,8 +1847,6 @@ int rproc_trigger_recovery(struct rproc *rproc)
 	else
 		ret = rproc_boot_recovery(rproc);
 
-unlock_mutex:
-	mutex_unlock(&rproc->lock);
 	return ret;
 }
 
@@ -1864,25 +1864,19 @@ static void rproc_crash_handler_work(struct work_struct *work)
 
 	dev_dbg(dev, "enter %s\n", __func__);
 
-	mutex_lock(&rproc->lock);
-
-	if (rproc->state == RPROC_CRASHED) {
+	scoped_guard(mutex, &rproc->lock) {
 		/* handle only the first crash detected */
-		mutex_unlock(&rproc->lock);
-		return;
-	}
+		if (rproc->state == RPROC_CRASHED)
+			return;
 
-	if (rproc->state == RPROC_OFFLINE) {
 		/* Don't recover if the remote processor was stopped */
-		mutex_unlock(&rproc->lock);
-		goto out;
-	}
-
-	rproc->state = RPROC_CRASHED;
-	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
-		rproc->name);
+		if (rproc->state == RPROC_OFFLINE)
+			goto out;
 
-	mutex_unlock(&rproc->lock);
+		rproc->state = RPROC_CRASHED;
+		dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
+			rproc->name);
+	}
 
 	if (!rproc->recovery_disabled)
 		rproc_trigger_recovery(rproc);
@@ -1915,23 +1909,21 @@ int rproc_boot(struct rproc *rproc)
 
 	dev = &rproc->dev;
 
-	ret = mutex_lock_interruptible(&rproc->lock);
+	ACQUIRE(mutex_intr, lock)(&rproc->lock);
+	ret = ACQUIRE_ERR(mutex_intr, &lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
 		return ret;
 	}
 
 	if (rproc->state == RPROC_DELETED) {
-		ret = -ENODEV;
 		dev_err(dev, "can't boot deleted rproc %s\n", rproc->name);
-		goto unlock_mutex;
+		return -ENODEV;
 	}
 
 	/* skip the boot or attach process if rproc is already powered up */
-	if (atomic_inc_return(&rproc->power) > 1) {
-		ret = 0;
-		goto unlock_mutex;
-	}
+	if (atomic_inc_return(&rproc->power) > 1)
+		return 0;
 
 	if (rproc->state == RPROC_DETACHED) {
 		dev_info(dev, "attaching to %s\n", rproc->name);
@@ -1955,8 +1947,7 @@ int rproc_boot(struct rproc *rproc)
 downref_rproc:
 	if (ret)
 		atomic_dec(&rproc->power);
-unlock_mutex:
-	mutex_unlock(&rproc->lock);
+
 	return ret;
 }
 EXPORT_SYMBOL(rproc_boot);
@@ -1987,26 +1978,24 @@ int rproc_shutdown(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
-	ret = mutex_lock_interruptible(&rproc->lock);
+	ACQUIRE(mutex_intr, lock)(&rproc->lock);
+	ret = ACQUIRE_ERR(mutex_intr, &lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
 		return ret;
 	}
 
-	if (rproc->state != RPROC_RUNNING &&
-	    rproc->state != RPROC_ATTACHED) {
-		ret = -EINVAL;
-		goto out;
-	}
+	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED)
+		return -EINVAL;
 
 	/* if the remote proc is still needed, bail out */
 	if (!atomic_dec_and_test(&rproc->power))
-		goto out;
+		return ret;
 
 	ret = rproc_stop(rproc, false);
 	if (ret) {
 		atomic_inc(&rproc->power);
-		goto out;
+		return ret;
 	}
 
 	/* clean up all acquired resources */
@@ -2021,8 +2010,7 @@ int rproc_shutdown(struct rproc *rproc)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
-out:
-	mutex_unlock(&rproc->lock);
+
 	return ret;
 }
 EXPORT_SYMBOL(rproc_shutdown);
@@ -2052,27 +2040,25 @@ int rproc_detach(struct rproc *rproc)
 	struct device *dev = &rproc->dev;
 	int ret;
 
-	ret = mutex_lock_interruptible(&rproc->lock);
+	ACQUIRE(mutex_intr, lock)(&rproc->lock);
+	ret = ACQUIRE_ERR(mutex_intr, &lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
 		return ret;
 	}
 
 	if (rproc->state != RPROC_ATTACHED) {
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	/* if the remote proc is still needed, bail out */
-	if (!atomic_dec_and_test(&rproc->power)) {
-		ret = 0;
-		goto out;
-	}
+	if (!atomic_dec_and_test(&rproc->power))
+		return 0;
 
 	ret = __rproc_detach(rproc);
 	if (ret) {
 		atomic_inc(&rproc->power);
-		goto out;
+		return ret;
 	}
 
 	/* clean up all acquired resources */
@@ -2087,8 +2073,7 @@ int rproc_detach(struct rproc *rproc)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
-out:
-	mutex_unlock(&rproc->lock);
+
 	return ret;
 }
 EXPORT_SYMBOL(rproc_detach);
@@ -2192,7 +2177,8 @@ int rproc_set_firmware(struct rproc *rproc, const char *fw_name)
 
 	dev = rproc->dev.parent;
 
-	ret = mutex_lock_interruptible(&rproc->lock);
+	ACQUIRE(mutex_intr, lock)(&rproc->lock);
+	ret = ACQUIRE_ERR(mutex_intr, &lock);
 	if (ret) {
 		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, ret);
 		return -EINVAL;
@@ -2200,28 +2186,22 @@ int rproc_set_firmware(struct rproc *rproc, const char *fw_name)
 
 	if (rproc->state != RPROC_OFFLINE) {
 		dev_err(dev, "can't change firmware while running\n");
-		ret = -EBUSY;
-		goto out;
+		return -EBUSY;
 	}
 
 	len = strcspn(fw_name, "\n");
 	if (!len) {
 		dev_err(dev, "can't provide empty string for firmware name\n");
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	p = kstrndup(fw_name, len, GFP_KERNEL);
-	if (!p) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!p)
+		return -ENOMEM;
 
 	kfree_const(rproc->firmware);
 	rproc->firmware = p;
 
-out:
-	mutex_unlock(&rproc->lock);
 	return ret;
 }
 EXPORT_SYMBOL(rproc_set_firmware);
@@ -2316,9 +2296,8 @@ int rproc_add(struct rproc *rproc)
 	}
 
 	/* expose to rproc_get_by_phandle users */
-	mutex_lock(&rproc_list_mutex);
-	list_add_rcu(&rproc->node, &rproc_list);
-	mutex_unlock(&rproc_list_mutex);
+	scoped_guard(mutex, &rproc_list_mutex)
+		list_add_rcu(&rproc->node, &rproc_list);
 
 	return 0;
 
@@ -2582,16 +2561,14 @@ int rproc_del(struct rproc *rproc)
 	/* TODO: make sure this works with rproc->power > 1 */
 	rproc_shutdown(rproc);
 
-	mutex_lock(&rproc->lock);
-	rproc->state = RPROC_DELETED;
-	mutex_unlock(&rproc->lock);
+	scoped_guard(mutex, &rproc->lock)
+		rproc->state = RPROC_DELETED;
 
 	rproc_delete_debug_dir(rproc);
 
 	/* the rproc is downref'ed as soon as it's removed from the klist */
-	mutex_lock(&rproc_list_mutex);
-	list_del_rcu(&rproc->node);
-	mutex_unlock(&rproc_list_mutex);
+	scoped_guard(mutex, &rproc_list_mutex)
+		list_del_rcu(&rproc->node);
 
 	/* Ensure that no readers of rproc_list are still active */
 	synchronize_rcu();

-- 
2.37.1

