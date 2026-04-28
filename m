Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06BE3F65E4;
	Tue, 28 Apr 2026 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381806; cv=fail; b=sXZ//1RjtkRfzIyNTx002mEf1Uzeoxq2qqlffYxIDi4hhLgBKdLHksVe/KUGuAEK7R8sblw9yeEyRGOyTpooEB5qzf/KfzEeYeLXPHF/UVK0lQOYzmqP+4dzRsUZtJErooDZayKEwILrcOSNpZO7Moki7oahvqQVAX9byexJrq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381806; c=relaxed/simple;
	bh=ILQAGcmfEFtiektJKv0NDhAvzrhuCr0x5M3MAdJkPJ8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p7tDXwfGrnZxkq9Woji3xwB4Wn2vXsA5vuuuj4l0Ewa0q6wntdZnULQQwVirikrfNVnD13nKj1/nOpUp6iSDU4LOe4hynhyHq5zYHQV0QDUMsCXgHcEbgwF9/6bMcfeu+2ZCJgA3B88kCYJbbuQGEs9hpmeMPFqCvsVGGZbA1qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NoNd6Wgn; arc=fail smtp.client-ip=52.101.62.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NoNd6Wgn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMqQYMFeKzV4LepVYYzZKNYeLE2eIwmIauihv21TfiOKtD7RVZdlX6nUFXXdeik63qgQ5OjaBsp9PgvjZlFveTr7y12WLuGUDkBEv2SNpslF5wJkMRv+fQ7D4Gb1S0oHVXbuxrm+OPbxeZBkGPR+bZ5RbPbn/aX1SICLSEKzuXUqJ2HEJJ6q+0FzRc8mt4/jekd9SVDyD8MTIHn3E8UlKX+75MrSaG305RhpxpRZdXrW//+i59JJmPXbLgH6+DMZZmLK2iqI/0FF1DYAttIGY+3qYCdq2zySFv7OTSbD8e3XZ9SSo/F9ZX5yQu/EafLp1m0aDlDMndAdRmk1sse14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+vLN+5bgrfnu2Pcw9Wq1sPDh1GC5pfDryHgcK7tSX8=;
 b=eoCq/u9nu4hThkhxsDHnz60xukWm8CA1JueKaOuHF3+Y0xQPZ+0CxNj+AgCHKR9N2J1ndZ+gYuBmvHTciUXepBcC3734IIPO8DgSIe/O5lKrmHsVLlFAyHFi/sU5XiaOju3pGUFKyshM3ccgERYsM9E9i5POgfvUJy7KtkrZ+/mzr0BKq14CcDkIdahCd/3bcBQiNtZYgvRbbzMCnBgvcYwlroPxQJZoHqKYeS3DnPRHG9vz2ljKzZICVQsIjX+C6w27m/o0VCMtJzjiQfMxZiMbtt7t318EVlw/Mpf31JYaj4FYckzcT2phkXTEsMi0Ik+1WI0lekgAHAIbdZJrsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+vLN+5bgrfnu2Pcw9Wq1sPDh1GC5pfDryHgcK7tSX8=;
 b=NoNd6Wgn8FOOGMFSdC+s/sbc1d7zpIdyCqadPOacMyvr8M6ianU73sqKlZuX/iFj2a0X0VgXoPS9im4xAPiwU6+r31JkYkAPGOvifYNlxFXARiI6saQXy8ONYU4wHL5bPFLBaWexW7ZzQoBMKzuGBAi5IXYsL96dMdVlloLAQwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CH0PR12MB8505.namprd12.prod.outlook.com (2603:10b6:610:193::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 13:10:00 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 13:10:00 +0000
Message-ID: <c2ee8499-2ba2-42b2-bacc-18166135abbb@amd.com>
Date: Tue, 28 Apr 2026 15:09:53 +0200
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
 <68cf4479-c6f5-4947-bc75-df9be73644d3@amd.com>
 <998b67ff-192a-478f-a9c6-ddcd7773e27c@kernel.org>
 <86e464f2-974b-441d-9459-dd957c16993d@amd.com>
 <5ded8bbd-11b2-4552-80f5-972df15dc6e0@kernel.org>
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
In-Reply-To: <5ded8bbd-11b2-4552-80f5-972df15dc6e0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P221CA0051.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::19) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CH0PR12MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: 227812bb-cc57-4ff1-b607-08dea52773ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	J10JTjHWvH4X6mbJBXSebztmSIww7dnFHN6bprLHmBLTqk8+bQkVaVWHUGN3MfC3nN/NwqzFvlrYcMZgydDDwSlYtaCWn0QnzpDlAQBOoinwmtAAmwHp1agAPAjkfdUPLbxad992+P1JDxVnjSh93gK14/7IMfscthgLqiDdcT4MtpmWfWRMY36T7fvbJegQ0LhUmO3PKYVV5tY7psUsH8DRFGRiPw+AuX3JAaZdTdMUFRY/lg1C4JvNw0Ut5acr8TCmXSCcTOjT9oLqPhj1hXhygR6jR5w1B/H1Ussc+OqMDnVmUf1FHsZ80YI8d2Ct9BZ8uehL2j8s/j3iCIp/PfkbAACHv+/gbek/dOo4ePehaznSZFVZYSgnkdWjZ0JgKZi3TinB5zYpE3DeFWbaDMxmbD+6T7hp+X2D1cnIR48AgiNpE16k0YAIWjj3BwG/JyZlbnh2gxo+dUai8F8YUXyAQgDoEUZcknqkHxGzpYOdaEkoXhKzej1wTn5LrN9wEg3d9cMuaWh3mLcraottxaDPzU3+a8wtizbuX55MmAlSGRy3w8KguXcW528HAxhlw3ZY4o+r/iUrp6jVBG5iviyG3xlymp1nrTsGn3DciB2qGYZqVQ3WCQo/9jUTspZan9QuNVS76nSEorBkuoscOer+LO4w0u+hzbq/cVmOB8am4hjqIciSY/lASBURtx2I
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmdEdWtVYnRPSUk4SkJuRjFDeDk4emJWTEZJTmk3dHZ3NUVYWnRBd09NZ1F4?=
 =?utf-8?B?NHQvbVQrQU9sSGpBdHMzQVQ1UHA5aFNVQm1oTjZFRVRlTXRtZ3E1MmtjSDk1?=
 =?utf-8?B?TlY5ZjR5TW1JMlBad1BtUmZrdjJPdVhUZENhcTdUdmZoUDhzREl0OXk0dnNx?=
 =?utf-8?B?MUpycjh4Q0F4cHhxQlcwZVBRYUQrUi96bFp6cytaSExlYVVnc1NScVVqd2h0?=
 =?utf-8?B?aElEUkZxSHE0dVNXZmtxaXBMOVNiQjVCTEVScTNxclAyZGRESm9zcEdMc0p1?=
 =?utf-8?B?Yk9VQXRpeDdReU5NRWVpdmNkN2daWlljaXlFRzZuUGc4WVJibHF5Z20vVGN1?=
 =?utf-8?B?OEFDRXFNOUNVeXYrbGMvYzR5eW53U0hjNVVzZFZMdU8xT3NGTW45MUpVakQz?=
 =?utf-8?B?bVI5OVhlZTBockVkaE1ZOVgzR1oySUQrSVNFUGFTVVNQakRsSm5GVWFkUTlH?=
 =?utf-8?B?a1FLTVdYT09vM1pCdTBhS1U3Qk9XM1orNndaYUNyc1RqSWJnTnlIRys2bHpP?=
 =?utf-8?B?ZDZ6TzI3S2R1S1E0TTYxNExCUGpGYzJxQ2xZNi9rOXlJUXU3YVFGdlA0NWx1?=
 =?utf-8?B?RXhoS3lwOWxXNmVOWUpPRHFXdmdtaS8rcjFIMDIvajkwZUFmVitxVjZtM1ZY?=
 =?utf-8?B?cjAyQkExRU4xWHlBUDBSeGE0MzJ4eG9VSmNIRCtUeElkRFZrVWNLTnBRN1dp?=
 =?utf-8?B?QWtnMDB5ekZmWFRVbUNDK1B3bzNvOXlZVlVHL0RXTmhMUVBVZFRqZHljMXFq?=
 =?utf-8?B?eU44ajdUYXBIQXhTTm4za0pWbEcySUNCWlRGN3FmV2huWUgrdkZCakxaMnlz?=
 =?utf-8?B?NkhFOGlMZ2NJeTBJWVY4eitURU8wV3crRGF3VDdhZDhhdkFzdEVTSk0xdUlS?=
 =?utf-8?B?R29vdGtlN2FrT1pRSHlmQkdmR09xdW1uUWZXMlFPdnBRU2FEZjF4dlJHN08y?=
 =?utf-8?B?ZFZzWGUwL2tGaHBqWDRNbUk2T0tMcnI5OG9jYVJUeEszYjVmK1ovY1ZtazBF?=
 =?utf-8?B?T28ySTN5czQ4TkVyQTQ1RURHZlJ1T3ZyMm9XajB0Q0JydktjZ1BFdXlMbGVm?=
 =?utf-8?B?OGZyU09FOXZPY1BvSjQ4czRZVHk4LzJ0TlU4MFFmK2pTM3dSMytLcTdSbDI0?=
 =?utf-8?B?d3d0anNRSU9ra1ZMUEozbnloZDZzaDRRbCtGSWFMN2YwUnlzWDF3YUtwMSs1?=
 =?utf-8?B?Y3huYU44QzJmM3hnbkw5N0pKRG5mS3k4bFlzU3RsQnIrY2UwOEVMVytPSlJo?=
 =?utf-8?B?a3R2RTlmQzNYZEhvcXB1Q01rcXFENUR3bVFMa0JLeG1wc0VaZ1pRaG1hVU0y?=
 =?utf-8?B?UXpsbFJoWkdrSGlJYVcyd3o1Wlk4YzAyNmxnM0RyQU5CZlVvNVczNGxCWEJD?=
 =?utf-8?B?Y2ZWRHRrT2hPQjNvY0M2MVhLaytWT3ZIMFZxTDZvQUt1V1JTbFJZQzhNckEr?=
 =?utf-8?B?TXJrUndveUFrWG95cHhJWCtxSFU5bklXcjgycUtuaU5XVEhua1FWZ3dkcFM0?=
 =?utf-8?B?Ny9ZLy93VTJSWUd5MEhLZHZPb1luZ0YzQ1VsWUJnTUEyQ0JBYzllV1hIV1Ir?=
 =?utf-8?B?dzJBc3dNUEVxa2kvR0xkOEt5ME9LZnhWVVdacjFZTFpmN2dad2RpMDBPd2VZ?=
 =?utf-8?B?UXdvbTdsV1BCRFExNDlyaUJ6WmErREdXSlRrUXloTWw4QTExeUVZQmhhb3pX?=
 =?utf-8?B?ckpISGJOeHdZRVl5U2xpT0FReWdhVDNBUE9aYW1KSmFYK1NYNkpJL2QzTldD?=
 =?utf-8?B?eldUT2laQmhBaVJsWVIzODZtc2x0Z3JJcXlVT0dnZi9DNGgxY1UvSGtyalRx?=
 =?utf-8?B?K25vd0VicW83anE5N2xKclJRMzNmZGtMSHl3dXRzeDZvYXFVZlJKT1BQYkVZ?=
 =?utf-8?B?Unk5d2lOV0QrSWhsV0F4UDJUcldwMHRWai9JR1cyUVRSZ1BpZGE1b2M5U3h4?=
 =?utf-8?B?Nk1rVDNvVjFpV0twRGZybnhRQ2I1ZzF6UFk3QjFhanlZVmNCVndsTnlRNEZp?=
 =?utf-8?B?ZWJLcy8rclFmM29PMFp5QkxYdlFKc0t4NFpsQjUwc292aGJuUFRJSnR5TVVZ?=
 =?utf-8?B?RGRTbXhjb2l5bkpzQysrUFBTL2tJcFhUaEZBM093ZzRzSTV0SHZUcG9GWWNm?=
 =?utf-8?B?Y1dZNzN2R2l3Yi9vcnpFMHpQeHhYNEQrcHJTTDNuL3N6a2dEU05PdHBuZnNY?=
 =?utf-8?B?ZnFnbmpRRS9TT3JHWnI2TU42RDlUdWliYjNuaWFSN3NnMWZFWGZNZUtQbVNE?=
 =?utf-8?B?RjR6NDIrVEVtOUN5MCtFdTFvS0d4SkRENm9tSFRobXM4cTFCVEJaVzNreFJ0?=
 =?utf-8?B?Mzg5aEg2UXkxS29MbWdMYldSTjdPMzNyWThmNjQ3N2lUajVMS2V1QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 227812bb-cc57-4ff1-b607-08dea52773ed
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:10:00.2520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhOq10m9RPEmEJRvbBTRNEWMohWtcE2FPW0E4aGcCbk6eVaQideYtkYoZyY59FSa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8505



On 4/28/26 11:14, Krzysztof Kozlowski wrote:
> On 28/04/2026 11:04, Michal Simek wrote:
>>
>>
>> On 4/28/26 10:47, Krzysztof Kozlowski wrote:
>>> On 28/04/2026 10:33, Michal Simek wrote:
>>>>
>>>>
>>>> On 4/28/26 08:50, Krzysztof Kozlowski wrote:
>>>>> On Mon, Apr 27, 2026 at 09:27:02AM -0700, Ben Levinsky wrote:
>>>>>> Describe an AMD BRAM-based soft-core processor subsystem instantiated in
>>>>>> programmable logic and using dual-port BRAM for firmware storage and
>>>>>> execution.
>>>>>>
>>>>>> The binding models a soft-core processor subsystem instantiated in AMD
>>>>>> programmable logic and using dual-port BRAM for firmware storage and
>>>>>> execution. The remoteproc device is represented as a child node whose
>>>>>> reg property describes the firmware memory window in the processor-local
>>>>>> address space. The parent bus node provides standard devicetree address
>>>>>> translation through ranges so Linux can access the same BRAM through the
>>>>>> system physical address space.
>>>>>>
>>>>>> A clock input feeds the soft-core processor subsystem, and an active-low
>>>>>> reset GPIO holds the processor in reset until firmware loading
>>>>>> completes. The firmware-name property is optional.
>>>>>>
>>>>>> Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
>>>>>> ---
>>>>>>     .../bindings/remoteproc/amd,bram-rproc.yaml   | 98 +++++++++++++++++++
>>>>>>     1 file changed, 98 insertions(+)
>>>>>>     create mode 100644 Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>>>>> new file mode 100644
>>>>>> index 000000000000..f16657dc0d9f
>>>>>> --- /dev/null
>>>>>> +++ b/Documentation/devicetree/bindings/remoteproc/amd,bram-rproc.yaml
>>>>>> @@ -0,0 +1,98 @@
>>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>>> +%YAML 1.2
>>>>>> +---
>>>>>> +$id: http://devicetree.org/schemas/remoteproc/amd,bram-rproc.yaml#
>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>> +
>>>>>> +title: AMD BRAM-based Remote Processor
>>>>>> +
>>>>>> +maintainers:
>>>>>> +  - Ben Levinsky <ben.levinsky@amd.com>
>>>>>> +
>>>>>> +description: |
>>>>>> +  Soft-core processor subsystem instantiated in AMD programmable logic and
>>>>>> +  using dual-port BRAM for firmware storage and execution.
>>>>>
>>>>> Isn't the soft-core or FPGA still part of some Xilinx SoC? Or is this
>>>>> completely different thing from SoC and there is a design WITHOUT SoC
>>>>> using this remote proc?
>>>>
>>>> In 99% case this is going to be used on Xilinx SOC with programmable logic next
>>>> to ARM core.
>>>> soft core means - means VHDL/Verilog code synthesized to programmable
>>>> logic/fpga. It means exact location in chip varies based on build and constraints.
>>>>
>>>> hard core - physical HW location - like ARM cores in our chip.
>>>>
>>>> (ARM is providing RTL/code that even ARM cores in fpga emulated platforms are
>>>> actually used as soft cores).
>>>>
>>>> Not sure if you want me to talk about that 1% use cases which are also possible
>>>> but don't think anybody will design them.
>>>
>>> Then I would treat it exactly like every other block of a SoC - you need
>>> a SoC specific compatible. If there is a fallback, SoC specific
>>> compatible should be used in the fallback as well - that's all already
>>> documented in writing-bindings.
>>
>> But which SOC? We have ZynqMP, Versal, Versal NET, Versal Gen 2. And all of
>> these will use this configuration.
>> Do you want to list all of them?
> 
> "Then I would treat it exactly like every other block of a SoC"

No issue. Here is snippet.

   properties:
     compatible:
       items:
         - enum:
             - xlnx,zynqmp-bram-rproc
             - xlnx,versal-bram-rproc
             - xlnx,versal-net-bram-rproc
             - amd,versal2-bram-rproc
         - const: amd,bram-rproc

   The example should also be updated:

   examples:
     - |
       #include <dt-bindings/gpio/gpio.h>
       remoteproc@0 {
         compatible = "xlnx,zynqmp-bram-rproc", "amd,bram-rproc";
         reg = <0x0 0x40000>;
         clocks = <&pl_clk>;
         firmware-name = "firmware.elf";
         reset-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
       };

Thanks,
Michal

