Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012051.outbound.protection.outlook.com [52.101.43.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE4D3101C8;
	Tue, 28 Apr 2026 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777365216; cv=fail; b=FxD89kDUavH3rM+PmNH4wLzNR0mtHw/SxA1EnLuzmmruVi/JVL3akN79PcHYLP4Z43m/O0JwElN1a18dixOvmArdwBWf3ILAFtada4XxYqp0npG2pWrLdMAHBNGPhQorgQAi1JIXE5Ce4IsIiBlrkKFlTePP+Ps6GaI0h0ok3Gc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777365216; c=relaxed/simple;
	bh=xBFLQoKACe+6ZXgyge+vHIa7TvPCT66E225aQ+l085k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ImCKpTltUqSfVK9xMs9h5teVzaYm97I++rruf8ND4ADtrxeF//54fbUzZ8KGxM5Ct8XIUWYyjAfMwyjpF4zmq1VCiDi8kkLkdwtGqVzx5BGWAkXpinSbkiSvDJcVkRcJ7h5SBB+tZWmTRXmBmdKdKEJ+67rCZH8J+eveyaUU82M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dOCGwK+f; arc=fail smtp.client-ip=52.101.43.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dOCGwK+f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dm6SicvV2OCQGChC4+ss5riYtSo+pR+NNs8ZYoD80G3zp0TAVBNsErd+OqAQ3dT1yIsA1HUiPaXJ2ZVVb82nH3CRFGVWcFs3YZmILGCjrmrV/+MQENjLFidUxlNAuQXmlr0c5sUGN2vNwND/vl/beQvy7kNJqIBrQfghA9Xb1QQa3lWsDm5W6aEHZafvyvc+E5M9P2q6MGidTmKAq9yMQexcN9EDgFWkaf/rB04tFM7f8OBr5OM9fqjW5lOmOuWqOKdtKoulNnDVwWsoEoR+HTT/smEX+gUzdq9oPOkQy3Lv8Y1wPLD06O1EJd2yC/3br8rQ/A9ySOQMvyJUuLV9yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wssKkw5atCGr+3N8K8gKASaC66/75FNCgSrBqJdYK/w=;
 b=YGku0LptHVD3HasLJFg47XTPzdYpLUO0jEiGRowOTtXBPLfZ9FALGoFAbgzlxEmSE3fB36mgYZd1mHmSdRz31hoKNqO9RTy+P7Y0CmQ4tm4ri0rdBF4y7LeagVJF5NJVwg5Rnas8eVpl5eGhqExh3bqtS4ohm1ZDFE3KzDRCoHBvu554PBBqfXs1Oi+4IhLxgqVqbLYW06GPyGD5kC4jUvhZCeeHX4pmbKw8rEPpuJOnPQOepSh1RTWpvp9bCLR3xyw1WSczKJUcntezW9TRPwAdfuvZd5ueLUiioQfFF5Q3ZAAN62fx1n5Tu7rLJROUmI+EcRejjdur2iPs2fl9ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wssKkw5atCGr+3N8K8gKASaC66/75FNCgSrBqJdYK/w=;
 b=dOCGwK+fRu2DQAgWjTycGUjHFI5LacAHfbC2VFMXgrlFiJKjfHUXlK7yOYj5WSAGS1pYy5h+votHV7ZUF7JeoH6kL8q7MTq7WPmYEiuEYdO3PZt7oSHCouCFmjGuLNWjpuyQ11vxjL9oQq0k8Ich20VOnzBul4TMKzvIKXoybPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DSWPR12MB999152.namprd12.prod.outlook.com (2603:10b6:8:36e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 08:33:32 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 08:33:32 +0000
Message-ID: <68cf4479-c6f5-4947-bc75-df9be73644d3@amd.com>
Date: Tue, 28 Apr 2026 10:33:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: document AMD BRAM-based
 rproc
To: Krzysztof Kozlowski <krzk@kernel.org>, Ben Levinsky <ben.levinsky@amd.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tanmay.shah@amd.com
References: <20260427162703.1644103-1-ben.levinsky@amd.com>
 <20260427162703.1644103-2-ben.levinsky@amd.com>
 <20260428-curly-hyena-of-triumph-fc1f4c@quoll>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <20260428-curly-hyena-of-triumph-fc1f4c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DSWPR12MB999152:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ff38ecc-a3ad-48f0-b13f-08dea500d4e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	d/Uq9r4NiH5XY7VFo3FHYxrvkvXzYSxu9Josb4/pMSkWuIenUjheMq7tqv+6TBMbNSmb6BxQG0evlVPT7PsE0EXmukbeoiF1MRMr6EvOKxjOqlJn5tfQoHGeRJBm4izHCZw0RZWlwlpfN7MDgmJxnQDMNj1l+RAXGZc99zLUwL5s9bTSWDUDV5OeIWJ66FjVbuBgcTq7gB6KGosHSO+y0ZyzmUtjmwzfpuItS3fGhDmd9l96Pmfl8VY8AJgptPt35MaDvVjSLiBFJJXO0Ged5cB8RmBaz/pBBy9KZfuetv1wLDFghHWddoVqKpKS52uoee8g6UK6+YhiMUyLNWS9ebAKxtmbJzQ1JmOvkPLoU1QKYmLxOsJzZeD8yn9j0jnciKzYg40LJOmaXhliX01DMwrJ3AKObovBLGV/WALGgqXazyY7EVMbkpkjrZygV4+cNdAGQ4wNAlzikGqWmOOFLed3Np5qfTSmlp5iW5EuzLdFXxTCTK6B6tN5OaLh1v3+v35JE+aGbpOgTzdXYh3mlO0uGHOCy1hvkebCFRrNmneXh2nkHFr2hCQ6TCtdN4cIZ1+jGqQqzH11iVUIGl0AugG0OwhzUHqHo2NFl5nqEyd0r+s8ZOIar6wlA558+f3VjsyUYCqO4fIWiUhbUA8Rm3sOKhKJyv0kv+dM4XgFuiiOu0XhtO9fLVWxgt+DrfiS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aURMSU5WblBDV1Y0dlhSUnp3R3Z1RmtETGxxM2VIbnNRanFmTEFzSXJ5bmJZ?=
 =?utf-8?B?My85aUhyNTk4VnBLZVV2ZXlZSW1KaGIxMU5mQUE3SDdWU0w2bTU4YzlSU2hk?=
 =?utf-8?B?NFM4ZjBqVlV3K3NkaVdHWDVrTUpxVWhOVUd2elNKL3htcFlTMXViYS9lVDJF?=
 =?utf-8?B?bEgxMHppbVMwN0JxMWhoSU80ZGUrWkhjTFozKzRaQ05iL1VtYURTVGdJR3Fl?=
 =?utf-8?B?MW9iK2g2eWdNUHNiV09mSTJHaTgvbmJVL1JRU0t3aVYvb09TaW5mMWh4ZWcv?=
 =?utf-8?B?djd5L3VDZkpDTW03QkkxOGg3R0VQVzBxWEpCektic3pjNHVQQWxGMkYyWTB5?=
 =?utf-8?B?dHNHUzVveU1wSjkyM2xCS29BMjF6bGRqWk5mMFA2dnRXR1kxeGtkZnZoTi9z?=
 =?utf-8?B?TzVoTzhGelNtRTA2M2s5SlU5a25memgycDJYaUwvM2x0QmtMSWtiaE1QOXZJ?=
 =?utf-8?B?U25qcGJrVVVnb1M4QnpOTE1rL1FzU2YvYk5WOXM4c1ZibysyUU83T0lQQTBo?=
 =?utf-8?B?Ym9OTmJqWjJYcnNwcExvT2k1Q2dVTTJZaGYxZXVObm95R2dsRHIrM1hCMTJN?=
 =?utf-8?B?WmVxUkl5bG9QUUIyNXFMOTlOVDV5ZlFWN0tJMmRGSlloSFF2TlN5WTJsSkFY?=
 =?utf-8?B?SnZsdE1na1ZkUE5iVzNVSUZZNjlhZFpsd25KMnM1Q0hTeldqbkkzbGpMUk1N?=
 =?utf-8?B?L0VJaFIvVVNYSFo0WWllZks2czNtY2pDUXBENVBNVXN1NWdSajFKcmVhYnVV?=
 =?utf-8?B?VmIvTUpqR2g5YXV4YkVKZlMvSFVMMmtRMzErbzE1QjFLZVJDZ2YwODRwMXVM?=
 =?utf-8?B?TjVucDRQS3g5dURJYlpxS1NISGhTNWVZT0xTYk5KeFR3MzRaMDBCdmdqRVZa?=
 =?utf-8?B?UG14MWhqNUM0M2lZeEF4Mm5NNXBQRlBOdkZna3Fyb001a3JJTXcyQUFxcm1B?=
 =?utf-8?B?ZDE2UEc5TUh4ZjUzVHhRVGFGcUJUVkxzZ1R3cHd4Wjc2QVFzNklYNTg0NGln?=
 =?utf-8?B?WHpHSGVWY2NFUG94eTMxSVBtK0t5MWd2T3AveE54ZGp5dFVrYnROeGcyS1ho?=
 =?utf-8?B?R2xyTEdaRW1RbWhSYStDelRiVmx0OWhNS3VNMjNzRlNoV1JVT25SbkhtUHQ2?=
 =?utf-8?B?Y0poNGxnbExXV3pjajNzODVGamZrbVZLMURwQ29scXJRMlRvV04ydC9waDVV?=
 =?utf-8?B?dU1seWRDTWROUVp5dHlCOFU3bVV0dThHVkxYNTdLK3JWakU2Qzd0S3lGV28v?=
 =?utf-8?B?akpzTWxMcEhhZVAwaUJrcTIyZnJ0c0JNZVV6bXlZdEZReCtTSEp4bE01WTVy?=
 =?utf-8?B?TEw1V05jaVJITzdLWFJwU1FEUXBHbGJ6bTFxYnRGNUFaRlpsVVd5dDNaSEVB?=
 =?utf-8?B?ZXpZMXkrMGIxOVJzR2JhMlZHYWt2SkdsUTdRRE5YZWRjdktOaU1QcEZUc1RN?=
 =?utf-8?B?TmxQWEQ5L2xwSDUvVFpFQlRjQ3lNbU0xaWlEQ2plWmhFNXhzb1I5bUh2QlA5?=
 =?utf-8?B?NGJyZURieklFSHNWY0pGaGhLT1lYYUxjN0hOTkJHb3Erd2Zuak82SjYvWWZi?=
 =?utf-8?B?V01BL1dhVWhrdkNmUmZROEZnQ0RTWnp6YVViNmQzSlRCQndEaTNyNTNHTEM1?=
 =?utf-8?B?bldtTFk4M2c4LzRiR0tQeURRR3RkcW5QVEJnSHgxTUVJNE1oZmNPOWN6RmxB?=
 =?utf-8?B?SC9YUGpYVTdKcS9lUXVwcjJkVGk4dldYRnlWaTJOeG50c2xTUGQ0ODc5ZEtD?=
 =?utf-8?B?Nzc0Uzh4OVBCWkpmNmlvUXdJNUI0QzE5dk8vYndWbmc0Tk81RHBRYlQ5ZDda?=
 =?utf-8?B?azl5RkVVeXJJc3E0NVR5THZUNm9rTk9kSjU1NWxiR2RrQlpiZG9IQXBZVy9L?=
 =?utf-8?B?b1RNSDVkbHY3aHlOL3FYWHZKU3V5QlpKeGUxVjY3REhidnd1TW9NWUwycHg2?=
 =?utf-8?B?a1lPc1FTaDM2bHl2ZytHbU5rTnhmY2hubTIyejh4Rk4xamY2VmR0Zm9vOFVY?=
 =?utf-8?B?Rkl3OUdvR0ZXSTlWZG5sUitENlNHM2lwMDZoemJzaExMVGlVdGdmQWV1OGxq?=
 =?utf-8?B?dEJMWDhUMU4yQnJpckt4TjlocFkxMHh4V2xNT3B2ci8zRFFINnl5U2NvRXN4?=
 =?utf-8?B?aFd2NC9QVzFnSnZ4MTIzZ0tSL3BPUFdReHNhY0FCd0YxNzNVOHAyQ3N2aS85?=
 =?utf-8?B?Qmxacjl5bWpDMTRCWEJOWXhJdkVaSCt6b2xNSlN2Z2JmUnNrR1U0ZWZNRndn?=
 =?utf-8?B?bjl0cnozRUpNQmtlZW9za2djT2tVRkttNnlGditzc0tMZnZ3c1BYem1Tb3dF?=
 =?utf-8?B?ZFFobmZtWVN5Y2tFcVpLeEltbDZzZjZOTEhBSUxZTWtVRTE5TThYZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff38ecc-a3ad-48f0-b13f-08dea500d4e7
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:33:32.5697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOoThGuK1Ch+acLvmoRV/5ZH3F//ZMfE68v1VVhaJtJOMVkdLq+Ticwa/nmZKbZ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999152



On 4/28/26 08:50, Krzysztof Kozlowski wrote:
> On Mon, Apr 27, 2026 at 09:27:02AM -0700, Ben Levinsky wrote:
>> Describe an AMD BRAM-based soft-core processor subsystem instantiated in
>> programmable logic and using dual-port BRAM for firmware storage and
>> execution.
>>
>> The binding models a soft-core processor subsystem instantiated in AMD
>> programmable logic and using dual-port BRAM for firmware storage and
>> execution. The remoteproc device is represented as a child node whose
>> reg property describes the firmware memory window in the processor-local
>> address space. The parent bus node provides standard devicetree address
>> translation through ranges so Linux can access the same BRAM through the
>> system physical address space.
>>
>> A clock input feeds the soft-core processor subsystem, and an active-low
>> reset GPIO holds the processor in reset until firmware loading
>> completes. The firmware-name property is optional.
>>
>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>> ---
>>   .../bindings/remoteproc/amd,bram-rproc.yaml   | 98 +++++++++++++++++++
>>   1 file changed, 98 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>> new file mode 100644
>> index 000000000000..f16657dc0d9f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/remoteproc/amd,bram-rproc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: AMD BRAM-based Remote Processor
>> +
>> +maintainers:
>> +  - Ben Levinsky <ben.levinsky@amd.com>
>> +
>> +description: |
>> +  Soft-core processor subsystem instantiated in AMD programmable logic and
>> +  using dual-port BRAM for firmware storage and execution.
> 
> Isn't the soft-core or FPGA still part of some Xilinx SoC? Or is this
> completely different thing from SoC and there is a design WITHOUT SoC
> using this remote proc?

In 99% case this is going to be used on Xilinx SOC with programmable logic next 
to ARM core.
soft core means - means VHDL/Verilog code synthesized to programmable 
logic/fpga. It means exact location in chip varies based on build and constraints.

hard core - physical HW location - like ARM cores in our chip.

(ARM is providing RTL/code that even ARM cores in fpga emulated platforms are 
actually used as soft cores).

Not sure if you want me to talk about that 1% use cases which are also possible 
but don't think anybody will design them.

Thanks,
Michal



