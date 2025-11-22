Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011020.outbound.protection.outlook.com [40.107.130.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F742638BC;
	Sat, 22 Nov 2025 00:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763773144; cv=fail; b=h/rqzPLKXBY7760yNG/qAHugl/j5WxWVWR3UgnIwmpLX4iPvZ9tvIl29QapCy4IWr0MudqrzZj8b4KMByh/9amyttHBo/ryOKfVOhKqvMj/eAxWAwk70iuFwIdBAoaTn/Ini71xGLJdcxmWd/Ac8z5ousB2LkpeVaBdVIJThBag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763773144; c=relaxed/simple;
	bh=7flVh1l/xyt6xZ5M/5J8Ux4PusYbLXJ8NMnnqPbZj8g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TgCpL3kCF3DCBTIJ6YDNNk/MOZMsAAE1gcep+Nf24kNX5h9wecoyATuJ8cRiYNsJ5pC9Li7H5TUxghkhQ4nf7xKKjjjESTJhLjAaGAfCefec3t2iwOSVytnJ8W9W6+xj8KUz2QWORP9XtQInZiNwglFg3kA7KuBnM+71zMXdIqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rz84RZpe; arc=fail smtp.client-ip=40.107.130.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rz84RZpe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0sevrYUcho1Kj4gOOdOdAt1e5s+MmbXv55/2g7h5hr3+Tni46ltlRQar7l50BgFeKTuQJLi1RLz783jmBL5BOtNUySrr6X30/Olz3AVEjFjyZ30xBOMcBpHOSWxMyh+r/IPLUVBCw/kwZInDM+I/HzEUg1hBnfUkpdAtNMX+U3QPrde0XV/EjcTjNGjtn/WIss2qj8LW1u2gcjzkm++92FuykUC/TANZWZWuLBkINuAKnHD/+DT9kdjO4bnW4GO+4zlClhKyKiWYC2eEtvwi55M/G9/hJ3lSzqDH/NaZI10xVu7DEQew03VVA7IlzHKAjMWeUgPJDw6+MNNfvtv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgUS++shW7IEefe3Wdg130u0tLNtjEC+tiHd3YNP9/k=;
 b=jXW8wALmGKcX2LqdtiIANK1vxul65D2QHbD4AJpxARwvKpTksUN87GBMxVAQBM+6gWKDuPWyiUND9EaadygKso3kHskWHXAaeBS8S/Bmk/h/ebaTLL2Z3WRc7uwo6LSmcfgaG8amsWZkhaQs/8N6UDxLNP1PPzGQ9n6MM9zY66QBxUmDK3vOJNqk2Ttt6WmP6pDV62TZZtX05DILDVRbDH977cvWIqcPouhleFQvxuZCc4ELOhNJOFwLRS8uQIyq79iiN1t9UL3PU/8hA/MOH6zmILhsXw8jRbSSqgRLn0/n/39KXTx2lnVwM3b3V2OxPg1PEtbTHjIeWlIbHmw7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgUS++shW7IEefe3Wdg130u0tLNtjEC+tiHd3YNP9/k=;
 b=rz84RZpeGEW8SHZ7VVJZRI9zSQLC2yGi4PKUfqkWHwSwUovgyeFna6y4xGgyFNRjKxQJ/1vlruklD6ssPdKj6KCnSV2hlBxTPUeiUIMyc8jXP0oEKfz0bOfcOFxmFvCKzzHe9MbzpZdgRigRgIdHgONrsC/KIlOcwopoZdBJEYSfQdkLNvA14la50B9/3DrmnS2cjRTp5qjAqbtN+CRbhLyc4VwI+Pj3Ad+Hug0hq+sjJjaX/qy2HWauSVlbsN1KimNzycDeTwdwP/m/vV/WIG5py+21LAnvXBzkSBxUksm2gN5HAnfA6eNbUpHHHBnM8/I3tsOT+25G6Ei+NhLMLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DUZPR04MB9917.eurprd04.prod.outlook.com (2603:10a6:10:4d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Sat, 22 Nov
 2025 00:58:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9343.009; Sat, 22 Nov 2025
 00:58:59 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sat, 22 Nov 2025 08:58:19 +0800
Subject: [PATCH v3 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-imx95-rproc-2025-11-20-v3-4-9ae6ee619a78@nxp.com>
References: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
In-Reply-To: <20251122-imx95-rproc-2025-11-20-v3-0-9ae6ee619a78@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0058.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::9) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DUZPR04MB9917:EE_
X-MS-Office365-Filtering-Correlation-Id: 70982f2c-0d31-4117-230e-08de296251be
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7416014|19092799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Vkp4WCt1aCtjT2xmTGhOTVBXY2dyNE40QU9GZFhvdGZrZ1RReHF3QUF3a0xF?=
 =?utf-8?B?NXNOaTNMU1R1WXY4aWphL05ETUJZV1kzaE52N1ExaUhjY2FCekk1eXUxdFhC?=
 =?utf-8?B?QUVUdElxT1hWc1Bwc0ZJV3Nwb2ljTTB2WFFMSWc0OUQvYWJ2RU9mOUNBTmR4?=
 =?utf-8?B?VjB4NkJRMW1EVllmaDZ4M3ErSlBLb3oyMGxTZUVPTGwreTVsTUk1VzArNGkz?=
 =?utf-8?B?RkFMMDVXVGVOcENtZEcrSmNHdHYrMURmcXpqRXhsSHlCQjNrVEdicmxCaDF2?=
 =?utf-8?B?QUJTeFRZcFBqMXhPRXRETW9pZTZLaE5RYmtSRGdaZXl6NWNGOTNub05hRG1z?=
 =?utf-8?B?bUllNENaelV5bjdVVW5lc0NPUDQzN2ErS290TUpUVWdiQVpKOUhaQmpLcGNY?=
 =?utf-8?B?ZG94M28zZjZsQWVJSVdPSmpzd0pLNkJRZjdkY3AwaklucG5TZWFiZnpWSGhE?=
 =?utf-8?B?bjJkcjdpNm8rVkMyUHBwSUFiUDRjN3FjVzk5YTgxQTNpeGZhcU5PS3FZY2th?=
 =?utf-8?B?M2tPWE9rZGNEMCtYaXkvRUQ4dFd4UFk4RmRnTldvWlc3TG5LbWxNRjJvLy96?=
 =?utf-8?B?K0hjeWdSTTYxMGgydlAyODZpSDZSNm1wOHNMaVdlK0RDTGdiNjVhRWF4WlQ0?=
 =?utf-8?B?OEVzdmN2U0ZNT0VvQUFNdEx0NjVyN1owNXkyYnlOVWtzUU11M1JncG9PUGtn?=
 =?utf-8?B?WUZkMXVNWnBpT0xuMStuaEVkek5IQytDbUhVNHlvcHZQZW9UQUtpcnZJWG1M?=
 =?utf-8?B?QlRZa1R6K1o2RXRTdzgveGk1S2wxS0JnUDdmY1RaTmhMTTJybWJYUmU1OUpq?=
 =?utf-8?B?cFYrRUhRWk9nMUNFaThKQmlWeVdBVEthWnpUWEMvb3RNbEVsL2xodi94cEhL?=
 =?utf-8?B?UGxTT0dRcllkNm1zVXhldTYxYk12SDlsRzYxMWFXYVlEdGVVdzJKWTJVaW1M?=
 =?utf-8?B?MitkM0xKZGU5VlEyS2hoVGpTNFRtQWZwSit2MFZZU3prbjhzQXFvZ1h2OTBE?=
 =?utf-8?B?R2lTdDVNRC84WDl5VUZ6Y3p4THJZT0ZCL1I3NkFtNFR0Ti9MWkhEMkNlZmM3?=
 =?utf-8?B?dmFTQlUwK05DUGVHYXNXTWFyNHlCTGJPY1B6aGJOTG83UEl4SmY1cmcrRVRB?=
 =?utf-8?B?K1Y4ZUR2Tjd0c0crbmd6R0FRTEJxYStrNTlML0wvVFVVdGVwRWdoY2FCR0F6?=
 =?utf-8?B?ek5SVjJzdFVzQWVYeFFTSFBya1pKZ29pNStQVHAwSGF4ZjFmcFA1bWZJOHYr?=
 =?utf-8?B?YWc5VXdKaUpaTHV5UVA4WWlzRTNSZUVyRXF0dWtTT29rd05GZ0dyVzJTd0ts?=
 =?utf-8?B?dU85Tno3SGxvN3BXdjBiTkNPZS9MWmpkSGZTQmJ4TnIyKzdoV2tabURyQmhX?=
 =?utf-8?B?aUtFd21ySkpzWmEyOEw1a3FkQWN0TGpZTzV5bjh0bEsvcUNNV2tVdkREck5T?=
 =?utf-8?B?bEo2WlArakpub0t1N0dkQitVNkhGanVRc01ncTd5RGJydERKQWpqaUEvMktz?=
 =?utf-8?B?RU93b1F1eUpnZk9qUzNma2ZYVWpyRlFvemxNcjY3cHAxa0d4UDBSck9jT2p4?=
 =?utf-8?B?MUNSU0p1U1ZCM0VHTVNMY3dFQk5HYVNwUVhOWWhaVmpvVURSZEMrc1YyWG9D?=
 =?utf-8?B?Z1BYdDU4NWNmVFRUOG04Q1ZCK3pmQys4V2YzSXBxUGR4bURPNFh3ckRnM09K?=
 =?utf-8?B?WXoxRjRnWUpjUXBRSFh3SndmR0FCek5ieUVodXFsbG5naERTeXRLaE90N2c0?=
 =?utf-8?B?T1Y1OExUYlVDeWczR3dsc1NTczVTdUprOVZnSVpxY01vVjRHSEpFczRGMU1Z?=
 =?utf-8?B?UGpLQmx6Y0RqTUJrNUw4NENuQXNvTzEwSWV4djFVM3RScmEvS3M2VWVBMmxp?=
 =?utf-8?B?OHIwdDRHMzc4R2lwSmFOT25YdkpDNFkrZk1YazQ5VmNyclpTM0U2TWVpT1dR?=
 =?utf-8?B?SS9pV2ZFcDJTenphQnVKTHlYVkFscDY3UXZBdS9UY0R0dmFZaXBKZ0VxaHlJ?=
 =?utf-8?B?UXFkamdzYzAzR0hMT2hIUWFGazYrVDRBbm04dmVFUG44SkFnbmJEbFo3VXdO?=
 =?utf-8?B?bGs4dVltdEJybisvWEQwVi85dk5YSlZLRENzdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7416014)(19092799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHBvNFVJL0JUZ0tBSnVtMURtY0JsbFYwR0dJMElJMG5qOWlET3orNzd6KzlX?=
 =?utf-8?B?QW1Sbk0xRFFxWDF0Rk9YMy9XeTE1WXdvclJJNzlqMWxaNkljUFIwbloweW5X?=
 =?utf-8?B?QW5EVUtrTlhxYUViTmNQd1kxS1dLS1gzemtYYWh2ak0zckROdDhzZ3Jud0xD?=
 =?utf-8?B?YWhQamg2clpnNjlaM0tOOStOWktlSkt0VVZqaDBXSDZYdnlLV1VJRk9ZblUy?=
 =?utf-8?B?VkM3VGVNTTNtTFpOa2o0U3pHeW9rTVRVaEdKM3VEVnVKVmh3UVMxT1dHVW81?=
 =?utf-8?B?L0VLQzljV1BoNzkyQ0hic1ZUOEpidjlpYTdwNndqODZLWDJIV01wdk8zTWVP?=
 =?utf-8?B?bk9US0hsL3llRkdMNkNhbXVOalNsTk5yRXMvL1V3MU9tTzJIbUR0dU15RFk4?=
 =?utf-8?B?S3ZQOUZGN2V3WGhaQWFRZ3NsbjU5andGakZnaUd3UCtoWEpNN24rNlh2L3pO?=
 =?utf-8?B?eEVOL05uQTBKMUxGRy9rck1OZU1WdUZJRFhTWVBZUzJRbVVVemhhUVQ3L0ha?=
 =?utf-8?B?RXFkdUwxOVdUL0Ivd1RUTDgzZzlwTzZmelpNeEJkQUV5ZGNpYnhOOHprOFIv?=
 =?utf-8?B?ZklmaDNxVUFpTW9HS3JxM1ozcTJwSTNmMlFXbm1PZjZyVkRFNnBVT0kwczNP?=
 =?utf-8?B?SXg1MzdtUHM3VjBQTDFLVExHbHN1bWZ3aFlvNGJZT3JLYnlOWndFQVp1Z1Iv?=
 =?utf-8?B?MDNxRnZCZ1NGQ3pSMG9lR0ZBMytpcG9qVXlCMVRyTEtZQWI2cWd1QVprdENt?=
 =?utf-8?B?ajMydUdsSk83b2RZNis2MDY3OHNnT2RMMkxsQnIrVmhDam8vTjc1U1VSY3BY?=
 =?utf-8?B?QWt4SXZBWVZLcHBqNVphV2VFZ2tKU2FDSi9sKytIaWdEWjBZQzZMMTdqK3Vy?=
 =?utf-8?B?ajh5QkZueHoxRm12YlB3VXRYajdpWlJOTlpMemQ5TFpObmRqZzlLbzZRTDdK?=
 =?utf-8?B?WHhpSzdGRjI2OTludzlSOFNMRVNLTU9rUjNIUzVNbFJEQ1ArUWNIZmVCR2lT?=
 =?utf-8?B?Qk1wM2o1Y1FFUTVXVUo0b3E4cW1SUFR0cmNCUmNneGJTZkd2MS9wb245Z0c3?=
 =?utf-8?B?SzluUzBTNXZFN3l4a2t1TDBDVGdVMFk2OUJIL216TkQyRm0rYnB1c3MyK0tw?=
 =?utf-8?B?WEY2VVZyQ1FybnlNVzM5Rkt0ZWU2S0M1ZmV5NURKTHkvK0RoOXlDV0NrbUhs?=
 =?utf-8?B?OXNETFE3Y21ZZ1RiNEkwYm95ZHpiSDI2dnhieWt1THVKc3RXRHVueGxMdlg0?=
 =?utf-8?B?ZjZqdXVncVNpTHptc3dYVkFsNHE2MzNaZ3FEU2puWjJKNW1mbUFRMFB0MkU2?=
 =?utf-8?B?d0JtNmwwZUgrenJ5elN0ME8rRDViZVVOME10aGVvYWN0ZEM0dzh3SHplN3RT?=
 =?utf-8?B?SGIwbDYzZ2pnbHJoczFXc3hmbC9HRHFrdytKYzNKVy9iZ2pIeExiSktVT2FF?=
 =?utf-8?B?NUdkbXBqa1BTa2Y0RkVWSWVtUDNzSVQyc3FLWTNFSmordldjV2o4dTJMM3Rj?=
 =?utf-8?B?dG90RVBQdEpCdDYxWERzd2d0cjhjTEdud3NTbXBLN0RmVVN2azJzVS9LeUw3?=
 =?utf-8?B?NHBMdFRZTXBEeDcrQUJwRTF0V3JBMlN0S3VYL2xmNVZQY0traHQ0bThIMG9C?=
 =?utf-8?B?SXZnTG9WVmdvejVHVkNQVEMzcCtQT0tKQjJFMVBSc3ZOeXgxc01JQk5hVngr?=
 =?utf-8?B?RHdoV0JhZVE1TWNkQ3ROVHlPVkd1K2NUUzFGWEt6OEhGd0dQZEZLSTFRb3Fq?=
 =?utf-8?B?Vzk5NTliWUNOM240SDl5K1Z6TmJKeHo5M1ZzVkgrTnZSMlAzTVhXeTZaNnpp?=
 =?utf-8?B?U05vb3FjOUhKZGZGeXpHK1FtWndIYldzajN1M0JZRTcxYVQwd1lZdkFlUE1J?=
 =?utf-8?B?UFQ3a0JQZk5IYTVqRVRCQkdJSGlFYVptbVkyZTNDNnAzUzZwbVFXSXFpYU03?=
 =?utf-8?B?NnZmYzI1M2xzRW9SK1ZoaWo3TVZIYzdhc290d2ZyU3FmVWs3ZmRLOENDOWdq?=
 =?utf-8?B?bjJZcXJxSnFsbGVlbFAwUGd5NGtneUxFQzlGdTU5Z1JmRkVxK2RDZjUrdEgx?=
 =?utf-8?B?MDZ2ZnZ5NGhycWVkbXZhajczUlBaSWFkak9QWm8zOXhCL0RZYXdoRjB3eVA3?=
 =?utf-8?Q?9hoSjq2eNlVB3c9NIftSttbf4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70982f2c-0d31-4117-230e-08de296251be
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 00:58:59.0218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMPiAenwDfBNxyfQOBBE248yJH1TT1OcNMiFdvTds7RN8VnZ48LFMTA5AZV1e0KowqXR3/UgeuXrBdwL9nzbUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9917

From: Peng Fan <peng.fan@nxp.com>

i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
one Cortex-M7 core. The System Control Management Interface(SCMI)
firmware runs on the M33 core. The i.MX95 SCMI firmware named System
Manager(SM) includes vendor extension protocols, Logical Machine
Management(LMM) protocol and CPU protocol and etc.

Depending on SM configuration, M7 can be used as follows:
 (1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
     can't control
 (2) M7 in a separate LM from A55 cores that Linux can control using LMM
     protocol.
 (3) M7 runs in same Logical Machine as A55 cores, so Linux can control it
     using CPU protocol

So extend the driver to using LMM and CPU protocol to manage the M7 core.
 - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
   is fixed as 1 in SM firmware if M7 is in a separate LM),
   if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
   protocol to start/stop. Otherwise, use LMM protocol to start/stop.
   Whether using CPU or LMM protocol to start/stop, the M7 status
   detection could use CPU protocol to detect started or not. So
   in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
   status of M7.
 - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whether
   the M7 LM is under control of A55 LM.
 - For above case , after using SCMI_IMX_LMM_POWER_ON to check
   permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
   the M7 LM to save power only when M7 LM is going to be started by
   remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
   M7 LM is started before booting Linux.

Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
initialization. In future, we could add the support in Linux to decouple
U-Boot and Linux.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/Kconfig     |   2 +
 drivers/remoteproc/imx_rproc.c | 193 +++++++++++++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_rproc.h |   3 +
 3 files changed, 198 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -27,6 +27,8 @@ config IMX_REMOTEPROC
 	tristate "i.MX remoteproc support"
 	depends on ARCH_MXC
 	depends on HAVE_ARM_SMCCC
+	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
+	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
 	select MAILBOX
 	help
 	  Say y here to support iMX's remote processors via the remote
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 232eb91e0b5dc2432131b1c140d6688b073fea1d..2ef5789f6f2a00d9159cd54e67ae9b2b96f798e8 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/firmware/imx/sci.h>
+#include <linux/firmware/imx/sm.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mailbox_client.h>
@@ -22,6 +23,7 @@
 #include <linux/reboot.h>
 #include <linux/regmap.h>
 #include <linux/remoteproc.h>
+#include <linux/scmi_imx_protocol.h>
 #include <linux/workqueue.h>
 
 #include "imx_rproc.h"
@@ -92,8 +94,12 @@ struct imx_rproc_mem {
 #define ATT_CORE_MASK   0xffff
 #define ATT_CORE(I)     BIT((I))
 
+/* Linux has permission to handle the Logical Machine of remote cores */
+#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(0)
+
 static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
 static void imx_rproc_free_mbox(void *data);
+static int imx_rproc_sm_detect_mode(struct rproc *rproc);
 
 struct imx_rproc {
 	struct device			*dev;
@@ -117,6 +123,11 @@ struct imx_rproc {
 	u32				core_index;
 	struct dev_pm_domain_list	*pd_list;
 	const struct imx_rproc_plat_ops	*ops;
+	/*
+	 * For i.MX System Manager based systems
+	 * BIT 0: IMX_RPROC_FLAGS_SM_LMM_AVAIL(RPROC LM is under Linux control )
+	 */
+	u32				flags;
 };
 
 static const struct imx_rproc_att imx_rproc_att_imx93[] = {
@@ -313,6 +324,44 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
 	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
 }
 
+static int imx_rproc_sm_cpu_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
+		return ret;
+	}
+
+	return scmi_imx_cpu_start(dcfg->cpuid, true);
+}
+
+static int imx_rproc_sm_lmm_start(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	int ret;
+
+	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
+	if (ret) {
+		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
+			dcfg->lmid, dcfg->cpuid, ret);
+		return ret;
+	}
+
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
+	if (ret) {
+		dev_err(dev, "Failed to boot lmm(%d): %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int imx_rproc_start(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -369,6 +418,25 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
 	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
 }
 
+static int imx_rproc_sm_cpu_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	return scmi_imx_cpu_start(dcfg->cpuid, false);
+}
+
+static int imx_rproc_sm_lmm_stop(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+
+	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
+		return -EACCES;
+
+	return scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+}
+
 static int imx_rproc_stop(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -485,6 +553,33 @@ static int imx_rproc_mem_release(struct rproc *rproc,
 	return 0;
 }
 
+static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	int ret;
+
+	/*
+	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
+	 * to start/stop rproc LM, then if rproc is not in detached state,
+	 * prepare should fail. If in detached state, this is in rproc_attach()
+	 * path.
+	 */
+	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
+		return rproc->state == RPROC_DETACHED ? 0 : -EACCES;
+
+	/* Power on the Logical Machine to make sure TCM is available. */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+	if (ret) {
+		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
+
+	return 0;
+}
+
 static int imx_rproc_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -994,6 +1089,104 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
 	return 0;
 }
 
+static const struct imx_rproc_plat_ops imx_rproc_ops_sm_lmm = {
+	.detect_mode	= imx_rproc_sm_detect_mode,
+	.prepare	= imx_rproc_sm_lmm_prepare,
+	.start		= imx_rproc_sm_lmm_start,
+	.stop		= imx_rproc_sm_lmm_stop,
+};
+
+static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu = {
+	.detect_mode	= imx_rproc_sm_detect_mode,
+	.start		= imx_rproc_sm_cpu_start,
+	.stop		= imx_rproc_sm_cpu_stop,
+};
+
+static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	int ret;
+
+	/*
+	 * Use power on to do permission check. If rproc is in different LM,
+	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
+	 */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
+	if (ret != 0) {
+		if (ret == -EACCES) {
+			/*
+			 * rproc LM is booted before Linux and not under Linux Control, so only
+			 * do IPC between RPROC and Linux, not return failure
+			 */
+			dev_info(dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
+			return 0;
+		}
+
+		dev_err(dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
+
+	/* rproc was started before boot Linux and under control of Linux, directly return */
+	if (started)
+		return 0;
+
+	/* else shutdown the LM to save power */
+	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
+	if (ret) {
+		priv->flags &= ~IMX_RPROC_FLAGS_SM_LMM_AVAIL;
+		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int imx_rproc_sm_detect_mode(struct rproc *rproc)
+{
+	struct imx_rproc *priv = rproc->priv;
+	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
+	struct device *dev = priv->dev;
+	struct scmi_imx_lmm_info info;
+	bool started = false;
+	int ret;
+
+	ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
+	if (ret) {
+		dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcfg->cpuid, ret);
+		return ret;
+	}
+
+	if (started)
+		priv->rproc->state = RPROC_DETACHED;
+
+	/* Get current Linux Logical Machine ID */
+	ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
+	if (ret) {
+		dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
+		return ret;
+	}
+
+	/*
+	 * Check whether rproc is in the same LM as host core(running Linux)
+	 * If yes, use CPU protocol API to manage rproc.
+	 * If no, use Logical Machine API to manage rproc.
+	 */
+	if (dcfg->lmid == info.lmid) {
+		priv->ops = &imx_rproc_ops_sm_cpu;
+		dev_info(dev, "Using CPU Protocol OPS\n");
+		return 0;
+	}
+
+	priv->ops = &imx_rproc_ops_sm_lmm;
+	dev_info(dev, "Using LMM Protocol OPS\n");
+
+	return imx_rproc_sm_lmm_check(rproc, started);
+}
+
 static int imx_rproc_detect_mode(struct imx_rproc *priv)
 {
 	/*
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 37417568a0ade2ae4d6a4e3d0f139ea52b185254..d37e6f90548cec727b4aeb874680b42af85bdbb4 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -38,6 +38,9 @@ struct imx_rproc_dcfg {
 	size_t				att_size;
 	u32				flags;
 	const struct imx_rproc_plat_ops	*ops;
+	/* For System Manager(SM) based SoCs */
+	u32				cpuid; /* ID of the remote core */
+	u32				lmid;  /* ID of the Logcial Machine */
 };
 
 #endif /* _IMX_RPROC_H */

-- 
2.37.1

