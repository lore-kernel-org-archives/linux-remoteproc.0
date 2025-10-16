Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010031.outbound.protection.outlook.com [52.101.84.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58F030BF66;
	Thu, 16 Oct 2025 11:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760615309; cv=fail; b=MzdgkIb70g6yo86Zr5OkwyMh945jBHA9Cbmgr6K7X5Wct0opkvxoQqoPJWH4UIZR+X5CDrSxJC+b3JAf59GI+LpNCrDoM6eQqpnBOmgsgBnyCNLi5n5VAEeYkoqPBTUH/WU+vKGYW5FFkjUbtE/9cCiQapwQvvp/MPAy2AATN0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760615309; c=relaxed/simple;
	bh=AtLBnon7/hCXRaawllKNOGfyFwvtQ3g4qCqVyQeQdCY=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=qyTV57Cbo6Cu5YQmfpBd8zSSOADRSN/E6DtkGf67uxPmbXjAcvPdzt7lss8RxbZxiMDNCX4jyOBxj5qKZICw8oB95M3WnecD4WKrv27N3Wny2zS5uMI7B413lrfsZJmq5na3q1Xdqj88heYcQIvy0KBzVvzpXvomgw8irvjYIAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CKtjtEfg; arc=fail smtp.client-ip=52.101.84.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CKtjtEfg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ykIX4zN9lgIfsjKyit5G61yt6o9t+z/ymvzu/I/3AEElb1BYYpoSlTKYTbzsRGA+XfQuRGsmzw2JhW8CAiAMRHcAEsc2ClSwKpWRNRo8chMWIgnORrRHYez3rGoaTrZgcZXZersjjFzP5D3EEKOelOJnIlrHKo/m/nYkHXYnL4XbRGl60KtzwLllIg2mlpKIcRSl05CkGUbviCCF7KQOwbwCmmT9ip+I3LlaozFF+xhirn7ec7nCzlEkXnAvXMXbeyuCEy54dbTMWXBVuTMPpbkQaLkUsmIjl9EwtE5d00N3I1S95BB8n/+jWTbGn+82Wyt0Pfe0vUHQG2iDCTooOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82KhjcjDfbqEVNoNBbOzBOyf73ycaEzXJN0kQstU6W8=;
 b=lgeODq/ITEHPb+FOMRm8oriCj45D0H0swddSSr/kuuNGw+KuBJFbK51g6gt3ggOOnjljP0q56nlJQSBm3/5lHM/EOGuwIYO/7oD8NfaKEv8Hvl6LLpcHiSu9M3H4sLS6z/tAH68hAfecx1izKwtbCjB5/fDnwDTgXiKXuvbNe+zMUloYv0hxrgJu0DEnRaYASaMT+E4Gi9Uv1HtUofCB1tZpUaHe8RrpaaAU1ojbn1jSySCHClo3DraMy3C2zvrJaX2RgTtjfi61sAZYW6O30AlbjYlx6peZIGEmCvJ+icw/mEW2XllNq24P8cS/WBXxDkgWFsx4y+uzfjsrRCD0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82KhjcjDfbqEVNoNBbOzBOyf73ycaEzXJN0kQstU6W8=;
 b=CKtjtEfgAPOTBMesslEWWt/Le10wG1TdPE9/ov3AF9IFfsKBqREueu/d+ACTQOyuwjzt3cBKuw4SZnz+f4eyHyJedugkuQ6CBS3nszfQ3UoNCms+OWNnEOPMTabpZQtzlpSReREjT+FZISu5vkqDWZuyYg2byrX+emsybWCu3VXRfyBBRUNz36cKALDGtQOpro0LiycTV+4KC6SvjYSe0w4H5EI0nx12taPD92ikS+cYMXwyGWLE/mZuCpqHtfrXOsRRZfsZ9bKYrxpsQOhRAsYJlqnxklPJIkQoaaaQEUmiZrb5DajfGoXzo0Zf6R/34U/bojGtvtXUZhux33mmBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB9065.eurprd04.prod.outlook.com (2603:10a6:10:2f0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 11:48:23 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 11:48:23 +0000
From: Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 0/4] remoteproc: core: misc update
Date: Thu, 16 Oct 2025 19:47:57 +0800
Message-Id: <20251016-rproc-cleanup-v3-v3-0-774083716e8a@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG3b8GgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0Mz3aKCovxk3eSc1MS80gLdMmNdY2MDEzOT1NRUY6NUJaC2gqLUtMw
 KsJHRsbW1AF6tGlpiAAAA
X-Change-ID: 20251016-rproc-cleanup-v3-330464eee32e
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760615296; l=1410;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=AtLBnon7/hCXRaawllKNOGfyFwvtQ3g4qCqVyQeQdCY=;
 b=7aMsh5MpXpBJVRITQT1Y7NaEaqezDMl56XdvUFJ/LEldtA+Y1Kk5C4rPSF3PfbC+Yc366wXl4
 XJqwzSUdlpwArtt0ANVcIx7qA1XRC27KRj0fLIagU8bjfuv0nwm4fUR
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR04CA0195.apcprd04.prod.outlook.com
 (2603:1096:4:14::33) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: eabf0257-cc51-427d-270e-08de0ca9e936
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VElKZ2xaSlE0SWs0RzJMdFJyajQ1aXVhdk5xanFDOVRXS0lsMzJwUVAxVUhW?=
 =?utf-8?B?SE4wSzZGaGoyL2dGQTdxbG5xM3Z2TVdkcUY4TWp1cGo0NFZTK0VqUG42bWN3?=
 =?utf-8?B?VGZJaklyTVFXNFpCb3lMcGtWWEpIQ01lQ2tlbnJrdm0wcXp2T0w2ZUUrVmVQ?=
 =?utf-8?B?TkxxNzYrMGdZUTQ4NURwRDJWaXUxbmJ1cmFvakRMM1hlaGtBUDgwWDVMbGQx?=
 =?utf-8?B?N25RRS9sRm9mZFd4eHQ5UXBDYzBxejlQZk1JaG1VK3hlOVlVNDJQTzJlYVdo?=
 =?utf-8?B?UmlIYnVpVEN6T3l0cTZmSWpheXZ3Y1FFTkFldTZ4UWNoWXlmQ1MxaVpQM3pS?=
 =?utf-8?B?Z0hJSjZIK1BKeDVCdEFWZGNYVzZsbzhXQ29aaDZQOHliQmxwRTh6aEZtQ2JS?=
 =?utf-8?B?OXg1YkF1a3p3NkdwZmhlZ3h5aTdpRHhLeUJmaHM2SnhSYUJnWC9SUjIrb0gx?=
 =?utf-8?B?UXZueXF0TEdVQ3ljQWJTS2ZjWWxEM21FLzVTSkZ2Vm9NSm1vY0J3allkaHB5?=
 =?utf-8?B?amNXN1BTZzBOM3NkLzlYdWxiUEtEZjBzVGhvdStFcXJTYzdpTVg3b2dSYmE1?=
 =?utf-8?B?aHBPT3Nob0l2V25LcnJVZ0hPZlNITHZOTVI3M1JYNmJySE9ob2drWEZONGtq?=
 =?utf-8?B?elBRZ3p0UmRRMkRaQXBseGRYU2RqanFVeG9hWmJ3czl3MTBmS0pHeEZaR3VO?=
 =?utf-8?B?UGNycEFwTmd5cUM5TzZqTHNKNlB3NlBsMTNyTlZ6bS9rRmhuK3pTVVcyR1hH?=
 =?utf-8?B?WUh5NENFSnFKbHdpcHNHelhCOXA2VUcvOHlueEE2dHhOaGp4Z2Zycit0TC90?=
 =?utf-8?B?VGl1QnJ2b2JIY3BnSExHc0Y3RGNVL0VGQm00SFRKUTBTNFJXa3drR1F5NVVC?=
 =?utf-8?B?NC9meEZyQmJqS1pvSmxLd0IreDAremV5YllKWG85NFk2SWVqZDFOOXpnc05p?=
 =?utf-8?B?ZHB2ZEZuVnozemdKSEs5a096MThubkpCNW81MzVaa2pZekQ2ZEd5b3MrV0Jo?=
 =?utf-8?B?VENhYmx5Rk5RZk55TjMwY2Z3R1BCRjExc1dPWWgyUENEamxXWHdHUFoxVzh3?=
 =?utf-8?B?ZitnZG1kVVNvSXdjTWgvN0l4ZThPZ1NoWUlqanZmTTdvT2VvaG5ZNkJ0emlN?=
 =?utf-8?B?WmxRb1NQQUZxVnYvN09wL3VqWjRsekk2OXZKZkVFdzJsdWo5VnhjWForQTVR?=
 =?utf-8?B?bjdRVVB3QWpaOWZJM2d0NDZzdmhGVGtDK21iZVZkT2xPMDlITjNkeVJySlZ3?=
 =?utf-8?B?UXIyMnlwWWZXdHFEcHhhalg4Y20vVU1JT1lXUVVKYkw0VTd6LzRHNldnbWto?=
 =?utf-8?B?VVorREE3WmVUamRUM3laNTlmUHM1YUFydk5WNXcraTRBemNIZTk0QTNyb1p3?=
 =?utf-8?B?M0tmRzZXOGVUMnA1RnFWbUNadE5SeVFoS0xrM3M3akF0VjFkbnpWaVM3T3l5?=
 =?utf-8?B?Q0tjdW1QakNmQ2VaWUViY1dKanNLNHJWbVpiOWN1U1V0SkZaNk5Zc3Fyd0ts?=
 =?utf-8?B?OUlhTWQrWUtFRms0cnlMaTF5dXNxNDk5Tyt6b2NQUEw0Q1RqcXNVTGk1ZUV1?=
 =?utf-8?B?MWluN3l4ZEQvNTQ5OFh3Y21idzgvQ05GRm5EL0dvZS8wV21OU2s2UEVVZWhD?=
 =?utf-8?B?QlUvaWJ1TjBqaUhTSTJXemJ1a0Y3ZlhrL3hoUFZ0VmRwZ2tZMlVhOWVWaEhz?=
 =?utf-8?B?Q0d1TDRrd2R6TmJ2VFpxTTVXT0ZqSFAzOW16ZmpHSjU2UjRjTk5BeS9GRXhB?=
 =?utf-8?B?eDdjbyt1dlFBMEdvenRZWVVZTk5lU2hlQnlOSWpMWWY3bzVzTDdOTDFhSytH?=
 =?utf-8?B?eExtdmEwMHN5WnRBd0JKd1dBaFlBZUh3QXYxTGc3Q1l2Q01xTXRlYVErd0tG?=
 =?utf-8?B?b2VncVVOUUk1UXhJQlljUk9QVkVqNFV6SGlVK0QrcS9kVk9MZWVRa3JDWnFz?=
 =?utf-8?B?S1k2dFk3eVYxWlM3UDVOK0xCNXpHaFlOcjRpU3U1ZnNwS2RoamUrdUlxODRU?=
 =?utf-8?B?RTR4UUx4V0EzZWxsZExOVStHMVRmS016cGNkSkREUEtURjFrSWRlTlM5dTBK?=
 =?utf-8?Q?WvvSUw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkNPdThCTHlzbjhXY1lYenBKZ3M5ZmU2QTlJNlpmSVFIOHp2dFhVZ1RrSnU1?=
 =?utf-8?B?V0xJMUxrMFRwanRyZ2lKSzQrbDQ1alJvdXFFc2dUSyt6bE1ZME8yYWJlZWx5?=
 =?utf-8?B?azNpUGlDOXVnM2praWtIV1docFJHSVRTdkw5bVIvR3VmQ1RralBMT3BKSWc4?=
 =?utf-8?B?QUc5NStPSzk2RExBMlZYK3ZUR1Q1dTJlSnl6SWxwYmxub0N4ZWM5eDlhdVdX?=
 =?utf-8?B?TTFBdjdBcDd5V2paaTZpOWZ2ekNOSU5kRzEwK0g1cUNEMjhrT2NJTTJmcWhv?=
 =?utf-8?B?aUR6WU9QemhBMGkxUWFvZm16UGFLTGpaWnRnUitJL2ptdG9LdjJubENxRFA4?=
 =?utf-8?B?Z3dHU09PQU56MHhhWFN5RDhHQ3dkUWNzUExtNm4vMHB6UWdGRWp1M25EZzFY?=
 =?utf-8?B?em1tWEhaYmdtbUh6VGN0b2ZpNmtLeHM3VmRFYi92VTB5d0ljSXp2cGZKZHdp?=
 =?utf-8?B?b2l1cUEwUm5wUk1OaEF2VG1YcWNZYUtCRml6bTlYbGwzaHBtUGlqK3N1WTdE?=
 =?utf-8?B?WkpiUXVhallGeGhHZ2hBd2ppb2hqbVRIOHdIQ1ZieE44RG9GNHNweno3MElL?=
 =?utf-8?B?SnR1U0NCT2FDU1JNVUdkSm5Ob2dRUjc4VEtQMGpaY3M0QUVzMS9DUXRjZVFn?=
 =?utf-8?B?RmRKbzl3MmxsbXBpK0tLVThPbjVwcUJ5YVRtbFUwS1hkck9aekw2RHg3TDVZ?=
 =?utf-8?B?bllUNXUycy9oNWt5ajJqTTBTMmhIZVczSG9GTGkycTdibG0yRVVqUGhJVlZT?=
 =?utf-8?B?bVRUVkdBOVgxdWg2SlVvWmNGUGJ0anRHUzBDNmtiMGRMY1BYN3hwa1ZmY1U3?=
 =?utf-8?B?ZGpNY25mTUZRbTlHNW91MWk5eVphSFY1VHQwbzcveWJuNWFVQkN6QzBzYTVY?=
 =?utf-8?B?MDdGMk5mZFlQZTd5aWtmajJMTVFvNlVqS1NSYVpGcUlSRlNCVERTbUEzSndn?=
 =?utf-8?B?K3FCclMydDdIL01qZnYvcm5lbjZLSng1bUVjUitJR0ZYTzh3K05HS1Uvb1p4?=
 =?utf-8?B?cVNiT2RCL0ZxcTdWWHlqYWtUNHJpNnh1bkVZMGluT2gxb0VOZ1IyQnM2K0FW?=
 =?utf-8?B?dW4zV1ZrZExOSUFWK04xb2JIZkxSaDhQYkpRdFZKd2FpamZyR2pVRCtyeTdB?=
 =?utf-8?B?OU9MOEdsU01WVDhDN0ZTZDFQb05lZ0loYW5hdUdOYnN6VXYzWCtjZVZrUCsv?=
 =?utf-8?B?cGxsSW9nUnhOWExsci80NUxvV1FXQzl3eTRydWZnWGlkYldmb3FvTXlNelJq?=
 =?utf-8?B?SkJsR3BpRmphNXZYMXNNQ21mSlZ6RU1lTGgvYnEybUxmaks2RWt4bjlOempP?=
 =?utf-8?B?UUN3V2IzMjRvQXFOdHllK0ZkQXNJbytvbWZNYzExdGZIM01qamNwcVQ2bldE?=
 =?utf-8?B?Zi9VMFJmbzBSbXhTUWJ3RTl6c1JtTE51V2gvdzJYOWhsRmtSbkdhVi9YNXBE?=
 =?utf-8?B?RDlHN0d2Q0NUVnhBSkZXSEtrY3cyRHVYdVQ3bk5Cd2oxNnhiLy94MG5jUzJW?=
 =?utf-8?B?alExOXZqVlI4STBFNXBld3d6eFpYR0Qva0dVZnFFcUZDRFpvTUNJQXdZM3V0?=
 =?utf-8?B?VGdiZ1FTb2h6MktqaVpRVUF4Z0thT0hZNXIxb2ZWbmRlMnZ6cGxQV3JHcDBC?=
 =?utf-8?B?L0JLRld0R3RRdnRRZ0tvS3J4eWN4dzVLQlE1eDBzNm9kRnNybHNMVWkxRnA3?=
 =?utf-8?B?Z3lFRzEwUEdKZVd6N3BiQ0dkalBINXR5Nzg0T2ZLWnhmdFdoczA0eDF1YkRa?=
 =?utf-8?B?R09ncnkzYUQ3Q0ZwS25jeVoxbmZtM3lEdi85bUxqUFZHZjBObndYb3Yzckt6?=
 =?utf-8?B?amc0a1JOSVkzaG9PS3VEUU56Q2NOdFVOS01nb05SbkdDUFoyRTFJeXRZdnhm?=
 =?utf-8?B?QVlwb1Nhd2ZFWlZOUkJacGdpZXptbW56YjQwMkxUNyt2VUZ6cTNWc1VXSHEw?=
 =?utf-8?B?ZjlLeXdnOFZVellSOC9jV2xLUTVodWVDa3NQa1hDNEZjQnhuejI4WnppNWdS?=
 =?utf-8?B?VFRGMjJIWVMxWS9WUWFuVHpiTTlxaC9oODUzdk1uM3M2VDRYYmd1MU1HMkhz?=
 =?utf-8?B?bWtReFlObjEzRzdMTE1JQUZZVlpRNld2VlErMzQ2aEUzRVY2Vk1NQldVYzFh?=
 =?utf-8?Q?tA8JjtHim9C85xINxS1y4DgNS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eabf0257-cc51-427d-270e-08de0ca9e936
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 11:48:23.7006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BFTvmNcoRzBSkujtHN9WoqSLC7wb8WuRM8ve5IhzY0rAsxmBkh4xqTD96uEOwk/aNWssh3ItrxRB4FC99nSz2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9065

This patchset is a misc update of remoteproc_core.c.
Patch 1: Drop a pointless initialization to variable ret
Patch 2-3: Cleanup the included headers
Patch 4: Remove export of rproc_va_to_pa

I am also reviewing the rproc->lock usage and thinking whether we
need to add a lockdep_assert_held for some functions that should have
lock held. But not sure.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Drop patch 4: Use cleanup API. Because there is a deadlock issue
  reported, need review the lock usage before the cleanup.
- Drop patch 6 & 7: Use bitfield for bool
- Add A-b from Andrew

Changes in v2:
- Add patch 6 "remoteproc: stm32: Avoid directly taking address of auto_boot"
  to address stm32_rproc.c build issue
- Link to v1: https://lore.kernel.org/r/20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com

---
Peng Fan (4):
      remoteproc: core: Drop redundant initialization of 'ret' in rproc_shutdown()
      remoteproc: core: Sort header includes
      remoteproc: core: Removed unused headers
      remoteproc: core: Remove unused export of rproc_va_to_pa

 drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)
---
base-commit: 1fdbb3ff1233e204e26f9f6821ae9c125a055229
change-id: 20251016-rproc-cleanup-v3-330464eee32e

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

