Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAC22A1CA;
	Thu, 25 Sep 2025 06:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781462; cv=fail; b=KlZ1mqkDgauptxh4nPt/gOhPnKfW5k8r1AYKSidFFOISgB3zHegIqS253Xa3xxKqcgZ0iRQqVEGB3eLERsBa4VBOuUKwTd7uoY+wV8psuwoe4cnUiLm0nGqneq9rbdHgsDxdWpHE25T+5YAsPIve0T6Z4VYo/n4AKXWkUAHgY1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781462; c=relaxed/simple;
	bh=haAwUiWfFvPt8TmOUxSyF6zZ6RRJrC0V90yl/oTOOyk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qcne/Hwk+1yTHoB+Bq9qaVQqkfet3YYY9r8AzjmDPydynei2C0C7rIf/By+dLg5EYKeizbezdOnZnntlgSh+/FbHbjH9UkV2yGfUsIbqbjP3wgdH9s/FdUzwe9WCR2ACApTmNl9+UBwuCvIAWep7CL357rn+ElxXSfqoHGtDRsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Le5WB+1y; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=vVXc+wmG; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Le5WB+1y";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="vVXc+wmG"
X-UUID: 3f9956ee99d811f0b33aeb1e7f16c2b6-20250925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=haAwUiWfFvPt8TmOUxSyF6zZ6RRJrC0V90yl/oTOOyk=;
	b=Le5WB+1yi72RtgwGVdGnxmw5g04qgUG2e19LlHMWASgvWxvEZZ0oQxzoC8xRAf1VcGVZtNFiZcwzgn/m9ywzv7dSBfQhH375pWFKubWSpxDO7Q9UGiaDMjt7ee79Fwb+69iXRw027eGjgf9rKLCD/dedfRadGRqm0wMZ7p87bXo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:e8c1e1d9-d522-49c1-b0fd-3fd110d3cab0,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:4e2aaae9-2ff9-4246-902c-2e3f7acb03c4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,
	BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3f9956ee99d811f0b33aeb1e7f16c2b6-20250925
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <huayu.zong@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1746305061; Thu, 25 Sep 2025 14:24:10 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 25 Sep 2025 14:24:08 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 25 Sep 2025 14:24:09 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5/C7ntvZY+/mnS4qzTG1tvwDWeV+KXkYiOuL4I8dVs0ZRJ1oucDFZhk/my4qV7YZGiQ64PgMyGGhXNGDWx2brnRyOvpnfvIcxSPD93xYKorHpxPu62cn+maBvREe7aqnAo3o3fssU0FhrepTTJEFGA09zfXvDmEVQ4f0GLhLyZmVQdBK5JeKdKJQCM7UjwVQqeir1EJlJCk38xqR9UCrScakAdUCaulCx/aYEJ8xQzd22E/+Iex6TJEuIhLCpxeF6RPpPwQdAt5HQkI7OyDXSZVI8GXUu07M32HwHAu6OZKgC6S94LuEFm34bszc5fpO3Jol9jZukjEYnwTbd4Vrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=haAwUiWfFvPt8TmOUxSyF6zZ6RRJrC0V90yl/oTOOyk=;
 b=LxFC1chYsZfZnvYbDPNba9pv8oe4OcmjNdb99IBA1hwfwvj3cE9im9yytbhnJFtQVyE54td15RK4dBc2NO0XxQFfZo6uzRMgcdEWR/Uf2U60wdSm25DaBaGwSMcEs3pCZi8UYN9nsqCdMBUOft4kByqRkxIWN29Xrxggmb1ROr2L95byQ/j/8W1BcV9ql+A4YdY6Fdg+krvX8X+KBx2wwU0TDlfnGlL3RQLHgXp2FPLbw+maMDXxTZoJH9xuPoJ6a7wzzkZQ7LMpz/7LqUQS//gas4ojC4YmzxjKCFXknkqEq19gXRvVLarVr2xqKFrtVds47wP9A5bO0dO2x4P+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=haAwUiWfFvPt8TmOUxSyF6zZ6RRJrC0V90yl/oTOOyk=;
 b=vVXc+wmGctUVUbb9DoneQvsk8UsDPRQGWTQu4FBNq1c7MTIGmvvLnSaVrbV7nYS+ZLYxLf6JrcsLl6D+z/O0srT373OleaA33Fwgml8pdX+Ybl9vrgzMlij+DHLmwFsDdooOMYMlUKHsKDIYMYPveM4xvWtEgR8PRRlanDp+knU=
Received: from KL1PR03MB5808.apcprd03.prod.outlook.com (2603:1096:820:81::12)
 by KL1PR03MB8571.apcprd03.prod.outlook.com (2603:1096:820:13d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 06:23:30 +0000
Received: from KL1PR03MB5808.apcprd03.prod.outlook.com
 ([fe80::b75c:b0c5:893b:193]) by KL1PR03MB5808.apcprd03.prod.outlook.com
 ([fe80::b75c:b0c5:893b:193%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 06:23:30 +0000
From: =?utf-8?B?SHVheXUgWm9uZyAo57q15Y2O5a6HKQ==?= <Huayu.Zong@mediatek.com>
To: =?utf-8?B?VGluZ0hhbiBTaGVuICjmsojlu7fnv7Ap?= <TingHan.Shen@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "andersson@kernel.org"
	<andersson@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>
CC: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH v2 2/2] remoteproc: mediatek: Support MT8189 SCP
Thread-Topic: [PATCH v2 2/2] remoteproc: mediatek: Support MT8189 SCP
Thread-Index: AQHcLS+qmZTg4na6UkeM2diZ0nOlwLSiHSAAgAFSUYA=
Date: Thu, 25 Sep 2025 06:23:30 +0000
Message-ID: <8440e84b5e1c49025e677aefae96710a7461f477.camel@mediatek.com>
References: <20250924084422.4604-1-huayu.zong@mediatek.com>
	 <20250924084422.4604-3-huayu.zong@mediatek.com>
	 <30a75332-a7f9-41ed-a4e8-520b1e7c9bfe@collabora.com>
In-Reply-To: <30a75332-a7f9-41ed-a4e8-520b1e7c9bfe@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR03MB5808:EE_|KL1PR03MB8571:EE_
x-ms-office365-filtering-correlation-id: ce478698-be2e-4ee0-f42a-08ddfbfc0b9c
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bFFwaU4zUVZNREhOeVpybDRreFhTWmNNeE1PTGd6UTI1Wjk4OWhmRUtTS1JF?=
 =?utf-8?B?NDJwRzhhazdkT1p4UlNQWGI2S1MvSE1KZmpobWdmVmF6NzRNUWg3eXpqN1FQ?=
 =?utf-8?B?K0JRR1hBT3VnSWhaSkM0aUgweldoT0Y0VGRSdGpjc2NlRTdZMTJOYmRWT2Na?=
 =?utf-8?B?ZnhUc0c4cUdpci95SXB5OTNFWnl0VjVsaytyZ0c5cDRxWDU0d2kwSCtPdUhO?=
 =?utf-8?B?Q0V6NnY2Y2FzczA0b25WbUhyR3hHaXZ0ZitWM3pyTVNYcXpKR1JIcXlMUldh?=
 =?utf-8?B?eklwbFZCK3FxaWIzN0NjM3k3ZHJSdzY5MkFhWnJ5T2NuV2dQUXVGTWR2dWNo?=
 =?utf-8?B?ZlRtNWcrd201RVZqT0NaS3ViNEdiTzg1U3JTUG1CQkJtOXNnd1UyRzVnVWFY?=
 =?utf-8?B?STNFcFBicHFGVXZvQTIzNU9aNGEvMXpVbFJEUkRaa1VqN0s2ZHl5aEllaDho?=
 =?utf-8?B?cTU3R1lFTmQ0c3NtUlR2R292OUt0VHdOamtqbHNNRzRGeXZCNjJPNU5zYlMx?=
 =?utf-8?B?TjdHL1ltVzB3S3JDdGFkVGpNODB4Z3F0TkVMMHUranV2UzM3TkxNbHhwS2RZ?=
 =?utf-8?B?RVl5TE83eGJSVTduUHdkcDZJdnNXYXIwSjBEKy9lVCtvZjIvVTRCUzVUWFJU?=
 =?utf-8?B?VU44NVN5eEtpdDJiVDcydzUxNFl0cnlmaGhYbGlWazJTWU1NSmNSNjdoV1lu?=
 =?utf-8?B?dE5JWFhKYTJualJIWFlOWmlXK0orNld0NWE5ZGprcW1HeDhsVHZUVlp4aEZn?=
 =?utf-8?B?R0UzdWJIakdUMFFGcU5PYzNEMjhtN0VjKzhSTlVGYWF1b2ZhcjNJbXBQNEk5?=
 =?utf-8?B?cXloU0FDeHZsbGtYSU5CYW5pbnB6bGpqeW1hdUNTdTNxTDdZckVlOUhDN3h2?=
 =?utf-8?B?QytZRVZvZVMyazR3V001dWd6Vm1LL0cwOVdlcFR0Mk1JU0ZlWmxMeVEzeFIz?=
 =?utf-8?B?amoyUzhaVWlsc0ZwVXR6Ylk5Y2llUWJQRzJHckVlSXRONFJKTmowVHZpMlF1?=
 =?utf-8?B?Tk5qTUwxN0RWYkozbVNkdFVBTzR2VkoyOG1XMGxmM3dKQ0pjUDdGeXVER1Fh?=
 =?utf-8?B?d3QvVlRmZzZXeHRFL3h5OWsxejlXMUtnRDAwVUFvZ21GbFB5Q2llMVk3eGdN?=
 =?utf-8?B?VWswWjUwU3JrR0dTdkM1RXFhNG5YRndyQ2NheDNSdHRoRTlmc1FOcGlOalRC?=
 =?utf-8?B?RVJ5c1lQZzZvUDdUSGYrRTRyNy9TQy96VWxIR2VJOHV4S2ZyNmFHYjdib202?=
 =?utf-8?B?U2dKL3cvUU9NdFhkT3U5V0JRZGIzMVJ5RWo2ZHVJVVBtb28vSk40WCtDZlUx?=
 =?utf-8?B?ZE5zbFUreEpRamR0NHhDaW4xYWt3VXdYQktVeUgzZWROZU5QTlRkdjJVclV6?=
 =?utf-8?B?b3p4VFpMUTYvdDc0TTIxNmRSOUd1azNhZWR5Q3pqYUtNVXdRaVNuM3BrZWN1?=
 =?utf-8?B?Q1FNSHh3SitiVEMxTEZiTTd2R1V0TVg3c1ZHRndzRXRYcHRrclh6S0NwNlVT?=
 =?utf-8?B?bXN4ZW1DTUVJZ1U0ak9jTFFaRDU2VnFMdDJNeWRBUHFjejQ4Z0RMTnd3N2tp?=
 =?utf-8?B?UVloREtBYjNwQ2pXV3ZuTkFOQVI4TGQ3eCtqa3dmSzF2QU1COGZzdTIvYm1M?=
 =?utf-8?B?Wk55ZGJwbTViSGs1K2RQTGM3eXdneVpHZTFKUFo3NUxRYlI3RUdlTkZkcWJE?=
 =?utf-8?B?ZVJUeGRZa1ZZcVdhaW9QK3ExZitKbkJJN0VVQ1lRME5XMzFZR3VmWDJRbXNE?=
 =?utf-8?B?UGdURUJDRW9lcGtNZnFwWjJLTjA2dlc2dVhsNE93QUcySk1FaGp6Wkx0VGFq?=
 =?utf-8?B?VEt3NU8yZmkwYnl2WGp3bjFNZUJ6bGk1RVNkOS8wWDMyZk5ha3hiQkp5OEl3?=
 =?utf-8?B?MHdWUkd0RWZFK1l4ZHlEVFl4WDBvclV1MkZpUy9pOGdZdEhjUmw1MDVaaWp2?=
 =?utf-8?B?YklDT1dxYUhraWVubkcwY0tzdllQT1dQYmlsTDRGVm5OUkV2TWpMam9KalJz?=
 =?utf-8?B?VlN5TWZoWncwUFpmVDA0UlJCeGZEVGx2alFPMWlwNVR4eTJnVU55OFJLT0hk?=
 =?utf-8?Q?KOQEym?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5808.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWRhMW9JMzdlbnpkN2FSV3o3dzNQbkVISS8wQXNuQzU5ZjVtZmsrMXBFUFd2?=
 =?utf-8?B?bTh1TGdSNS9IelBUMG8wQXNodXZuUll4NXdIc3VnUzBiMFRZcWdSVzFERkVJ?=
 =?utf-8?B?UXVBcmFjL0VaS3oyS2RGNG4xeURYTTFZbitFaXRrK1ZwQ0FWWEdteTY3dW1D?=
 =?utf-8?B?amVaSlhiakpvTi9FVnhWN05GazhIbWEra21KQ0p2bmR5WU9hNTJ2OUVMeVB5?=
 =?utf-8?B?MWtpVUxjUFRvcXdYZzRRMUpvVzJzbmFRbDhrSWFOSXFFQUdEZVJ0MUkzRHpn?=
 =?utf-8?B?SzJ2S2JTNU96WEtEdWZzeUx3MitnQmtsYjFHOGJGNTl1UWRoSXRxREhGdGlh?=
 =?utf-8?B?TS9EWXdnd3RXUFlYY1kvZFJvdDNydThTYlAzeXBNRDViR0dHdElXclRjQ3ZL?=
 =?utf-8?B?eXhkcE1rM1oxRGhjUndRR1dDUS9hK0k5STFoWUNqQnprUEVnVWZub21RaVNh?=
 =?utf-8?B?bHQ2MWVEVzh2c1pPRzVxbUVaNnpKRnZXczgrTDdnc3RkSGhZUi9tdkhNS29r?=
 =?utf-8?B?SCsrZXJEOC9PS1lxYWhad2N2NUJmRitLa25oT0dOUGk0TGYrTElQVUlGdDVn?=
 =?utf-8?B?SkZVTHZxd1VsMTRhcUFKbnZYTEdKM1hUbVRDM1RMa1A5cU50TElyK3dCS1pN?=
 =?utf-8?B?YXIvVFhMQnVWQ01mRHBrL3VVOHgyQU5EZElrT3RmT09tOHM1K2VqL0tXNG0x?=
 =?utf-8?B?SnkvcXUxSzFvcWpydk1jbThhYkZHNnREY20rUTIwYVpQTGlIYVJvaTErTXlK?=
 =?utf-8?B?VXZFY0RvYnAxaVh5ZzBjVUExNEI5T1ZuWGxIcU9CYXpTTkZWcEVJeFNMcThr?=
 =?utf-8?B?VXBHSzlqeGVKT1pCYXBYV3pVZmw1UytSTDFwcVpDam8ySVlEQ1NINWI0WGVz?=
 =?utf-8?B?Y3ZyV0NzbFhKMXVOOWh0QnJZcE1MZ1MxSkpkamdnTDFvdUhDQ0JFMUI2Skpm?=
 =?utf-8?B?bkVHMTdCSGo0akVlMWxaOTkzNlVCRUdhVlg3cDEyQkJQdGJhTDNMbzk3cTFh?=
 =?utf-8?B?THB6cHZFdkRNZ3lGYzl0YTU4d1N6b0hQK3NHL0R1ZEVCdWhCNGVNbmd2Y0hs?=
 =?utf-8?B?aXZnczkzdXNXaFliL1ZaYjN5K0lMVzk2RFZLNzY1UVh0NFlORDJuY3FXTWlI?=
 =?utf-8?B?UTFFQXhzclJqMkJRdkxrR2tGWE9ERjB4QUFDNzBnc1ZJY2hoNE5KMUFNSnFt?=
 =?utf-8?B?d1hSM3BUMHNzblpwajhuR1ZNa0tTTDJLak9DMzBZblFhNXNzUERaK1VDSmV4?=
 =?utf-8?B?dEtVS0R4WnNqWnYzT2orRlNEVUVUSkUzbnRraHdUNit5dzUxaWpMMEV4L1VT?=
 =?utf-8?B?SVlXRXFhT2Nncnc2SlNNZVhUNmFEVkdXSmFUdmtzb1hqazJNY0VCZ2E5dGlX?=
 =?utf-8?B?VUswanM1aGt6NE9kOHBjOHhHdFcyYW56MklQcVRLMXZtOFpvMkJVN3R6ZTA0?=
 =?utf-8?B?eHNYQXpjaUpHYmhZL2hFenBzeExHQk5YbXIyM1k1dEZob09VZkdVa1hJbno4?=
 =?utf-8?B?c3prSWVSNG9RUk9TNUhjNDJIRVJnNlBRdVRySytmNjNyWVh5VHRGZHhRMnJX?=
 =?utf-8?B?cFlSU3N3Q3B4b1lkanZpNEpLaHEwZDM2WkFEKzE3c1pOeUEwR2lDNkd2cHdw?=
 =?utf-8?B?Vmh4Y2lHMFhkVVVCeEx3UTFqMFM0Kytxdi9XOGp5ajhDVUU5UG5KbEcwVmRi?=
 =?utf-8?B?WjJSVHNmUkpvN1Rsa2xNWm5zUFZiNWFQQndiSXJHWTFmN1dzaU0zdHVUdk1N?=
 =?utf-8?B?SzFNRTZ1cklISlRSWWF1YUkxNFJpQjFsT01JekVIL1JVSUFwYmYwdkgzWURq?=
 =?utf-8?B?VzczWUtxU1NlS0pCUlpRWTZ6bWVUQitzU0g3Q0JwdkJnbDFYemxGWVpiWmU2?=
 =?utf-8?B?ZHBaUUpYWDBhYU5XMXZhZWNSeUpLSzMxUE5BTkhtR25lQXVPZ2huZlo2bkww?=
 =?utf-8?B?aVdQa2lmVkxRVitXS2VlSTJ4Vi96U3dUaUdEZ0U1SVAzR2FmWHoxVFZodmN5?=
 =?utf-8?B?TndLa2lEOURrMStHTGk1Q2p5YmVsT3lKdjk4NU9tMjdacmdjMEYwZDZDcjNY?=
 =?utf-8?B?ZzNEWHhNd3RMVnZKMUIrdUY2dE44Q2VNemRnU0E2aHlRdVF0TlZwL0J5UFdy?=
 =?utf-8?B?OVYvdkJTR2VHS0h0SmV0cVY3OVFRb3JCNkIxeFdLOURrZVhHRnYvWEVDaDg0?=
 =?utf-8?B?NHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DD95D4E099B4845BB2D8666C9C436D7@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5808.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce478698-be2e-4ee0-f42a-08ddfbfc0b9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 06:23:30.1420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O9f81LCgVpucSzr0Ax8Zca+kWyU1N/o2ArcF2JAswcjKhcf/nVAtqA9JltADzACPgSJA+H/rGQ03FWbwn6o/lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8571

T24gV2VkLCAyMDI1LTA5LTI0IGF0IDEyOjEyICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRl
ciBvciB0aGUgY29udGVudC4NCj4gDQo+IA0KPiBJbCAyNC8wOS8yNSAxMDo0NCwgSHVheXUgWm9u
ZyBoYSBzY3JpdHRvOg0KPiA+IEFkZCBTQ1Agc3VwcG9ydCBmb3IgbXQ4MTg5Lg0KPiA+IA0KPiAN
Cj4gUGxlYXNlIHNwbGl0IHRoaXMgaW4gYXQgbGVhc3QgdHdvIGNvbW1pdHMsIHdpdGggdGhlIGxh
c3Qgb25lIGFkZGluZw0KPiBvbmx5IHRoZQ0KPiBNVDgxODkgcGxhdGZvcm0gZGF0YSBhbmQgY29t
cGF0aWJsZS4NCj4gDQo+IEFsc28sIHBsZWFzZSBjbGVhcmx5IGRlc2NyaWJlIHRoZSBuZXcgc2Nw
X3NlY3VyZV9kb21haW5fcmVnIHdyaXRlLCBhcw0KPiB0aGUgY3VycmVudA0KPiBjb21tZW50IGlz
IG5vdCBjbGVhciBhdCBhbGwuDQo+IA0KPiBBbnl3YXkgLSB0aGUgY29kZSBsb29rcyBnb29kIG92
ZXJhbGwuDQo+IA0KPiBDaGVlcnMsDQo+IEFuZ2Vsbw0KPiANCg0KVGhhbmtzLg0KDQpJIHdpbGwg
c3BsaXQgdGhpcyBjb21taXQgaW4gMiBjb21taXRzLCBvbmUgaXMgcGxhdGZvcm0gZGF0YSAgKG10
a19zY3AuYw0KJiBtdGtfY29tbW9uLmggZmlsZSkgYW5kIHRoZSBvdGhlciBjb21taXQgaW5jbHVk
ZSBzdHJjdXQgZWxlbWVudA0KZGVmaW5lLCBmdW5jdGlvbiBtb2RpZmljYXRpb24uDQoNCkkgd2ls
bCBhZGQgbW9yZSBhYm91dCBzY3Bfc2VjdXJlX2RvbWFpbiBjb21tZW50Lg0KDQo+ID4gU2lnbmVk
LW9mZi1ieTogSHVheXUgWm9uZyA8aHVheXUuem9uZ0BtZWRpYXRlay5jb20+DQo=
