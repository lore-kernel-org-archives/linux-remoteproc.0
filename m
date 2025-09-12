Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1334724BCF5;
	Fri, 12 Sep 2025 16:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693064; cv=fail; b=PfAqUDYT6mH02yZOy5+FU7rrxaHpPRSfs9mvRdH+6I9L1zfGWbSboGL3bk5vW6Mw1kdUzB3Eb2V2viAgUSaII9I8E75LKctIhfIV+uOUrwVeaHdGmSvdDz8XBuoXA5Tw6xTx8KDVEG1NsQJSbJMwQTmZOWz2Pjzs9EIruSB1dUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693064; c=relaxed/simple;
	bh=vy5ULDPkyBd9Jk9Q1XeyliKwTz26WsglVooVB96hHLY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=TlNU+q0vpcZMfkgotxxNLvk+BKbOfoQok0H6RiTAE48mFb9Vmvopj7c+3GpTxWpNisQLuc/dXkkEj8+BJ2g0BZM0iv76r4lgtgWxqYCM3H5rZBAudWLC9urRLQekXKVQ+hYKupQjS6JepzRoGkRaCJJ2E/1VUZBgUEZeMpzA7sM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Bx6TH2kc; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Bx6TH2kc"
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CFUFw0029599;
	Fri, 12 Sep 2025 18:04:01 +0200
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013037.outbound.protection.outlook.com [52.101.83.37])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490ywn0bfm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 18:04:01 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=av2uBWVFngVafYop2IOV/3lyK7UvLU5NO/v0Fh4r83KEm9aa989H5YJfI5XK8uq+zKFwKemp/SZFV7HkT/jr8j+c/DVVF5KSjyVMW7jHnLMC52uGrndfw/YRaGe27kW40VqKD8hDTLiF+IuCPW/kT6aBf0zQj+4wQb5/1MyoHG9c6znKiOCtJbU9VlleLE9S5chYG86alyPxbdtpJKu/5Da8HbE0LFwgR/+C7cnzSyNvKraWq9pJUJ44wmS61ZC2kUG+FehLDd6r0z4duSfD6uDhbPpKxvb9fYfmS+8DYxy/bHqjzLsQvcqa1EnFhrUJwgS5GI9PQC56couM9YL/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shFndJ4soXqjZfay1OZSf17vidnwrY2UyeKVO6HGEQE=;
 b=omxZVCdLlJuYrqNVkaGg6jIpKhGvG3vn8zNufq+T0Au0MFCda6WrqKcWAga08FOjVtqCZKYaT5pIYX8hEbyussX2V8vnRcUv4l6P5BsnJWW7QC0BhwhFi2OTCj8t5WlQfpAdIXQfxahOdkvZR8qZVmh8q9V5J+SFYoyMhO3uzdzfYST4faEWa39TE5tD6Onv1tFRRBXNdrz1cdDcrLiuuL00PrHg0VYkA0fvnkqc2KQCu4wCUGl984zJDFe28sj3UtX8FrLd3Y2lQMmusvD+APgh+tgcQo7DflzwDFGqy9W8ZMYT88KcbyLKzWey8wiqqcO2rcwV+O7p/mXSt5jweQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shFndJ4soXqjZfay1OZSf17vidnwrY2UyeKVO6HGEQE=;
 b=Bx6TH2kcJyYnPSqQZ2OYc4eax65WpElN0yvKr9r7IrxQ7uYei8hDSG/5JleaA4gNPjxu5Ms9pd8iNOBdih3VJS6AQzAZQDzQ0iqV17cBkGGhcZxrpfHqhIkLVchn4bdELyXO3tqGthcKNwCqmV3g2zd3scWTwIe7RRkwn2TPD2AWVhbwoVqCAJYi0nv4Dz/6uFz4BedB7m7NCvixGHBWktaObYptTn4AXTd07CXNJvd8k/ni3htUpQ8SjUPbZX48KXWjIsfLRqC/hCgyjFPJIsOilhFtNOCMXYW6i/pfnp2AhsIlXcbrBgJz64WjZlkKAYHobfke86s9Gt3SJpGbZQ==
Received: from AM0PR04CA0093.eurprd04.prod.outlook.com (2603:10a6:208:be::34)
 by AM7PR10MB3938.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 16:03:52 +0000
Received: from AM3PEPF0000A792.eurprd04.prod.outlook.com
 (2603:10a6:208:be:cafe::3e) by AM0PR04CA0093.outlook.office365.com
 (2603:10a6:208:be::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Fri,
 12 Sep 2025 16:03:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM3PEPF0000A792.mail.protection.outlook.com (10.167.16.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 16:03:52 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 18:01:29 +0200
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 18:03:51 +0200
Received: from [10.48.87.127] (10.48.87.127) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 18:03:50 +0200
Message-ID: <cc53b15e-f0a4-413d-95cb-174996344d64@foss.st.com>
Date: Fri, 12 Sep 2025 18:03:50 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Subject: Re: [PATCH v19 0/6] Introduction of a remoteproc tee to load signed
 firmware
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>, <devicetree@vger.kernel.org>
References: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
In-Reply-To: <20250625094028.758016-1-arnaud.pouliquen@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A792:EE_|AM7PR10MB3938:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ec35a4-383d-48ae-17b8-08ddf215f7cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?THgzTy96V2xtYVdISXZIMEpocEFnOXBIbTZXOFhrZnNMaUVFeWFpTmtpY2Rn?=
 =?utf-8?B?RzhPYUtsZkQvbXYzc2cxb0V5MmRNWitNdVZLUElqQ2krUEh5VU52UUhMeU41?=
 =?utf-8?B?YU9qdlBRUGJzQWlDR2F5UFJZWGp4Z1p4TCszK0ZiUDNQZkdyNTJsRkMrQXRo?=
 =?utf-8?B?dXU0VGFYM213QllDcGdZZ1ZpeG1VaktvdStWN0IwSHBuQ2t0QlZvZXd5U0lB?=
 =?utf-8?B?Uk1DVG5pN1NrSzZvQktwMHYvS255OWZ2MmNVVGk0QWpMZ3d1eWYydUE2emdP?=
 =?utf-8?B?Vm5EcXhjY1dvVG9wUFNMUlIxSElxMzQzdEtqU3Z0WFltZXYyTEd6ZEJuZHlM?=
 =?utf-8?B?cFY1SE9JZXhVL2hWOVZDdUNmS0cwNi9CdTVCK2xBa0dhWUMzMXNMRUsydDRM?=
 =?utf-8?B?b0FOYlJIQlFiNkdXWENiVElYQlB0T2p5aDltR1lPNm1rUnBrVlpRditoSUpm?=
 =?utf-8?B?dTlkRjlTNXFPVWtBNFlaTlVVZnc1NTVlRWRueFEzOEFsaFJXYUVXRndpZGFW?=
 =?utf-8?B?eVFyNzBLWk01MFFaN1VIVFRrOWtaUXEwb214aDdzQTlnanZpTWFocEZOZGdY?=
 =?utf-8?B?TjRDQS9reStsaStTdjhGNkhMMTlFdGFqa2duSTREL2dGU3NKL2NKSHZRZTlX?=
 =?utf-8?B?S1dZZm1zT211OFdmb0x0eFp2UHNBWmE4ZkVQWGNOU3A0QXpUR3VKdmsxOUdN?=
 =?utf-8?B?Q2xiUTU4RGVFNlVqSlZlNW9tN3hBUWp0aEwrNGlhaWdKQVh6TDZZQmZWc2pC?=
 =?utf-8?B?NjdXSzNFL1YvVEZ3Tm5acEF5QlVmbk5Zb2FRY1pCeWt6MTkybHAzOG1CU0ZX?=
 =?utf-8?B?QWpYS0ZYMUVubVNsTENhNUN6UUJFL09FOUQvYzRXemtSQWUwbW40WVgweDEz?=
 =?utf-8?B?RjNsRk5TbHZWZFk1dmhZTHlERDl6cE5ocFZiZGJPVE03Z2g0NWdMLzM5VGVS?=
 =?utf-8?B?d1NSeTB4ZkNyaG1qSFNnK1E1MlZKWUJsOGRxMGpFVDlLWmFCeGtTUisvUExy?=
 =?utf-8?B?TTFFcDZQVmxFVTJ1MTR4SDBBTjlJTFpyNHVBR28xUEJ3RnAzb3ZsSjVMMUJ4?=
 =?utf-8?B?clpUd1NuVVZSVEljdzE0UmsvOVZYQnBFYW5WMkthNFpudEw1dURPeXp1VjFM?=
 =?utf-8?B?Tnc0Nm56bTNSMTRBL2xRMGc1eGpYaUFiUEpZSEUzQy9scjJISE1pZ1QxTGV5?=
 =?utf-8?B?OFZVNlZIVjBjUERhWGFld292ZXlic3QwYThJdUFWT3EvRmJsUW41aXZuTENh?=
 =?utf-8?B?UXNPV3l4Rk4wQkNwaTBVamM2eE53TkM3OWJ1QmZXQTVZSTBuTm9MY21oV1do?=
 =?utf-8?B?L2lGREFtMUJwZFFha2xwRnh5T0laSWt0M3E0YUhvbEVYTXZOMWlRazhWbGVJ?=
 =?utf-8?B?VlNxOXd3TVdVZko3aU4yV1NlbkFxTndZeGhucUJlRUxOOVEwU1YxZjUydndS?=
 =?utf-8?B?OFNMeVFDQTNPeFVpdVNvaFNkT29Kdytud3h6aWpmZDJXT1FJUGR3cGkvb1Jj?=
 =?utf-8?B?TnQ1S0M0Y0lNZklXcXN5NDdyMjZ1dTZvYlVyV01BU1JUd3doSzEvV0tEMVBS?=
 =?utf-8?B?OTltVzRPdUxCTmh0RVlvMWRqUXd5SHJRdVNsMlZPYkZLQlp4U2dyNllaVkpi?=
 =?utf-8?B?R3c4SjREeEhZc1Z0U2dldXJJakhWeDJhTU5MR0tFeGNDa1ZjcVN2RTlQNlNy?=
 =?utf-8?B?cHA5WG9ia3J3bE03QWRHUzdUd1BGcXNzREJNUUVQRHZOYVVBWlI5am1xM2c4?=
 =?utf-8?B?S1h2OTg0cWpibkE1TFJuSnhCM2hlWW1YWld5SVdONmZmQVNyM2FXUjJmZTNx?=
 =?utf-8?B?YUpRRHl6NEFqaTVwaUorUDBtbXdkOWRtREdqK1FFZkRudUZIbFp2UXlucTNj?=
 =?utf-8?B?aUdiUXFML0hUY3BhOXFIVjNBY1d3allMeDZxRkJadjdPaWZ6dFhoMDdJNFpP?=
 =?utf-8?B?eDhEejc4WGhBSDNLSDYwRE5XYVcyejN2UnVoUjJSQXpjZkJrb2w1RFJTWXly?=
 =?utf-8?B?ODZlZjhNU1hnPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 16:03:52.1230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ec35a4-383d-48ae-17b8-08ddf215f7cd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A792.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3938
X-Authority-Analysis: v=2.4 cv=OaqYDgTY c=1 sm=1 tr=0 ts=68c44471 cx=c_pps a=RjD04lOnQ4Lz5/88gw47hg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=FOPVHIcnkjUA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VwQbUJbxAAAA:8 a=8b9GpE9nAAAA:8 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=xw-PHShiiOY97SZu4-oA:9 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bNPVEa56AIYNM6znhVe8x73PIMedoeLr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA3MDAwNiBTYWx0ZWRfX530NuF79EQ5B tKrT9ESVkrIsmXV9uspnZSsFckEVVfmumx0ryN7JE8QzyscMebS1BqtXF4IPIzHWw89FdYtR6Fx nQX7qPqsWv/NUAOwSoF3YD6MPwWJ1+ACa9p9PyPU2duLbp6zAZFVGsss8leVNtS/CLkIYBfqovP
 1Lx26qnvKC4+pr7+1DVrhFc0CpM80wamYr4vzBk4z4Ontcx0Hm5MCl4DUL9x4wGKIMmqXEkTtq5 tnTid1Xu59p70a8fR/hSfD/5vUqh10OI26YLREQeyyyhJLcCMoIj7xhnPGh5eZQW02RcK6qTWnX HXc238Qd4L8eTDLZ5tKI6g0cY4G8E5cdP5FuRQzQHC0Z8IEcDjAH8rdUxyQUQ9PoLail19HlI3L A4D49b/I
X-Proofpoint-GUID: bNPVEa56AIYNM6znhVe8x73PIMedoeLr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509070006

Hello BJorn, Mathieu,

Do you think, you could find time to review this series before the
next merge window.

Regarding the discussion between Harshal and Sumit, I did not notice any
comments requesting immediate updates; the conversation focused more
on potential future extensions for FF-A.

Thanks and Regards,
Arnaud.

On 6/25/25 11:40, Arnaud Pouliquen wrote:
> Main updates from version V18[2]:
> - rework documentation for the release_fw ops
> - rework function documentation in remoteproc_tee.c
> - replace spinlock by mutex and generalize usage in remoteproc_tee.c
>
>
> Main updates from version V17[1]:
> - Fix:  warning: EXPORT_SYMBOL() is used, but #include <linux/export.h>
>    is missing
>
> More details are available in each patch commit message.
>
> [1]https://lore.kernel.org/linux-remoteproc/20250613091650.2337411-1-arnaud.pouliquen@foss.st.com/
> [2]https://lore.kernel.org/linux-remoteproc/20250616075530.4106090-1-arnaud.pouliquen@foss.st.com/
>
> Tested-on: commit 19272b37aa4f ("Linux 6.16-rc1")
>
> Description of the feature:
> --------------------------
> This series proposes the implementation of a remoteproc tee driver to
> communicate with a TEE trusted application responsible for authenticating
> and loading the remoteproc firmware image in an Arm secure context.
>
> 1) Principle:
>
> The remoteproc tee driver provides services to communicate with the OP-TEE
> trusted application running on the Trusted Execution Context (TEE).
> The trusted application in TEE manages the remote processor lifecycle:
>
> - authenticating and loading firmware images,
> - isolating and securing the remote processor memories,
> - supporting multi-firmware (e.g., TF-M + Zephyr on a Cortex-M33),
> - managing the start and stop of the firmware by the TEE.
>
> 2) Format of the signed image:
>
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/src/remoteproc_core.c#L18-L57
>
> 3) OP-TEE trusted application API:
>
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/ta/remoteproc/include/ta_remoteproc.h
>
> 4) OP-TEE signature script
>
> Refer to:
> https://github.com/OP-TEE/optee_os/blob/master/scripts/sign_rproc_fw.py
>
> Example of usage:
> sign_rproc_fw.py --in <fw1.elf> --in <fw2.elf> --out <signed_fw.sign> --key ${OP-TEE_PATH}/keys/default.pem
>
>
> 5) Impact on User space Application
>
> No sysfs impact. The user only needs to provide the signed firmware image
> instead of the ELF image.
>
>
> For more information about the implementation, a presentation is available here
> (note that the format of the signed image has evolved between the presentation
> and the integration in OP-TEE).
>
> https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
>
> Arnaud Pouliquen (6):
>    remoteproc: core: Introduce rproc_pa_to_va helper
>    remoteproc: Add TEE support
>    remoteproc: Introduce optional release_fw operation
>    dt-bindings: remoteproc: Add compatibility for TEE support
>    remoteproc: stm32: Create sub-functions to request shutdown and
>      release
>    remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
>
>   .../bindings/remoteproc/st,stm32-rproc.yaml   |  58 +-
>   drivers/remoteproc/Kconfig                    |  10 +
>   drivers/remoteproc/Makefile                   |   1 +
>   drivers/remoteproc/remoteproc_core.c          |  52 ++
>   drivers/remoteproc/remoteproc_internal.h      |   6 +
>   drivers/remoteproc/remoteproc_tee.c           | 708 ++++++++++++++++++
>   drivers/remoteproc/stm32_rproc.c              | 139 +++-
>   include/linux/remoteproc.h                    |   6 +
>   include/linux/remoteproc_tee.h                |  87 +++
>   9 files changed, 1023 insertions(+), 44 deletions(-)
>   create mode 100644 drivers/remoteproc/remoteproc_tee.c
>   create mode 100644 include/linux/remoteproc_tee.h
>
>
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

