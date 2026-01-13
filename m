Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33E831D36D;
	Tue, 13 Jan 2026 16:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768320292; cv=fail; b=EWd26UscZX+S3qHodOBkheOdGx/vvszagKOEiSdS2VvG3w/a/lERdOXxEFXtt628OrkfSlA4UsIzOS5fNPBrkwGsdQSCKtS/eUbDdby93A4GHVt3tuu1TP30uhhwDUXhPRXKA4bZVKoxcudvm3Cn7AusTEn72GlnU54/Yh6X6C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768320292; c=relaxed/simple;
	bh=Pa6Lkz5D3cxo1lszj7hI7pBZEJuAHs3pIfKzAT6+Anc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Pni9HWjTj1ZuBe1T4+/4AotMPZacCAQAghCvjHaO0jtHry2MyYOwBvPq2keSi8gTyyiHqzX1hBlk25vkpWJmUraNg8l/TAcVqZK62MJJUvU5ERQz8/41bEMMMabEu6Purlhm91mJy53olQ9IvfgD3rU5nNyKbPgF3ZKty+8O2bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=YZWlwzzT; arc=fail smtp.client-ip=52.101.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="YZWlwzzT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSxj0lrz95XXvmn9yQlTlFK91yKkzq5G6ocsuoNOv7uhap5xIagk9BPzcrn4WFqHSMBS4JUEUG3etP9qmndZiisUvrzDJUA+MWAtJGSZwkHcqo12SgnQG3s/da4aAHqCRsSY7AZE2RG3mKbP0FeqaRNKBrBd6SwJGl+VALWwu7g2aNe8a3SNe9wGGUgOT4jvRxot1DnFXxnlxfFiAnTMVdmbusNU7coRfAUKybRS5m/OFBZO/thbp9nlvAsYugRC9109YCANy7zgWYLyZZIxCVkptdb1f63SlJucUJl2+Od2wfPA53pVmpfymQcFNAB95yPwhuU1aHpyl/pT+ZUY6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vn9Dv1lbJPxxCTv5NGXFU7Xtxw6Skg0XccwL9pBe2ZU=;
 b=GMBn3y/dxIFZ8yZ0r6ey8BcEhVfkT6RnQynP2evs6NurWCXbUYpRm80rXaCLqah0QhO/ofxL/qjRfnAlyKe+JiO8G1AaNI5R45OEA9v2HMPCzCvM2QneKZQ3/0qG7EkUoaYP8zxNNg8USYJHtt01ydzKmCLj4SZ3/Yzdlp2PNbQKii3KoxQWjVzj360xIn29KxOscyYnO8CJnMmOGnxUYc9b+UhmjYGjSKjEZS9OHSgeVXabAXzO9pcMM/dvS+5tw4VxxXkrstQ5h+s83FqVqPfI28nhNypNqkBwNhPuEYkN3rkg93cAUWhKTgIW/NAfk6VPhTOQRDreluVKjvWsGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vn9Dv1lbJPxxCTv5NGXFU7Xtxw6Skg0XccwL9pBe2ZU=;
 b=YZWlwzzTRzU57DI+SzT55tOv7fItf9rfCQV/dO+fyqMEf6uoyVedgqUaymqE/dQOgUyK1aQe+jIZjJmWu2SSLJUt/BfNPFzSvHPizCGiuvtA1aIM1YvwluT4Ji3ALolkpBT/K3P2H74cyqqsVeLdkC59oNi8xj7dy5McaIcr/h4=
Received: from CH2PR12CA0021.namprd12.prod.outlook.com (2603:10b6:610:57::31)
 by CY8PR10MB6804.namprd10.prod.outlook.com (2603:10b6:930:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:04:44 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:57:cafe::bd) by CH2PR12CA0021.outlook.office365.com
 (2603:10b6:610:57::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 16:04:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 16:04:42 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 10:04:41 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 10:04:41 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 10:04:41 -0600
Received: from [10.249.130.12] ([10.249.130.12])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60DG4ZAa2405658;
	Tue, 13 Jan 2026 10:04:36 -0600
Message-ID: <8a4692f8-4366-49f2-bcef-b087a7bcc24c@ti.com>
Date: Tue, 13 Jan 2026 21:34:34 +0530
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: ti:
 k3-{j784s4-j742s2/j721s2}-mcu-wakeup: Add HSM M4F node
To: Nishanth Menon <nm@ti.com>
CC: <andersson@kernel.org>, <mathieu.poirier@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vigneshr@ti.com>,
	<kristo@kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>, <hnagalla@ti.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260106104755.948086-1-b-padhi@ti.com>
 <20260106104755.948086-3-b-padhi@ti.com>
 <20260109192735.rijejfwwrkunosdp@gauging>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <20260109192735.rijejfwwrkunosdp@gauging>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|CY8PR10MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: e046a05d-25e8-43b4-89a7-08de52bd76b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|34020700016|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUUrSTJYSGNXaFlGRnduaGlUTWhybWhMK05IaFJlT29CMGozK3RqaE9tdjl3?=
 =?utf-8?B?TEZlN2FYQVVTejRGVDY4NDJ4VzkyOEtJZkZ1Zy9aT2tGd0E1dFhwR1dyeGtM?=
 =?utf-8?B?c1haNXFSOHZ2WFZ2VXcrYzZyNW9LTEpnUm1vSTM2Tkh1Y2pXdmtGNFhWUjcy?=
 =?utf-8?B?ZDFuMkQrQ2Y5cmhzWWVEdnhUVjRGQWhlRGdnK3hSaXh6MFJlS3lNSWNMNFpE?=
 =?utf-8?B?cDdhZWcwYy90aFJpd1E3ME5uaUJSTmpTbUF5dlZjMlVEM3JTcXNVeTlablM2?=
 =?utf-8?B?UE5uM1pRL25wV0R4b2theExXRmEyTFFlUjVIYi8rZGIwUXBqTG83Skkxc0Vp?=
 =?utf-8?B?cUVJQndkMit2R0lIRkpFT2FwcmUvWTFNaWFtUGVrbUxYVDRvL0tYOUswNEhL?=
 =?utf-8?B?OTJ0eWovTUZoSUNJeGFFcHF6UjhzZXUyYTBPQU9yWnVlTGRZYmJoY0dVWlVj?=
 =?utf-8?B?eTE0V2FxWmJWZlp2QjR3TnhaWEVuWHNWa3p6SkJVWCswaVdmektPbjBPejhk?=
 =?utf-8?B?dThkVVhCU2NHbXE5Zkg0WDJWYU5HY1k1SXkvVGJWamIzYVNmNDFhMHVvS2hm?=
 =?utf-8?B?a0owSjF0bDh4bC94Y3RtNGVKVFFoVVJqWTZTSWJPRHFVMG45ays1b3hTcDRa?=
 =?utf-8?B?NWdtUjBBOEpVQk8vSHo3UlpwTHcwYkppWHhnc1dYSGlCQ1g1L2lTQmErL3Ny?=
 =?utf-8?B?ejM2YmF0eFRrUVFkVHRmWGszMUlJajIzdnJtbUlGWmpvWldCQ04xSE9JeHpV?=
 =?utf-8?B?czNoSlRoUkQ4OERVZCtJNG1FNFpYOFpOL0srdWNEdHVoaks4VUlTUmNnQk5P?=
 =?utf-8?B?djQ4MHN3WDM0czF2Mkt3enBPWmNSKytHMVhBV3FLNGkxTG8yeXY2Q1ZWSVVG?=
 =?utf-8?B?NTJOQ0tLdkNldDJMOTJEK2Z2OVpLMGFTbHo5VWh2N2hIQnczRjdMTmVjdXp1?=
 =?utf-8?B?SWg3cTVZaklRTU5mcUNYc0xlUkgwcFBlY2FmYzA2MXNrK0tUb1BYd2ViL0ZU?=
 =?utf-8?B?ZTNrQURFeTl6bElaUHU0TXlTUWZFZ2J2aGl6S0RMeDM5QmdjVWc3ZkxSVEpZ?=
 =?utf-8?B?blpqMGVmU0ZZK3dIVDNFVklVUWRuVFNTd1pwNVg3czR5TWg4c1JwMWlTaGFh?=
 =?utf-8?B?bERvVzdnWVJXc2pESUFxR1RRQjRZakdvbERvT3BHRjJ6TDBLWkwyUFk1MDZP?=
 =?utf-8?B?MUtBdEs5QmdxVVJzeEpKUUxlRVdWUDA4UFN0UjV2YzVmdTBCMytIM010bm01?=
 =?utf-8?B?RHlGTW9RdHhWVXdJcTFHYmtESkdITjJzN3FnTU5nblhJcVRMTHBVUks4V1M4?=
 =?utf-8?B?SUwvM0RRRkhjd21KQ0hpcTZMUUJwVndqNFA1TnJVemF0cUphUS8xdTRXQ0Zm?=
 =?utf-8?B?VlhPOGtOUzVaSFZtakhyK0JjS2RTaHMwM21McEVQWkpSU1hydmF1S2Y3aGt5?=
 =?utf-8?B?L3VzNS90T2ovTW8xT1lBc1AycVEwU2xiL2htZzlVZDh5UC95SVhFdERsMk90?=
 =?utf-8?B?STg0UlRkdXJhRGl5MHZHNkhPdHF1RzRnSlFPYTFsZmJHVW0yVTQrei9od2Y4?=
 =?utf-8?B?OFdEZUlzRi9OSXV3NUthSXZwUmUvdEpyWExOWEI0QnczVnlrMXgxcUNtVWpy?=
 =?utf-8?B?bCtqcTIyMnRjdWFvUlYxZHlkSU1TU0NrNGpnOEtuc0wwbzlZY1NLMjNXSHov?=
 =?utf-8?B?Q0wyRlN4QmdCbDBwODRtbUUrR0phTUdFc0hFellNNSs4cE1kaVhOejlLWHB1?=
 =?utf-8?B?c3JJblR1dWJ6WVVObjRMNXhtd1hBc0hTOVlWcW44VThDWmxiUmQ3ZWZHb0lZ?=
 =?utf-8?B?WCtlOGYxMXpMR0JGaDJSdnFxazFsdlNadkhpdWYzNFhlL3U0UmFZVFRkQjJu?=
 =?utf-8?B?ZmZRZ0piMk10VWNQVlVxcnA4QUxZSURneWpVSFJKQjBVc3RMMFkydjdta0J0?=
 =?utf-8?B?RWU4STk5S05OOXhKV0prRXdnaU5WdjY4bkt0QlhYQUFucUlqa2g5cjlUZVVy?=
 =?utf-8?B?WHc2L2IrMEcvdmNFc0QvdEh6NjFNYTRYVkZTenJMdU5Vc2JjL0gyQ0FRNytK?=
 =?utf-8?B?citpVlVJemkzRE0rTlZ5ZW55RGh1S2EzQytlcXlKUDI4aVFUbTRQR0lERUVM?=
 =?utf-8?Q?Nugs=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(34020700016)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:04:42.4389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e046a05d-25e8-43b4-89a7-08de52bd76b3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6804

Hi Nishanth,

On 1/10/2026 12:57 AM, Nishanth Menon wrote:
> On 16:17-20260106, Beleswar Padhi wrote:
>> The TI K3 J721S2, J784S4 and J742S2 SoCs have a HSM (High Security
>> Module) M4F core in the Wakeup Voltage Domain which could be used to run
>> secure services like Authentication. Add Device Tree Node definitions
>> for the HSM core in the respective SoC wakeup dtsi files.
>>
>> [...]
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
>> index fd01437726ab4..c3d78d4a838a1 100644
>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi
>> @@ -766,4 +766,19 @@ mcu_watchdog1: watchdog@40610000 {
>>   		/* reserved for MCU_R5F0_1 */
>>   		status = "reserved";
>>   	};
>> +
>> +	hsm_m4fss: m4fss@43c00000 {
> You did fix this in the binding example.. but missed in dts.
>
> The node name should use the generic type, not the instance name. It should
> be "remoteproc@43c00000", not "m4fss@43c00000".
>
> Additionally for the label, why not just use hsm: like we have for sms?


Thanks for catching this... Will fix in v2...

>
>> +		compatible = "ti,hsm-m4fss";
>> +		reg = <0x00 0x43c00000 0x00 0x20000>,
>> +		      <0x00 0x43c20000 0x00 0x10000>,
>> +		      <0x00 0x43c30000 0x00 0x10000>;
> The total address range covered here is 0x43c00000-0x43c40000, which is
> 0x40000 bytes, matching the ranges entry. However, you're defining three
> separate regions: 0x43c00000-0x43c20000 (0x20000), 0x43c20000-0x43c30000
> (0x10000), and 0x43c30000-0x43c40000 (0x10000).
>
> I assume you are doing this since the h/w integration could be
> instantiated differently?


Yes... Will add a comment in v2...

>
>
>> +		reg-names = "sram0_0", "sram0_1", "sram1";
>> +		resets = <&k3_reset 304 1>;
>> +		firmware-name = "hsm.bin";
> I am not a fan of putting firmware-name in SoC.dtsi - esp when it is
> reserved,


I thought the opposite way. Since it is reserved (and not a general purpose
remote core), it is unlikely boards out there are going to use a separate
firmware. Does it make sense to override this 'required' property with
the same value in every other board level file?... Here is a diff for 
just 2 of
the SoCs (J722S, AM62P). Let me know if you prefer this way and I will
fix in v2.

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi 
b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
index 34954df692a39..a4026424b64dd 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
@@ -1415,4 +1415,8 @@ &wkup_uart0 {
      status = "disabled";
  };

+&hsm {
+    firmware-name = "am62p-main-m4f-fw";
+};
+
  #include "k3-am62p-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts 
b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 4f7f6f95b02ef..7b370a65238db 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -832,4 +832,8 @@ &mcu_uart0 {
              <&system_standby>;
  };

+&hsm {
+    firmware-name = "am62p-main-m4f-fw";
+};
+
  #include "k3-am62p-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi 
b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index fc5a3942cde00..79d371c54c52b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -432,4 +432,8 @@ &main_uart1 {
      status = "reserved";
  };

+&hsm {
+    firmware-name = "am62p-main-m4f-fw";
+};
+
  #include "k3-am62p-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts 
b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 5255e04b9ac76..bb0c9857f907c 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -399,4 +399,8 @@ &sdhci1 {
      status = "okay";
  };

+&hsm {
+    firmware-name = "j722s-main-m4f-fw";
+};
+
  #include "k3-j722s-ti-ipc-firmware.dtsi"
diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts 
b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
index 7169d934adac5..37f31c206f0b7 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
@@ -1089,3 +1089,7 @@ &wkup_uart0 {
      bootph-all;
      status = "reserved";
  };
+
+&hsm {
+    firmware-name = "j722s-main-m4f-fw";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts 
b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index e66330c71593a..6b38488815c34 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -854,4 +854,8 @@ &mcu_i2c0 {
      status = "okay";
  };

+&hsm {
+    firmware-name = "j722s-main-m4f-fw";
+};
+
  #include "k3-j722s-ti-ipc-firmware.dtsi"

> further, so far we have been using j722s-wkup-r5f0_0-fw and
> so on.. which allows for firmware specific to SoC.. which kind of makes
> sense here as well.


Right, will fix this in v2...

>
>> +		ti,sci = <&sms>;
>> +		ti,sci-dev-id = <304>;
>> +		ti,sci-proc-ids = <0x80 0xff>;
>> +		status = "disabled";
> As usual, document why? Additionally, should this be reserved?


Will fix in v2...

>
>> +		bootph-pre-ram;
> "standard property"


Sorry my bad.. Will fix in v2...

Thanks,
Beleswar

> [...]
