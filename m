Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146EE19006B;
	Wed, 29 Oct 2025 22:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761778156; cv=fail; b=Sq2wtZnn2p9EQ7ZobNUSLPCAftGcpQu4JWJCyO9uWpNLtiolGWdWqDqs4RUJFLXtR+3ty3cuUT5LXZrfUajmRGy/ftD2iP42OBtcs+VLv1qyn3YPSZ3FCGEJH/X8mIEukVSutqBltRlPDFyDN+0GEyMnpadIsvHscZ3dQx30Rw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761778156; c=relaxed/simple;
	bh=3GI3Vo+cWHW5J0BGPx9oxi9/W9zTcxhTRnZE4B6BRpQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ld4FnjnP1xMOEriGCrVxvPrVPPmu6icOSAG1ovmTU2I9CutXHvyB1YC6yDVBgvAQ9HHAQz7Y9orJb05LaXfS41J8yHDnwuhKHVO8c7E40Jy3djwWGj+L8QlaCa/aAoz2Kkcj9qioraiCBjaUtxp7wOLAQawlQ85rJeHOA/+tZH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m8oeB6d+; arc=fail smtp.client-ip=52.101.65.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m8oeB6d+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ME9NmT9m0xromL/0mlYQzfj4vK9aPyrQ73sKfauSre495zxEliRXd7R45Gau6jhxjN4vjxLJ4rxydEj7v8oSluEbXnyrDXlg3xCgooNTQgVeAtnlBz4O58wVfE7d1k/nd2Mp8GfJTfV8PbbxgkSiwqt5K1e7fPHiJra/BhViVzBbYu4a/QxqEg2QRIsArqu6ZTATdXTxdcbn0v5IU5IkWguVownlYOEQjnpeUcp0yUNqLjVpKYtc/b2AzxihvMgX/BnDc65+QZfxPorBgtMu/O8Df6RPYjbd7rrTpYER77VYoScelhtgQwE6dGTiGF5wgxHxiQkDni0LE7YPnTAR4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ti72lG8gM8sfuKD9vAZrCt7h3BytWF9W8vBj3+nrCx4=;
 b=Bp4ZCmMoe9yzqvkdqWCw5nfmvZq3A8S10EqsI4NZEdAYgZ4FHSd2YJGHucoMnE/A8Xib12hr8bTgy84lRrKfsqy1ewfnu5FE4XgzrK7li+id983qc0uBsxgSxGMOdXv/vXJ9PQ/tnQuHBZpUS+0mXOCrhSH/OjASyYkU/9EJ2LMA1Bnoc2M64Qpo5GfTphWLgLGBBW1Qe3pWlRHGZR7LUJhQYu3IQ3deQOjgRZDXlxNpsRZnhWHPYtls4A7GmO+ozJt8ARHJsWbn529Xzs/3EW3N9ndazIgXaMRLXA+y7k+1wQMFgnLH335TEU13gq6rZHjAf8v9u4l5OAsG3uPoMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ti72lG8gM8sfuKD9vAZrCt7h3BytWF9W8vBj3+nrCx4=;
 b=m8oeB6d+J7PdE4/GYlNcGGpVT0dEsJqrIGPTQwkRdiUfxzFlzyADu6dgezPtYr4XHlXA6hJupAOGfszeAPOuZQnZP8oxhVg2UGGBEERRGKskfj2HCbX6LRU/DDF3bI5B6XA3Wz7oIhFdhhZJ/VMWvQjd1qVHO/XweU9YFptHFN+UDjmRr2niWFgr0UBlKH23Hh6YOvD258fYOJIgyb+/bP+haiooCdq2tr0solJbXQ/V+/ri4Zmx06XsH3KykGdXqZVGlKTOQd/jqLlxQvj6SELWr8LCR18VcKQgIDT9Jl8tPmE1j4W0bZueqEFj9aN9hmiJrOVvQnPcFiHXTDV6YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com (2603:10a6:20b:40a::22)
 by DU4PR04MB10458.eurprd04.prod.outlook.com (2603:10a6:10:565::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 29 Oct
 2025 22:49:11 +0000
Received: from AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9]) by AM9PR04MB8907.eurprd04.prod.outlook.com
 ([fe80::a361:2618:7785:3bc9%4]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 22:49:11 +0000
Message-ID: <35f18c7d-8853-4e1e-b506-c0899453ca95@nxp.com>
Date: Thu, 30 Oct 2025 00:49:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] remoteproc: core: full attach detach during recovery
To: Tanmay Shah <tanmay.shah@amd.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251028045730.1622685-1-tanmay.shah@amd.com>
 <20251028045730.1622685-3-tanmay.shah@amd.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <20251028045730.1622685-3-tanmay.shah@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::18) To AM9PR04MB8907.eurprd04.prod.outlook.com
 (2603:10a6:20b:40a::22)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8907:EE_|DU4PR04MB10458:EE_
X-MS-Office365-Filtering-Correlation-Id: de45c129-2bcb-4f57-cb5f-08de173d6015
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDZyS0dHOWJtMVdkTlRiMmcvaVU4Q2dMRjY4N0YzMXpiOUUrV1NCVUEybkZU?=
 =?utf-8?B?NTZTVkxWVmxEbjdrditkMzdHaUZTUGdIaWI3bGhuMnZQWEU3d2w4Vi9OSC8v?=
 =?utf-8?B?MTR4aXlaK29VRVVOUUJTY3gwWmQ2S3hXRGNJTUNCanZ3bEQ5VFpKckNxYjJE?=
 =?utf-8?B?TVRtOTQwRzhKdlJXMjFNRWdrLzI0dDlRL3BFV3QxQ1hNWk1GU0s5dEozdmtz?=
 =?utf-8?B?Q3JVMFBPRWYwSFJ4eVRZbDVxUWNQNUhibng3cVhQWmpoc3U3SmN5NjBHdmhp?=
 =?utf-8?B?NHAyR2tiUUZURGlUanlJenRjVlA1K3d6Tk1BVUVjZng5Qlh3RitSWHFzSHJD?=
 =?utf-8?B?NFhkdmVCT1pMMnVkUFlRWC8wRkNTT1Q5U09XNVNRYkVhOXZPM1lURUdJNG9N?=
 =?utf-8?B?QSt1VmpRUGFsdG5LbkZjWVFIZFhaWGJFQ3JoZGovb1lFMXVFWUQrTGJGZnZQ?=
 =?utf-8?B?WkR5WVJKUkdtL1htc1ZmUkhTWUwxYVFKZ1hYMTdhdVVhTHV4eVRpNUdxejhv?=
 =?utf-8?B?dC9zcm11aXZFcTRpRllNWEJLNnVkN1BPSktFTmZkTzNKYVNCTHFjNGxNenRy?=
 =?utf-8?B?ZkJQQ3o5U0VwUmF1d3dEZ2Q0TmlTeVdSRjNXOVBqajlvamIvZmhRUW8ycEZ0?=
 =?utf-8?B?ekJKeU41YW1JMFRVUFkyQ0p3cmVXSk9wL0VQUk5sNDF2UG81alhYeGxJVnp0?=
 =?utf-8?B?c2JLbUttalh5THhTTEVCWlo0R01uNXVVUUJCTENEMVIvZm5xQWhVWGV2RW8x?=
 =?utf-8?B?VzdQMVBSSEFwSXhJRkhuQ1BLZkZWcmdGN3MxNU1hUFl1ZU9qYTZnR0NLRW1U?=
 =?utf-8?B?aTFUb0hrNERSVWtzNVc0Zkx2SlpQSTB5U28ybTJYVVV5T1NJRXRxU3ZST3hC?=
 =?utf-8?B?MGJIclNPSGw4Q1htYm15WGxzdkJZUmxrL2Jrc3BPYXBCdWRTZ0JGVjV5aHdI?=
 =?utf-8?B?M2dXSTVUaHc0eTB6SVNNV1ZhOHN6SVFncHQ5STNwVXFsdzZLR1ZmRWZ2MkY1?=
 =?utf-8?B?YXJSWUpFUnNaMGl4ZzRoRS95VHB6Qk43WDRNejkxL2Y0WGVJMDFtMWEzMWhv?=
 =?utf-8?B?bGcyN1J1UE1yNnlnUkw1ZlFoalI0bTVHR3JRdnNWb1pwTHFBejU3LzhmNjFp?=
 =?utf-8?B?TlNHY0ZsTjJSZkhiRitNSkpYc1JFUGRDRFBaME5IME9uWktmYURwWEdWSSsr?=
 =?utf-8?B?Y2o0VHcrS3E1T0VvNjZXNDk2VVppcUV5MGxud0E2LzcvRFh0T2IyTXRFb3Q3?=
 =?utf-8?B?dHJ1aU1JL0szbGZLN3krMitEQk5IK096TEZIeHZVeHphSWhUZm5lM2NURDVT?=
 =?utf-8?B?Z3g1eWdYZXF1eXpubW5idFBRbGlKL0tpNGtaVjl1UkJVRUVnZmhwRHVQckpL?=
 =?utf-8?B?S0xHQ05sT3VmOVE1SDkyM3lsWlhVREJ3MWI3TlRmaEM1YjZEMGJDMERMRXNH?=
 =?utf-8?B?NzhjRU1CS3g5RlZqQmY3Slc4MEVHN25XU0FBYmRDcUoxV0dnRVc5NkdaWnZD?=
 =?utf-8?B?TEJSODJFME1WZU03cCtxWjc0Nmx1NThlazJQZmNYN3ZXU3I0a3pxcWc1LzZy?=
 =?utf-8?B?cTZETmd0T3RZK1VNc1ljUVpMc2lrNnYyTDA1TUdOTlg4NEFrZGFraFBZbUJF?=
 =?utf-8?B?L1A3MlA2OGo5RzRjKzhUZ2RNd3BpbW9Nc1FlTzB6R0dkTzJNUUZvVGJvSE12?=
 =?utf-8?B?Vk1JeW0zekdIVjR4RklWWnp6NEhBZzNrMldKY0tnM1hQSVY2OHNEcWZLZHdn?=
 =?utf-8?B?NGVzU25TNHNHRkRWK1pNNEFUekRuOGZJNmJjNlhpeDYrVlNjcytmbjlGTXV0?=
 =?utf-8?B?Um1TV082c1FzSWtkbzhSVE1jNkhQVmtpWG1kbmplSVBrVW1EU3hjdHltaEZD?=
 =?utf-8?B?OWFNR0N3ZTZsa0FWdEZQMktGU0o0R1JMeGNRZTNYMmZMWHpON3BVNit6L3R6?=
 =?utf-8?Q?WiaF1nfSt+/ijV9CdK7Ki6UfVwISbi6s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8907.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlVGMWg0Z2NGR09MUDBpSHRwVG42bThnQUNUaFZORFJ0Q2QzdUpYM1orNU1j?=
 =?utf-8?B?OXBtUkJpMGM1MTZuMDJnNEI2WjFERGp1S0Y4TFhlWUFZZklyNmJiTnpVdFdR?=
 =?utf-8?B?NkZKVTVIVGR2cmdFc3ZaN0RXWmlmb2N4MVBzcWJKRFZhNHdwS2o3TS8rQnFz?=
 =?utf-8?B?ZFpSTDFBc1BoSlF3aEV1M3JlK2xLd0Q1RENXclBtVEZ5em1wNlc2cVdkcENQ?=
 =?utf-8?B?dkh5T0h3UkFON0VERmt3WlExNnNDRG9oT2pVQ0FpOEdhTUFUdHJvUkphSTBz?=
 =?utf-8?B?ZjJ6eEtsNGgzRmFVWlo3VWlzbHJhY1daNGNIOXRaanFpckl2U3N1RDNEZU4r?=
 =?utf-8?B?cnREY0NTWngzOWJNOGdZT0tnNllPaTdUcXpGdzd1d0gyaU8rNW9oczV6dE9i?=
 =?utf-8?B?bVpYWktlUUY0dTI4bDZGSVdCSTYrR1U4b01ZTGtLSitRdE5rRUViZGg3UHBM?=
 =?utf-8?B?QTlJRXVCV1V0MU0rK2V1aThUYU85MmpUd0IybHpxZFVXU1lxVDZ0bnhsL3VV?=
 =?utf-8?B?OUFrNmQvZWdLT21sa1Q5QUJJOUxGWkxoV3JJVWRmU1h1NzRDT1JDeXJOSUc1?=
 =?utf-8?B?c0tBRXYzNENLZWdNWEFCSFNYTCthZk14alpKWU9oWFo0dURJS012QUhnTmZs?=
 =?utf-8?B?UjArTHIzTW94L29PYmczcU5ZVkdwcjY2L0dNa3krWnIrWlZaZU93T2MrdTFz?=
 =?utf-8?B?Y3ZZZUVJZ2tuZGJSWHBnS3NWa1FmL3hGUzN0QmoweUdxMVV6OSthSC9kaXc0?=
 =?utf-8?B?TnA0bUVNTnZrU0dwZXR0bWlDSERDa1NidUNRd2s0WE5wRllQZkxkZ28rQ0xl?=
 =?utf-8?B?QXF2TGhjUWMyRGRmczVvYzNjeExNV1hNaTlyc3BxcmwzcEQxaWU4eVNoTmRT?=
 =?utf-8?B?L3pUMncySE9OSERtL2JOK3d6TEZlV3A5bU5iN0l6V3JBd0FHbFZ6RHQ3UnJG?=
 =?utf-8?B?a29Gait2V21MRDVhcjZQeERtTjNyKzVRK21ETTZwV1crY0ZzLy9VMmNLRmZ3?=
 =?utf-8?B?ZWRoa3ZWZVBicEdpS0RRdVFSb2xkek1rZFB6dzdkT21JTngycXczdVlTVXZh?=
 =?utf-8?B?N0tSejc5TGtmTkptQUZSUG9aNWtjM0ZDMTF3UnFiTHUrWWdIVE02cTd0OUcy?=
 =?utf-8?B?MENFV21ka1ExNTR1eWEwSHRqUHVTSEdLMEJlbXkyUjRDYjJ0dW80TzlBTlFE?=
 =?utf-8?B?SjVKTnVRNWY0ZVJITW5rRHBqTzhPUzBhLzZyTGpXaEluQU43cFZMWWRMSTJR?=
 =?utf-8?B?NVJvM1EyQXpSWXFuZUhLODJqZzlzcWI3cVFyQ29ZTmJIQmRIaGRQaVVhVDBi?=
 =?utf-8?B?dlhFc2xZaEZ5ZzhkeVFYVmJ0NDA5QUxMWUFWRks5NUROZUxqaXVUdUJPYU02?=
 =?utf-8?B?eW9nMEljTG1nRFBKV2NEcFN6QnRGVkRpanh2Zkh6bWdUT0pFZ1BMNDJ2UmVX?=
 =?utf-8?B?WmpmaU1rb2RFNkt3ZkR4QkFpQ0d1UVZHZmNmNDVlN1ZFdWxyVDFMdGdZY3dp?=
 =?utf-8?B?bUN4cmtKSkVEN21nN0dxT3NBdmRyTHpUeXBHSldaMDUxakRIMzhCd1dNUXEz?=
 =?utf-8?B?T2E5VmI5ZloyQ2s1T3I0OENSY1JRKzh0NVJrVWVwMkMyczJXUkJDcVE2QUVw?=
 =?utf-8?B?YXRnS1IzSVhZKy9EbHlFVFd1bGV4bUdUUVo2b0ttOTB3cHJyNlhZSzNCN1Vh?=
 =?utf-8?B?Y2FwcXU4L3pVZWJUSU9FR0R4d3ZKZGRVYm4wMnN3SDRjRnBQdlBwdDNxNEdM?=
 =?utf-8?B?NytYNnRHazNBb1dITXpxNDVyV2ZoWG9vazhWWlF2Vmg0aWM1UGQ1a1VNRFBI?=
 =?utf-8?B?VVVNSDQrMHhJTVkvQVU5SWZOWEphd0ZDOTNWTjU4RG40YTM4THdobXR3RVkv?=
 =?utf-8?B?cFZ5UnNBNkN1ZU9mRyt1NlptSXF2Q3g3QjltRThyWW85Wi81Y1UvWXd6eEZH?=
 =?utf-8?B?UTR0Z1JwR2tVQUUvUkF3azFPRmtHbm52cS8wSk8rVWl4OVk1b05zc3h6OHhE?=
 =?utf-8?B?RG9HWWxjOVIzTmlJTGFJSHFhcXorQW1WRUdNMkVDcnJycHF3QUhRMFNkczlD?=
 =?utf-8?B?UENGVTVBN05aVTZnVmp3cG85U1hIc001YmZrMWM1VGUxWnhoREV1MUdJQjAv?=
 =?utf-8?Q?zYMDIYGN2KNFiWt5UgRvpp6Y3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de45c129-2bcb-4f57-cb5f-08de173d6015
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8907.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 22:49:11.2462
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGVjD4fwTkUP6dpg3GUxmzS/fihpPGuH7G6sPLWkQVBhFUTEVvj6RuxgDewWoLvVDJXAUqJ3lP1CHqXe4ErHNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10458

Hi Tanmay,

On 10/28/2025 6:57 AM, Tanmay Shah wrote:
> Current attach on recovery mechanism loads the clean resource table
> during recovery, but doesn't re-allocate the resources. RPMsg
> communication will fail after recovery due to this. Fix this
> incorrect behavior by doing the full detach and attach of remote
> processor during the recovery. This will load the clean resource table
> and re-allocate all the resources, which will set up correct vring
> information in the resource table.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>   drivers/remoteproc/remoteproc_core.c | 22 +++++++++++++---------
>   1 file changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index aada2780b343..f5b078fe056a 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1777,11 +1777,11 @@ static int rproc_attach_recovery(struct rproc *rproc)
>   {
>   	int ret;
>   
> -	ret = __rproc_detach(rproc);
> +	ret = rproc_detach(rproc);
>   	if (ret)
>   		return ret;
>   
> -	return __rproc_attach(rproc);
> +	return rproc_attach(rproc);
>   }
>   
>   static int rproc_boot_recovery(struct rproc *rproc)
> @@ -1829,6 +1829,9 @@ int rproc_trigger_recovery(struct rproc *rproc)
>   	struct device *dev = &rproc->dev;
>   	int ret;
>   
> +	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
> +		return rproc_attach_recovery(rproc);
> +
>   	ret = mutex_lock_interruptible(&rproc->lock);
>   	if (ret)
>   		return ret;
> @@ -1839,10 +1842,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>   
>   	dev_err(dev, "recovering %s\n", rproc->name);

Please move the log message above the new early return so both paths log 
recovery.
>   
> -	if (rproc_has_feature(rproc, RPROC_FEAT_ATTACH_ON_RECOVERY))
> -		ret = rproc_attach_recovery(rproc);
> -	else
> -		ret = rproc_boot_recovery(rproc);
> +	ret = rproc_boot_recovery(rproc);
>   
>   unlock_mutex:
>   	mutex_unlock(&rproc->lock);
> @@ -1860,6 +1860,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
>   {
>   	struct rproc *rproc = container_of(work, struct rproc, crash_handler);
>   	struct device *dev = &rproc->dev;
> +	int ret;
>   
>   	dev_dbg(dev, "enter %s\n", __func__);
>   
> @@ -1883,8 +1884,11 @@ static void rproc_crash_handler_work(struct work_struct *work)
>   
>   	mutex_unlock(&rproc->lock);
>   
> -	if (!rproc->recovery_disabled)
> -		rproc_trigger_recovery(rproc);
> +	if (!rproc->recovery_disabled) {
> +		ret = rproc_trigger_recovery(rproc);
> +		if (ret)
> +			dev_warn(dev, "rproc recovery failed, err %d\n", ret);
> +	}
>   
>   out:
>   	pm_relax(rproc->dev.parent);
> @@ -2057,7 +2061,7 @@ int rproc_detach(struct rproc *rproc)
>   		return ret;
>   	}
>   
> -	if (rproc->state != RPROC_ATTACHED) {
> +	if (rproc->state != RPROC_ATTACHED && rproc->state != RPROC_CRASHED) {
>   		ret = -EINVAL;
>   		goto out;
>   	}
Tested this on i.MX8M Plus using the imx_dsp_rproc driver, which 
supports recovery.
Everything looks good, but on imx_dsp_rproc we use rproc_boot_recovery, 
not rproc_attach_recovery, where most of the changes happened.

Iulia
